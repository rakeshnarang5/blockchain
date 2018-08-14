pragma solidity ^0.4.0;

import "browser/library.sol";

contract TestLibrary {
    using IntExtended for uint;
    
    function testIncrement(uint _base) returns (uint) {
        return _base.increment();
    }
    
    function testIncrementPassing(uint _base) returns (uint) {
        return IntExtended.increment(_base);
    }
    
    function testDecrement(uint _base) returns (uint) {
        return _base.decrement();
    }
    
    function testIncrementByValue(uint _base, uint _value) returns (uint) {
        return _base.incrementByValue(_value);
    }
    
    function testDecrementByValue(uint _base, uint _value) returns (uint) {
        return _base.decrementByValue(_value);
    }
    
}