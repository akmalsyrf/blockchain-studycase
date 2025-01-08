// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TypesContract {
    bool public valid = true;

    int32 public myNumber = -32;
    uint public yourNumber = 1;

    // sol doesn't have float
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
    string text = "this is string";

    // fixed size array
    uint[5] numbers = [1, 2, 3, 4, 5];

    // dynamic array
    uint[] numbers2 = [1, 2, 3, 4, 5];
    function addNumber(uint num) public {
        numbers2.push(num);
    }

    // struct
    struct Person {
        string name;
        uint age;
    }

    Person[] people = [
        Person("John", 30),
        Person("Jane", 25)
    ];

    // enum
    enum Color { RED, GREEN, BLUE }
    Color favoriteColor = Color.BLUE;
    function getFavoriteColor() public view returns (Color) {
        return favoriteColor; // 2 = BLUE
    }

    // mapping
    mapping(address => uint) balances;
    function setBalance(address account, uint amount) public {
        balances[account] = amount;
    }

    // nested mapping
    mapping(address => mapping(address => uint)) nestedBalances;
    function setNestedBalance(address account1, address account2, uint amount) public {
        nestedBalances[account1][account2] = amount;
    }

}