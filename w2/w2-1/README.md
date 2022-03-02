## Bank合约代码（亦可见代码文件）
![bank](/assets/w2/bank.png)

## 操作流程
1. hardhat node      // 开启本地节点
2. hardhat compile   // 编译合约
3. hardhat run scripts/deploy.js --network dev  // 将合约部署到本地节点，并记录部署地址
4. metamask导入hardhat提供的第一个地址，网络选择本地节点（注意chainid）
5. 从metamsk向合约地址转币，可以成功转账
6. hardhat run scripts/withdraw.js --network dev  // 全部提现，metamsk中可验证