pragma solidity >=0.5.0 <0.7.0;

contract Certificate {
    struct Register {
        uint256 registerId;
        address registerAddress;
        string orgName;
    }

    struct Document {
        uint256 docId;
        address userCertificated;
        string userName;
        string userLastNames;
        string certifiedMatter;
        string orgName;
        string hashPhoto;
    }

    address public rootUser;

    constructor() public {
        rootUser = msg.sender;
    }

    function createRegister(
        uint256 memory _registerId,
        address _registerAddres,
        string memory _orgName
    ) public onlyRootUser() {
        // Se crea el usuario que podrá crear certificados.
        // Estos usuarios solo se pueden crear por el dueño del SC.
    }

    function createDocument() public onlyRegister() {
        // Se crea el documento para certificar a algun usuario.
        // El documento solo se puede crear por el usuario Register.
    }
}
