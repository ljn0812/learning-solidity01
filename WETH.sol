// SPDX-License-Identifier: MIT
pragma solidity >0.5.0;

contract WETH{

    string public name = "Wrapped Ether";
    string public symbol = "WETH";
    uint8 public decimals = 18;
    event Transfer(address indexed src, address indexed to, uint256 amount);
    event Approval(address indexed src, address indexed to, uint256 amount);
    event Deposit(address indexed toAds, uint256 amount);
    event Withdraw(address indexed src, uint256 amount);
    mapping(address => uint256) public balanceof;
    mapping(address => mapping(address => uint256)) public allowance;

    function deposit() public payable {
        balanceof[msg.sender] += msg.value;
        emit Deposit(msg.sender, msg.value);
    }

    function withDraw(uint256 amount) public {
        require(balanceof[msg.sender] >= amount,"No Amount");
        balanceof[msg.sender] -= amount;
        payable(msg.sender).transfer(amount);
        emit Withdraw(msg.sender, amount);
    }

    function totalSupply() public view returns (uint256) {
        return address(this).balance;
    }

    function transfer(address to, uint256 amount) public returns (bool) {
        return transferFrom(msg.sender, to, amount);
    }

    function transferFrom(address src, address to, uint256 amount) public returns (bool) {
        require(balanceof[src] > amount);
        if(src != msg.sender) {
            require(allowance[src][msg.sender] >= amount);
            allowance[src][msg.sender] -= amount;
        }

        balanceof[src] -=  amount;
        balanceof[to] += amount;
        emit Transfer(src, to, amount);
        return true;
    }

    fallback() external payable { 
        deposit();
    }

    receive() external payable { 
        deposit();
    }

    function approval(address delegateAds, uint256 amount) public returns (bool){
        allowance[msg.sender][delegateAds] = amount;
        emit Approval(msg.sender, delegateAds, amount);
        return true;
    }

    

    
}