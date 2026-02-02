// SPDX-Lisense-Identifier: MIT
pragma solidity ^0.8.0;

contract Rafftle {
    error Ruffle__InsufficientEntryFee();

    uint256 private immutable i_entryFee;

    constructor(uint256 entryFee) {
        i_entryFee = entryFee;
    }

    function enterRaffle() public payable {
        if (msg.value < i_entryFee) {
            revert Ruffle__InsufficientEntryFee();
        }
        // Logic to enter the raffle
    }


    function pickWinner() public {
        // Logic to pick a winner
    }

    function getEntryFee() public view returns (uint256) {
        return i_entryFee; 
    }

}