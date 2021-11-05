// SPDX-License-Identifier: MIT
pragma solidity >0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721.sol";

contract SwapContract {
    // consider chainging to multiple owners (shareholders)
    address public owner;
    address private pETH;
    address private pDAI;
    IERC20 public polyETH = IERC(pETH);
    IERC20 public polyDAI = IERC(pDAI);

    // map active trades
    struct Trade {
        address minterA;
        uint256 tokenIdA;
        address minterB;
        uint256 tokenIdB;
        bytes32 approvalHashA;
        bool approvalA;
        bool approvalB;
    }
    mapping(bytes32 => Trade) public activeTrades;

    constructor(address polygonETH, address polygonDAI) {
        owner = msg.sender;
        pETH = polygonETH;
        pDAI = polygonDAI;
    }


    // 1. user A offers to trade his token 
    //  - approve contract to manage NFT with ERC721 standard
    //  - add token to list of managed tokens
    function offerToken(address _approved, uint256 tokenId, address minter) public {
      
    } 

    // 2. user B offers his token for exchange (automatic first approval?)
    //  - creates a new active trade
    function createTrade(address _minterA, uint256 _tokenIdA)
        public
        returns (bool)
    {}

    function calculateTradeHash(TokenData tokenData)
        private
        returns (bytes32)
    {}

    // 3. user A approves a trade
    //  - hash is calulated and set as hashOnApprovalA
    // 4. user B accepts a trade
    //  - current hash is compared with hash fromApprovalA - this prevents user B from chainging seconds NFT after approval of user A
    function approveTrade(bytes32 activeTradeHash) public returns (bool) {}

    // 5. contract changes the ownership of corresponding NFTs 
    function swapOwnership(bytes32 tradeID) private returns (bytes32) {}
}
