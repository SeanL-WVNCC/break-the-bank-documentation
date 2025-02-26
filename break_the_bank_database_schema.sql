DROP TABLE IF EXISTS fileUploads;
DROP TABLE IF EXISTS transactions;
DROP TABLE IF EXISTS accounts;
DROP TABLE IF EXISTS users;

/*
    CIT 291 - CIT Internship & Certification
    Break The Bank - Initial Database Design
    Initial Draft: February 16th, 2025
*/
/*
    User data.
     * userId                 - Unique numeric user ID.
     * username               - Unique username/handle.
     * password               - Plaintext user password.
     * firstName              - User's first name.
     * firstName              - User's last name.
     * email                  - User's email.
     * isAdmin                - Whether or not this user is an administrator.
*/
CREATE TABLE users (
    userId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(32) NOT NULL UNIQUE,
    password VARCHAR(256) NOT NULL,
    firstName VARCHAR(25) NOT NULL,
    lastName VARCHAR(25) NOT NULL,
    email VARCHAR(256) NOT NULL,
    isAdmin BOOL DEFAULT FALSE
);

/*
    Account data. Each user may have multiple accounts.
    * accountNumber  - Unique account ID.
    * userId         - User ID of the accountholder.
    * accountType    - Type of account. It may be "Checking", "Saving", etc.
    * nickname       - User-selected account nickname.
*/
CREATE TABLE accounts (
    accountNumber INT NOT NULL,
    userId INT NOT NULL,
    accountType VARCHAR(32) NOT NULL,
    nickname VARCHAR(25) DEFAULT NULL,
    FOREIGN KEY (userId) REFERENCES users(userId)
);

/*
    Transaction journal.
    * transactionId    - Unique transaction ID.
    * debitAccountId   - Account ID of the account to be debited in this transaction.
    * creditAccountId  - Account ID of the account to be credited in this transaction.
    * amount           - Amount to be credited/debited.
    * transactionTime  - Date/time of the transaction.
    * postedTime       - Date/time that the transaction has cleared. NULL if still pending.
)
*/
CREATE TABLE transactions (
    transactionId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    debitAccountId INT,
    creditAccountId INT,
    amount DECIMAL(30, 2) NOT NULL,
    transactionTime DATETIME NOT NULL,
    postedTime DATETIME,
    description VARCHAR(256)
);

/*
    Metadata for user-uploaded mobile check pictures. File content is stored on the web server.
     * fileUploadId   - Numeric ID of the file, doubles as the filename.
     * fileExtention  - File extention of the image, should be png, jpeg, webp, etc.
     * transactionId  - ID of the transaction to which this image is attached.
*/
CREATE TABLE fileUploads (
    fileUploadId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    fileExtention VARCHAR(25) NOT NULL,
    transactionId INT NOT NULL,
    FOREIGN KEY (transactionId) REFERENCES transactions(transactionId)
);


INSERT INTO users (username, password, firstName, lastName, email, isAdmin) VALUES ("SeanLauritzen", "hackme", "Sean", "Lauritzen", "splauritzen@mail.wvncc.edu", True);
