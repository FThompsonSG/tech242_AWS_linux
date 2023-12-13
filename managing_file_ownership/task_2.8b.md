# Research Managing File Permissions

## 1. Does being the owner of a file mean you have full permissions on that file? Explain.
- Not neccesarily, it means that the owner determines who may have permission but doesn't immediately grant them full permission e.g. executable

## 2. If you give permissions to the User entity, what does this mean?
- Giving permissions to another user who is not the owner

## 3. If you give permissions to the Group entity, what does this mean?
- Giving permissions to a group of user with shared ownership or access to a file

## 4. If you give permissions to the Other entity, what does this mean?
- Giving permissions to a user that did not create the file and/or is not in the group with access.

## 5. You give the following permissions to a [file: Use](file: Us "‌")r permissions are read-only, Group permissions are read and write, Other permissions are read, write and execute. You are logged in as the user which is owner of the file. What permissions will you have on this file? Explain.
- Read and write as you will automatically be part of the group as the owner

## 6. Here is one line from the ls -l. Work everything you can about permissions on this file or directory.
"-rwxr-xr-- 1 tcboony staff  123 Nov 25 18:36 keeprunning.sh"
- This is not a directory but is a file
- The user has read, write and executable permissions
- The owners group has read and executable permissions
- The rest of the world only has read permissions
- There is 1 link to this file
- The user is tcboony
- The group is staff
- The number of bytes (characters) in the file is 123
- The date and time the file was last updated was November 25th at 18L36
- This is a script file called keeprunning.sh