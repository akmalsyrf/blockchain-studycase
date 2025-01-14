// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Ballot {
    struct Pemilih {
        uint weight;
        bool isVoted;
        address delegate;
        uint vote;
    }

    struct Proposal {
        string name;
        uint voteCount;
    }

    address public ketuaPemilu;
    mapping(address => Pemilih) public voters;

    Proposal[] public proposals;

    constructor(string[] memory namaProposal) {
        ketuaPemilu = msg.sender;
        voters[ketuaPemilu].weight = 1;

        for (uint i = 0; i < namaProposal.length; i++) {
            proposals.push(Proposal({
                name: namaProposal[i],
                voteCount: 0
            }));
        }
    }

    function addressYangIkutVote(address voter) public {
        require(msg.sender == ketuaPemilu, "Hanya ketua pemilu yg bisa memberikan akses siapa yg bisa memilih");
        require(!voters[voter].isVoted, "Pemilih ini sudah ikut vote sebelumnya");
        require(voters[voter].weight == 0);
        voters[voter].weight = 1;
    }

    function vote(uint proposal) public {
        Pemilih storage sender = voters[msg.sender];
        require(sender.weight != 0, "Tidak memiliki hak untuk memilih");
        require(!sender.isVoted, "Sudah memilih.");
        sender.isVoted = true;
        sender.vote = proposal;

        proposals[proposal].voteCount += sender.weight;
    }

    function pemenangProposal() public view returns (uint winningProposal) {
        uint winningVoteCount = 0;
        for (uint p = 0; p < proposals.length ; p++) {
            if (proposals[p].voteCount > winningVoteCount) {
                winningVoteCount = proposals[p].voteCount;
                winningProposal = p;
            }
        }
    }

    function pemenangVoting() public view returns (string memory winnerName) {
        winnerName = proposals[pemenangProposal()].name;
    }
}