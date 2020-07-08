pragma solidity >=0.5.0 <0.7.0;

contract Certificate {
    struct Certifier {
        uint256 certifierId;
        address certifierAddres;
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

    event NewCertifier(
        uint256 certifierId,
        address certifierAddress,
        string _orgName
    );

    address public rootUser;
    uint256 public certifierCount;
    mapping(uint256 => Certifier) public certifiers;

    constructor() public {
        rootUser = msg.sender;
    }

    function createCertifier(address _certifierAddress, string memory _orgName)
        public
        onlyRootUser()
    {
        certifierCount++;
        certifiers[certifierCount] = Certifier(
            certifierCount,
            _certifierAddress,
            _orgName
        );
        emit NewCertifier(certifierCount, _certifierAddress, _orgName);
    }

    function createDocument() public onlyCertifier() {
        // Se crea el documento para certificar a algun usuario.
        // El documento solo se puede crear por el usuario Register.
    }

    modifier onlyRootUser() {
        require(
            msg.sender == rootUser,
            "Solo el usuario Root puede registrar Certificadores"
        );
        _;
    }

    modifier onlyCertifier() {
        // la direccion actual debe corresponder a un Certificador
    }
}
