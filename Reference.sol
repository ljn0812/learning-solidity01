// SPDX-License-Identifier: MIT
pragma solidity >0.5.0;
contract TestReference {
    uint[] data;//状态变量 data数组，存储在storage上
    //函数 接受一个memory数组并赋值给状态变量data
    function updateData(uint[] memory newData) public {
        data = newData;//从memory到storage,创建了独立的拷贝
    }
    //通过该函数获取data数组
    function getData() public view returns (uint[] memory) {
        return data; //返回storage中的值，作为memory中的数组
    }
    //函数 修改data数组中指定索引位置的值
    function modifyStorageData(uint index, uint value) public {
        data[index] = value; //修改storage中的值 开销较大
    }
    //函数 修改传入参数 memory的值并返回
    function modifyMemoryData(uint[] memory memData) public pure returns (uint[] memory){
        if(memData.length > 0) {
            memData[0] = 99; //修改memory中的值 开销较小
        }
        return memData;//返回memory数组
    }
}