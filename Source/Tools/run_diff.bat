python run_diff.py > diff-result-file
set /p diff-result= < diff-result-file
del diff-result-file
echo "diff-result=%diff-result%"