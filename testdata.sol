// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TransactionRecord {

    struct Transaction {
        address from;
        address to;
        uint256 amount;
        uint256 timestamp;
        string memo;
    }

    mapping(address => Transaction[]) public transactions;

    // Add a transaction record
    function addTransaction(address _from, address _to, uint256 _amount, string memory _memo) public {
        Transaction memory newTransaction = Transaction({
            from: _from,
            to: _to,
            amount: _amount,
            timestamp: block.timestamp,
            memo: _memo
        });
        
        transactions[_from].push(newTransaction);
        transactions[_to].push(newTransaction);
    }

    // Retrieve all transactions for an address
    function getTransactions(address _wallet) public view returns (Transaction[] memory) {
        return transactions[_wallet];
    }

    // This function is to seed demo data for demonstration purposes
    function seedDemoData() public {
        addTransaction(address(0xDEADBEEFDEADBEEFDEADBEEFDEADBEEFDEADBEEF), address(0xCAFEBABECAFEBABECAFEBABECAFEBABECAFEBABE), 100, "Payment for services");
        addTransaction(address(0x1234567890123456789012345678901234567890), address(0xDEADBEEFDEADBEEFDEADBEEFDEADBEEFDEADBEEF), 50, "Lunch reimbursement");
        addTransaction(address(0xCAFEBABECAFEBABECAFEBABECAFEBABECAFEBABE), address(0x1234567890123456789012345678901234567890), 25, "Refund for overpayment");
        // Add more demo data as required
    }
}
