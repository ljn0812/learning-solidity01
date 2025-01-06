// SPDX-License-Identifier: MIT
pragma solidity >0.5.0;
contract HandleError {

    address public owner;

    error customizeError (address caller); //自定义错误

    constructor() {
        owner = msg.sender;
    }
    
    function transfer(address newOwner) public {
        //检查调用者是否为合约拥有者
        require(msg.sender == owner, "only owner can operate");
        owner = newOwner;
    }

    function cal(uint a, uint b) public pure returns (uint){
        uint result = a + b;
        assert(result >= a);//检查是否溢出
        return result;
    }

    function rev(uint a, uint b) public pure {
        if(a>b){
            revert("throw an error");
        }
    }

    function restrict() public view {
        if(msg.sender != owner) {
            revert customizeError(msg.sender);//使用自定错误
        }
    }
}

contract trycatchDemo{

    HandleError handlerror;

    constructor() {
        handlerror = new HandleError();
    }
    // try catch 捕获异常
    function test() public view returns (string memory){
        try handlerror.rev(2, 1) {
            return "not execute";
        }catch Error(string memory error){
            return error;
        }
    }
}