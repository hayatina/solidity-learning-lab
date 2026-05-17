pragma solidity ^0.8.20;

import "./Hero.sol";

contract Mage is Hero {
    constructor() Hero(50) {
        // Mage starts with 50 health
    }
}

contract Warrior is Hero {
    constructor() Hero(200) {
        // Warrior starts with 200 health
    }
}