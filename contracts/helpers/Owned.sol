// SPDX-License-Identifier: Apache-2.0

pragma solidity ^0.8.10;

contract Owned {
  address public ownerAddr;

  constructor() {
    ownerAddr = msg.sender;
  }

  modifier onlyOwner() {
    require(msg.sender == ownerAddr);
    _;
  }

  function transferOwnership(address newOwner) public onlyOwner {
    require(newOwner != address(0));

    ownerAddr = newOwner;
  }
}
