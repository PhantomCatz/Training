Git Usage
=========

> **Note:**
>
> You may hear about GitHub Desktop, or see the Git integration in VS Code.
> However, the team has found that, at least for when GitHub Desktop is used,
> the code can break. To avoid such occurences, please do not use GitHub
> Desktop. Reading through this can also let you learn more about properly using
> Git and allow you to control Git better.

> **Note 2:**
>
> I do not use Windows, and I do not know much about using it. Thus, I cannot
> support you if you have issues. These instructions may work, but you may have
> to research fixes or workarounds by yourself.

> **Note 3:** This is not a comprehensive guide to Git. This just covers
> everything you need to know to use Git on our team. You can refer to this guide
> when learning, but if you want to learn more about Git, you may read the [Pro
> Git Book](https://git-scm.com/book/en/v2)

To use Git, you must first install it. You can go to the [Git website](
https://git-scm.com/downloads) to install it. Follow the instructions to install Git.

For Unix, it might ask you to install Homebrew. You should do so if you don't
already have a package manager. Click the link, and follow the instructions it
gives you.

When you finish installing Homebrew, it will tell you to run some commands to
add it to your PATH. You should do so.

# Consider remaking this part

> ## Creating a GitHub Account
>
> The team uses GitHub as its primary Git storage. Make a GitHub account by
> going to [GitHub](https://github.com/). Follow the instructions until you have
> made an account.
>
>
>
> Open up a Command Window with the following steps: Click on the Windows Start
> Icon and in the search bar, start typing “Command Prompt”. The Command Prompt
> icon will appear under “Best match”, so click it to open up a Command Prompt
> window (or open a Terminal window on Mac).
>
> From the Command Prompt window, enter the following:
>
> ssh-keygen -t ed25519 -C <github email>
>
> where <github email> is the email you used to create your GitHub account
>
> For example:  ssh-keygen -t ed25519 john.doe@gmail.com
>
> You’ll be prompted to enter the following:
>
> Enter a file in which to save the key:  hit enter to accept the default saved
> location.  Default location can be found here:
>
> On Windows, it’ll be saved to C:\\\\Users\\\\YOU\\\\.ssh\id_ed25519
>
> On MacOS, it’ll be saved to $HOME/.ssh/id_ed25519
>
> Enter a passphrase (empty for no passphrase):  if you enter a passphrase,
> you’ll need to remember and enter it each time you push up your changes. Hit
> enter twice if you do not wish to enter a passphrase.
>
> Your SSH key pair files are created.
>
> Note: By default, File Explorer in Windows does not show file extensions. To
> make the file extensions visible, select View -> Show -> File Name Extensions.
> If the folder C:\Users\YOU\.ssh is opened in File Explorer, there will be two
> files with the name id_ed25519, one with the extension .pub and one without
> any extension, as shown in below:
>
> The two files are the public and private key pair used for user
> authentication.
>
> The file with the .pub extension is the public key that will be used when
> uploading files, or setting up GitHub.
>
> The file without the .pub extension is a private key, and should NOT be shared
> with anyone.

## Git Overview

Git is a version control system. This means that, for a workspace of code, it
stores snapshots of what the codebase looks like at certain points. You may be
used to this concept from applications like Google Docs, in which you can look
at the history of the documents and restore past changes. Git is similar to
these applications, but it has more features and gives you more control over
each snapshot.

Git manages directories called *repositories*. Any directory can be made into a
Git repository. To make a directory into a repository, `cd` into it and run `git
init`. This creates a subdirectory named `.git`, which contains all of the
information that Git uses. This directory is all Git uses to manage your files,
so if you modify or delete this folder, Git will not work.

# Change this part

> Git does not store every version of your repository, as this would take too much
> memory. Instead, it stores a list of differences, or *diffs*, between versions.
> By adding up all of the diffs, the current file can be remade from the original
> one.

**Refer to this image for the following explanations:**
> ```
>      ┌C─E┬F─
>  A─B─┤  ┌┘
>      └─D┴──G─
> ```

The Git system is usually likened to a tree. Each of the nodes on the graph, the
letters, represent a *commit*, or a snapshot of the repository. Commits are
meant to be static, not changing and not dependent on future commits.

The paths on the graph should be read from left to right, starting from node A.
The repository is initially at commit A. Then, a commit B is made. At this
point, the repository contains two snapshots of the history, along with the
current file state. When changes are made after B, the file state is called the
*working tree*, as the changes have not been committed yet.

After commit B, the path splits. This is called a *branch*. In a branch, the
changes made are separate from those in another branch. After commits C, D, and
E are made, the only changes in the top branch are those made by C and E. In the
bottom branch, only the changes from D are present. This allows multiple people
to work on the same project without interfering with each other.

Although branches are convenient, they are not useful unless you can somehow
recombine the changes made. As it turns out, you can do so with a process called
*merging*. You can merge the changes of one branch into another branch, which
will add the changes from both branches together. This lets you split work into
multiple groups, then merge the changes together once everything is finished.
However, sometimes the changes may conflict, in which case you would have to
resolve the merge manually, choosing what changes to make. We will talk more
about merging later.

The line after D represents merging the bottom branch into the top branch. At
commit F, all of the changes from A-E are present. However, note that the only
thing that happened was that the bottom branch was merged into the top branch.
At commit G, only the changes from A, B, and D are present.


## Basics

Running the command `git status` will give you the status of the current git
repository. Try to run this on the command line. It should give you a message
like this:

> ```
> fatal: not a git repository (or any of the parent directories): .git
> ```

Why did this happen? It is because we are not in a Git repository. We are only
in a Git repository if the current directory, or any of its parents has, as a
direct child, a `.git` directory. This just means that your directory has to be
a child of a directory containing a `.git` directory. However, you should not
make this directory yourself.

As stated before, you can make a directory a Git repository by running `git
init`. Create a directory for this training in a good location, perhaps putting
it in a directory for robotics. `cd` into it in the terminal, then run `git init`.

Now you can run `git status` again. You should get a message like this:

> ```
> On branch main
> Your branch is up to date with origin/main
>
> nothing to commit, working tree clean
> ```

There is no failiure this time, so we are now in a Git repository. But what does
each line mean?

The first line states that you are on the branch `main`. This branch is the
initial branch made by Git, like the line containing commits A and B in the
previous example.

Although this is the default branch, you should not work on
this branch. On our team, the `main` branch is meant for releases, not normal
working. To enforce this, pushing to `main` on GitHub is not allowed, and pull
requests require a review. We will cover more about this later. 

The second line states that the current workspace has all the changes that
`origin/main` does. `origin` can be thought of as the files on GitHub, and
`origin/main` is the branch `main` on `origin`. However, your computer just
saves a copy of `origin` onto your computer, and it does not automatically
update along with GitHub. This means that when someone else updates GitHub, your
computer will still have the old files until you explicitly tell it to update.
Please remember this, as you may think that you have all the changes, but you
will not know unless you update your repository again.

The last line says that you have no changes that are not committed. This means
that your working tree is empty. We will also cover this topic later.


## Committing

### How to commit

As stated before, commits are snapshots of your code. To make a commit, run the
command `git commit`. However, if you have been following this tutorial, when
you run this command, you will get the following error message:

> ```
> On branch main
>
> Initial commit
>
> nothing to commit (create/copy files and use "git add" to track)
> ```

This message is to the one produced by `git status`. The last line states that
there have been no changes since the last commit (it says 'Initial commit'
because you have not made a commit yet). Try creating a file called `a`. Now,
when you run `commit`, you should get the message

> ```
> On branch main
>
> Initial commit
>
> Untracked files:
>   (use "git add <file>..." to include in what will be committed)
> 	a
>
> nothing added to commit but untracked files present (use "git add" to track)
> ```

Note that the commit still does not work, but new information is shown. To
explain this, we will need to understand how Git tracks files.

### File tracking

Git remembers what files have been added to previous commits. Note that Git only
saves **files**, not **directories**. When you change a file's location or name,
it treats this as a special operation, rather than the creation and deletion of
whole files. This means that you cannot add an empty directory to a Git
repository. The directory structure in Git is only implicitly made by the files
you add, so if you have a directory containing only files that have not been
saved, then the directory containing them will not be saved either.

When you add a file to a commit, the file is *tracked* by Git. When you run `git
status`, you can see three categories of files: untracked, unstaged, and staged
files.

1. Staged files are files that have been prepared for committing. We will talk
   more about staging files later.

1. Unstaged files are files that have been inside a commit before, but the
   changes have not been staged.

1. Untracked files are files that have never been added to a commit and are not
   staged.

To stage a file, do `git add PATH/TO/FILE`, where the path is based on your
current working directory. Additionally, you can to `git add PATH/TO/DIRECTORY`
to add all of the files contained inside a directory, including files in
subdirectories.

Create a file named `a`, and try to stage it. Now run `git status`. You should
get this message:

> ```
> On branch main
>
> No commits yet
>
> Changes to be committed:
>   (use "git rm --cached <file>..." to unstage)
> 	new file:   a
> ```

All of the files under the 'Changes to be committed' category are staged files.

When you stage a file, you stage a snapshot of the file at that time. This means
that if you edit the file again, then the changes that were staged are still
just the ones that were made at the moment that you had staged the file. Edit
`a` again and get the status. You should find that `a` is listed twice: once for
the changes you had staged, and again for the change that you just made.

Create a new file called `b`, and put it in a directory called `c`. When you get
the status, you should see this message:

> ```
> On branch main
>
> No commits yet
>
> Changes to be committed:
>   (use "git rm --cached <file>..." to unstage)
> 	new file:   a
>
> Changes not staged for commit:
>   (use "git add <file>..." to update what will be committed)
>   (use "git restore <file>..." to discard changes in working directory)
> 	modified:   a
>
> Untracked files:
>   (use "git add <file>..." to include in what will be committed)
> 	c/
> ```

There are two things of note here:

1. As stated before, the staging you did for `a` the first time was a snapshot
   of what it was *at that time*. As it says, you can run `git restore
   PATH/TO/FILE` to get the state of the file at the time that you had staged
   it. However, this only works for staged files.

1. You can see how the file you just added is untracked. Note that you also
   created a new directory, which has never been tracked either. When you do
   this, Git does not list all of the files contained inside it, but just the
   highest level directory that hasn't been tracked yet.

A helpful command is `git add -A`, to add all of the files that are contained
inside the repository.

What if there are certain files that you never want to add to Git, such as
temporary files, log files, or compiled code? To do so, you can make a special
file named `.gitignore` inside a directory, and everything matched by the file
list would be ignored in the status. This means that if a file were to be
changed but it was listed in the gitignore, the status would not list it in the
untracked files. However, note that if a file is already tracked, then the
gitignore will not affect it, and it will always be listed in the status.

### How to commit, part 2

Now that you know how to stage files, you can start committing. At this point,
your status should be like this:

> ```
> Untracked (1)
> ? c/
>
> Unstaged (1)
> M a
>
> Staged (1)
> A a
> ```

From now on, this document will use this notation for the status. For untracked
files, they will be prefixed with `?`. Files that are tracked and added will be
prefixed with `A`. Files that are tracked and have been modified will be
prefixed with `M`. This is not shown, but tracked files that have been deleted
will be prefixed with `D`.

You can get a display like this by running status with the `s` flag, for short,
i.e. `git status -s`. You can search up more about short form online.

### Adding a Commit Message

Now, try running `git commit`. You should find that your terminal has opened up
an editor that looks like this:

> ```
>
> # Please enter the commit message for your changes. Lines starting
> # with '#' will be ignored, and an empty message aborts the commit.
> #
> # On branch main
> #
> # Initial commit
> #
> # Changes to be committed:
> #	new file:   a
> #
> # Changes not staged for commit:
> #	modified:   a
> #
> # Untracked files:
> #	c/
> #
> ~
> ~
> ~
> ~
> ```

When you make a commit in Git, you have to add a message. If you want to learn
how to use this editor, read the Vim training. Otherwise, read the following:

To get out of the editor, type `ZZ`. Note the caps. You should remember this if
you make a mistake in the future.

You have two options:

1. You can set the default editor for Git to something else. This is highly
   recommended, as this method allows for more control over the commit messages.
   It also gives more information than the other option.

   > ```
   > git config --global core.editor "nano"
   > ```

   Nano is an editor that is simpler to use than Vim. It will likely be on your
   machine if you use Mac or Linux.

   You can replace `nano` with `code --wait` if you have set up your VS Code
   correctly, which opens the Git commit with VS Code. This may be over-the-top,
   though.

   The text in the double quotes is the command that is run to edit the file.
   Thus, if you set the command to a command like `cat`, it would just give you
   the contents of the file. You can experiment with this yourself and search
   online on how to use your favorite editor.

1. You can use the `-m` flag. Again, this method is not recommended. However,
   you can write `git commit -m 'MESSAGE'` to write the commit message as
   `MESSAGE`.

### Logging

Run the command `git commit -m 'Made a'`. You should now have one commit in your
history. You can check this by running `git log`. Each commit message will look
different, but it should follow this format:

1. `commit`, followed by a long hash
1. `Author`, followed by your name, followed by your email in angled brackets
1. `Date`, followed by the time you made the commit
1. The commit message you just wrote

This log should give you all of the information you need to do further work
regarding a commit. Most notably, the commit hash is typically used to refer to
a specific commit. Git allows you to replace any usage of a hash with just a
part of the start, as long as that can refer to a unique commit. If this is too
difficult to use, then Git has another option: the latest commit is referred to
as `HEAD~0`, the commit before that is `HEAD~1`, and so on.

With more commits, your log will grow larger, but you can still search through
it to find what you need if the commit messages are good.

### Amending

If you mess up a commit, like forgetting to stage files or messing up the
message, you can edit the commit as long as you don't push the commit. You can
do so with the command `git commit --amend`, which allows you to edit the last
commit you made.

When you just run this command, you will redo your last commit with the
additional changes that you have staged. Suppose you commit, but you forgot to
add a file:

> ```
> git commit -m 'commit 1'
> git add FORGOTTEN_FILE
> git commit --amend
> ```

This process will add the file to the commit, making it seem as it was always
added.

### Resetting

To remove a file from the stage, you can use `git reset`. Suppose your status
looks like this:

> ```
> Staged (1)
> M a
> ```

Then, you can run `git reset a`, which would make it become

> ```
> Unstaged (1)
> M a
> ```

This command is useful, as you can select exactly what you want to commit
at one time, and you can modify what has been staged before you commit. Note
that you can write multiple file names after the command and reset as many files
as you want. For example, `git reset a b c/d` will remove files `a`, `b`, and
`c/d` from the stage


## Cloning

You know how to make your own repository, but what if you want to use one that
already exists? You can do so by *cloning* it. Git by itself cannot share files,
but by using a host site like GitHub, we can share a single repository across
the whole team.

To clone a Git repository from GitHub:

1. Go to the repository on GitHub

1. Click the arrow on the green 'Code' button, and look under 'Local'. It should
   say 'Clone' under it.

1. Some options may appear:

   1. HTTP

   1. SSH

   1. GitHub CLI

   If you are on a Unix-based system (typically anything but Windows), you
   should use the link for SSH.

   If you are on Windows, use the link for HTTPS. The option for SSH may not
   show up or work.

   Click the corresponding tab and copy the link it gives you.

1. Open your terminal, and `cd` to the directory into which you want to clone
   the repository.

1. Enter `git clone `, and then the link that you just copied. There should be a
   space between `clone` and the link.

   If your screen freezes for a long time, then press `<C-c>`. This will stop
   the execution. This will likely occur if you are connected to the school wifi
   and using SSH. We are not sure how to solve this, but you can connect to your
   phone's hotspot and run the git commands.

   If you do not want to waste data downloading the whole database, you can do
   the following:

   1. Retry cloning using the HTTPS link.

   1. Go into the repository. You can do this from the terminal, or use the
      native file explorer.

      * For Unix, do `ls -la`. This shows hidden files and displays them in a
        readable list

      * For Windows, just do `dir`.

   1. Go into the `.git` directory. This directory is very important. You should
      not try modifying anything in here without knowing what you are doing.

   1. Edit the `config` file. This stores the configuration for the current
      repository.

   1. Under `[remote "origin"]`, change `url` to the SSH link. This makes the
      access link the correct type.

   Although you can clone through HTTPS, you will likely not be able to do much
   more with it, unless you are on Windows.

Now that you have cloned the repository, there is a **copy** stored on your
machine. Note that this is just a copy. If you want to have your changes on
GitHub, you have to update it manually. We will talk more about updating later.


## Branching

As stated before, you can make branches in Git. You can do this with the `git
branch NAME` command, to create a branch with the name `NAME`. Note that adding
a name is necessary.

This command creates a branch based off of your current commit. As you have
read, this means that it has all of the commits up to and including your latest
commit. However, it will not be changed when another branch makes additional
changes.

Run `git branch branch2`. This will make a new branch called `branch2` off of
your last commit. If it ran successfully, then there should be no output.

Get your status. Note that, although you have created the branch, you are still
on the `main` branch. You have to switch to the branch first.

You can do so by using `git checkout branch2`. The command `checkout` changes
the files in your workspace to match that of the branch you are switching to.

If you have uncommitted changes, then Git will not let you switch. This is
because you will lose your changes when you run `checkout`. You can save your
changes by committing, but you may not want to make a commit. If this is the
case, then you can *stash* your changes.

### Stashing your changes

To stash any unsaved changes, run the command `git stash`. This command stores
all of your changes on tracked files since your last commit on the current
branch. Suppose your workspace looks like this:

> ```
> Untracked (1)
> ? c/
> 
> Unstaged (1)
> M a
> ```

When you run `stash`, you should get this message:

> ```
> Saved working directory and index state WIP on main: 03e7c3b Made a
> ```

The last part of this line is the commit hash and message of the latest commit.

When you run `status` again, you should find that the tracked changes are no
longer listed, but the untracked ones are still there. Git does not affect
untracked files. The tracked changes are stored in a 'stash', which you can view
by running `git stash list`. If you run this command, you should see that there
is one stash in your current workspace.

Now that you have stashed, you should be able to switch to another branch. If
you run `status` again, you will find that the untracked files have not been
modified. Again, this is because Git does not touch the untracked changes. If
you do not want to see them in the status, you should `add` them or put them in
the `gitignore` file.


## Undoing Changes

Sometimes, you may make a mistake and want to undo what you had done.

### Aborting

You can abort a commit while writing a message by providing an empty message.
Note that when using `git commit -m`, you cannot see what changes you have made
on the commit while writing the message. This is why is is highly recommended to
use a real text editor to make your commits. Doing so also allows you to make
multi-line commit messages. When you write the commit message, you should always
make sure that you are committing exactly what you want.

When you write the commit with an empty message, it should tell you that the
commit has been aborted.

If you start a merge, but you realise that you want to stop merging, you can
abort the merging process. When you start a merge, but there is a conflict, it
stops before making the commit. However, you can have it always pause before
committing with the flag `--no-commit`, i.e. running `git merge --no-commit
<args>`.

When you have not finished a merge, and you want to abort it, run `git merge
--abort`. This will roll back your changes to the commit before the merge. This
is partly why you have to have no unsaved changes when you commit, as Git cannot
revert to your previous workspace without fail. This command allows you to undo
a merge while in it, so that you don't break something with a merge.

### Resetting

You have learned that the `reset` command can remove files from the stage.
However, you can also roll back files to what they were in a previous commit.

You can do this using the command `git checkout --`, followed by any number of
files. This command will overwrite the contents of files in your current
workspace, and it is irreversible. Thus, you should be very careful when using
it. To show how this works, here is an example:

Suppose your workspace is this:

> ```
> Unstaged (3)
> M f1
> M f2
> M f3
> ```

After running `git checkout -- f1`, the contents of `f1` would be what they were
on your previous commit, and your status would look like this:

> ```
> Unstaged (2)
> M f2
> M f3
> ```

Running `git checkout -- f2 f3` would make the contents of both `f2` and `f3` be
what they were when you made the last commit.

If you put the hash of a commit before the `--`, Git will pull the files from
the commit you specified instead of the last one. If the file was not tracked in
that commit, Git will give an error instead of deleting your file.

When referring to a previous commit, there is a shorthand notation. `HEAD`
refers to the latest commit, `HEAD~1` refers to the commit before that, and so
on. Note that this will only take the commits from the current branch. You can
find the order that commits are placed in with `git log`.

You can reset your whole branch with `git reset --hard`. With this command, you
must specify a whole commit, not an individual file. This command, unlike
`checkout`, puts your branch at the state of the specified commit. This means
that, when resetting to a prior commit, any later commits are not in the commit
log. This command is **very** dangerous, as you cannot recover the overwritten
files. Please make sure you know what you are doing when you use this command.


# This could be implemented next year

> ## Git Conventions and Standards
> 
> ### Commits
> 
> 1. Name your commits by this standard:
>    1. New features should start with `feat:`
>       * New features are things that are wholly new or add new functionality to
>         something old
>    1. Bug fixes should start with `fix:`
>       * Fixes should not add new functionality
>    1. Refactoring should start with `refactor:`
>       * Refactoring should not fix bugs or add new features, but make an
>         existing part more extensible
>    1. Documentation should start with `docs:`
>       * This is for when you add documentation to anything
> 
>    You can have multiple of the above in a single commit, but you must list all
>    of the ones that apply. If you create a new feature and add documentation for
>    it, you should have a field for `feat` and a field for `docs`.
> 
> ### Branches
> 
> 1. Use your dev branch for things that are not tracked by issues.
> 1. Create a separate branch for each issue, merge it into your dev branch, and
>    merge your dev branch into `main`
