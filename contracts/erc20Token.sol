// SPDX-License-Identifier: GPL-3.0

// --------------------------------------------------------------
// Implemets EIP20 token https://github.com/ethereum/EIPs/blob/master/EIPS/eip-20.md
// ---------------------------------------------------------------

pragma solidity ^0.8.10;

import "./erc20Interface.sol";

contract ERC20Token is ERC20Interface {
    uint256 constant private MAX_UINT256 = 2**256 - 1;
    mapping (address => uint256) public balances;
    mapping (address => mapping (address => uint256)) public allowed;

    uint256 public totSupply; // Total number of tokens
    string public name; // Descriptive names (i.e. For Dummies Sample Token)
    uint8 public decimals; // How many decimals to use when displaying amounts
    string public symbol; // Short identifier for token (i.e. FDT)

    // Create the new token and assign initial values, including initial amount
    constructor(
        uint256 _initialAmount,
        string memory _tokenName,
        uint8 _decimalUnits,
        string memory _tokenSymbol
    ) {
        balances[msg.sender] = _initialAmount; // The creator owns all initial tokens
        totSupply = _initialAmount; // Update total token supply
        name = _tokenName;  // Store the token name (used for display only)
        decimals = _decimalUnits; // Store the number of decimals (used for display only)
        symbol = _tokenSymbol; // Store the token symbol (used for display only)
    }

    // Transfer tokens from msg.sender to a specified address
    function transfer(address _to, uint _tokens) external override returns (bool success) {
            require(balances[msg.sender] >= _tokens, "Insufficient funds for transfer source.");
            balances[msg.sender] -= _tokens;
            balances[_to] += _tokens;
            emit Transfer(msg.sender, _to, _tokens);
            return true;
    }

    // Transfer tokens from one specified address to another specified address
    function transferFrom(address _from, address _to, uint256 _tokens) external override returns (bool success) {
        uint256 _allowance = allowed[_from][msg.sender];
        require(balances[_from] >= _tokens && _allowance >= _tokens, "Insufficient allowed funds for transfer sources");
        balances[_to] += _tokens;
        balances[_from] -= _tokens;
        if (_allowance < MAX_UINT256) {
            allowed[_from][msg.sender] -= _tokens;
        }
        emit Transfer(_from, _to, _tokens);
        return true;
    }

    // Return the current balance (in tokens) of a specified address
    function balanceOf(address _tokenOwner) external view override returns (uint256 balance) {
        return balances[_tokenOwner];
    }

    function apporve(address _sender, uint256 _tokens) external override returns (bool success) {
        allowed[msg.sender][_sender] = _tokens;
        emit Approval(msg.sender, _sender, _tokens);
        return true;
    }

    function allowance(address _tokenOwner, address _spender) external view override returns (uint256 remaining) {
        return allowed[_tokenOwner][_spender];
    }

    // Return the total number of tokens in circulation
    function totalSupply() external view override returns (uint256 totSupp) {
        return totSupply;
    }


}