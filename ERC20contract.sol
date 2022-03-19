// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts@4.5.0/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts@4.5.0/access/Ownable.sol";

contract Token20 is ERC20, Ownable {
    constructor() ERC20("Token20", "T2") {
        _mint(msg.sender, 1000000 * 10  ** decimals());
    }

      function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function buyToken(address receiver) public payable returns (uint256){
        uint256 tokenAmount = msg.value / (1 * 10 ** decimals()) * 1000;

        _mint(receiver, tokenAmount);

        return tokenAmount;
    }

}