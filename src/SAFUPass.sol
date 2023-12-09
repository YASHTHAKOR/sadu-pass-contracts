// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

struct Password {
    string domain;
    string data;
}

struct AuthIntegrations {
    string pubKey;
    string companyId;
}

struct AuthLogins {
    string data;
}

contract SAFUPass {

    mapping(address => Password[]) public records;

    mapping(address => AuthIntegrations[]) public auths;

    mapping(address => mapping(address => AuthLogins)) public authLogins;

    event passwordAdd(string domain, string data, address user);

    event AuthRegister(string companyId, address user);

    function addPassword(string memory domain, string memory data) external {
        Password memory newPassword = Password(domain, data);
        records[msg.sender].push(newPassword);
        emit passwordAdd(domain, data, msg.sender);
    }

    function getPassword(address user, uint index) public view returns (Password memory) {
        require(index < records[user].length, "Index out of bounds");
        return records[user][index];
    }

    function registerForOauth(string memory publicKey,string memory companyId) external {
        AuthIntegrations memory integrations = AuthIntegrations(publicKey, companyId);
        auths[msg.sender].push(integrations);
        emit AuthRegister(companyId, msg.sender);
    }

    function authLogin( string memory data, address oAuth ) {
        AuthLogins memory authLogin = AuthLogins(data);
        authLogins[msg.sender][oAuth] = authLogin;
    }
}
