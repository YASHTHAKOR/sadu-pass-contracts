// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console2} from "forge-std/Test.sol";
import {SAFUPass,Password} from "../src/SAFUPass.sol";

contract CounterTest is Test {
    SAFUPass public safupass;

    function setUp() public {
        safupass = new SAFUPass();
    }

    function test_AddPassword() public {
        safupass.addPassword("google.com", "testdata");
    }

    function test_getPassword() public {
        safupass.addPassword("google.com", "testdata");
        address defaultSender = address(this);
        Password memory password = safupass.getPassword(defaultSender, 0);
        assertEq(password.data, "testdata");
    }
}
