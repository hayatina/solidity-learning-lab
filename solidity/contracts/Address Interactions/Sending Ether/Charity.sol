// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Contract {

    address payable public charity;

    constructor(address _charity) {
        charity = payable(_charity);
    }

    receive() external payable {}

    function donate() external {
        payable(charity).transfer(address(this).balance);
    }
}