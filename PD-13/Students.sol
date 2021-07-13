// SPDX-License-Identifier: MIT
pragma experimental ABIEncoderV2;
pragma solidity ^0.8.0;
import "./provableAPI.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Students is usingProvable, Ownable {
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
    mapping (address => Student) public students;
    address[] public studentAccounts;
    address public _owner;
    mapping(address => uint) public IndexInList;

    
    ///studentAccounts.name[0]

    constructor() payable Ownable() {
        _owner = msg.sender;
        studentAccounts.push(address(0)); // "use" address 0, to make tests easier
    }

    // add event
    event logAddStudent (
    	uint indexed date,
    	string indexed name,
    	uint8 age,
    	string message
    );
    
    function setStudent(address _address, string memory _name, uint8 _age) public onlyOwner {
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
    }
    
    function getStudent(address _address) view public returns(Student memory){
        /// @notice Get the credentials of a student through searching by address
        /// @return name and age of a specific student
        return students[_address];
    }

    function getStudentById(uint id) view public returns (Student memory) {
        return students[studentAccounts[id]];
    }
  
    function amountOfStudents() public view returns(uint count) {
        /// @notice Get the amount of students in the database
        /// @return the amount of students in the database
        return studentAccounts.length;
    }
    
    function removeStudent(address _address) public onlyOwner {
        delete students[_address];
        
        for (uint256 i = 0; i < studentAccounts.length; i++) {
            if (studentAccounts[i] == _address) {
                delete studentAccounts[i];
                break;
            }
        }
    }
    
    ////////////////////
    
    function Participate(Student calldata Join) public {
        students[msg.sender]=Join;
        uint i=IndexInList[msg.sender];

        if (i > 0) { // Delete previous participation entry
            studentAccounts[i] = studentAccounts[studentAccounts.length - 1]; // switch
            IndexInList[msg.sender]=0;
            IndexInList[studentAccounts[i]]=i;
            studentAccounts.pop();
        }
        if (Join.exists) {
             studentAccounts.push(msg.sender); 
             IndexInList[msg.sender]=studentAccounts.length-1;
        }
    }

    ////////////////////
    
   string  public amsterdamWeather;
   uint256 public priceOfUrl;
   
   function __callback(bytes32 /* myid prevent warning*/ , string memory result ) override public {
    //    if (msg.sender != provable_cbAddress()) revert();
       amsterdamWeather = result;
   }

    // function getWeather() public payable  {
    //     require (
    //         address(this).balance >= provable_getPrice("URL"),
    //         "please add some ETH to cover for the query fee"
    //     );
    //    provable_query("URL", 
    //         "json(http://weerlive.nl/api/json-data-10min.php?key=0044d4a4f9&locatie=Amsterdam).liveweer[0].samenv");
    // }

    function getWeather() public payable {
        priceOfUrl = provable_getPrice("URL");
        require(    
            // address(this).balance >= priceOfUrl,"please add some ETH to cover for the query fee");
            address(this).balance >= .1 ether,"please add some ETH to cover for the query fee");
        provable_query(
            "URL",
            "json(json(http://weerlive.nl/api/json-data-10min.php?key=0044d4a4f9&locatie=Amsterdam).liveweer[0].samenv"
        );
    }

    function bal() public payable returns (uint256, uint256) {
        return (address(this).balance, provable_getPrice("URL"));
    }

    // modifier onlyBy(address account){
    //     require (msg.sender == account, "Wrong addess"); _;
    // }
    
    // function f() payable onlyBy(owner) public returns(string memory){
    // return "Done";
    // }
    
    // function destroy() public {
    //     selfdestruct(msg.sender);
    // }
    
    function getWeatherResult() public view returns (string memory) {
        return amsterdamWeather;
    }
    
    function NrOfParticipants() public view returns (uint) {
       return studentAccounts.length-1;
    }
}