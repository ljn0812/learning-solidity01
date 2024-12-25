// SPDX-License-Identifier: MIT
pragma solidity >0.5.0;

contract RecieveFallback {
    //事件 用来记录接受以太币的信息
    event Receive(address addr, uint amount);
    //事件 用来记录fallback调用的信息
    event Fallback(address addr, bytes data);
    //当合约接受以太币时出发
    receive() external payable {
        emit Receive(msg.sender,msg.value);
    }
    //当调用的函数不存在或发送以太币的同时带有数据触发
    fallback() external payable {
        emit Fallback(msg.sender,msg.data);
    }
    //指定用户接收以太币
    function deal(uint256 amout,address payable recipient) public {
        require(amout <= address(this).balance, "insufficient balance");
        recipient.transfer(amout);
    }
    //获取合约的余额
    function getBalance() public view returns (uint256){
        return address(this).balance;
    }
}