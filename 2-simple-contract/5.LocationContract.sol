// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// lokasi data bisa memengaruhi gas fee
// 1. storage: permanen, bisa diakses dalam semua fungsi dlm smart contract
// 2. memory: hanya bisa diakses di dalam fungsi (ram)
// 3. calldata
// 4. stack
contract LocationContract {
    // storage
    uint stateStorage;
    // uint storage stateStorage2; // error

    // memory: semua yg didalam function
    function calculation(uint a, uint b) public pure returns(uint result) {
        return a + b;
    }
}

contract ReassignValueContract {
    uint public stateVar1 = 10;
    uint stateVar2 = 20;

    // 1. PASS BY VALUE
    function iniFunc1() public returns(uint) {
        stateVar1 = stateVar2;
        stateVar2 = 30;

        return stateVar1; // 20
    }

    // apakah local var yg diubah bisa memengaruhi state var?
    uint stateVar3;

    function iniFunc2() public returns(uint) {
        uint localVar = 20;
        stateVar3 = localVar;
        localVar = 40; // tidak bisa mengubah

        return stateVar3; // 20
    }

    // bagaimana bila sebaliknya?
    uint stateVar4 = 10;
    function iniFunc3() public returns(uint) {
        uint localVar = 20; // memory

        localVar = stateVar4;
        stateVar4 = 40; // tidak berpengaruh

        return localVar; // 10
    }

    // 2. PASS BY REFERENCE
    function iniFunc4() public pure returns(uint[] memory, uint[] memory) {
        uint[] memory localMemoryArr1 = new uint[](3);

        localMemoryArr1[0] = 4;
        localMemoryArr1[1] = 5;
        localMemoryArr1[2] = 6;

        uint[] memory localMemoryArr2 = localMemoryArr1;
        localMemoryArr1[0] = 10;

        return (localMemoryArr1, localMemoryArr2); // sama antara localMemoryArr1 dan localMemoryArr2
    }
}