// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Contract {

    address public owner;

    constructor() payable {
        require(msg.value >= 1 ether, "Need at least 1 ether");
        owner = msg.sender;
    }

    function withdraw() external {
        require(msg.sender == owner, "Not owner");
        payable(owner).transfer(address(this).balance);
    }
}