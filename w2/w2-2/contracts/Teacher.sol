//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract Teacher {
    address public scoreContract;
    
    constructor(address scoreAddress) {
        scoreContract = scoreAddress;
    }

    function teacherSetScore(address _student, uint _score) external {
       IScore(scoreContract).recordScore(_student,_score);
    }
}

