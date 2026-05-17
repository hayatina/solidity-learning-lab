pragma solidity ^0.8.20;

contract Voting {

    struct Proposal {
        address target;
        bytes data;
        uint yesCount;
        uint noCount;
    }

    Proposal[] public proposals;

    // track: proposalId → voter → their choice
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
    }

    function castVote(uint proposalId, bool support) external {

        Proposal storage proposal = proposals[proposalId];

        // if user already voted, remove previous vote first
        if (hasVoted[proposalId][msg.sender]) {

            bool previousVote = voteChoice[proposalId][msg.sender];

            if (previousVote) {
                proposal.yesCount -= 1;
            } else {
                proposal.noCount -= 1;
            }
        }

        // store new vote
        hasVoted[proposalId][msg.sender] = true;
        voteChoice[proposalId][msg.sender] = support;

        // apply new vote
        if (support) {
            proposal.yesCount += 1;
        } else {
            proposal.noCount += 1;
        }
    }
}