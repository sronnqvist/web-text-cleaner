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

module purge
module load tensorflow

export BERT_BASE_DIR=models/multi_cased_L-12_H-768_A-12
OUTPUT_DIR=../output/$2
rm -rf $OUTPUT_DIR

cd bert/
srun python run_classifier_junk.py \
  --task_name=junk \
  --do_train=false \
  --do_eval=false \
  --data_dir=../tmp/$2 \
  --vocab_file=$BERT_BASE_DIR/vocab.txt \
  --bert_config_file=$BERT_BASE_DIR/bert_config.json \
  --init_checkpoint=$1 \
  --max_seq_length=192 \
  --train_batch_size=16 \
  --learning_rate=2.5e-6 \
  --num_train_epochs=0.0 \
  --output_dir=$OUTPUT_DIR \
  --do_lower_case=false \
  --do_predict=true \
  --save_checkpoints_steps 10000



seff $SLURM_JOBID

