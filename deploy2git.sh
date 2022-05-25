
echo "Choose whatever action number you want:

1) Create a branch and push commited changes
2) Move modifications to a another branch
3) Delete branch locally and remotely
4) Update commit without changing the message
5) Quit
===>"
read option

# OPTION 1 
if [ "$option" == "1" ]; then
	echo 'Enter a name for the new branch :'
	read branch
	git checkout -b $branch
	git status .
	git add .
	echo 'Enter the commit message:'
	read commitMessage
	git commit -m "$commitMessage"
	git push origin $branch
fi

# OPTION 2 
if [ "$option" == "2" ]; then
	echo 'Enter a name for the newer branch:'
	read branch
	git stash
	git checkout -b   $branch
	git stash pop
fi

# OPTION 3 
if [ "$option" == "3" ]; then
	echo 'Enter a name for the branch to delete:'
	read branch
	git branch -D $branch
	git push -d origin $branch
fi

# OPTION 4
if [ "$option" == "4" ]; then 	
	branch=$(git symbolic-ref --short HEAD)
	echo 'Current branch : '$branch 
	git status .
	git add .
	git commit --amend --no-edit
	git push origin $branch -f
fi

# OPTION 4 
if [ "$option" == "5" ]; then
	exit
fi

