// SPDX-License-Identifier: MIT
pragma solidity >0.5.0;

contract TestMapping {
    mapping (address => uint) public balances;//用户与余额的映射

    mapping (address => uint) public userScores;//存储用户和积分的映射

    address[] public users; //动态数组 保存所有的用户

       // 定义交易结构体
    struct Transaction {
        address from;   // 发起交易的地址
        address to;     // 接收交易的地址
        uint amount; // 交易金额
        uint timestamp; // 交易时间戳
    }
    // 每个用户的交易历史映射
    mapping(address => Transaction[]) public histories;

    //函数 使某个用户的余额增加指定的金额
    function balancesAdd(uint amount) public {
        balances[msg.sender] += amount;

         // 记录交易历史
        Transaction memory newTransaction = Transaction({
            from: address(0), // 对于存款，from 设置为零地址
            to: msg.sender,
            amount: amount,
            timestamp: block.timestamp
        });
        histories[msg.sender].push(newTransaction);
    }

    function getSalary() public view returns (uint) {
        return balances[msg.sender]; //返回某个用户的余额,msg.sender 当前调用者也就是谁调用该函数查询的就是谁的余额
    }
}