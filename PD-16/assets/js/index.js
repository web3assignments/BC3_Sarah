// contract address
contract_address = "0x78C4f4762a424c1fb0B15E58BDc0E08123565E0f";

// abi of the combined contracts
const abi = [
	{
		"inputs": [],
		"stateMutability": "payable",
		"type": "constructor"
	},
	{
		"anonymous": false,
		"inputs": [
			{
				"indexed": false,
				"internalType": "string",
				"name": "price",
				"type": "string"
			}
		],
		"name": "LogNewAmsterdamTemp",
		"type": "event"
	},
	{
		"anonymous": false,
		"inputs": [
			{
				"indexed": false,
				"internalType": "string",
				"name": "description",
				"type": "string"
			}
		],
		"name": "LogNewProvableQuery",
		"type": "event"
	},
	{
		"anonymous": false,
		"inputs": [
			{
				"indexed": true,
				"internalType": "address",
				"name": "previousOwner",
				"type": "address"
			},
			{
				"indexed": true,
				"internalType": "address",
				"name": "newOwner",
				"type": "address"
			}
		],
		"name": "OwnershipTransferred",
		"type": "event"
	},
	{
		"anonymous": false,
		"inputs": [
			{
				"indexed": true,
				"internalType": "uint256",
				"name": "date",
				"type": "uint256"
			},
			{
				"indexed": true,
				"internalType": "string",
				"name": "name",
				"type": "string"
			},
			{
				"indexed": false,
				"internalType": "uint8",
				"name": "age",
				"type": "uint8"
			},
			{
				"indexed": false,
				"internalType": "string",
				"name": "message",
				"type": "string"
			}
		],
		"name": "logAddStudent",
		"type": "event"
	},
	{
		"inputs": [
			{
				"internalType": "address",
				"name": "",
				"type": "address"
			}
		],
		"name": "IndexInList",
		"outputs": [
			{
				"internalType": "uint256",
				"name": "",
				"type": "uint256"
			}
		],
		"stateMutability": "view",
		"type": "function"
	},
	{
		"inputs": [],
		"name": "NrOfParticipants",
		"outputs": [
			{
				"internalType": "uint256",
				"name": "",
				"type": "uint256"
			}
		],
		"stateMutability": "view",
		"type": "function"
	},
	{
		"inputs": [
			{
				"components": [
					{
						"internalType": "string",
						"name": "name",
						"type": "string"
					},
					{
						"internalType": "uint8",
						"name": "age",
						"type": "uint8"
					},
					{
						"internalType": "bool",
						"name": "exists",
						"type": "bool"
					}
				],
				"internalType": "struct Students.Student",
				"name": "Join",
				"type": "tuple"
			}
		],
		"name": "Participate",
		"outputs": [],
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "bytes32",
				"name": "",
				"type": "bytes32"
			},
			{
				"internalType": "string",
				"name": "_result",
				"type": "string"
			}
		],
		"name": "__callback",
		"outputs": [],
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "bytes32",
				"name": "_myid",
				"type": "bytes32"
			},
			{
				"internalType": "string",
				"name": "_result",
				"type": "string"
			},
			{
				"internalType": "bytes",
				"name": "_proof",
				"type": "bytes"
			}
		],
		"name": "__callback",
		"outputs": [],
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"inputs": [],
		"name": "_owner",
		"outputs": [
			{
				"internalType": "address",
				"name": "",
				"type": "address"
			}
		],
		"stateMutability": "view",
		"type": "function"
	},
	{
		"inputs": [],
		"name": "amountOfStudents",
		"outputs": [
			{
				"internalType": "uint256",
				"name": "count",
				"type": "uint256"
			}
		],
		"stateMutability": "view",
		"type": "function"
	},
	{
		"inputs": [],
		"name": "amsterdamTemp",
		"outputs": [
			{
				"internalType": "uint256",
				"name": "",
				"type": "uint256"
			}
		],
		"stateMutability": "view",
		"type": "function"
	},
	{
		"inputs": [],
		"name": "bal",
		"outputs": [
			{
				"internalType": "uint256",
				"name": "",
				"type": "uint256"
			},
			{
				"internalType": "uint256",
				"name": "",
				"type": "uint256"
			}
		],
		"stateMutability": "payable",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "address",
				"name": "_address",
				"type": "address"
			}
		],
		"name": "getStudent",
		"outputs": [
			{
				"components": [
					{
						"internalType": "string",
						"name": "name",
						"type": "string"
					},
					{
						"internalType": "uint8",
						"name": "age",
						"type": "uint8"
					},
					{
						"internalType": "bool",
						"name": "exists",
						"type": "bool"
					}
				],
				"internalType": "struct Students.Student",
				"name": "",
				"type": "tuple"
			}
		],
		"stateMutability": "view",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "uint256",
				"name": "id",
				"type": "uint256"
			}
		],
		"name": "getStudentById",
		"outputs": [
			{
				"components": [
					{
						"internalType": "string",
						"name": "name",
						"type": "string"
					},
					{
						"internalType": "uint8",
						"name": "age",
						"type": "uint8"
					},
					{
						"internalType": "bool",
						"name": "exists",
						"type": "bool"
					}
				],
				"internalType": "struct Students.Student",
				"name": "",
				"type": "tuple"
			}
		],
		"stateMutability": "view",
		"type": "function"
	},
	{
		"inputs": [],
		"name": "getTemp",
		"outputs": [
			{
				"internalType": "uint256",
				"name": "",
				"type": "uint256"
			}
		],
		"stateMutability": "view",
		"type": "function"
	},
	{
		"inputs": [],
		"name": "getWeather",
		"outputs": [],
		"stateMutability": "payable",
		"type": "function"
	},
	{
		"inputs": [],
		"name": "owner",
		"outputs": [
			{
				"internalType": "address",
				"name": "",
				"type": "address"
			}
		],
		"stateMutability": "view",
		"type": "function"
	},
	{
		"inputs": [],
		"name": "priceOfUrl",
		"outputs": [
			{
				"internalType": "uint256",
				"name": "",
				"type": "uint256"
			}
		],
		"stateMutability": "view",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "address",
				"name": "_address",
				"type": "address"
			}
		],
		"name": "removeStudent",
		"outputs": [],
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"inputs": [],
		"name": "renounceOwnership",
		"outputs": [],
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "address",
				"name": "_address",
				"type": "address"
			},
			{
				"internalType": "string",
				"name": "_name",
				"type": "string"
			},
			{
				"internalType": "uint8",
				"name": "_age",
				"type": "uint8"
			}
		],
		"name": "setStudent",
		"outputs": [],
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "uint256",
				"name": "",
				"type": "uint256"
			}
		],
		"name": "studentAccounts",
		"outputs": [
			{
				"internalType": "address",
				"name": "",
				"type": "address"
			}
		],
		"stateMutability": "view",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "address",
				"name": "",
				"type": "address"
			}
		],
		"name": "students",
		"outputs": [
			{
				"internalType": "string",
				"name": "name",
				"type": "string"
			},
			{
				"internalType": "uint8",
				"name": "age",
				"type": "uint8"
			},
			{
				"internalType": "bool",
				"name": "exists",
				"type": "bool"
			}
		],
		"stateMutability": "view",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "address",
				"name": "newOwner",
				"type": "address"
			}
		],
		"name": "transferOwnership",
		"outputs": [],
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"inputs": [],
		"name": "update",
		"outputs": [],
		"stateMutability": "payable",
		"type": "function"
	}
]

