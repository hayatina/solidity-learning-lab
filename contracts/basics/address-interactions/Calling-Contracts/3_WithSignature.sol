// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Sidekick {

    function sendAlert(address hero, uint enemies, bool armed) external {
        bytes memory data =
            abi.encodeWithSignature("alert(uint256,bool)", enemies, armed);

        hero.call(data);
    }
}