#!/bin/bash
# Begin LSF Directives
#BSUB -P STF007
#BSUB -W 1:00
#BSUB -nnodes 1
#BSUB -q debug
#BSUB -J AF_basic_example
#BSUB -o AF_basic_example.%J
#BSUB -e AF_basic_example.%J

module purge

target_file=/gpfs/alpine/stf007/world-shared/AlphaFold/casp14_fm.lst
output_file=/gpfs/alpine/stf007/world-shared/AlphaFold/test-output

jsrun -r1 -g6 -a1 -c42 singularity exec --bind /gpfs/alpine:/gpfs/alpine --nv /gpfs/alpine/stf007/world-shared/AlphaFold/alphafold1103.sif ./run_af_summit_dl.sh $target_file $output_file
