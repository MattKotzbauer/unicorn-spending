// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract DailyLimit {
    mapping(address => uint256) public spentToday;
    address[] public spenders;
    uint256 public lastReset;
    uint256 public constant DAILY_LIMIT = 1 ether;

    constructor() {
        lastReset = block.timestamp;
    }

    function spend(uint256 amount) public {
        require(block.timestamp >= lastReset + 1 days, "Spending limit has not been reset");
        require(spentToday[msg.sender] + amount <= DAILY_LIMIT, "Exceeds daily limit");

        if (spentToday[msg.sender] == 0) {
            spenders.push(msg.sender);
        }
        spentToday[msg.sender] += amount;
        // Add code here to actually spend the `amount` (e.g., transfer it to another address)
    }

    function resetSpending() public {
        require(block.timestamp >= lastReset + 1 days, "Can only reset spending once a day");

        for (uint256 i = 0; i < spenders.length; i++) {
            spentToday[spenders[i]] = 0;
        }
        delete spenders;

        lastReset = block.timestamp;
    }
}

