const Demo_Contract = artifacts.require("UrlEmitter");
const Demo_Contract_V2 = artifacts.require("UrlEmitterV2");

module.exports = function (deployer) {
  const initialUrls = [
    "https://chaincloack-65913277c1a0.herokuapp.com/api/chat/ask",
  ];
  deployer.deploy(Demo_Contract, initialUrls);
  deployer.deploy(Demo_Contract_V2, initialUrls);
};
