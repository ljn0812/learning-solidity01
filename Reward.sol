// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "./Mytoken.sol";


contract Reward {
    Mytoken immutable token;
    // 构造函数初始化token地址
    constructor(address _tokenAddress) {
        token = Mytoken(_tokenAddress);
    }

     // 发放奖励的函数
    function distributeReward(address recipient, uint256 amount) public {
        require(token.balanceOf(address(this)) >= amount, "Reward: Not enough tokens in the contract.");
        token.transfer(recipient, amount);
    }
}
