// SPDX-License-Identifier: MIT
pragma solidity =0.8.28;
import {ERC721URIStorage, ERC721} from "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";
import {IBattleNFT} from "./interfaces/IBattleNFT.sol";
import {INftStorage} from "./interfaces/INftStorage.sol";
import {TFHE, euint64} from "./fhevm/lib/TFHE.sol";
import {SafeERC20} from "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
/* Logic:
1. user buy Battle token (next BT) on Dex
2. user mint one or several NFTs for BT
3. user lock nfts in match making sc for a looking for a fight and transfer BT tokens there
4. after user found partner, calculates fight points
5. who win receive BT tokens 
*/
contract BattleNft is ERC721URIStorage, IBattleNFT, Ownable {
    using SafeERC20 for IERC20;
    uint256 public nftBTPrice;
    uint256 public tokenIdCounter;
    address public nftStorage;
    address public btToken;
    mapping(uint256 => NftStats) public stats;

    constructor(
        address _btToken
    ) ERC721("BattleNFT", "BN") Ownable(msg.sender) {
        if (_btToken == address(0)) revert ZeroAddress();
        btToken = _btToken;
    }

    function setNftPrice(uint256 amount) external onlyOwner {
        if (amount == 0) revert ZeroValue();
        nftBTPrice = amount;
        emit PricePudated(amount);
    }

    function mint() external {
        _mint();
    }

    function mint(uint256 amount) external {
        if (amount == 0) revert ZeroValue();
        if (
            IERC20(btToken).allowance(msg.sender, address(this)) <
            amount * nftBTPrice
        ) revert NotEnoughAllowance();
        for (uint256 i; i < amount; i++) {
            _mint();
        }
    }

    function _mint() internal {
        uint256 id = tokenIdCounter;
        tokenIdCounter++;
        euint64 rand = TFHE.randEuint64();
        address _nftStorage = nftStorage;
        TFHE.allow(rand, _nftStorage);
        stats[id] = INftStorage(_nftStorage).getNftStats(rand);
        _mint(msg.sender, id);
    }
}
