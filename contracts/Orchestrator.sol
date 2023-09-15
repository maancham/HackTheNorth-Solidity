// contracts/UrlEmitter.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UrlEmitter {
    string[] public urls;
    uint256 public currentIndex;

    event UrlEmitted(address indexed sender, string url);
    event UrlListEmitted(string url);
    event UrlAppended(address indexed sender, string appendedUrl);

    constructor(string[] memory initialUrls) {
        require(initialUrls.length > 0, "Initial URLs array must not be empty");
        urls = initialUrls;
        currentIndex = 0;
    }

    function emitNextNode() public {
        require(urls.length > 0, "No URLs available");

        string memory nextUrl = urls[currentIndex];
        emit UrlEmitted(msg.sender, nextUrl);

        currentIndex = (currentIndex + 1) % urls.length;
    }

    function appendUrl(string memory newUrl) public {
        require(bytes(newUrl).length > 0, "URL must not be empty");
        urls.push(newUrl);
        emit UrlAppended(msg.sender, newUrl);
    }

    function emitAllUrls() public {
        for (uint256 i = 0; i < urls.length; i++) {
            emit UrlListEmitted(urls[i]);
        }
    }
}
