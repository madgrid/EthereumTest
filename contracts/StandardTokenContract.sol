pragma solidity ^0.4.4;
contract StandardTokenContract {
	// Common pattern for smart contracts
  // When the contract is first deployed
  // I want the person that deployed the contract as Admin
  address public owner;

  // In order to store the state of the standard token contracts.
  // You need a hashmap, which is the most integral data structure.
  // Mapping is like a hash table.
  // Can map from any data type ex: address
  // Address or wallets or accounts to a uint.
	// Send that to the balances variable.
	mapping (address => uint) balances;

  // constructor
  // runs once upon contract creation
  function StandardTokenContract() {
    // Set owner equal to msg
    // Solidity provides msg.sender
    // msg.sender takes on the value of the address
    // that matches the sending transaction
    owner = msg.sender;
    // We give a value to the owner 1000 meta whatever coins upon start
    // Test Phase
    balances[owner] = 1000;
  }


  // Sending a value from one adress to another ONLY
  // We know by default who is sending the value from the owner
	function transfer(address _to, uint _value) returns (bool success) {

    // A check if sender has the funds to send amount
    if(balances[msg.sender] < _value) {
      return false;
    }

    // Subtracts the value from the sender
    balances[msg.sender] -= _value;
    // Adds the value to the another user or address
    balances[_to] += _value;
    // Confirms the transaction was successfull
    return true;
  }

  // This function when called shows the balance of the user
  // Cost gas, but is very little.
  // Constant does not change the state of the blockchain
  // !Can not loop!
  // Because every single address and uint is initalized to zero
  // Unlike having a hash table that only has entries have been specified
	// Mapping is different automaticaly has initialized zero values for everything
  // Until we modify those zero values
  // Check out https://live.ether.camp
  function getBalance(address _user) constant returns (uint _balance) {
    return balances[_user];
  }
}
