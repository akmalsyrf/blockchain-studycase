// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Payable {
    address payable public owner;

    constructor() {
        owner = payable(msg.sender);
    }

    function getAmount() public view returns (uint) {
        uint amount = address(this).balance;
        return amount;
    }

    function withdraw() public {
        uint amount = address(this).balance;

        (bool success, ) = owner.call{value: amount}("");
        require(success, "Withdrawal failed");
    }

    function transfer(address payable _to, uint _amount) public {
        (bool success, ) = _to.call{value: _amount}("");
        require(success, "Transfer failed");
    }
}