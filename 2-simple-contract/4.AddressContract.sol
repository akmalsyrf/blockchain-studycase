// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AddressContract {
    // address = nomor rekening -> 20 bytes
    // address payable : send and transfer

    // cara 1
    // address public caller;

    // function getCallerAddress() public returns(address) {
    //     caller = msg.sender;

    //     return caller;
    // }

    // cara 2
    // function getCallerAddress() public view returns(address caller) {
    //     caller = msg.sender;
    // }

    // cara 3
    function getAddress() public view returns(address) {
        address myAddress = address(this);
        return myAddress;
    }

    // address payable
    uint receivedAmount;
    function receiveEther() payable public {
        receivedAmount = msg.value;
    }

    function transferFund(address payable _address, uint nominal) public  {
        _address.transfer(nominal);
    }

    function sendFund(address payable _address, uint nominal) public returns(bool) {
        _address.transfer(nominal); 
        return true;
    }

}