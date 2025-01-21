// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Mint {
    address public owner;
    constructor()  {
        owner = msg.sender;
    }
    modifier onlyOwner {
      require(msg.sender == owner);
      _;
    }

    function _mint(address to , uint tokenId) public onlyOwner {
        // code
    }
}