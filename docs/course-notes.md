
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


## ABI Encoding with Function Arguments

- Learned how to encode function calls using `abi.encodeWithSignature`
- Understood how function names and parameter types form calldata
- Required explicit types like `uint256` instead of `uint`
- Passed multiple arguments into encoded function calls
- Practiced building dynamic contract interactions without interfaces


## Calldata Forwarding

- Learned how to accept raw calldata using `bytes calldata`
- Forwarded arbitrary function calls to another contract using `.call`
- Understood that contracts can act as relayers without decoding data
- Practiced building flexible execution systems (used in DAOs and multisigs)
- Learned importance of calldata efficiency for gas optimization


## Fallback Function

- Learned that contracts execute `fallback()` when no function matches calldata
- Triggered fallback using empty calldata `""`
- Understood how function selectors determine execution flow
- Learned that invalid or unknown function signatures automatically route to fallback
- Gained insight into contract behavior when receiving unexpected input


.................ESCROW

## Escrow Participants Setup

- Defined core roles in an escrow system:
  - depositor (funds provider)
  - beneficiary (receiver of funds)
  - arbiter (approval authority)
- Learned how smart contracts model real-world trust systems
- Introduced role-based architecture in Solidity contracts

## Constructor

- Learned how constructors initialize contract state
- Stored depositor using `msg.sender`
- Accepted arbiter and beneficiary as constructor arguments
- Understood deployment-time trust setup in escrow systems
- Reinforced idea that contract state is immutable by design after deployment

## Funding the Escrow

- Learned how to make constructors payable
- Allowed ETH to be sent during contract deployment
- Understood that contract balance can be initialized at creation time
- Connected deployment process with real financial locking behavior

## Approval Mechanism

- Implemented fund release function using `approve`
- Transferred entire contract balance to beneficiary
- Used `address(this).balance` to access stored ETH
- Learned how escrow systems complete a payment flow
- Introduced concept of controlled fund disbursement

## Event Logging in Escrow

- Created `Approved(uint balance)` event
- Emitted event after successful fund transfer
- Learned how blockchain events act as a communication layer
- Understood role of events in frontend indexing and UX
- Practiced logging important state changes on-chain


3. Reference Types

Arrays

## Fixed Arrays & Loops

- Learned how to use fixed-size arrays in Solidity
- Used `uint[5] memory` for temporary array storage
- Iterated through arrays using a `for` loop
- Calculated totals using loop accumulation
- Understood difference between memory and storage data locations
  

## Dynamic Arrays

- Learned how to use dynamic arrays with `uint[]`
- Used `calldata` for efficient external input handling
- Iterated through arrays using `.length`
- Calculated totals from variable-sized input arrays
- Understood runtime-sized data structures in Solidity


## Storage Arrays & Filtering

- Learned how to use dynamic storage arrays
- Used `.push()` to add elements permanently to blockchain storage
- Filtered even numbers using modulo operator `%`
- Combined calldata input with persistent state updates
- Understood difference between temporary memory and permanent storage


## Memory Array Filtering

- Learned how to create dynamic memory arrays using `new`
- Understood that memory arrays cannot use `.push()`
- Used a two-pass filtering approach:
  1. count matching elements
  2. allocate exact-sized array
- Returned filtered data without modifying blockchain storage
- Practiced efficient temporary data handling in Solidity


## Stack-Based Membership Tracking

- Created dynamic storage array for member addresses
- Added new members using `.push()`
- Implemented membership lookup with linear search
- Learned how address comparison works in Solidity
- Introduced stack-style data management concepts


## Stack Club Access Control

- Added deployer as initial club member
- Used `.pop()` to remove the most recent member
- Restricted membership actions to existing members only
- Implemented authorization using `require`
- Learned stack-style Last-In-First-Out behavior in storage arrays


Structs

## Struct Storage

