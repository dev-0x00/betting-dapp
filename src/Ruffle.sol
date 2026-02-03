// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Rafftle {
    error Ruffle__InsufficientEntryFee();
    error Ruffle__TimeNotElapsed();
    uint256 private immutable i_entryFee;
    uint256 private immutable i_interval;
    uint256 private s_lastTimeStamp;
    address payable[] private s_players;

    event  RuffleEntered( address indexed player);

    constructor(uint256 entryFee, uint256 interval) {
        i_entryFee = entryFee;
        i_interval = interval;
        s_lastTimeStamp = block.timestamp;
    }

    function enterRaffle() external payable {
        if (msg.value < i_entryFee) {
            revert Ruffle__InsufficientEntryFee();
        }
        // Logic to enter the raffle
        // push the player's address to the players array
        s_players.push(payable(msg.sender));
        emit RuffleEntered(msg.sender);
    }


    function pickWinner() external view {
        // Logic to pick a winner
        // check if the enough time has passed
        if ((block.timestamp - s_lastTimeStamp) < i_interval){
            revert Ruffle__TimeNotElapsed();
        }

        // Get our random number from chainlink VRF
    }

    function getEntryFee() public view returns (uint256) {
        return i_entryFee; 
    }

}