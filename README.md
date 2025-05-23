# Tokenized Healthcare Clinical Trial Management System

This project implements a blockchain-based clinical trial management system using Clarity smart contracts. The system provides a secure, transparent, and immutable platform for managing clinical trials in healthcare.

## Overview

The system consists of five main components:

1. **Research Institution Verification**: Validates and verifies research entities participating in clinical trials
2. **Protocol Registration**: Records study methodologies and protocols
3. **Patient Enrollment**: Manages participant consent and enrollment
4. **Data Collection**: Securely stores trial results and data
5. **Adverse Event Tracking**: Records and manages safety incidents

## Smart Contracts

### Research Institution Verification

This contract maintains a registry of verified research institutions that can participate in clinical trials.

Key functions:
- `verify-institution`: Adds a new institution to the verified list
- `revoke-verification`: Revokes an institution's verification
- `is-verified`: Checks if an institution is verified
- `get-institution-details`: Retrieves details about a verified institution

### Protocol Registration

This contract allows for the registration and management of clinical trial protocols.

Key functions:
- `register-protocol`: Registers a new clinical trial protocol
- `update-protocol-status`: Updates the status of an existing protocol
- `get-protocol-details`: Retrieves details about a registered protocol

### Patient Enrollment

This contract manages patient enrollment and consent in clinical trials.

Key functions:
- `enroll-patient`: Enrolls a patient in a specific protocol
- `update-enrollment-status`: Updates a patient's enrollment status
- `is-patient-enrolled`: Checks if a patient is enrolled in a protocol
- `get-enrollment-details`: Retrieves details about a patient's enrollment

### Data Collection

This contract securely stores and manages clinical trial data.

Key functions:
- `record-data`: Records a new data entry for a patient
- `update-data-status`: Updates the status of a data entry
- `get-data-entry`: Retrieves a specific data entry

### Adverse Event Tracking

This contract records and manages adverse events that occur during clinical trials.

Key functions:
- `report-adverse-event`: Reports a new adverse event
- `update-event-status`: Updates the status of an adverse event
- `get-event-details`: Retrieves details about an adverse event
- `get-event-count`: Gets the count of adverse events for a protocol

## Security Features

- Admin controls for critical operations
- Hashing of sensitive documents and data
- Status tracking for all entities
- Immutable audit trail of all actions

## Privacy Considerations

This system is designed with privacy in mind:
- Patient identifiers are stored as hashes
- Actual medical data is stored off-chain with only hashes on-chain
- Access controls limit who can view sensitive information

## Getting Started

1. Deploy the smart contracts to a Stacks blockchain node
2. Set up the appropriate admin accounts
3. Begin by verifying research institutions
4. Register protocols for clinical trials
5. Start enrolling patients and collecting data

## Testing

The system includes comprehensive tests using Vitest. Run the tests with:

```
npm test
```

## Future Enhancements

- Integration with decentralized storage solutions
- Multi-signature requirements for critical operations
- Enhanced analytics and reporting capabilities
- Integration with existing healthcare systems
```

```md project="Healthcare Trial Management" file="PR-DETAILS.md" type="markdown"
# Pull Request: Tokenized Healthcare Clinical Trial Management System

## Overview

This PR implements a blockchain-based clinical trial management system using Clarity smart contracts. The system provides a secure, transparent, and immutable platform for managing clinical trials in healthcare.

## Components

1. **Research Institution Verification Contract**
   - Validates research entities participating in clinical trials
   - Maintains a registry of verified institutions
   - Provides verification status checking

2. **Protocol Registration Contract**
   - Records study methodologies
   - Manages protocol status throughout the trial lifecycle
   - Stores protocol document hashes for verification

3. **Patient Enrollment Contract**
   - Manages participant consent
   - Tracks enrollment status
   - Securely stores consent document hashes

4. **Data Collection Contract**
   - Securely stores trial results
   - Maintains data integrity through hashing
   - Tracks data collection events

5. **Adverse Event Tracking Contract**
   - Records safety incidents
   - Categorizes events by severity
   - Provides reporting and tracking mechanisms

## Technical Details

- All contracts implement proper access controls
- Sensitive data is stored as hashes, with actual data kept off-chain
- Each contract has a dedicated admin role that can be transferred
- Comprehensive test suite using Vitest

## Security Considerations

- Admin controls protect critical functions
- Data integrity is maintained through hashing
- All operations are recorded on the blockchain for audit purposes
- Status tracking prevents unauthorized modifications

## Testing

The PR includes tests for all contracts, covering:
- Happy path scenarios
- Error handling
- Access control validation
- Data integrity checks

## Future Work

- Implement cross-contract calls for better integration
- Add multi-signature requirements for critical operations
- Enhance privacy features
- Develop a frontend interface for easier interaction
```

## System Architecture

Here's a diagram showing how the different contracts interact in this system:

```mermaid title="Clinical Trial Management System Architecture" type="diagram"
graph TD;
    A["Research Institution Verification"] -->|"Verifies"| B["Protocol Registration"]
    B -->|"References"| C["Patient Enrollment"]
    C -->|"References"| D["Data Collection"]
    C -->|"References"| E["Adverse Event Tracking"]
    D -->|"May trigger"| E
