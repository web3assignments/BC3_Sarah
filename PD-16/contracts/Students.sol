// SPDX-License-Identifier: MIT
pragma experimental ABIEncoderV2;
pragma solidity ^0.8.0;
import "./ProvableAPI.sol";
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

    constructor() payable Ownable() {
        _owner = msg.sender;
        studentAccounts.push(address(0)); // "use" address 0, to make tests easier
        update(); // First check at contract creation...
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
    
    // test function
    
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
    
    uint public denHaagTemp;
    uint256 public priceOfUrl;

    event LogNewDenHaagTemp(string price);
    event LogNewProvableQuery(string description);
    
    function __callback (bytes32 /* myid prevent warning*/, string memory _result) override public {
        require(msg.sender == provable_cbAddress());
        emit LogNewdenHaagTemp(_result);
        denHaagTemp = parseInt(_result);
    }
   
    function update() public payable {
        emit LogNewProvableQuery("Provable query was sent, standing by for the answer...");
        provable_query("URL", "json(http://weerlive.nl/api/json-data-10min.php?key=0044d4a4f9&locatie=Den+Haag).liveweer[0].temp");
    }

    function getTemp() public view returns (uint) {
       return denHaagTemp;
    }
    
    function NrOfParticipants() public view returns (uint) {
       return studentAccounts.length-1;
    }
}