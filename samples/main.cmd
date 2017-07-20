@echo off

svn checkout https://github.com/Unicornum/Backup.git/trunk/samples/main .
svn update

echo bin https://github.com/Unicornum/Backup.git/trunk/bin > externals.txt
echo clear https://github.com/Unicornum/Backup.git/trunk/cmd/clear >> externals.txt

svn propset svn:externals . -F externals.txt
svn update

del externals.txt
del main.cmd
