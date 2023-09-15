const Demo_Contract = artifacts.require("UrlEmitter");

module.exports = function (deployer) {
  const initialUrls = [
    "https://chaincloack-65913277c1a0.herokuapp.com/api/chat/ask",
  ];
  deployer.deploy(Demo_Contract, initialUrls);
};
