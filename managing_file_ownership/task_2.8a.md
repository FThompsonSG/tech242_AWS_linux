# Research Managing File Ownership

## 1. Why is managing file ownership important?
- The ownership of a file will determine who has what permissions so reduces the risk of a file being accidentally or unknowingly modified/deleted.

## 2. What is the command to view file ownership?
- “Is -I” or "ls -lah"

## 3. What permissions are set when a user creates a file or directory? Who does file or directory belong to?
- Read, write and execute (though typically not received by user). The file will typically belong to the one who created it.

## 4. Why does the owner, by default, not receive X permissions when they create a file?
- Could lead to security risks, textual content or data storage don't typically require execute permissions and the principle of least privilege.

## 5. What command is used to change the owner of a file or directory?
- "chmod" then +, - or = with r,w or x and a filename