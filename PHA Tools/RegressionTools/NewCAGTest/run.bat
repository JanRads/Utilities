set _=%CD%\TestFiles\
call del %_%phase*.*
call ipybot --variable Auto:0 --log Setup_Log.html TestSetup.txt
call ipybot --exclude Dummy --name PHARegtest %_%Phase1-Write.txt %_%Phase1-Diff.txt %_%Phase2-Write.txt %_%Phase2-Diff.txt %_%Phase3-Write.txt %_%Phase3-Diff.txt