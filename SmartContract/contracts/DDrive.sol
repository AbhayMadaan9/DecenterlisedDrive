// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity >0.7.0 <=0.9.0;

contract DDrive {
    struct Access {
        address user;
        bool access;
    }

    mapping(address => string[]) data;
    mapping(address => Access[]) accessList;
    mapping(address => mapping(address => bool)) ownership;
    mapping(address => mapping(address => bool)) prevData;


    function entries(string memory url, address _user) external {
        data[_user].push(url);
    }


    function allowAccess(address shareAddress) external {
        ownership[msg.sender][shareAddress] = true;
        //if marked not allowed.
         for (uint i = 0; i < accessList[msg.sender].length; i++) {
            if ((accessList[msg.sender][i].user == shareAddress))
            {
                if(accessList[msg.sender][i].access = false)) {
                accessList[msg.sender].push(Access(shareAddress, true));
            }
            else {
                accessList[msg.sender][i].access = true;
            }
            } 
        }
    }


    function disallowAccess(address shareAddress) external {
        ownership[msg.sender][shareAddress] = false;
        for (uint i = 0; i < accessList[msg.sender].length; i++) {
            if (accessList[msg.sender][i].user == shareAddress) {
                accessList[msg.sender][i].access = false;
            }
        }
    }

}
