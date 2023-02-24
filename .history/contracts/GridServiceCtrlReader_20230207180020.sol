//SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

import "@openzeppelin/contracts/access/Ownable.sol";

contract GridServiceHwReader is Ownable {

    mapping(address => int128) public subscribers_reads;

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
