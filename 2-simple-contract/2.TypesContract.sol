// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TypesContract {
    bool public valid = true;

    int32 public myNumber = -32;
    uint public yourNumber = 1;

    // sol does't have float
    uint constant SCALE = 1e18; // Skala untuk presisi

    function storeDecimal(uint value) public pure returns (uint) {
        // Simpan nilai dengan skala tetap
        return value * SCALE;
    }

    function retrieveDecimal(uint scaledValue) public pure returns (uint) {
        // Kembalikan ke nilai desimal asli
        return scaledValue / SCALE;
    }

    // bytes 1-32
    bytes1 letter = "A";
    string text = "this is string"
}