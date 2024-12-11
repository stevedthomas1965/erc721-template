const { buildModule } = require("@nomicfoundation/hardhat-ignition/modules");

const AssetsModule = buildModule("AssetsModule", (m) => {
  const assets = m.contract("Assets");

  return { assets };
});

module.exports = AssetsModule;