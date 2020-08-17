# Web text cleaner
### BERT model for filtering main text content of web pages after automatic boilerplate removal

The tool is described in the paper [From Web Crawl to Clean Register-Annotated Corpora](https://www.aclweb.org/anthology/2020.wac-1.3.pdf) by Veronika Laippala, Samuel Rönnqvist, Saara Hellström, Juhani Luotolahti, Liina Repo, Anna Salmela, Valtteri Skantsi, Sampo Pyysalo (In Proceedings of the 12th Web as Corpus Workshop: WAC-XII; 2020).

To classify lines of a document, specify input file, model path and name (for temp and output files), e.g.: 

`sh classify.sh input.txt models/sel_se.192.2.5e-6.6/model.ckpt-1075 SV`

This submits a SLURM job according to the configuration in `test_tmp.sbatch` and predictions are written to `output/SV/test_results.tsv`.
Predictions and input are combined by `sh compile.sh SV` and written to `output/SV.txt.classified`.

Note: If input is longer than ~100k lines, split the data and run predictions for max 100k lines at a time. For compiling of results see `compile_splits.sh`.

