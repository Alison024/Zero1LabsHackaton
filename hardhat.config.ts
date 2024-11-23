import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";

const config: HardhatUserConfig = {
  solidity: {
    version: "0.8.28", // Use a Solidity version compatible with Cancun
    settings: {
      optimizer: {
        enabled: true,
        runs: 200,
      },
      evmVersion: `cancun`,
    },
  },
  networks: {
    hardhat: {
      hardfork: "cancun", // Explicitly specify Cancun fork
    },
  },
};

export default config;
