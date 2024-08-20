// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "./PERC20.sol";

contract PERC20TestToken is PERC20 {
    constructor() PERC20("WIND", "pWIND") {}

    receive() external payable {
            _mint(_msgSender(), msg.value);
    }
    function balanceOf(address account) public view override returns (uint256) {
            return _balances[account];
    }

    function allowance(address owner, address spender) public view virtual override returns (uint256) {
            require(msg.sender == spender, "PERC20Sample: msg.sender != account");
        
       
            return _allowances[owner][spender];
    }

    function mint() public {
        _mint(msg.sender, 100*10**18);
    }

    
}
