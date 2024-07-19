 //SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.4;

contract Transactions{
uint256 trasactionCount;

event Transfer(address from,address receiver,uint amount,string massage,uint256 timestamp,string keyword);

struct TransactionStruct{
   address sender;
   address receiver;
   uint amount;
   string massage;
   uint256 timestamp;
   string keyword;
}

TransactionStruct [] trasactions;

function addToBlockchain(address payable receiver,uint amount,string memory massage,string memory keyword) 
public
{
trasactionCount +=1;
trasactions.push(TransactionStruct(msg.sender,receiver,amount,massage,block.timestamp,keyword));

emit Transfer(msg.sender, receiver, amount, massage, block.timestamp, keyword);
}

function getAllTransaction() 
public view returns(TransactionStruct[] memory)
{
  return trasactions;
}
function getTranscationCount() 
public view returns(uint256)
{
      return trasactionCount;
}

}