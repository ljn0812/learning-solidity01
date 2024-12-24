// SPDX-License-Identifier: MIT
pragma solidity >0.5.0;

contract TestSelector {

    //状态变量
    bytes4 storedSelector;
    //函数用来计算平方
    function square(uint x) public pure  returns (uint y) {
        return x**2;
    }
    //函数用来计算双倍
    function double(uint x) public pure returns (uint y) {
        return x*2;
    }
    //函数 动态调用square或double
    function executeFunction(bytes4 selector, uint x) public pure returns(uint y) {
        // 通过selector来判断传入的函数是square还是double
        if(selector == this.square.selector) {
            y = square(x);
            return y;
        }else {
            y = double(x);
            return y;
        }
    }
    //将选择器存储在状态变量storedSelector中
    function storeSelector(bytes4 selector) public {
        storedSelector = selector;
    }
    //调用存储在storedSelector中的函数，并返回结果
    function executeStoredFunction(uint x) public returns (uint y){
        require(storedSelector != bytes4(0x0),"selector not exsit");
        (bool succuss, bytes memory data) = address(this).call(abi.encodeWithSelector(storedSelector, x));
        require(succuss, "call failed");
        y = abi.decode(data, (uint));
        return y;
    }
}