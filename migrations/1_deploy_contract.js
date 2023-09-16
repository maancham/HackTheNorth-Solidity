const Demo_Contract = artifacts.require("UrlEmitter");

module.exports = function(deployer) {
    const initialUrls = ["url1", "url2", "url3"];
    deployer.deploy(UrlEmitter, initialUrls);
};