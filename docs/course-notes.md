
1. Solidity Introduction

## - Smart Contract Basics

- Learned how smart contracts are defined in Solidity
- Understood state variables and how they persist on-chain
- Explored default values and public visibility
- Learned how contracts are compiled and deployed
- Completed Alchemy validation exercises successfully



## - Functions and Value Types

### Constructor Arguments
- Learned how constructors initialize contract values during deployment
- Passed values into contracts using function arguments
- Used state variables to store deployed values

### Contract Functions
- Created external functions to modify contract state
- Learned how functions can update blockchain storage
- Implemented increment logic for state variables

### Returning Values
- Learned how Solidity functions return values using `returns`
- Used `view` functions to read contract state without modifying it
- Performed calculations using state variables

### Console.log Debugging
- Used `console.log` for Solidity debugging in Foundry
- Inspected function input values during execution
- Learned basic debugging workflow in smart contract development

### Pure Functions
- Created `pure` functions that do not read or modify blockchain state
- Performed arithmetic operations using only function inputs
- Learned the difference between `view` and `pure`

### Function Overloading & Tuples
- Implemented overloaded functions with the same name but different parameters
- Returned multiple values using tuples
- Reused functions internally by changing visibility from `external` to `public`



## 3. Address Interactions

............Sending Ether

### Storing Owner

- Learned how Solidity stores Ethereum addresses using the `address` type
- Used `msg.sender` to access the address calling the contract
- Stored the deployer address as the contract owner
- Understood basic ownership patterns in smart contracts

### Receive Ether

- Learned how contracts receive Ether using payable functions
- Used the special `receive()` function for transactions without calldata
- Understood the purpose of `msg.value`
- Learned that contracts cannot receive Ether unless marked payable

### Transferring Funds

- Learned how payable functions receive Ether
- Used `msg.value` to access transferred Wei
- Transferred Ether using `address.call`
- Used `require` to ensure transfers succeed
- Implemented a simple tipping mechanism for the contract owner

### Charity Donation

- Learned how contracts store Ether using `address(this).balance`
- Used constructors to initialize external addresses
- Transferred full contract balance using `transfer`
- Understood how contracts can act as fund routers (users → contract → recipient)

### Self Destruct

- Learned how contracts can be permanently removed from the blockchain using `selfdestruct`
- Used `selfdestruct` to send all remaining Ether in the contract to a specified address
- Understood that `selfdestruct` transfers the entire contract balance automatically
- Learned that `selfdestruct` destroys contract state and removes it from the blockchain
- Practiced replacing manual Ether transfers with contract destruction for fund recovery

............Reverting Transactions

## Constructor Revert

- Learned how constructors can accept Ether during deployment
- Used `msg.value` inside constructor to validate payment
- Used `require()` to enforce minimum 1 ether deposit
- Understood that failing `require` reverts contract deployment
- Learned that constructors are the only functions executed at deployment time

## Payable Constructor & Ownership

- Learned that constructors must be marked `payable` to receive ETH during deployment
- Used `msg.value` inside constructor for initial funding validation
- Combined ownership pattern with funded deployment
- Understood how deployment-time ETH transfer works in smart contracts


## Function Modifiers (onlyOwner)

- Learned how modifiers add reusable logic to functions
- Implemented `onlyOwner` modifier to restrict access
- Used `require(msg.sender == owner)` for authorization
- Understood `_` as the placeholder for function execution
- Replaced repeated access checks with reusable modifier pattern

.............Calling Contracts

## Interfaces & External Calls

- Learned how contracts interact using interfaces
- Used `interface` to define external contract functions
- Called another contract using `IHero(hero).alert()`
- Understood how Solidity encodes function calls into calldata
- Practiced safe contract-to-contract communication

## Function Signatures & Low-Level Calls

- Learned that function signatures are hashed using keccak256
- Understood that first 4 bytes identify the function in calldata
- Used `abi.encodeWithSignature` to generate calldata manually
- Performed low-level contract calls using `.call()`
- Learned the difference between interface calls and raw EVM calls

