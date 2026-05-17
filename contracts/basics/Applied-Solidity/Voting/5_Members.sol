// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Voting {

    struct Proposal {
        address target;
        bytes data;
        uint yesCount;
        uint noCount;
    }

    Proposal[] public proposals;

    event ProposalCreated(uint proposalId);
    event VoteCast(uint proposalId, address voter);

    mapping(uint => mapping(address => bool)) public hasVoted;
    mapping(uint => mapping(address => bool)) public voteChoice;

    // ✅ membership mapping
    mapping(address => bool) public members;

    // ✅ constructor sets allowed voters
    constructor(address[] memory allowedMembers) {
        members[msg.sender] = true;

        for (uint i = 0; i < allowedMembers.length; i++) {
            members[allowedMembers[i]] = true;
        }
    }

    // ✅ proposal creation restricted
    function newProposal(address target, bytes calldata data) external {
        require(members[msg.sender], "Not a member");

        proposals.push(
            Proposal({
                target: target,
                data: data,
                yesCount: 0,
                noCount: 0
            })
        );

        emit ProposalCreated(proposals.length - 1);
    }

    // ✅ voting restricted
    function castVote(uint proposalId, bool support) external {
        require(members[msg.sender], "Not a member");

        Proposal storage proposal = proposals[proposalId];

        if (hasVoted[proposalId][msg.sender]) {
            bool previous = voteChoice[proposalId][msg.sender];

            if (previous) proposal.yesCount--;
            else proposal.noCount--;
        }

        hasVoted[proposalId][msg.sender] = true;
        voteChoice[proposalId][msg.sender] = support;

        if (support) proposal.yesCount++;
        else proposal.noCount++;

        emit VoteCast(proposalId, msg.sender);
    }
}