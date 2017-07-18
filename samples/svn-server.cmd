@echo off

set PATH=%PATH%;C:\Program Files\VisualSVN Server\bin

svn checkout https://github.com/Unicornum/Backup.git/trunk/samples/svn-server .
svn update

echo bin https://github.com/Unicornum/Backup.git/trunk/bin > externals.txt
echo clear https://github.com/Unicornum/Backup.git/trunk/cmd/clear >> externals.txt
echo svn https://github.com/Unicornum/Backup.git/trunk/cmd/svn >> externals.txt

svn propset svn:externals . -F externals.txt
svn update

del externals.txt
del svn-server.cmd

