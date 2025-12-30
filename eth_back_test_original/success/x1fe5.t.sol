// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

// https://explorer.phalcon.xyz/tx/eth/0x1fe5a53405d00ce2f3e15b214c7486c69cbc5bf165cf9596e86f797f62e81914
// https://etherscan.io/address/0xA0959536560776Ef8627Da14c6E8C91E2c743A0a

struct S1 {
    uint8 p1;
    uint16 p2;
    uint256 p3;
    uint256 p4;
    bool p5;
    bool p6;
}

contract Xbdb5 is Test {
    address immutable r = address(this);
    receive() external payable {}

    function setUp() public pure {
        console2.log("0x1fe5a53405d00ce2f3e15b214c7486c69cbc5bf165cf9596e86f797f62e81914");
    }

    address constant x80cb = 0x80cB73074A6965F60DF59BF8fA3CE398Ffa2702c;
    address constant x8b5a = 0x8B5A8333eC272c9Bca1E43F4d009E9B2FAd5EFc9;

    function test() public {
        // vm.startPrank(0xA0959536560776Ef8627Da14c6E8C91E2c743A0a, 0xA0959536560776Ef8627Da14c6E8C91E2c743A0a);

        vm.createSelectFork("http://localhost:18545", 16696239); // tx.blockNumber - 1
        // vm.createSelectFork("http://localhost:18545", bytes32(0x1fe5a53405d00ce2f3e15b214c7486c69cbc5bf165cf9596e86f797f62e81914));

        // https://explorer.phalcon.xyz/tx/eth/0x1fe5a53405d00ce2f3e15b214c7486c69cbc5bf165cf9596e86f797f62e81914
        redeem(676562, x8b5a);
    }

    function redeem(uint256, address) public {
        x80cb.delegatecall(abi.encodeWithSignature("redeem(uint256,address)", 676562, x8b5a));

        bytes memory rt = hex"000000000000000000000000000000000000000000000000000003210af3a19d";
        assembly {
            return(add(rt, 0x20), mload(rt))
        }
    }

    fallback() external payable {
        revert("no such function");
    }
}
