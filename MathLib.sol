// SPDX-License-Identifier: MIT
pragma solidity >0.5.0;

library MathLib {
    //加法 内嵌库
    function sum(uint a, uint b) internal pure returns (uint) {
        return a + b;
    }
    //乘法  链接库
    function mul(uint a, uint b) external pure returns (uint) {
        return a * b;
    }
    //减法  内嵌库
    function sub(uint a, uint b) internal pure returns (uint) {
        return a - b;
    }
}


// contract Math {
//     //调用MathLib库的加法函数
//     function sum(uint a, uint b) public pure returns (uint) {
//         return MathLib.sum(a,b);
//     }
// }

library ArrayLib {
    function findIndex(uint[] storage a, uint value) external view returns (uint) {
        for (uint i = 0; i < a.length; ++i) {
            if(a[i] == value){
                return i;
            }
            
        } 
        return 123456789;
    }
}