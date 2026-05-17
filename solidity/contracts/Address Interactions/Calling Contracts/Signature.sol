// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Sidekick {

    function sendAlert(address hero) external {
        bytes memory data = abi.encodeWithSignature("alert()");
        hero.call(data);
    }
}