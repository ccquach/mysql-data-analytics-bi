# Set field with NOT NULL constraint
CREATE TABLE companies
(
	company_id INT AUTO_INCREMENT,
    headquarters_phone_number VARCHAR(255),
    company_name VARCHAR(255) NOT NULL,
    PRIMARY KEY (company_id)
);

# Remove NOT NULL
ALTER TABLE companies
MODIFY company_name VARCHAR(255) NULL;

# Add NOT NULL to field of existing table
ALTER TABLE companies
CHANGE COLUMN company_name company_name VARCHAR(255) NOT NULL;

# Test NOT NULL 

# Expect an error
INSERT INTO companies (headquarters_phone_number)
VALUES ('+1 (202) 555-0196');

# Expect insert record
INSERT INTO companies (headquarters_phone_number, company_name)
VALUES ('+1 (202) 555-0196', 'Company A');

SELECT * FROM companies;