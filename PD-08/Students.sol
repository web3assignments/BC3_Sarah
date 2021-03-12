// SPDX-License-Identifier: MIT
pragma experimental ABIEncoderV2;
pragma solidity ^0.6.0;
import "github.com/provable-things/ethereum-api/provableAPI_0.6.sol";

contract Students is usingProvable {

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
        // add error handling
        if (!students[_address].exists)
        {
            Student storage student = students[_address];
            student.name = _name;
            student.age = _age;
            student.exists = true;
            studentAccounts.push(_address);
            // call event
            emit logAddStudent(block.timestamp, _name, _age, "Test");
        }
        else
        {
            
        }
    }
    
    function getStudent(address _address) view public returns(Student memory){
        return students[_address];
    }
  
    function amountOfStudents() public view returns(uint count) {
        return studentAccounts.length;
    }

   string  public amsterdamWeather;
   uint256 public priceOfUrl;
   constructor() public payable {}

   function __callback(bytes32 /* myid prevent warning*/ , string memory result ) override public {
       if (msg.sender != provable_cbAddress()) revert();
       amsterdamWeather = result;
   }

   function GetWeather() public payable {
       priceOfUrl = provable_getPrice("URL");
       require (address(this).balance >= priceOfUrl,
            "please add some ETH to cover for the query fee");
       provable_query("URL", 
            "json(http://weerlive.nl/api/json-data-10min.php?key=demo&locatie=Amsterdam).liveweer[0].samenv");
    }
}