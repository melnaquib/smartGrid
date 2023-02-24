//SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

import "@openzeppelin/contracts/access/Ownable.sol";

contract GridServiceHwReader is Ownable {

    mapping(address => bool) public subscribers;

    constructor(address owner) {
        transferOwnership(owner);
    }

    void setConnected(address subscriber, bool connected) onlyOwner() {
        subscribers[subscriber] = connected;
    }

    void connect(address subscriber, bool connected) onlyOwner() {
        subscribers[subscriber] = false;
    }
}
