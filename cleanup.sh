git checkout master
git pull
git rm -f only_in_master.txt in_both.txt only_in_feature.txt only_in_feature1.txt
git commit -a -m "Cleanup"
git push origin master

git branch -D feature/test-backport
git branch -D release/1.0
git branch -D release/1.1
git branch -D release/1.2

for b in $(git branch -r | grep --color=never backport/); do
    git push origin --delete ${b#origin/}
done

git push origin --delete feature/test-backport
git push origin --delete release/1.0
git push origin --delete release/1.1
git push origin --delete release/1.2
