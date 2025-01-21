// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

// Uncomment this line to use console.log
// import "hardhat/console.sol";

contract Try {
    string public textRaw;
    address private owner;
    uint256 public angka;

    constructor(){
        owner = msg.sender;
    }

    function setText(string calldata _text) external{
        textRaw = _text;
    }

    function inc() external{
        require(msg.sender == owner, "NOT OWNER");
        angka++; 
    }

    function getOwner() public view returns(address){
        return owner;
    }
}