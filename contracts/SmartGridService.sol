//SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract SmartGridService is Ownable {

    struct Band {
        int32 base;
        int32 rate;
    }

    int32[] public LEVELS = [0, 1000];

    IERC20 token;

    event Invoice(address subscriber, int32 usage, uint32 amount);

    constructor(IERC20 atoken) {
        token = atoken;
    }

    function reportUsage(address asubscriber, int32 ausage, uint32 abillId) external onlyOwner {
        Band memory band = getBillingBand(asubscriber, ausage);
        int32 amount = band.base + band.rate * ausage;

        if( amount > 0) {
            token.transferFrom(asubscriber, owner, amount);
        } else {
            token.transferFrom(owner, asubscriber, -amount);
        }

        emit Invoice(asubscriber, ausage, amount);
    }


    function getBillingBand(address subscriber, int32 ausage) public view returns(Band memory) {
        //TODO

        if (ausage < LEVELS[0]) {
            return Band({base:0, rate: -10});
        } 
        if (ausage < LEVELS[1]) {
            return Band({base:50, rate: 10});
        } 
        return Band({base:500, rate: 100});
    }
}
