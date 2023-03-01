//SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import '@openzeppelin/contracts/token/ERC20/ERC20Mintable.sol';

contract MyToken is ERC20Mintable {
       string public name = "My Token";
       string public symbol = "MYT";
}
