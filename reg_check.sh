grep -rn "^ *reg " -A1 myCPU.fir-tmp | sed ":a;N;s/:\n//g;ba" | sed ":a;N;s/--\n//g;ba" | sed -n "s/\( *reg \w\)/\1/p" > reg_check_txt_1
#grep -rn "^ *reg " -A1 myCPU.fir | sed ":a;N;s/:\n//g;ba" | sed ":a;N;s/--\n//g;ba" | sed -n "s/*=>/\1/p" > reg_check_txt_1
grep -rn "^ *reg " -A1 myCPU.fir-tmp | sed ":a;N;s/:\n//g;ba" | sed ":a;N;s/--\n//g;ba" | sed -n "s/reg \b : { \b : [a-zA-Z0-9<>()\"\"_]\+}, clock with [0-9]\+-=> ([a-zA-Z0-9<>()\"\"_]\+, \([a-zA-Z0-9_]\+\))/\1/p"
