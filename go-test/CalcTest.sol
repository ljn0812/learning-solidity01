// SPDX-License-Identifier: MIT
pragma solidity >0.5.0;
import "./MathLib.sol";

contract CalcTest {

    using ArrayLib for uint[];

    uint[] public data;

    //调用链接库中的乘法函数
    function mul(uint a, uint b) public pure returns (uint) {
        return MathLib.mul(a,b);
    }
    //using for 语法调用链接库中的函数
    function replace(uint _old, uint _new) public {
        uint result = data.findIndex(_old);
        if(result == uint(123456789)) {
            data.push(_new);
        } else{
            data[result] = _new;
        }
    }
}