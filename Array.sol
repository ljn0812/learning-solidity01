// SPDX-License-Identifier: MIT
pragma solidity >0.5.0;
contract TestArray {
    uint[] public array;
    bytes[] public bytesArray;
    string[] public strArray;
    //函数 计算memory数组 并计算各个元素的和
    function sum(uint[] memory arr) public pure returns (uint) {
        require(arr.length > 0, "arr is required");
        return sumOfArr_(arr);

    }
    //循环memory数组，求和并返回
    function sumOfArr_(uint[] memory arr) internal pure returns (uint) {
        uint256 total = 0;
        for (uint i=0;i<arr.length;i++){
            total+= arr[i];
        }
        return total;
    }
    //修改storage中的数组，并缩短长度
    function changeLength(uint index) public {
        require(index<array.length,"index outbound");
        if(index != array.length-1) { 
            array[index] = array[array.length-1];//用数组中的最后一个元素，替换想要删除的那个元素
        }
        array.pop();//删除最后一个元素
    }
    //函数 参数为memory字节，并添加到bytesArray数组
    function addBytes(bytes memory data) public {
        bytesArray.push(data);
    }

     //函数 参数为memory字符串，并添加到strArray数组
    function addStr(string memory data) public {
        strArray.push(data);
    }
}