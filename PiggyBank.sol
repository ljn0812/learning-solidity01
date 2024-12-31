// SPDX-License-Identifier: MIT
pragma solidity >0.5.0;

contract PiggyBank {
    address public owner;

    event Recieve(address from, uint256 amout);
    event Withdraw(uint256 amount);

    constructor() {
        owner = msg.sender;
    }


    receive() external payable { 
        emit Recieve(msg.sender, msg.value);
    }

    function withdraw() external  {
        require(msg.sender == owner,"only owner has access");
        emit Withdraw(address(this).balance);
        selfdestruct(payable(msg.sender));//销毁合约。并将所有的余额发送到调用者
    }

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }

    
}