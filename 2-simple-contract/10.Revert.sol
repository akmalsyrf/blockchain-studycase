// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract RevertStatement {
    function checkOverflow(uint256 _num1, uint256 _num2)
        public
        view
        returns (string memory, uint256)
    {
        uint256 sum = _num1 + _num2;
        if (sum < 0 || sum > 255) {
            revert(" Overflow Exist");
        } else {
            return ("No Overflow", sum);
        }
    }
}