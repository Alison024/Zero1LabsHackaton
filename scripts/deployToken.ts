import { ethers } from "hardhat";
async function main() {
  const Token = await ethers.getContractFactory("BattleToken");
  const bt = await Token.deploy();
  await bt.waitForDeployment();
  console.log("Your token deployed to:", await bt.getAddress());
}
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
