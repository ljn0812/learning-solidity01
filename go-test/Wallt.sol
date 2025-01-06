// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract Wallet {
    IERC20 private token;

    constructor(address _tokenAddress) {
        token = IERC20(_tokenAddress);
    }

    // 查询余额
    function balanceOf(address account) public view returns (uint256) {
        return token.balanceOf(account);
    }

    // 转账
    function transfer(address recipient, uint256 amount) public returns (bool) {
        require(token.transferFrom(msg.sender, recipient, amount), "Transfer failed.");
        return true;
    }

    // 授权额度
    function approve(address spender, uint256 amount) public returns (bool) {
        require(token.approve(spender, amount), "Approval failed.");
        return true;
    }

    // 查看授权额度
    function allowance(address owner, address spender) public view returns (uint256) {
        return token.allowance(owner, spender);
    }
}