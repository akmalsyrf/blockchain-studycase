// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FunctionContract {
    uint result;

    function printHello() public pure returns(string memory) {
        return "Hello World";
    }

    function sum(uint a, uint b) public {
        uint temp = a + b;
        result = temp;
    }

    function getResult() public view returns(uint) {
        return result;
    }
}

contract PayableContract {
    uint receivedAmount;

    function receivedEther() payable public {
        receivedAmount = msg.value;
    }

    function getTotalAmount() public view returns (uint) {
        return receivedAmount;
    }

    // overload func
    function add(uint a, uint b) public pure returns(uint result) {
        result = a + b;
    }
    function add(uint a, uint b, uint c) public pure returns(uint result) {
        result = a + b + c;
    }
}