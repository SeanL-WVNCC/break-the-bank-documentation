# Possible attacks
Updated 2025-04-15

## Reflected XSS
* `search.php` accepts a query string parameter `query` that is vulnerable to a reflected XSS attack. Visiting a url such as `search.php?query=%3Cscript%3Ealert(%27Hi%27)%3C%2Fscript%3E` will trigger untrusted JavaScript.
* `login.php` reflects the `username` field without sanitization.

## Stored XSS
* `feedback.php` does not sanitize user input, allowing stored XSS attacks against administrators. Any user can place a malicious payload into the `feedback` field.
* `dashboard.php` is vulnerable to stored XSS, it does not sanitize the `nickname` field of the `accounts` table.

## Session manipulaton
* The session cookie is just the user's numeric ID in the users table, allowing trivial session hijacking.
* `feedback.php` contains a hidden field `user-id` that can be tampered with. Changing its value allows the attecker to submit feedback under another the account of another user.

## SQL injection
* `login.php` is vulnerable to SQL injection. Attempting a username such as `" OR 1=1 -- ` will allow authentication without a correct password.

## Remote code execution
* `mobile-deposit.php` allows executable PHP files to be uploaded to a server-accessible directory when the filename contains "jpeg" or "png". This severe oversight allows remote code execution.

## Sensitive information disclosure
* `login.php` can be used to enumerate users.
* The file `break_the_bank_database_schema.sql` contains the database schema and sample admin accounts.
* The file `config/php/php.ini` contains the web server configuration.
* `info.php` also contains the web server configuration.

## Cross-Site Request Forgery / CSRF
* `about.php` and `feedback.php` both have the frame of a CSRF attack in place.
* `about.php' has a form `Learn More About Nixon', disguised as a button, that has two hidden fields. Hackers must figure out the two field names - `changing-user-info` and `new-info-value`, and what the values need to be.
* `changing-user-info` is for field names in the user table of the database, and `new-info-value` is what the current value of that field will be changed to.
* The `Learn More About Nixon' form takes the user to `about-nixon.php`, which is a purposefully broken page that gives hackers hints for all of this information; it also executes the SQL statement once the hacker gets all the variables correct.
* `feedback.php` is vulnerable in almost the exact same way, but the attack is done on the same page and there's another needed value for the hacker to figure out -- there's a hidden 'csrf' form field and the value must be changed for the attack to work.
* The other variables needed for this page's attack are named the same as in `about.php` - `changing-user-info` and `new-info-value` and they function the same.
