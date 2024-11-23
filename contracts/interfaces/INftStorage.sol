// SPDX-License-Identifier: MIT
pragma solidity =0.8.28;
import {IBattleNFT} from "./IBattleNFT.sol";
import {euint64} from "../fhevm/lib/TFHE.sol";
interface INftStorage {
    function getNftStats(
        euint64 rand
    ) external returns (IBattleNFT.NftStats memory);

    function setNftStats(
        uint8 id,
        bool isInitialized,
        uint8 linkToStats,
        IBattleNFT.NftStats calldata stats
    ) external;
}
