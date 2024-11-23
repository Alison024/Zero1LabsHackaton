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
        bool isDone;
    }
    uint256 public gameIdCounter;
    uint256 public gameBTPrice;
    mapping(uint256 => Game) public games;
    mapping(address => uint256) public ratings;
    mapping(Ratings => uint256[]) public ratingGames;
    mapping(Ratings => uint256) public ratingMultiplier;
    function createOrJoinGame() external {
        
    }

    function _executeGame()

}
