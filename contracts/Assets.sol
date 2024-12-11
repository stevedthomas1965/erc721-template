//SPDX-License-Identifier: MIT

// The Assets contract creates and manages both physical & digital assets. 
// 
pragma solidity ^0.8.27;

import "hardhat/console.sol";

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";


contract Assets is ERC721URIStorage, Ownable {
    uint256 public _nextTokenId;
    address public _contractOwner ;
  


constructor()
        ERC721("Pops NFTs", "POPS")
        Ownable(msg.sender)
    {
        _nextTokenId = 1000;
        _contractOwner = msg.sender;
    }

     function mint(string memory tokenURI)
        public
        returns (uint256)
    {
        _nextTokenId++;

        uint256 newItemId = _nextTokenId;
        _mint(msg.sender, newItemId);
        _setTokenURI(newItemId, tokenURI);

        return newItemId;
    }

    function transfer(address from, address to, uint256 tokenId) public {
        safeTransferFrom(from, to, tokenId);
    }

    function nftOwner(uint256 tokenId) public view returns (address) {
        return(ownerOf(tokenId));
    }

    function balance(address owner) public view returns (uint256) {
        return(balanceOf(owner));
    }

    function nftSymbol() public view returns (string memory) {
        string memory nftsymbol = symbol();
        return (nftsymbol);
    }

    function nftBurn(uint256 tokenId) public {
        _burn(tokenId);
    }
    function nftTokenURI(uint256 tokenId) public view returns (string memory) {
       return(tokenURI(tokenId));
    }

}