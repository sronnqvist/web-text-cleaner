echo $(expr $(ls experiment_outputs/|while read FILE; do echo $(grep acc experiment_outputs/$FILE/eval_results.txt|cut -d"=" -f2) $(grep -c "" ../junk_classification_data/hold_one_out/$FILE/dev.tsv)|awk '{printf "%d + ",$1*$2}'; done) 0) $(cat ../junk_classification_data/hold_one_out/*/dev.tsv|grep -c "")|awk '{printf "%4.5f\n",$1/$2}'
LANG=fr
echo $(expr $(ls experiment_outputs/|grep $LANG|while read FILE; do echo $(grep acc experiment_outputs/$FILE/eval_results.txt|cut -d"=" -f2) $(grep -c "" ../junk_classification_data/hold_one_out/$FILE/dev.tsv)|awk '{printf "%d + ",$1*$2}'; done) 0) $(cat ../junk_classification_data/hold_one_out/*$LANG*/dev.tsv|grep -c "")|awk '{printf "%4.5f\n",$1/$2}'
LANG=se
echo $(expr $(ls experiment_outputs/|grep $LANG|while read FILE; do echo $(grep acc experiment_outputs/$FILE/eval_results.txt|cut -d"=" -f2) $(grep -c "" ../junk_classification_data/hold_one_out/$FILE/dev.tsv)|awk '{printf "%d + ",$1*$2}'; done) 0) $(cat ../junk_classification_data/hold_one_out/*$LANG*/dev.tsv|grep -c "")|awk '{printf "%4.5f\n",$1/$2}'