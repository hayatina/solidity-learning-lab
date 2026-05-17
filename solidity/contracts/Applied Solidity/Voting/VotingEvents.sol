pragma solidity ^0.8.20;

contract Voting {

    struct Proposal {
        address target;
        bytes data;
        uint yesCount;
        uint noCount;
    }

    Proposal[] public proposals;

    // ✅ EVENTS
    event ProposalCreated(uint proposalId);
    event VoteCast(uint proposalId, address voter);

    mapping(uint => mapping(address => bool)) public hasVoted;
    mapping(uint => mapping(address => bool)) public voteChoice;

    function newProposal(address target, bytes calldata data) external {

        proposals.push(
            Proposal({
                target: target,
                data: data,
                yesCount: 0,
                noCount: 0
            })
        );

        uint proposalId = proposals.length - 1;

        emit ProposalCreated(proposalId);
    }

    function castVote(uint proposalId, bool support) external {

        Proposal storage proposal = proposals[proposalId];

        // handle vote change
        if (hasVoted[proposalId][msg.sender]) {

            bool previous = voteChoice[proposalId][msg.sender];

            if (previous) {
                proposal.yesCount -= 1;
            } else {
                proposal.noCount -= 1;
            }
        }

        hasVoted[proposalId][msg.sender] = true;
        voteChoice[proposalId][msg.sender] = support;

        if (support) {
            proposal.yesCount += 1;
        } else {
            proposal.noCount += 1;
        }

        emit VoteCast(proposalId, msg.sender);
    }
}