//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

//import "hardhat/console.sol";

contract Bank {
    event logdata(uint x);
    mapping(address => uint) public balances;

    // 合约账户收到币后记录发送者和发送金额
    receive() external payable {
        emit logdata(msg.value);
        balances[msg.sender] = msg.value;
    }

    // 如果消息发送者有币，则全部提现
    function withdraw() public {
        if (balances[msg.sender] > 0) {
            //payable(msg.sender).transfer(balances[msg.sender]);
            bool success = payable(msg.sender).send(balances[msg.sender]);
            if (success) {
                balances[msg.sender] = 0;
            }
        }
    }

    // 获取消息发送者的余额
    function getBalance() public view returns(uint) {
        return balances[msg.sender];
    }
}
