// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Parent {
    uint private data;
    uint public info;

    constructor() {
        info = 10;
    }

    function updateData(uint a) public { data = a; }

    function increment(uint a) private pure returns(uint) {return a + 1;}

    function compute(uint a, uint b) internal pure returns (uint) {return a+b;}
}

contract External {
    function printInfo() public returns(uint) {
        Parent c = new Parent();
        return c.info();
    }

    function updateData() public {
        Parent c = new Parent();
        c.updateData(7);
    }
}

contract InheritContract is Parent {
    uint private result;
    Parent private c;

    constructor() {
        c = new Parent();
    }

    function getComputeResult() public {
        result = compute(1, 2); // bisa langsung menggunakan func internal
    }

    function getInfo() public view returns (uint) {
        return info; // bisa langsung mengggunakan var public
    }
}

// other studycase, this is about constructor
contract MyToken {
    int totalSupply;
    address private owner = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;

    constructor(int _tokenSupply) {
        if (msg.sender == owner) {
            totalSupply = _tokenSupply;
        }
    }

    function getTotalSupply() public view returns(int) {
        return totalSupply;
    }
}