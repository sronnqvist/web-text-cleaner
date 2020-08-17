for i in 1 3 5 7; do echo $i; python compile.py tmp_fr$i/test.tsv output_fr$i/test_results.tsv > ../french_raw_texts/text_$i.classified;done
for i in 2 4 6; do for j in 0 1 2 3 4 5 6 7 8 9 10 11; do echo $i $j; python compile.py tmp_fr$i.$j/test.tsv output_fr$i.$j/test_results.tsv >> ../french_raw_texts/text_$i.classified;done;done

