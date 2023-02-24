//SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";

contract GridServiceHwCtrl is ERC721Enumerable, Ownable {

    //place holder for whether subscriber is connected or not
    //to be read by connecting hardware
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
