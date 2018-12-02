-- Expect error: cannot set strictly global variables as session variables
SET SESSION max_connections = 1000;

SET @@global.max_connections = 1;


-- Expect warning
SET SESSION sql_mode='STRICT_TRANS_TABLES,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';