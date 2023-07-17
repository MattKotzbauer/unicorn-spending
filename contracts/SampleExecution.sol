// SPDX-License-Identifier: Unlicensed
pragma solidity >=0.7.0 <0.9.0;
import "atlas_tests.sol";
import "../contracts/HelloWorld.sol";

contract HelloWorldTest {
   
    HelloWorld hello_world_instance;
    address public main_test_wallet = address(0x5B38Da6a701c568545dCfcB03FcB875f56beddC4);

    function beforeAll () public {
        hello_world_instance = new HelloWorld();
    }
    
    function storedIntegerIsZero () public {
        // Sanity test
        Assert.equal(hello_world_instance.storedInteger(), uint(0), "Stored integer is not zero");
    }

    function storedIntegerIncremented() public {
        hello_world_instance.increment();
        Assert.equal(hello_world_instance.storedInteger(), uint(1), "Stored integer is not incremented");
    }

    /// #sender: account-0
    /// #value: 100
    function canSendEther() payable public {
      Assert.equal(msg.value, uint(100), "msg.value not set");
    }
}
