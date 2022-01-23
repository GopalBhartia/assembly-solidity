//SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract If {
    function ifSolidity(uint256 _data) external pure returns (uint256) {
        if (_data == 1) {
            return 10;
        } else if (_data == 2) {
            return 20;
        } else {
            return 100;
        }
    }

    function ifAssembly(uint256 _data) external pure returns (uint256 ret) {
        assembly {
            switch _data
            case 1 {
                ret := 10
            }
            case 2 {
                ret := 20
            }
            default {
                ret := 100
            }
        }
    }
}
