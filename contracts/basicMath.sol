// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.10;

contract basicMath {
    uint256 constant private MAX_UINT256 = 2**256 - 1;

    function add(uint256 _numberA, uint256 _numberB) public pure returns (uint256) {
        return _numberA + _numberB;
    }
}