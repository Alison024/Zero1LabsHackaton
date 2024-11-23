// SPDX-License-Identifier: MIT
pragma solidity =0.8.28;
import {euint32, euint4} from "../fhevm/lib/TFHE.sol";
interface IBattleNFT {
    enum AbilityType {
        NONE,
        ATTACK_ALL_AT_START,
        ATTACK_FIRST_AT_START,
        SHIELD_FIRST_AT_START,
        SHIELD_ALL_AT_START,
        HEAL_SELF_AFTER_ATTACK,
        HEAL_ALL_AFTER_ATTACK
    } // 6 types

    struct NftStats {
        euint32 health;
        euint32 attack;
        euint4 ability;
        euint32 abilityPower;
    }

    error ZeroValue();
    error ZeroAddress();
    error NotEnoughAllowance();
    event PricePudated(uint256 newPrice);
}