- Learned how to create custom data structures using `struct`
- Combined enums and structs for organized state management
- Stored grouped voting data in a single storage variable
- Used `msg.sender` to track vote ownership
- Practiced creating and assigning struct instances


## Returning Structs in Memory

- Learned how to return structs from external functions
- Used `memory` data location for returned struct copies
- Created temporary struct instances without modifying storage
- Understood difference between returning storage and memory data
- Practiced lightweight read-only contract behavior

## Struct Arrays

- Created dynamic storage array of structs
- Stored multiple vote records on-chain
- Used `.push()` with struct instances
- Combined enums, structs, and arrays together
- Learned how smart contracts model collections of structured data


## Struct Lookup in Arrays

- Accessed struct properties using dot notation
- Implemented search functions over struct arrays
- Created `hasVoted` to check existence of a record
- Created `findChoice` to retrieve stored enum value
- Learned linear search pattern in Solidity storage
- Understood inefficiency of array-based lookups


## Single Vote Constraint

- Implemented one-vote-per-address rule
- Used loop-based search to detect duplicate voting
- Enforced uniqueness using `require`
- Learned integrity constraints in smart contracts
- Observed scalability issues of array-based validation

## Change Vote Logic

- Implemented ability to update existing vote
- Required validation that user already voted
- Used loop-based search to locate voter record
- Modified struct field in-place within storage array
- Learned mutation of stored structs in Solidity

Mapping

## Mapping Basics

- Created address → bool mapping for membership tracking
- Used mappings for constant-time lookup
- Eliminated need for loops when checking membership
- Learned difference between arrays (iterable) and mappings (direct access)
- Implemented simple access control data structure

## Mapping Lookup

- Implemented membership check using mapping
- Replaced iteration with direct key access
- Learned default values in Solidity mappings
- Understood gas efficiency benefits of mappings
- Practiced simple access-control pattern using booleans

## Mapping Removal

- Implemented removal by updating mapping value to false
- Learned that mappings do not physically delete keys
- Understood difference between structural deletion vs logical deactivation
- Practiced whitelist/blacklist style access control
- Reinforced gas efficiency benefits of mappings over arrays

## Mapping to Structs

- Created mapping from address to struct-based user accounts
- Initialized structured user data with balance and active status
- Enforced single-user creation using state validation
- Combined mappings + structs for account modeling
- Learned basic on-chain “user account” design pattern

## Struct-Based Transfers

- Implemented internal token transfer system using mappings and structs
- Validated sender and recipient account activation
- Enforced balance checks before state mutation
- Performed safe balance deduction and addition
- Modeled ERC-style token logic without using native ETH transfers

## Nested Mappings

- Created mapping of address → address → enum relationship type
- Modeled user-to-user connections using nested mappings
- Stored directional relationships (A → B is independent of B → A)
- Implemented social graph-like data structure
- Learned advanced mapping composition for relationship modeling



4.  Applied Solidity

Voting

## Proposal Storage System

- Created Proposal struct containing target address and calldata
- Initialized vote counters (yesCount, noCount) at zero
- Stored proposals in a dynamic array
- Learned concept of deferred execution in smart contracts
- Introduced calldata-based governance design pattern


## Voting on Proposals

- Accessed struct inside array using storage reference
- Updated proposal state directly (yes/no counters)
- Learned difference between storage vs memory in struct manipulation
- Implemented basic on-chain voting mechanism
- Reinforced index-based proposal tracking

## Mutable Voting System

- Introduced per-user vote tracking using nested mappings
- Enabled vote changes instead of one-time voting
- Adjusted aggregate counters when votes are updated
- Maintained consistency between individual and global state
- Implemented reversible voting logic
- Learned importance of tracking historical state in smart contracts

## Events in Voting System

- Created ProposalCreated event for new proposals
- Created VoteCast event for vote tracking
- Emitted events after state changes
- Learned distinction between storage state and event logs
- Enabled off-chain UI synchronization through event emission

