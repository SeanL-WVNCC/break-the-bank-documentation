# 03/13/2025 Meeting summary - Kevin Hoge

## Throughout the meeting, the development team demonstrated some of the working functions of the website in its current state.
* Sean briefly demonstrated Remote Shell Execution within the web browser
* Angela demonstrated her functioning cross site request forgery button.
* Wyatt demonstrated his vulnerable feedback input, where the text placed into the input field is rendered by the browser without filtering.

## Functioning Vulnerabilities
* Reflected Cross Site Scripting
* Remote Shell Execution
* Path Traversal
* Denial of Service

Grant Reviewed the ClickUp Tasks. The addition of ClickUp has organized this task into manageable little snippets of work.
## Vikram’s Suggestions
* Make the vulnerabilities a little less obvious.
* Return Specific error messages to the user of the webpage that indicate potential vulnerabilities
* CSRF Vulnerability - perhaps the button on the page could lead to the page source or another clever error message, which contains a hint to the vulnerability.
* File Upload Function – Display error message that states the file size is too large or a similar error message to give the “attackers” hints.
* He mentioned an earlier SSL protocol version (1.1) that is vulnerable to the Poodle Attack.
* He also mentioned about coding with a “whitelist”
* For the remote code execution, he suggested adding a specific space within the webpage that allows the user to input commands.
* The entire team needs to research ways to present this project in terms the general public is able to understand.
* Return the focus of development to the mentality of a hacker, this intentionally vulnerable website is intended to be a game where intrigued students have to find all of these vulnerabilities on their own.