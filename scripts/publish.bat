SETLOCAL

rimraf dist
npm run lint
npm run generate
rimraf ..\poly-coder-publish
git clone https://github.com/poly-coder/poly-coder.github.io.git ..\poly-coder-publish
rimraf ..\poly-coder-publish\*
xcopy dist ..\poly-coder-publish /E /F /Y
echo|set /p="Auto-published content from commit " > commitmsg.txt
git show --format=%H --no-patch >> commitmsg.txt
cd ..\poly-coder-publish
git add -A
git commit -F ..\poly-coder-cms\commitmsg.txt
git push origin
cd ..\poly-coder-cms
rimraf commitmsg.txt

ENDLOCAL