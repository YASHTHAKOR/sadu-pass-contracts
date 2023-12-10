// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "forge-std/Script.sol";
import "forge-std/console.sol";
import {SAFUPass} from "../src/SAFUPass.sol";

contract DeploySafuPass is Script {
    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        SAFUPass deployed = new SAFUPass();

        console.log("SAFUPass address: ", address(deployed), "\n");

        vm.stopBroadcast();
    }
}
