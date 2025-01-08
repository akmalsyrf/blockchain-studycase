// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BasicContract {
    uint storedData;

    function set(uint x) public {
        storedData = x;
    }

    function get() view public returns (uint) {
        return storedData;
    }
}