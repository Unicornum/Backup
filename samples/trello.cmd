@echo off

svn checkout https://github.com/Unicornum/Backup.git/trunk/samples/trello .
svn update

echo bin https://github.com/Unicornum/Backup.git/trunk/bin > externals.txt
echo clear https://github.com/Unicornum/Backup.git/trunk/cmd/clear >> externals.txt
echo trello https://github.com/Unicornum/Backup.git/trunk/cmd/trello >> externals.txt

svn propset svn:externals . -F externals.txt
svn update

del externals.txt
del trello.cmd
