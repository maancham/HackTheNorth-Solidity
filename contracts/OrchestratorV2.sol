// contracts/UrlEmitter.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract UrlEmitter {
    string[] public urls;

    mapping(string => uint256) public reputationMap;

    event UrlEmitted(address indexed sender, string url);
    event UrlListEmitted(string url);
    event UrlAppended(
        address indexed sender,
        string appendedUrl,
        uint256 reputation
    );
    event UrlsCleared(address indexed sender);

    constructor(string[] memory initialUrls) {
        require(initialUrls.length > 0, "Initial URLs array must not be empty");
        for (uint256 i = 0; i < initialUrls.length; i++) {
            urls.push(initialUrls[i]);
            reputationMap[initialUrls[i]] = 1; // default reputation is 1
        }
    }

    function emitNextNode() public view returns (string memory) {
        require(urls.length > 0, "No URLs available");

        string memory mostReputableUrl = urls[0];
        uint256 highestReputation = reputationMap[mostReputableUrl];

        for (uint256 i = 1; i < urls.length; i++) {
            if (reputationMap[urls[i]] > highestReputation) {
                mostReputableUrl = urls[i];
                highestReputation = reputationMap[mostReputableUrl];
            }
        }

        return mostReputableUrl;
    }

    function appendUrl(string memory newUrl, uint256 reputation) public {
        require(bytes(newUrl).length > 0, "URL must not be empty");
        urls.push(newUrl);
        reputationMap[newUrl] = reputation;
        emit UrlAppended(msg.sender, newUrl, reputation);
    }

    function emitAllUrls() public {
        for (uint256 i = 0; i < urls.length; i++) {
            emit UrlListEmitted(urls[i]);
        }
    }

    function clearUrls() public {
        require(urls.length > 0, "No URLs to clear");
        delete urls;
        emit UrlsCleared(msg.sender);
    }
}
