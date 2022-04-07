START TRANSACTION;

SELECT balance FROM Account WHERE id = 1;

UPDATE Account
SET balance = 1100 WHERE id = 1;

/*IF account_error = 1 Then
ROLLBACK
Else
COMMIT*/