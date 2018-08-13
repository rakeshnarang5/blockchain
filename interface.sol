pragma solidity ^0.4.0;

interface Regulator {
    function checkValue(uint amount) returns (bool);
    function loan() returns (bool);
}

contract Bank is Regulator {
    
    uint private value;
	address private owner;
    
    function Bank(uint amount) {
        value = amount;
		owner = msg.sender;
    }
	
	modifier ownerFunc {
		require(owner == msg.sender);
		_;
	}
    
    function deposit (uint amount) private ownerFunc {
        value += amount;
    }
    
    function balance() returns (uint) internal ownerFunc {
        return value;
    }
    
    function withdraw(uint amount) {
        if (checkValue(amount)) {
             value -= amount;
        }
    }
    
    function checkValue(uint amount) returns (bool) {
        return value >= amount;
    }
    
    function loan() returns (bool) {
        return value > 0;
    }    
    
}

contract MyFirstContract is Bank(100) { 
    
    string private name;
    uint private age;
    
    function setName(string newName) {
        name = newName;
    }
    
    function getName() returns (string) {
        return name;
    }
    
    function setAge(uint newAge) {
        age = newAge;
    }
    
    function getAge() returns (uint) {
        return age;
    }
}


contract TestThrows {
	function testAssert() {
		assert(false);
	}
	
	function testRequire() {
		require(1==2);
	}
	
	function testRevert() {
		revert();
	}
	
	function testThrow() {
		throw;
	}
}