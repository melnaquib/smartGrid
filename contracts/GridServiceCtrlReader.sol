//SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

import "@openzeppelin/contracts/access/Ownable.sol";

contract GridServiceHwReader is Ownable {

    mapping(address => int128) public subscribers_reads;

    constructor(address owner) {
        transferOwnership(owner);
    }

    void setRead(address subscriber, int32 read) onlyOwner() {
        subscribers_reads[subscriber] = read;
    }

    int32 getRead(address subscriber, bool connected) onlyOwner() {
        subscribers_reads[subscriber] = false;
    }
}
