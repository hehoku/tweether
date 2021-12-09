// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.10;

import "./Owned.sol";

contract BaseController is Owned {
  address managerAddr;

  function setManagerAddr(address _managerAddr) public onlyOwner {
    managerAddr = _managerAddr;
  }
}
