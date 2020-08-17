ls experiment_outputs/|grep "$1"|while read FILE; do echo $(grep acc experiment_outputs/$FILE/eval_results.txt|cut -d" " -f3) $FILE; done|sort
