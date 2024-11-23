// SPDX-License-Identifier: MIT
pragma solidity =0.8.27;
import {ERC721URIStorage, ERC721} from "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import {IBattleNFT} from "./interfaces/IBattleNFT.sol";
import {TFHE, euint64} from "./fhevm/lib/TFHE.sol";
/* Logic:
1. user buy Battle token (next BT) on Dex
2. user mint one or several NFTs for BT
3. user lock nfts in match making sc for a looking for a fight and transfer BT tokens there
4. after user found partner, calculates fight points
5. who win receive BT tokens 
*/
contract BattleNft is ERC721URIStorage, IBattleNFT {
    uint256 public nftBTPrice;
    uint256 public tokenIdCounter;
    address public nftStorage;
    mapping(uint256 => IBattleNFT.NftStats) public stats;

    constructor() ERC721("BattleNFT", "BN") {}

    function mint() external {
        uint256 id = tokenIdCounter;
        tokenIdCounter++;
        euint64 rand = TFHE.randEuint64();
        stats[id] = TFHE.allowTransient(rand, nftStorage);
        _mint(msg.sender, id);
    }
}
