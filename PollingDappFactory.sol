// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;
import "./PollingDapp.sol";

contract PollingDappFactory{
    PollDapp[] public pollDappInstance;
    address payable owner;

    constructor(){
        owner = payable(msg.sender);
    }

    function createPollDappInstance(string memory _question, string[] memory _options) payable public returns (string memory) {
    
        require(msg.value == 10**18);
        PollDapp _instance = new PollDapp(_question, _options);
        pollDappInstance.push(_instance);
    
        return "Done!";
    
    }

    function getBalance() public view returns (uint){
        return address(this).balance;
    }

    function withdraw() public{
        require(msg.sender == owner);
        owner.transfer(address(this).balance);
    }
}