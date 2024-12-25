// SPDX-License-Identifier: MIT
pragma solidity >0.5.0;
contract GlobalDemo {

    address public owner;
    uint public locktime;

    event OperationResult(uint256 result, string operatino);

    constructor() {
        owner = msg.sender;
        locktime = locktime + block.timestamp * 1 days;
    }

    function getInfo() public view returns (uint _blockNum,uint _timestamp, address miner, uint price) {
        _blockNum = block.number; //当前区块号
        _timestamp = block.timestamp;//当前区块时间戳
        miner = block.coinbase;//挖出当前区块的矿工地址
        price = tx.gasprice;//当前交易的gas价格
    }

    function encode(uint a, uint b) public pure returns (bytes memory)  {
        return abi.encode(a,b);//对输入的参数进行abi编码，返回字节数组
    }

    function decode(bytes memory _data) public pure returns (uint,uint){
        return abi.decode(_data, (uint, uint));//对输入的字节数据进行解码，返回参数
    }

    function withdraw() public view{
        require(block.timestamp > locktime); // 判断锁定时间是否过期
        require( owner == msg.sender); //只有合约拥有者才能调用这个函数
        //执行资金操作
    }
    // 大数加法
    function addmodDemo(uint a, uint b, uint c) public returns (uint) {
         uint result = addmod(a, b, c);
        emit OperationResult(result, "add");
        return result;
    }
    // 大数乘法
    function mulmodDemo(uint a, uint b, uint c) public returns (uint) {
         uint result = mulmod(a, b, c);
        emit OperationResult(result, "mul");
        return result;
    }

    // 对输入字符串进行 keccak256 哈希计算
    function hashString(string memory input) public pure returns (bytes32) {
        return keccak256(abi.encodePacked(input));
    }

    // 验证输入字符串与哈希值是否匹配
    function verifyHash(string memory input, bytes32 hash) public pure returns (bool) {
        return keccak256(abi.encodePacked(input)) == hash;
    }
}