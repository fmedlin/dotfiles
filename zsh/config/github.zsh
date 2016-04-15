function gh {
    giturl=$(git config --get remote.origin.url)
    if [ "$1" = "help" ]; then
        echo "gh: Opens this repository's GitHub homepage."
        echo "gh 123 246: Opens the page for issues or pull requests #123 and #246."
        echo "gh issues: Opens the repository's issues."
        echo "gh pulls: Opens the repository's pull requests."
        echo "gh new: Opens the page for a new issue on the repository."
        echo "gh pr: Opens the page for a new pull request to master."
        echo "gh pr branchname: Opens the page for a new pull request to the named branch."
        echo "gh help: Shows this message."
    elif [ "$giturl" = "" ]; then
        echo "Not a git repository or no remote.origin.url set"
    else
        giturl=${giturl/git\@github\.com\:/https://github.com/}
        giturl=${giturl/\.git//}
        if [ "$1" = "pr" ]; then
            branch=`git branch | grep \* | cut -f 2 -d " "`
            if [ "$2" = "" ]; then
                giturl=${giturl}pull/new/master...$branch
                open $giturl
            else
                giturl=${giturl}pull/new/$2...$branch
                open $giturl
            fi
        else
            if [ "$1" = "" ]; then
                # base URL
                open $giturl
            elif [ "$1" = "issues" ]; then
                # issues list
                giturl=${giturl}issues
                open $giturl
            elif [ "$1" = "pulls" ]; then
                # pull requests list
                giturl=${giturl}pulls
                open $giturl
            elif [ "$1" = "new" ]; then
                # new issue page
                giturl=${giturl}issues/new
                open $giturl
            else
                # issue number
                giturl=${giturl}issues/$1
                open $giturl
            fi

            if [ "$2" != "" ]; then
                 gh $2 $3 $4 $5 $6 $7 $8 $9
            fi
        fi
    fi
}
