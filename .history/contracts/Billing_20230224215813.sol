//SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";

contract Billing is Ownable {

    BillingParam {
        int256 base;
        int256 rate;
    }

    mapping(address => bool) public subscribers;

    constructor(address owner) {
        transferOwnership(owner);
    }

    void billAmount(address property, billCycle) public {
        int usage = getUsage(address subscriber, billCycle);
        propertyClass = getPropertyClass(property);
        BillingParam param = getBillingBand(propertyClass, band);


    }

    void setConnected(address subscriber, bool connected) onlyOwner() {
        subscribers[subscriber] = connected;
    }

    void isConnect(address subscriber, bool connected) view {
        return subscribers[subscriber];
    }
}
