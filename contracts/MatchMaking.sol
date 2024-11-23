// SPDX-License-Identifier: MIT
pragma solidity =0.8.28;
contract MatchMaking {
    enum Ratings {
        BRONZE,
        SILVER,
        GOLD,
        PLATINUM,
        DIAMON,
        LEGEND,
        GOD
    }
    struct Game {
        address player1;
        address player2;
        address[3] command1;
        address[3] command2;
        uint256 amountBt1;
        uint256 amountBt2;
        bool isDone;
    }
    uint256 public gameIdCounter;
    uint256 public gameBTPrice;
    mapping(uint256 => Game) public games;
    mapping(address => uint256) public ratings;
    mapping(Ratings => uint256[]) public ratingGames;
    mapping(Ratings => uint256) public ratingMultiplier;
    function createOrJoinGame() external {
        /* the function looks for existing games in same rating as sender,
        if such games don't exist, create one,
        (user need to pay fixed amount of BT token and lock their NFTs on this SC)
        else start battle and by running function _executeGame */
    }

    function _executeGame() internal {
        /* the function calculate delta of health per one round and based on it decide winner of the game 
        the winner return his deposit back and receive bt tokens from loser
        NFTs of boths players are unlocked*/
    }
}
