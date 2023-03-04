const ddrive = artifacts.require("./ddrive.sol");

module.exports = function (deployer) {
  deployer.deploy(ddrive);
};