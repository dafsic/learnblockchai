//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract Score {
    mapping(address=>uint) public scores;
    address public teacher;

    constructor() {
        teacher = msg.sender;
    }

    modifier onlyTeacher() {
        require(tx.origin == teacher, "Not teacher");
        _;
    }

    function recordScore(address _student, uint _score) external onlyTeacher {
        require(_score < 101, "Max score is 100");
        scores[_student] = _score;
    }
}


interface IScore {
    function recordScore(address, uint) external;
}

