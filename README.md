# invoice-audit

Checks a fictional law firm's invoices for duplicate billing and trust-account problems before they reach a client.

All data is synthetic: the firm, its clients, its matters and its invoices are invented.

Phase 1 delivers a SQLite database, SQL checks run from a Python script, and tests that prove every planted fault is caught.