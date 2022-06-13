// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;
import "./PollingDapp.sol";

contract PollingDappFactory{
    PollDapp[] public pollDappInstance;
    function createPollDappInstance(string memory _question, string[] memory _options) public returns (string memory) {
        PollDapp _instance = new PollDapp(_question, _options);
        pollDappInstance.push(_instance);
        return "Done!";
    }
}