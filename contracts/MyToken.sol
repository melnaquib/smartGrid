//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyToken is ERC20 {
       constructor() ERC20("My Token", "MYT") {
              //Remix VM(Merge)
              uint64 b = 1000000000;
              address svc = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
              address sub = 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2;

              _mint(msg.sender, b);
              _mint(svc, b);
              _mint(sub, b);
       }

}
