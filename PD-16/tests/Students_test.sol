// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import { Assert } from "remix_tests.sol";
import "remix_accounts.sol";
import "../contracts/Students.sol";
import { Students } from "../contracts/Students.sol";

contract StudentsTest {
    Students S;
    address msgsender = address(this);

    function beforeEach() public {  // Re-init before each test
        S = new Students();
        Assert.equal(S.NrOfParticipants(), 0, "NrOfParticipants should be 0 initially");
        Assert.equal(S.studentAccounts(0), address(0), "ListParticipant(0) should be 0");
    }
    
    function AddParticipant() public {
        Students.Student memory student = Students.Student ({
           name: "Saar",
           age: 8,
           exists: true
        });
    
        S.Participate(student); // address(this) => msg.sender
        Assert.equal(S.NrOfParticipants(), 1, "NrOfParticipants should be 1 now"); 
        Assert.equal(S.studentAccounts(1), address(this), "ListParticipant(1) should be address(this)");
        Assert.equal(S.IndexInList(address(this)),1,"Index should be 1"); 
    }
    
    function AddAFaultyParticipant() public {
        Students.Student memory student = Students.Student ({
           name: "Kees",
           age: 1,
           exists: false
        });
        
        S.Participate(student); // address(this) => msg.sender
        Assert.equal(S.NrOfParticipants(), 0, "NrOfParticipants should be 0"); 
    }
    
    function exists() public {
        Assert.equal(msg.sender, msg.sender, "msg.sender exists");
    }
    
    function msgSender() public {
        Assert.equal(msgsender, msg.sender, "purely to check the expected and actual sender");
    }
    
    function checkSuccess() public {
        Assert.equal(uint(1), uint(1), "1 should be equal to 1");
        Assert.notEqual(uint(1), uint(2), "1 should not be equal to 2");
    }
}