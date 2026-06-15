CREATE TABLE accounts (
                          account_id SERIAL PRIMARY KEY,
                          account_name VARCHAR(50) NOT NULL,
                          balance NUMERIC(12,2) NOT NULL
);

INSERT INTO accounts (account_name, balance)
VALUES
    ('Nguyen Van A', 1000.00),
    ('Tran Van B', 2000.00);

SELECT balance
FROM accounts
WHERE account_id = 1;

-- Kết quả: 1000.00

-- Chờ Session B update

SELECT balance
FROM accounts
WHERE account_id = 1;

-- READ COMMITTED:
-- Kết quả sẽ là 1500.00

COMMIT;

BEGIN;
UPDATE accounts
SET balance = balance + 500.00
WHERE account_id = 1;
COMMIT;



BEGIN;
SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;

SELECT balance
FROM accounts
WHERE account_id = 1;

