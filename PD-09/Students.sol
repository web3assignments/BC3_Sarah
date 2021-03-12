// SPDX-License-Identifier: MIT
pragma experimental ABIEncoderV2;
pragma solidity ^0.6.0;
import "github.com/provable-things/ethereum-api/provableAPI_0.6.sol";

contract Students is usingProvable {
/// @title Student database
/// @author Sarah Thieleman
/// @notice A simple contract to make a database of students
/// @dev All function calls are currently implemented without side effects
    struct Student {
        string name;
        uint8 age;
        bool exists;
    }
    
    /// @dev this takes the struct Student to be used inside a mapping
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
        /// @notice Add a student to the database
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
        /// @notice Get the credentials of a student through searching by address
        /// @return name and age of a specific student
        return students[_address];
    }
  
    function amountOfStudents() public view returns(uint count) {
        /// @notice Get the amount of students in the database
        /// @return the amount of students in the database
        return studentAccounts.length;
    }
    
    function removeStudent(address _address) public {
        delete students[_address];
        
        for (uint256 i = 0; i < studentAccounts.length; i++) {
            if (studentAccounts[i] == _address) {
                delete studentAccounts[i];
                break;
            }
        }
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

    address public owner = msg.sender;

    modifier onlyBy(address account){
        require (msg.sender == account, "Wrong addess"); _;
    }
    
    function f() payable onlyBy(owner) public returns(string memory){
    return "Done";
    }
    
    function destroy() public {
        selfdestruct(msg.sender);
    }
    
}