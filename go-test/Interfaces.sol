// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IVault {
    function setMoney(uint amount) external ;
    function getBalance(uint amout) external;
}

contract Reward is IVault {
    function setMoney(uint amout) external override {
        //存钱逻辑
    }

    function getBalance(uint amout) external override {
        //取钱逻辑
    }
}

