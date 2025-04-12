# Possible attacks
* `search.php` accepts a query string parameter `query` that is vulnerable to a reflected XSS attack. Visiting a url such as `search.php?query=%3Cscript%3Ealert(%27Hi%27)%3C%2Fscript%3E` will trigger untrusted JS.
* `login.php` is vulnerable to SQL injection. Attempting a username such as `" OR 1=1 -- ` will allow authentication without a correct password.
* `login.php` can be used to enumerate users.