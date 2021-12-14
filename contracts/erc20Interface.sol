// SPDX-License-Identifier: GPL-3.0

// --------------------------------------------------------------
// ERC Token Standard #20 Interface
// https://github.com/ethereum/EIPs/blob/master/EIPS/eip-20.md
// ---------------------------------------------------------------

pragma solidity ^0.8.10;

interface ERC20Interface {
    // uint256 public virtual totSupply;

    function totalSupply() external view returns (uint);
    function balanceOf(address _tokenOwner) external view returns (uint balance);
    function allowance(address _tokenOwner, address spender) external view returns (uint remaining);
    function transfer(address _to, uint _tokens) external returns (bool success);
    function apporve(address _sender, uint _tokens) external returns (bool success);
    function transferFrom(address _from, address _to, uint _tokens) external returns (bool success);

    event Transfer(address indexed from, address indexed to, uint tokens);
    event Approval(address indexed tokenOwner, address indexed spender, uint tokens);
}