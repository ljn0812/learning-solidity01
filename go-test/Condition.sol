// SPDX-License-Identifier: MIT
pragma solidity >0.5.0;
contract Condition {
    uint public a = 10;//公共变量
    uint internal b = 20;//内部变量
    uint private c = 30;//私有变量
    //访问并修改公共变量并返回
    function testA() public returns (uint){
        a = 101;
        return a;
    }
     //访问并修改公共变量并返回
    function testB() public returns (uint){
        b = 201;
        return b;
    }
     //访问并修改公共变量并返回
    function testC() public returns (uint){
        c = 301;
        return c;
    }
    //for循环计算1-n的奇数和
    function sumByFor(uint256 n) public pure returns (uint256 sum) {
        for (uint256 i = 1; i <= n; i++) {
            if (i % 2 != 0) {
                sum += i;
            }
        }
    }




}
//外部合约可访问公共属性
contract ConditionA {
    Condition c = new Condition();
    function testD() public view returns (uint) {
        return c.a();
    }
    function testF() public view returns (uint) {
        // return c.c()   // 不可见，编译不通过
        //c.b();// 不可见，编译不通过
    }

    function tryCatch(address addr) public pure returns (uint256 sum, string memory str){
        //调用外部函数，并处理可能出现的异常
        try Condition(addr).sumByFor(100) returns (uint256 a) {
       //如果出现异常，则返回0，否则返回结果
            return (a,"success");
        } catch {
            return(0,"fail");
        }
    }

}
//子合约可访问私有属性
contract ConditionB is Condition {
    function testE() public view returns (uint){
        return b;
    }

}