// SPDX-License-Identifier: MIT
pragma experimental ABIEncoderV2;
pragma solidity 0.8.4;

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
    	address _address,
    	string name,
        uint8 age
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
            emit logAddStudent(_address,_name, _age);
    }
    
    function getStudent(address _address) public returns(Student memory){
        return students[_address];
    }
  
    function amountOfStudents() public view returns(uint count) {
        return studentAccounts.length;
    }
}