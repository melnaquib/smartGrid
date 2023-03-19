//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract SmartGridService is Ownable {

    mapping (address => mapping (uint32 => bool)) paid;
    struct Band {
        int32 base;
        int32 rate;
    }

    IERC20 token;

    event Invoice(address subscriber, int32 usage, uint32 amount);

    constructor(IERC20 atoken) {
        token = atoken;
    }

    function hasPaid(address asubscriber, uint32 abillId) public view returns (bool) {
        return paid[asubscriber][abillId] ;
    }

    modifier notPaid(address asubscriber, uint32 abillId) {
        require(!hasPaid(asubscriber, abillId));
        _;
    }
    
    function reportUsage(address asubscriber, int32 ausage, uint32 abillId) external onlyOwner notPaid(asubscriber, abillId) {
        Band memory band = getBillingBand(asubscriber, ausage);
        int32 amount = band.base + band.rate * ausage;

        if( amount > 0) {
            token.transferFrom(asubscriber, owner(), uint32(amount));
        } else {
            token.transferFrom(owner(), asubscriber, uint32(-amount));
        }

        paid[asubscriber][abillId] = true;
        emit Invoice(asubscriber, ausage, uint32(amount));
    }


    function getBillingBand(address asubscriber, int32 ausage) public pure returns(Band memory) {
        if (ausage < 0) {
            return Band({base:0, rate: -1});
        } 
        if (ausage < 1000) {
            return Band({base: 5, rate: 10});
        } 
        return Band({base:50, rate: 10});
    }
}
