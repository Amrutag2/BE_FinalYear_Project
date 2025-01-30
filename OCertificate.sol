// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract OCertificate {
    struct CertificateData {
        string name;
        uint256 uid;
        string courseName;
        string remark;
        uint256 dateOfIssue;
        address issuer;
        bytes32 certificateHash;
        bool isValid;
    }

    mapping(uint256 => CertificateData) public certificates;
    mapping(bytes32 => CertificateData) private certifi;
    mapping(bytes32 => bool) public transactionValidated;

    uint256 public certificateCount;

    // Event to emit when a new certificate is generated
    event CertificateGenerated(
        string name,
        uint256 indexed uid,
        string courseName,
        string remark,
        uint256 indexed dateOfIssue,
        address indexed issuer,
        bytes32 certificateHash
    );

    // Event to emit when a certificate is validated
    event CertificateValidated(bytes32 indexed certificateHash, bool isValid);

    // Event to emit when a certificate is updated
    event CertificateUpdated(
        uint256 indexed uid,
        address indexed issuer,
        bytes32 indexed certificateHash
    );

    // Modifier to check if the caller is the issuer of the certificate
    modifier onlyIssuer(uint256 _uid) {
        require(
            certificates[_uid].issuer == msg.sender,
            "Only the issuer can update the certificate"
        );
        _;
    }

    // Function to generate a new certificate
    function generateCertificate(
        string memory _name,
        uint256 _uid,
        string memory _courseName,
        string memory _remark
    ) public {
        require(
            certificates[_uid].uid == 0,
            "Certificate with the given UID already exists"
        );
        bytes32 certHash = sha256(
            abi.encodePacked(_name, _uid, _courseName, _remark, block.timestamp)
        );

        certifi[certHash] = CertificateData({
            name: _name,
            uid: _uid,
            courseName: _courseName,
            remark: _remark,
            dateOfIssue:block.timestamp,
            issuer: msg.sender,
            certificateHash: certHash,
            isValid: true
        });
        certificates[_uid] = CertificateData({
            name: _name,
            uid: _uid,
            courseName: _courseName,
            remark: _remark,
            dateOfIssue:block.timestamp,
            issuer: msg.sender,
            certificateHash: certHash,
            isValid: true
        });
        transactionValidated[certHash] = true;

        certificateCount++;

        // Emit event
        emit CertificateGenerated(
            _name,
            _uid,
            _courseName,
            _remark,
            block.timestamp,
            msg.sender,
            certHash
        );
    }

    // Function to validate a certificate
    function validateCertificate(bytes32 _certificateHash) public {
        bool isValid = transactionValidated[_certificateHash];
        emit CertificateValidated(_certificateHash, isValid);
    }

    //Function to retrieve certificate data
    function retrieveCertficateData(
        bytes32 _hash
    )
        public
        view
        returns (
            string memory name,
            uint256 uid,
            string memory courseName,
            string memory remark,
            uint256 dateOfIssue,
            address issuer,
            bytes32 certificateHash,
            bool isValid
        )
    {
        require(certifi[_hash].isValid, "certficate already exists");
        CertificateData storage certData = certifi[_hash];
        return (
            certData.name,
            certData.uid,
            certData.courseName,
            certData.remark,
            certData.dateOfIssue,
            certData.issuer,
            certData.certificateHash,
            certData.isValid
        );
    }

    // Function to update certificate data
    function updateCertificateData(
        uint256 _uid,
        string memory _name,
        string memory _courseName,
        string memory _remark,
        bytes32 _certificateHash
    ) public onlyIssuer(_uid) {
        certificates[_uid].name = _name;
        certificates[_uid].courseName = _courseName;
        certificates[_uid].remark = _remark;
        certificates[_uid].certificateHash = _certificateHash;

        // Emit event
        emit CertificateUpdated(_uid, msg.sender, _certificateHash);
    }
}
