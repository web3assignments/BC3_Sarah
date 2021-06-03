contract_address = "0x83117abc122b0f62e7f1cd0e031891cc8bb6dc5d";
const abi = [
    {
        "constant": false,
        "inputs": [
            {
                "name": "_address",
                "type": "address"
            },
            {
                "name": "_name",
                "type": "string"
            },
            {
                "name": "_age",
                "type": "uint8"
            }
        ],
        "name": "setStudent",
        "outputs": [],
        "payable": false,
        "stateMutability": "nonpayable",
        "type": "function"
    },
    {
        "constant": true,
        "inputs": [
            {
                "name": "_address",
                "type": "address"
            }
        ],
        "name": "getStudent",
        "outputs": [
            {
                "components": [
                    {
                        "name": "name",
                        "type": "string"
                    },
                    {
                        "name": "age",
                        "type": "uint8"
                    },
                    {
                        "name": "exists",
                        "type": "bool"
                    }
                ],
                "name": "",
                "type": "tuple"
            }
        ],
        "payable": false,
        "stateMutability": "view",
        "type": "function"
    },
    {
        "constant": true,
        "inputs": [],
        "name": "amountOfStudents",
        "outputs": [
            {
                "name": "count",
                "type": "uint256"
            }
        ],
        "payable": false,
        "stateMutability": "view",
        "type": "function"
    },
    {
        "anonymous": false,
        "inputs": [
            {
                "indexed": true,
                "name": "date",
                "type": "uint256"
            },
            {
                "indexed": true,
                "name": "name",
                "type": "string"
            },
            {
                "indexed": false,
                "name": "age",
                "type": "uint8"
            },
            {
                "indexed": false,
                "name": "message",
                "type": "string"
            }
        ],
        "name": "logAddStudent",
        "type": "event"
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
    if (typeof network === 'undefined' || network != 4) { console.log("Please select Rinkeby test network"); return; }

    console.log(accounts[0]); // show current user.
    contract = new web3.eth.Contract(abi, contract_address);
}
window.addEventListener('load', asyncloaded);

//////////////////

async function setStudent() {
    var address = document.getElementById("address").value;
    var name = document.getElementById("name").value;
    var age = document.getElementById("age").value;
    console.log(address, name, age);
    console.log(contract);
    var send = await contract.methods.setStudent(address, name, age).send({ from: accounts[0] });
    console.log(send);
}