// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Contract {

    uint public x;

    // Constructor Arguments
    constructor(uint _x) {
        x = _x;
    }

    // Increment Function
    function increment() external {
        x = x + 1;
    }

    // Returning Values
    function add(uint _value) external view returns (uint) {
        return x + _value;
    }
}