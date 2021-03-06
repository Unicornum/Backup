@echo off

set PATH=%PATH%;C:\Program Files\VisualSVN Server\bin

svn checkout https://github.com/Unicornum/Backup.git/trunk/samples/github .
svn update

echo bin https://github.com/Unicornum/Backup.git/trunk/bin > externals.txt
echo clear https://github.com/Unicornum/Backup.git/trunk/cmd/clear >> externals.txt
echo github https://github.com/Unicornum/Backup.git/trunk/cmd/github >> externals.txt

svn propset svn:externals . -F externals.txt
svn update

del externals.txt
del github.cmd
