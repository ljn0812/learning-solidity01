// SPDX-License-Identifier: MIT
pragma solidity >0.5.0;
contract FunctionTest {

    struct Record {
        address from;//交易发送发
        uint amount;//以太币数量
    }

    mapping (address => Record[]) public records;//用户与交易记录的映射

    uint public num = 10;
    //函数可见性为public，任何地方都可调用该函数，切状态可见性为pure，既不能读取状态变量，也不能修改
    function testPublic(uint a, uint b) public pure returns (uint c) {
        return a+b;
    }
    //函数可见性为external，只能从合约的外部调用，如果内部想调用该函数，需使用this关键字
    function testExternal(uint a, uint b) external pure returns (uint c) {
        return a+b;
    }
    //函数可见性为internal，可在合约内部调用，继承了该合约的子合约也可调用
    function testInternal(uint a, uint b) internal pure returns (uint c) {
        return a+b;
    }
    //函数可见性为private，只能在合约内部调用
    function testPrivate(uint a, uint b) private pure returns (uint c) {
        return a+b;
    }
    //函数状态可变性为view， 只能读取状态变量，不能修改
    function testView() public view returns (uint b) {
        return num;
    }
    //状态可见性为payable，用来接收以太币，如果没有该修饰符，函数将拒绝接受任何以太币
    function testPayable() public payable {
       
        testPublic(1, 1);
        this.testExternal(1, 1);
        testInternal(1, 1);
        testPrivate(1,1);
    }
    //该函数接受两个参数，并返回和与积
    function calculate(uint a, uint b) public pure returns (uint c, uint d) {
        return (a+b, a*b);
    }
    //接受以太币
    function accept(uint amount) external payable {
        Record memory newRecord = Record({from: msg.sender, amount: amount});
        records[msg.sender].push(newRecord);
        
    }

    
}