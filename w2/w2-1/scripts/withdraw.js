//通过脚本调用count
const {ethers, network} = require("hardhat");

const addr = "0x2279B7A0a67DB372996a5FaB50D91eAA73d2eBe6"
async function main() {
    let [owner] = await ethers.getSigners();

    let bank = await ethers.getContractAt("Bank",addr,owner)


    // 全部提现
    await bank.withdraw();
}

main()
.then(()=> process.exit(0))
.catch(error=>{
    console.error(error);
    process.exit(1);
});