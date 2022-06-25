// SPDX-License-Identifier: GPL-3.0
// 0xf87c3345522305a9e235c6f2d816fabfd1226db1
// https://goerli.etherscan.io/tx/0xf3ba952586204be4a812b06b6a498e2552ab87648c8850a98ba17911a99592ee

// pragma solidity >=0.7.0 <0.9.0;

contract Deadman {

    modifier OnlyOnwer{
        require(owner == msg.sender);
        _;
    }

    address public owner = msg.sender;
    address payable public trans_to = payable(0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2);
    bool public trans = false;
    uint public block_num = block.number;

    function still_alive () public view OnlyOnwer{
        require(block.number - block_num <= 10);
    }

    function transfer_to() public payable {
        require(block.number - block_num >= 10);
        trans_to.transfer(msg.value);
    }
} 