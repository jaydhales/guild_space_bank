// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";

import "src/Challenge.sol";
import "src/SpaceBank.sol";

contract Deploy is Script {
    function run() external returns (address challenge) {
        vm.startBroadcast();

        SpaceToken token = new SpaceToken();

        SpaceBank spacebank = new SpaceBank(address(token));

        token.mint(address(spacebank), 1000);

        challenge = address(new Challenge(spacebank));

        vm.stopBroadcast();
    }
}
