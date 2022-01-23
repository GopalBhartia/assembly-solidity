//SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract ForloopExample {
    function sumSolidity(uint256[] memory _data)
        external
        pure
        returns (uint256 sum)
    {
        for (uint256 i = 0; i < _data.length; i++) {
            sum += _data[i];
        }
    }

    function sumAssembly(uint256[] memory _data)
        external
        pure
        returns (uint256 sum)
    {
        assembly {
            let length := mload(_data) // load the value at _data pointer which is the length of array
            let dataPointer := add(_data, 0x20) // create a pointer at first element of array, 0x20 == 32 bytes
            // and each integers takes 32 bytes in solidity
            for {
                let end := add(dataPointer, mul(0x20, length))
            } lt(dataPointer, end) {
                // initializer // condition - here lt(dataPointer, end) means lower than
                dataPointer := add(dataPointer, 0x20)
            } {
                // this executes after each iteration
                sum := add(sum, mload(dataPointer))
            }
        }
    }
}
