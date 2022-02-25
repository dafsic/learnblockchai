const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("Counter", function () {
  it("Counter test", async function () {
    const Counter = await ethers.getContractFactory("Counter");
    const counter = await Counter.deploy(5);
    await counter.deployed();

    expect(await counter.getCounter()).to.equal(5);

    const countTx = await counter.count();

    // wait until the transaction is mined
    await countTx.wait();

    expect(await counter.getCounter()).to.equal(6);
  });
});
