//通过脚本调用count
const {ethers, network} = require("hardhat");

const addr = "0x5d4127f6e3cB8764acD9bE93A89Da9E6CAd5B389"
async function main() {
    let [owner] = await ethers.getSigners();

    let counter = await ethers.getContractAt("Counter",addr,owner)

    // 计数加1
    let countTx = await counter.count();
    // 等待交易上链
    await countTx.wait();

    // 获取最新状态
    let newValue = await counter.getCounter();

    console.log("newValue:" + newValue);
}

main()
.then(()=> process.exit(0))
.catch(error=>{
    console.error(error);
    process.exit(1);
});