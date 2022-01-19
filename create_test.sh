git checkout master
git pull -r
git clean -d -f -x

git checkout -b release/1.0 master
git push origin release/1.0

git checkout -b release/1.1 master
echo bbb > in_both.txt
git add in_both.txt
git commit -m "Adding in_both.txt"
git push origin release/1.1

git checkout -b release/1.2 master
echo aaa > in_both.txt
git add in_both.txt
git commit -m "Adding in_both.txt"
git push origin release/1.2

git checkout -b feature/test-backport
touch only_in_feature.txt
git add only_in_feature.txt
git commit -a -m "Add only_in_feature.txt"
touch only_in_feature1.txt
git add only_in_feature1.txt
git commit -a -m "Add only_in_feature1.txt"
echo aaa > in_both.txt
git add in_both.txt
git commit -m "Adding in_both.txt"
git push origin feature/test-backport
gh pr create -B master -H feature/test-backport -t "Test PR for feature/test-backport branch" -b ""
git commit --amend --no-edit
git push --force origin feature/test-backport

git checkout master
touch only_in_master.txt
git add only_in_master.txt
git commit -a -m "Add only_in_master.txt"
git push origin master
