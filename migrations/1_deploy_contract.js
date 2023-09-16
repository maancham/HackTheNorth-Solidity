const Demo_Contract = artifacts.require("UrlEmitter");

module.exports = function(deployer) {
    const initialUrls = ["url1"];
    deployer.deploy(Demo_Contract, initialUrls);
};