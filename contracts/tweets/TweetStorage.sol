// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.10;

import "../helpers/BaseStorage.sol";

contract TweetStorage is BaseStorage {
  mapping(uint => Tweet) public tweets;

  struct Tweet {
    uint id;
    string text;
    uint userId;
    uint postedAt;
  }

  uint lastestTweetId = 0;

  function createTweet(uint _userId, string memory _text)
    public
    onlyController
    returns (uint)
  {
    lastestTweetId++;
    tweets[lastestTweetId] = Tweet({
      id: lastestTweetId,
      text: _text,
      userId: _userId,
      postedAt: block.timestamp
    });

    return lastestTweetId;
  }
}
