# 🎓 Online Certificate Generation and Validation using Blockchain

This repository contains the source code for a **Blockchain-based Online Certificate Generation and Validation System**, developed as part of a final year academic project. The system ensures a **secure, tamper-proof, and decentralized way** of issuing and verifying certificates using **Ethereum smart contracts written in Solidity**.

---

## 📌 Project Description

Traditional certificate generation and validation systems are often centralized and susceptible to forgery and data tampering. This project aims to **eliminate certificate fraud** by leveraging the transparency, immutability, and security of blockchain technology.

Using this DApp:
- Educational institutions can issue verifiable digital certificates.
- Employers or third parties can instantly validate the authenticity of certificates without intermediaries.

---

## 🚀 Features

- ✅ **Blockchain-backed authenticity**
- 🧾 **Certificate issuance with metadata** (Name, UID, Course, Remarks, etc.)
- 🔍 **On-chain certificate validation**
- 🔐 **Data integrity via SHA-256 hashing**
- 🔄 **Controlled certificate updates by the issuer**
- 📬 **Event-based tracking for transactions**

---

## 🛠️ Smart Contract Overview (`OCertificate.sol`)

### 🔧 Key Structs
- `CertificateData`: Stores all certificate metadata like:
  - `name`, `uid`, `courseName`, `remark`, `dateOfIssue`, `issuer`, `certificateHash`, and `isValid`.

### 🔑 Functions

| Function | Description |
|---------|-------------|
| `generateCertificate(...)` | Issues a new certificate and stores it immutably on the blockchain |
| `validateCertificate(bytes32 _certificateHash)` | Validates whether a certificate exists and is valid |
| `retrieveCertficateData(bytes32 _hash)` | Retrieves full certificate details using its hash |
| `updateCertificateData(...)` | Allows the issuer to update an existing certificate's information (issuer-only access) |

### 🛡️ Security
- **Only the original issuer** of a certificate can modify it.
- Uses `sha256` for generating a unique, tamper-resistant hash.
- All certificate issuance and validation events are logged on the chain.

---
Note: You can extend this project with a frontend (React.js, Web3.js/Ethers.js) to provide a user-friendly interface for issuers and validators.

---

## 📚 Tech Stack

- **Solidity** (Smart Contract Language)
- **Ethereum** Blockchain (EVM compatible)
- **Remix IDE** or **Truffle/Hardhat** for testing & deployment
- **MetaMask** for transaction signing (frontend extension - optional)

---

## 📢 Future Enhancements

- 🔗 Integration with IPFS for storing actual certificate PDFs
- 🌐 User Interface using React + Web3.js
- 📊 Dashboard for tracking issued certificates and validations
- 📱 Mobile app integration for on-the-go verification

---

## 👨‍🎓 Author

**Amruta Samir Gulekar**  
Final Year Computer Engineering Student  
amrutagulekar12@gmail.com
www.linkedin.com/in/amruta-gulekar-4283b7207

---



