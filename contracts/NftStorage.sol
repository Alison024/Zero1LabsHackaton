// SPDX-License-Identifier: MIT
pragma solidity =0.8.27;
import {TFHE, Impl, euint64, euint4} from "./fhevm/lib/TFHE.sol";
import {IBattleNFT} from "./interfaces/IBattleNFT.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";
contract NftStorage is Ownable {
    struct Storage {
        IBattleNFT.NftStats stats;
        bool isInitialized;
        uint8 linkToStats;
    }
    error NotHaveAccessToSecret();
    mapping(uint8 => Storage) public nftStatsStorage;

    constructor() Ownable(msg.sender) {}

    function getNftStats(
        euint64 rand
    ) external returns (IBattleNFT.NftStats memory) {
        if (!TFHE.isSenderAllowed(rand)) {
            revert NotHaveAccessToSecret();
        }
        euint64 encryptoedid = TFHE.rem(rand, uint64(255));
        uint8 id = uint8(euint64.unwrap(encryptoedid));
        Storage memory strStats = nftStatsStorage[id];
        if (strStats.isInitialized == false) {
            return strStats.stats;
        }
        return nftStatsStorage[strStats.linkToStats].stats;
    }

    function setNftStats(
        uint8 id,
        bool isInitialized,
        uint8 linkToStats,
        IBattleNFT.NftStats calldata stats
    ) external onlyOwner {
        nftStatsStorage[id] = Storage({
            stats: stats,
            isInitialized: isInitialized,
            linkToStats: linkToStats
        });
    }
}
