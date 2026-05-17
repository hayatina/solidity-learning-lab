// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Contract {

    // Pure Function
    function double(uint x) public pure returns (uint) {
        return x * 2;
    }

    // Function Overloading + Tuple Return
    function double(uint x, uint y)
        external
        pure
        returns (uint, uint)
    {
        return (double(x), double(y));
    }
}