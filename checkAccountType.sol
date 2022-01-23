//SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

// The below code can be used to check if a given address belongs to a Contract or and Externally Owned Account
// We make use of extcodesize() function provided by the assembly in solidity.

contract checkAccountType {
    function isContractAccount(address addr) external view returns (bool) {
        uint256 size;
        assembly {
            size := extcodesize(addr)
        }
        return size > 0;
    }

    function isExternallyOwnedAccount(address addr)
        external
        view
        returns (bool)
    {
        uint256 size;
        assembly {
            size := extcodesize(addr)
        }
        return size == 0;
    }
}
