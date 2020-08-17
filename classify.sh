# args: original data path, model path, tmp storage name

mkdir tmp/$3
rm tmp/$3/*
paste /dev/null $1 |cut -b-131000 | tr -d '\000' > tmp/$3/test.tsv
sbatch test_tmp.sbatch $2 $3
