function git_current_branch --description "Git current git branch if in repository"
	set CURRENT_BRANCH (git symbolic-ref --short -q HEAD)
	echo $CURRENT_BRANCH
end

function gpsup --description "Push local branch to upstream remote"
	git push --set-upstream origin (git_current_branch)
end

function gbrn -a newBranchName --description "Rename the current branch"
	git branch -m (git_current_branch) $newBranchName
end
