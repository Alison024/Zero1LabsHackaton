import * as dotenv from "dotenv";
import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";
dotenv.config();
const { DEV_PRIVATE_KEY } = process.env;
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
    cypherTestnet: {
      url: "http://46.101.206.70:8449/",
      chainId: 9000,
      accounts: [`${DEV_PRIVATE_KEY}`],
    },
  },
};

export default config;
