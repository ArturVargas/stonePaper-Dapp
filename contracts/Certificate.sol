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

    event NewCertificated(
        uint256 docId,
        address userCertificated,
        string userName,
        string userLastNames,
        string certifiedMatter,
        string orgName,
        string hashPhoto
    );

    address public rootUser;
    mapping(uint256 => Certifier) public certifiers;
    mapping(address => Certifier) public certifierAdd;
    mapping(uint256 => Document) public documents;
    uint256 certifierCount = 0;
    uint256 documentCount = 0;

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

    function createDocument(
        address _userCertificated,
        string memory _userName,
        string memory _userLastNames,
        string memory _certifiedMatter,
        string memory _hashPhoto
    ) public onlyCertifier() {
        documentCount++;
        string memory _orgName = certifierAdd[msg.sender].orgName;
        documents[documentCount] = Document(
            documentCount,
            _userCertificated,
            _userName,
            _userLastNames,
            _certifiedMatter,
            _orgName,
            _hashPhoto
        );
        emit NewCertificated(
            documentCount,
            _userCertificated,
            _userName,
            _userLastNames,
            _certifiedMatter,
            _orgName,
            _hashPhoto
        );
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
