const HDWalletProvider = require("@truffle/hdwallet-provider");
const path = require("path");
require("dotenv").config();

const mnemonic = process.env.MNEMONIC;

module.exports = {
  contracts_build_directory: path.join(__dirname, "src/contracts"),
  networks: {
    develop: {
      host: "127.0.0.1",
      port: 8545,
      network_id: "*",
      gasPrice: 0,
    },
    polygon: {
      provider: () => new HDWalletProvider(mnemonic, process.env.POLY_URL),
      network_id: 137,
      confirmations: 10,
      timeoutBlocks: 200,
      skipDryRun: true,
    },
    mumbai: {
      provider: () => new HDWalletProvider(mnemonic, process.env.MUMB_URL),
      network_id: 80001,
      confirmations: 10,
      timeoutBlocks: 200,
      skipDryRun: true,
    },
  },
  compilers: {
    solc: {
      version: "0.8.7",
      settings: {
        optimizer: {
          enabled: true,
          runs: 200,
        },
      },
    },
  },
};
