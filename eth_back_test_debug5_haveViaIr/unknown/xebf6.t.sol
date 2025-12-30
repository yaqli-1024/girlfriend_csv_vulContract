// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

interface IERC20 {
    function balanceOf(address) external view returns (uint256);
}

// https://explorer.phalcon.xyz/tx/eth/0xebf6bfdef7c5c13a303f71e5eea9b13917c0b478db8a8ad86397cd3781e6df5d
// https://etherscan.io/address/0x013B646FE54562a3fF6e3469Fcc8C4efc2337656

struct S2 {
    uint256 p1;
    uint256 p2;
}

struct S1 {
    uint256 p1;
    uint256 p2;
    bytes p3;
}

struct S3 {
    uint256 p1;
    uint256 p2;
    uint256 p3;
    uint256 p4;
    uint256 p5;
    uint256 p6;
}

interface I {
    function transfer(address, uint256) external payable;
    function approve(address, uint256) external payable;
    function deposit() external payable;
    function redeemLocal(uint16, uint256, uint256, address, uint256, bytes memory, S1 memory) external payable;
    function addLiquidity(uint256, uint256, address) external payable;
    function swap(uint16, uint256, uint256, address, uint256, uint256, S1 memory, bytes memory, bytes memory)
        external
        payable;
}

contract X150f is Test {
    address immutable r = address(this);
    receive() external payable {}

    function setUp() public pure {
        console2.log("0xebf6bfdef7c5c13a303f71e5eea9b13917c0b478db8a8ad86397cd3781e6df5d");
    }

    address constant x013b = 0x013B646FE54562a3fF6e3469Fcc8C4efc2337656;
    address constant x72e2 = 0x72E2F4830b9E45d52F80aC08CB2bEC0FeF72eD9c;
    address constant x8731 = 0x8731d54E9D02c286767d56ac03e8037C07e01e98;
    address constant x9316 = 0x9316b7a2CBf0762E974029D48a4Ca678a89c64DA;
    address constant xdac1 = 0xdAC17F958D2ee523a2206206994597C13D831ec7;

    function test1() public {
        vm.createSelectFork("http://localhost:18545", 17301807); // tx.blockNumber - 1
        // vm.createSelectFork("http://localhost:18545", bytes32(0x0771cfaf7f138b6c5b52adf3cfadbaa6dbde8b9a31e5e016ff7c5a53df490dfa));

        // https://explorer.phalcon.xyz/tx/eth/0x0771cfaf7f138b6c5b52adf3cfadbaa6dbde8b9a31e5e016ff7c5a53df490dfa
        this.x0771cfaf();
        // https://explorer.phalcon.xyz/tx/eth/0xfae3619dca49824f34f2e6f829686f1a634393b14da0c8468ab6b5427ee97f71
        this.xfae3619d();
        // https://explorer.phalcon.xyz/tx/eth/0x0a25400d1a4ccd13e774f335bb364ab034e3520d3b348dd113183030b18ad34e
        this.x0a25400d();
        // https://explorer.phalcon.xyz/tx/eth/0xebf6bfdef7c5c13a303f71e5eea9b13917c0b478db8a8ad86397cd3781e6df5d
        this.swapETH{value: 1100150000000000000000}(
            110,
            tx.origin,
            hex"013b646fe54562a3ff6e3469fcc8c4efc2337656",
            1100000000000000000000,
            1100000000000000000000
        );
    }

    function test2() public {
        vm.createSelectFork("http://localhost:18545", 17299114); // tx.blockNumber - 1
        // https://explorer.phalcon.xyz/tx/eth/0x0771cfaf7f138b6c5b52adf3cfadbaa6dbde8b9a31e5e016ff7c5a53df490dfa
        this.x0771cfaf();
        vm.warp(1684599515);
        vm.roll(17301775);
        // https://explorer.phalcon.xyz/tx/eth/0xfae3619dca49824f34f2e6f829686f1a634393b14da0c8468ab6b5427ee97f71
        this.xfae3619d();
        vm.warp(1684599899);
        vm.roll(17301807);
        // https://explorer.phalcon.xyz/tx/eth/0x0a25400d1a4ccd13e774f335bb364ab034e3520d3b348dd113183030b18ad34e
        this.x0a25400d();
        vm.warp(1684599899);
        vm.roll(17301807);
        // https://explorer.phalcon.xyz/tx/eth/0xebf6bfdef7c5c13a303f71e5eea9b13917c0b478db8a8ad86397cd3781e6df5d
        this.swapETH{value: 1100150000000000000000}(
            110,
            tx.origin,
            hex"013b646fe54562a3ff6e3469fcc8c4efc2337656",
            1100000000000000000000,
            1100000000000000000000
        );
    }

    function test3() public {
        vm.createSelectFork("http://localhost:18545", 17301807); // tx.blockNumber - 1

        address RECEIVER = address(this);
        vm.warp(1684599899);
        vm.roll(17301808);
        vm.deal(RECEIVER, 10 ether);
        vm.store(
            address(0x72E2F4830b9E45d52F80aC08CB2bEC0FeF72eD9c),
            keccak256(abi.encode(RECEIVER, uint256(3))),
            bytes32(uint256(1000000000000000000000000))
        );
        vm.store(
            address(0xdAC17F958D2ee523a2206206994597C13D831ec7),
            keccak256(abi.encode(RECEIVER, uint256(2))),
            bytes32(uint256(1000000000000000000000000))
        );
        // https://explorer.phalcon.xyz/tx/eth/0xebf6bfdef7c5c13a303f71e5eea9b13917c0b478db8a8ad86397cd3781e6df5d
        this.swapETH{value: 1100150000000000000000}(
            110,
            tx.origin,
            hex"013b646fe54562a3ff6e3469fcc8c4efc2337656",
            1100000000000000000000,
            1100000000000000000000
        );
    }

    function x0a25400d() public {
        S1 memory s101 = S1(0, 0, hex"013b646fe54562a3ff6e3469fcc8c4efc2337656");
        I(x8731).redeemLocal{value: 150000000000000000}(
            111, 13, 13, tx.origin, 999918384830047497728, hex"013b646fe54562a3ff6e3469fcc8c4efc2337656", s101
        );
    }

    function x0771cfaf() public {
        I(xdac1).transfer(x9316, 400134937976);
    }

    function xfae3619d() public {
        X150f(payable(r)).addLiquidityETH{value: 1000000000000000000000}();
    }

    function swapETH(uint16, address, bytes memory, uint256, uint256) public payable {
        I(x72e2).deposit{value: 1100000000000000000000}();
        I(x72e2).approve(x8731, 1100000000000000000000);

        S1 memory s103 = S1(0, 0, hex"3078");
        I(x8731).swap{value: 150000000000000000}(
            110,
            13,
            13,
            tx.origin,
            1100000000000000000000,
            1100000000000000000000,
            s103,
            hex"013b646fe54562a3ff6e3469fcc8c4efc2337656",
            ""
        );
    }

    function addLiquidityETH() public payable {
        I(x72e2).deposit{value: 1000000000000000000000}();
        I(x72e2).approve(x8731, 1000000000000000000000);
        I(x8731).addLiquidity(13, 1000000000000000000000, tx.origin);
    }

    fallback() external payable {
        revert("no such function");
    }
}
