// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;



contract FakeNFTMarketplace {
    /// @dev Maintain a mapping of Fake TokenID to Owner addresses
    mapping(uint256 => address) public tokens;
    /// @dev Set the purchase price for each Fake NFT
    uint256 nftPrice = 0.01 ether;

    /// @dev purchase() accepts ETH and marks the owner of the given tokenId as the caller address
    /// @param _tokenId - the fake NFT token Id to purchase
    function purchase(uint256 _tokenId) external payable {
        require(msg.value == nftPrice, "This NFT costs 0.01 ether");
        tokens[_tokenId] = msg.sender;
    }

    /// @dev getPrice() returns the price of one NFT
    function getPrice() external view returns (uint256) {
        return nftPrice;
    }

    /// @dev available() checks whether the given tokenId has already been sold or not
    /// @param _tokenId - the tokenId to check for
    function available(uint256 _tokenId) external view returns (bool) {
        // address(0) = 0x0000000000000000000000000000000000000000
        // This is the default value for addresses in Solidity
        if (tokens[_tokenId] == address(0)) {
            return true;
        }
        return false;
    }

    /**
    * Interface for the FakeNFTMarketplace
    */
    //     IFakeNFTMarketplace nftMarketplace;
    //     interface IFakeNFTMarketplace {
    //     /// @dev getPrice() returns the price of an NFT from the FakeNFTMarketplace
    //     /// @return Returns the price in Wei for an NFT
    // function getPrice() external view returns (uint256);

    //     /// @dev available() returns whether or not the given _tokenId has already been purchased
    //     /// @return Returns a boolean value - true if available, false if not
    // function available(uint256 _tokenId) external view returns (bool);

    // /// @dev purchase() purchases an NFT from the FakeNFTMarketplace
    // /// @param _tokenId - the fake NFT tokenID to purchase
    // function purchase(uint256 _tokenId) external payable;
    // }

    // // Create a struct named Proposal containing all relevant information
    // struct Proposal {
    //     // nftTokenId - the tokenID of the NFT to purchase from FakeNFTMarketplace if the proposal passes
    //     uint256 nftTokenId;
    //     // deadline - the UNIX timestamp until which this proposal is active. Proposal can be executed after the deadline has been exceeded.
    //     uint256 deadline;
    //     // yayVotes - number of yay votes for this proposal
    //     uint256 yayVotes;
    //     // nayVotes - number of nay votes for this proposal
    //     uint256 nayVotes;
    //     // executed - whether or not this proposal has been executed yet. Cannot be executed before the deadline has been exceeded.
    //     bool executed;
    //     // voters - a mapping of CryptoDevsNFT tokenIDs to booleans indicating whether that NFT has already been used to cast a vote or not
    //     mapping(uint256 => bool) voters;
    //     // Create a mapping of ID to Proposal
    //     mapping(uint256 => Proposal) public proposals;
    //     // Number of proposals that have been created
    //     uint256 public numProposals;
    // }
}
