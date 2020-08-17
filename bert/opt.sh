for seq_len in 320 288 256 224 192; do
  for lr in 1.25e-6 2.5e-6 5e-6 1e-5; do
    for bs in 16; do
     for ep in 6; do
       if [ -e experiment_outputs/_se.$seq_len.$lr.$ep ]
       then
         echo $1 $seq_len $lr $ep pass
       else
         echo $1 $seq_len $lr $ep
         sbatch tune_strat_opt.sbatch__ $1 $seq_len $lr $ep
       fi
     done;
    done;
  done;
done

