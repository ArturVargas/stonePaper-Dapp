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

    event NewRegister(
        uint256 certifierId,
        address certifierAddress,
        string _orgName
    );

    address public rootUser;
    uint256 public registerCount;
    mapping(uint256 => Register) public registers;

    constructor() public {
        rootUser = msg.sender;
    }

    function createRegister(address _registerAddres, string memory _orgName)
        public
        onlyRootUser()
    {
        registerCount++;
        registers[registerCount] = Register(
            registerCount,
            _registerAddres,
            _orgName
        );
        emit NewRegister(registerCount, _registerAddres, _orgName);
    }

    function createDocument() public onlyRegister() {
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

    modifier onlyRegister() {
        // la direccion actual debe corresponder a un Certificador
    }
}
