pragma solidity ^0.8.4;

contract Proxy {
    address implementation;
    address admin;

    constructor() {
        admin = msg.sender;
    }

    function update(address _implementation) external {
        implementation = _implementation;
    }

    fallback() external payable {
        require(implementation != address(0));
        address imp = implementation;

        assembly {
            let ptr := mload(0x40)
            calldatacopy(ptr, 0, calldatasize)
            let result := delegatecall(gas, impl, ptr, calldatasize, 0, 0)
            let size := returndatasize
            returndatacopy(ptr, 0, size)

            switch result
            case 0 {
                revert(ptr, size)
            }
            default {
                return(ptr, size)
            }
        }
    }
}
