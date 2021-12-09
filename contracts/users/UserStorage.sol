// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import "../helpers/BaseStorage.sol";

contract UserStorage is BaseStorage {
  struct Profile {
    uint id;
    bytes32 username;
  }

  mapping(uint => Profile) public profiles;

  uint lastestUserId = 0;

  function createUser(bytes32 _username) public onlyController returns (uint) {
    lastestUserId++;
    profiles[lastestUserId] = Profile(lastestUserId, _username);

    return lastestUserId;
  }
}
