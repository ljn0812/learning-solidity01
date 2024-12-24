// SPDX-License-Identifier: MIT
pragma solidity >0.5.0;

contract UserManage {
    struct User {
        string userName;//姓名
        uint age;//年龄
        string gender;//性别
        uint balance;//余额
        mapping(address => Transaction[]) histories;//用户的历史交易记录
    }


    struct Transaction {
        address from;   // 发起交易的地址
        address to;     // 接收交易的地址
        uint amount; // 交易金额
        uint timestamp; // 交易时间戳
    }

    mapping (address => User) public users;
}