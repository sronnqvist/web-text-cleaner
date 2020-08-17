#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=4G
#SBATCH -p gpu
#SBATCH -t 05:00:00
#SBATCH --gres=gpu:v100:1
#SBATCH --ntasks-per-node=1
#SBATCH --account=Project_2002026
#SBATCH -o logs/%j.out
#SBATCH -e logs/%j.err

rm logs/current.err
rm logs/current.out
ln -s $SLURM_JOBID.err logs/current.err
ln -s $SLURM_JOBID.out logs/current.out


#OUTPUT_DIR="output/$SLURM_JOBID"
#function on_exit {
#    # rm -rf "$OUTPUT_DIR"
#    rm -f jobs/$SLURM_JOBID
#}
#trap on_exit EXITif [ "$#" -ne 6 ]; then
#    echo "Usage: $0 model data_dir seq_len batch_size learning_rate epochs"
#    exit 1
#fiMODEL="$1"
#DATA_DIR="$2"
#MAX_SEQ_LENGTH="$3"
#BATCH_SIZE="$4"
#LEARNING_RATE="$5"
#EPOCHS="$6"VOCAB="$(dirname "$MODEL")/vocab.txt"

#CONFIG="$(dirname "$MODEL")/bert_config.json"if [[ $MODEL =~ "uncased" ]]; then
#    lower_case="true"
#elif [[ $MODEL =~ "multilingual" ]]; then
#    lower_case="true"
#else
#    lower_case="false"

#rm logs/*

#fitask_name="regs"
#rm -rf "OUTPUT_DIR"
#mkdir -p "$OUTPUT_DIR"
#rm -f latest.out latest.err
#ln -s logs/$SLURM_JOBID.out latest.out
#ln -s logs/$SLURM_JOBID.err latest.err

module purge
module load tensorflow
#source $HOME/venv/keras-bert/bin/activateexport OMP_NUM_THREADS=$SLURM_CPUS_PER_TASKecho "START $SLURM_JOBID: $(date)"
#srun python run_classifier.py \
#    --task_name "$task_name" \
#    --do_train=true \
#    --do_predict=true \
#    --bert_config_file "$CONFIG" \
#    --init_checkpoint "$MODEL" \
#    --vocab_file "$VOCAB" \
#    --do_lower_case="$lower_case" \
#    --learning_rate $LEARNING_RATE \
#    --max_seq_length $MAX_SEQ_LENGTH \
#    --train_batch_size $BATCH_SIZE \
#    --num_train_epochs $EPOCHS \
#    --data_dir "$DATA_DIR" \
#    --output_dir "$OUTPUT_DIR"result=$(python3 accuracy.py "$task_name" "$DATA_DIR/test.tsv" "$OUTPUT_DIR/test_results.tsv")echo -n 'TEST-RESULT'$'\t'
#echo -n 'init_checkpoint'$'\t'"$MODEL"$'\t'
#echo -n 'data_dir'$'\t'"$DATA_DIR"$'\t'
#echo -n 'max_seq_length'$'\t'"$MAX_SEQ_LENGTH"$'\t'
#echo -n 'train_batch_size'$'\t'"$BATCH_SIZE"$'\t'
#echo -n 'learning_rate'$'\t'"$LEARNING_RATE"$'\t'
#echo -n 'num_train_epochs'$'\t'"$EPOCHS"$'\t'
#echo "$result"seff $SLURM_JOBIDecho "END $SLURM_JOBID: $(date)"

#source $HOME/venvs/dl/bin/activate

export BERT_BASE_DIR=models/multi_cased_L-12_H-768_A-12
export GLUE_DIR=../swedish-unknown


## Defaults
#srun python run_classifier_junk.py \
#  --task_name=junk \
#  --do_train=true \
#  --do_eval=true \
#  --data_dir=$GLUE_DIR \
#  --vocab_file=$BERT_BASE_DIR/vocab.txt \
#  --bert_config_file=$BERT_BASE_DIR/bert_config.json \
#  --init_checkpoint=$BERT_BASE_DIR/bert_model.ckpt \
#  --max_seq_length=128 \
#  --train_batch_size=32 \
#  --learning_rate=2e-5 \
#  --num_train_epochs=3.0 \
#  --output_dir=output/ \
#  --do_lower_case=False


OUTPUT_DIR=experiment_outputs/$1
rm -rf $OUTPUT_DIR

srun python run_classifier_junk.py \
  --task_name=junk \
  --do_train=false \
  --do_eval=true \
  --data_dir=../junk_classification_data/stratified/$1 \
  --vocab_file=$BERT_BASE_DIR/vocab.txt \
  --bert_config_file=$BERT_BASE_DIR/bert_config.json \
  --init_checkpoint=$2 \
  --max_seq_length=256 \
  --train_batch_size=4 \
  --learning_rate=1e-5 \
  --num_train_epochs=0.0 \
  --output_dir=$OUTPUT_DIR \
  --do_lower_case=false \
  --do_predict=true \
  --save_checkpoints_steps 10000



seff $SLURM_JOBID

