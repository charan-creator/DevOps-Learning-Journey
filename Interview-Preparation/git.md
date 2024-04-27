Git conflict?

Branching strategy?

How often do you release the product?

how to resolve merge conflicts?

Merge vs rebase

interactive rebase git

squash in git

fast-forward merge in Git?

What is cherry pic

1. Differences between git rebase and git merge?
2. Git workflow?
3. What is git init?
4. What is git clone?
5. If there is suddenly the file is deleted in git and how do you get it back?
6. Difference between SVN and GIT?
7. Difference between ant and maven?
8. What are the version control tools are using in the present market?
9. What is git commit
10. Git push and fetch?
11. How to create a repository in GitHub?
12. How to push the file in the GitHub flow?
13. About branching strategies?
14. Difference between GitHub and Bit Bucket?
15. Use of git commit and purpose?
16. Difference between rebasing and merge?
17. What is Maven repositories?
18. Explain about GIT Branching in your project?
19. Can you describe your experience with Git and GitHub, and how you have used these tools 
in your previous roles?
20. What are some of the key benefits of using Git for version control, and how have you seen 
these benefits in your work?
21. Can you discuss your experience using Git to manage changes to code and collaborate with 
other developers, including any techniques you have used to manage conflicts and merge 
changes?
22. How have you used Git branching and tagging strategies to manage releases and 
versioning, particularly in large code bases or complex projects?
23. Can you explain how Git hooks work and how you have used them to automate workflows 
or enforce coding standards?
24. How have you used GitHub to implement code reviews and ensure code quality, including 
any techniques you have used to enforce coding standards or identify and fix bugs?
25. Can you discuss how you have used Git to manage changes to code and collaborate with 
other developers, including any techniques you have used to manage conflicts and merge 
changes?
26. How have you used Git tagging and release management strategies to manage releases and 
versioning, particularly in large code bases or complex projects?
27. Can you explain how you have used Git hooks to automate workflows or enforce coding 
standards, and any techniques you have used to implement custom hooks?
28. How have you used GitHub to implement continuous integration and continuous 
deployment workflows, including any techniques you have used to automate testing, 
building, and deploying code?
29. Can you describe your experience using Git and GitHub for version control, and how you 
have used these tools in your previous roles?
30. What are some of the key benefits of using Git for version control, and how have you seen 
these benefits in your work?

what is bare repository in git and what is the purpose of it and how to create it ?
 > A bare repository in Git is a special type of repository that lacks a working directory. This means it only contains the Git history and metadata, but not the actual project files.
> Bare repositories are primarily used for sharing code between developers. They act as central servers where developers can push and pull changes. They are not intended for local development as they lack the working files needed for editing
> You can create a bare repository using the git init --bare command. This will create a new directory containing only the Git data

Git rebase vs reset vs revert 
  - Git rebase is simmilar to git merge but there is a difference. The end goal of both git rebase and git merge is to keep all the commits in a single line. But, rebase will delete
  - git merge is straightforward and non-destructive, but it can clutter the history. Git rebase provides a cleaner history but requires caution. Choose based on your team’s preferences and project need
  - git revert to safely undo changes in a public context, and reserve git reset for local adjustments on private branches
  - [Reference](https://geekflare.com/git-reset-vs-revert-vs-rebase/)

what is git revlist ?
 - To list commit in onebranch which are not in another branch `git rev-list --oneline  master ^origin/master`

what is git squash ?

what is git cherry-pick ?

what is gitreflog ?

what is git clean -i ?

what git clean -f will do ? Forcefully remove all untracked files

git clean -fx ? To remove all ignored files from current directory and subdirectory

git clean -xn ? To preview all the files that will be cleaned

git clean -fd ? To remove all untracked directories and files in them 

git clean -dn ? to preview all the directories that will be cleaned.

what is git bisect ?