var contract;
var accounts;

// Function from web3examples. responsible for loading the provider.
async function asyncloaded() {
  web3 = new Web3(Web3.givenProvider);
  var requestAccounts = await web3.eth.requestAccounts();
  accounts = await web3.eth.getAccounts();
  const network = await web3.eth.net.getId();
  if (typeof network === 'undefined' || network != 4) { console.warn("Please select Rinkeby test network"); return; }
	console.log("current user address is: " + accounts[0]); // show current user.
	console.log("main contract address is: " + contract_address); // show main contract address.
	contract = new web3.eth.Contract(abi, contract_address);
}
window.addEventListener('load', asyncloaded);

function log(logstr) {
	document.getElementById("alert-retrievestudent").hidden = false; 
	document.getElementById("alert-retrievestudent").innerHTML = logstr + "\n";
  }
  
async function setStudent() {
  var address = document.getElementById("address").value;
  var name = document.getElementById("name").value;
	var age = document.getElementById("age").value;
	if (age < 0 || age > 100) {
		document.getElementById("wrong").innerHTML = "foute age \n";
		return;
	} 
  console.log(address, name, age);
  console.log(contract);
  var send = await contract.methods.setStudent(address, name, age).send({ from: accounts[0] });
  console.log('Test 1' + send);
  log(`Student added!`);
}

function retrieveStudent(logstr) {
	document.getElementById("retrieveStudent").innerHTML = logstr;
}

async function getStudent() {
  var address = document.getElementById("addressR").value;
  // var name = document.getElementById("name").value;
  // var age = document.getElementById("age").value;
  console.log(address);
  console.log(contract);
  var student = await contract.methods.getStudent(address).call({ from: accounts[0] });
  console.log('Test 1' + student);
  retrieveStudent(`Name: ${student.name} \n Age: ${student.age}`);
}

async function getStudent2(address) {
	return contract.methods.getStudent(address).call({ from: accounts[0] });
}

async function getOwner(address) {
	return contract.methods.owner().call({ from: accounts[0] });
}

const studentCount = document.getElementById("studentCount");
async function amountOfStudents() {
  	let amount = contract.methods.amountOfStudents().call({ from: accounts[0] });
	console.log(await amount);
	studentCount.innerHTML = await amount;
}

const weatherid = document.getElementById("weatherid");
async function updateWeather() {
	let weather = contract.methods.update().send({ from: accounts[0] });
	console.log(await weather);
	weatherid.innerHTML = await weather;
	getTemp();
}

async function getTemp(){
    var result = await contract.methods.getTemp().call().then(x => {console.log(x); return x});   
	console.log(result);
	weatherid.innerText = await result;
}

setTimeout(amountOfStudents, 1000);
setTimeout(getTemp, 1000);
