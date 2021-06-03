// SPDX-License-Identifier: MIT
pragma experimental ABIEncoderV2;
pragma solidity 0.7.4;

contract Class {

    struct Student {
        string name;
        uint8 age;
        bool exists;
    }
    
    // add mapping
    mapping (address => Student) students;
    address[] private studentAccounts;
    
    // add event
    event logAddStudent (
    	uint indexed date,
    	string indexed name,
    	uint8 age,
    	string message
    );
    
    function setStudent(address _address, string memory _name, uint8 _age) public {
        require(
            !students[_address].exists,
            "This is not a valid address."
            );
        
        Student storage student = students[_address];
            student.name = _name;
            student.age = _age;
            student.exists = true;
            studentAccounts.push(_address);
            // call event
            emit logAddStudent(block.timestamp, _name, _age, "Test");
            emit logAddStudent(block.timestamp, _name, _age, "Test");
    }
    
    function getStudent(address _address) view public returns(Student memory){
        return students[_address];
    }
  
    function amountOfStudents() public view returns(uint count) {
        return studentAccounts.length;
    }

}