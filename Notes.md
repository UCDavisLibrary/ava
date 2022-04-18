These are notes that were removed from the documentation. It's important information, but maybe too much detail for the docs.

***After your pull request is accepted OR it's been a while since you've updated your fork*** Once you've set up your fork, you'll need to update it regularly to make sure you have all the current files.  There is unfortunately no way to do this with the GitHub Desktop tool, but it's not too complicated to update it.
1. Open GitHub Desktop
1. Click on your fork to open it.
1. Right click on the name of the fork and select "Open Command Prompt" or "Open in Git Shell" (depending on the version you have the text will be different).  A command line shell will open.  The path before the > should be where you store your data (probably the GitHub folder on your computer).
1. You will now run a few commands to update your fork ([reference](https://gist.github.com/CristinaSolana/1885435)).
    1. The first time you'll need to set an upstream repository for your fork:
    ```
        git remote add upstream git://github.com/UCDavisLibrary/ava.git
    ```
        
    2. Now you'll fetch any changes:
    ```
        git fetch upstream
    ```
    
    3. Finally, you'll update your folder with the changes you just fetched:
    ```
        git pull upstream master
    ```

***When things go wrong*** In the event that your fork gets too messy (such as you have too many differences in your fork and you can't sort it out), you can do a **hard reset** to remove everything from your fork and replace it with what is on the UC Davis AVA repository. 
1. Copy any data you've been working on into a folder not affected by git. 
2. Run a few lines of code to reset your repository:
    1. The first time you'll need to set an upstream repository for your fork:
    ```
        git remote add upstream git://github.com/UCDavisLibrary/ava.git
    ```
    
    2. Now the reset:
    ```
    git fetch upstream
    git checkout master
    git reset --hard upstream/master  
    git push origin master --force
    ```
3. Finally, move any data you've been working on back into it's folder.  Now you can do a pull request like you normally would.
