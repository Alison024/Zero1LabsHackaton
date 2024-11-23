import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";
const TokenModule = buildModule("Token", (m) => {
  const lock = m.contract("BattleToken", []);
  return { lock };
});

export default TokenModule;
