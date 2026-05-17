// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Contract {

    constructor() payable {
        require(msg.value >= 1 ether, "Minimum 1 ether required");
    }
}