#!/bin/bash

if [ $# -eq 0 ]
  then
    echo "Usage: $0 <target_file> <out_dir>"
    exit 1
fi


target_file=$1
out_dir=$2

##########################################################################################

preset=reduced_dbs
fea_dir=/gpfs/alpine/stf007/world-shared/AlphaFold/casp14
af_dir=/gpfs/alpine/stf007/world-shared/AlphaFold/alphafold
data_dir=/gpfs/alpine/stf007/world-shared/AlphaFold/alphafold_databases

##########################################################################################

## get the names of targets, not the actual sequence because it is already in 'features.pkl'
fasta_path=''
counter=0
while IFS= read -r line
do
  [[ "$line" = "\#*" ]] && continue
  IFS=' '; read -a args <<< "$line"
  target=${args[0]}
  if [ $counter -eq 0 ]; then
    fasta_path=$target.fas
  else
    fasta_path="$fasta_path,$target.fas"
  fi
  counter=$(($counter+1))
done < "$target_file"


##########################################################################################
cd $af_dir  || { echo 'Error: enter $af_dir failed' ; exit 1 ; }
python $af_dir/run_alphafold_summit_dl.py --fasta_paths=$fasta_path --preset=$preset \
  --data_dir=$data_dir --output_dir=$out_dir --feature_dir=$fea_dir \
  --model_names=model_1,model_2,model_3,model_4,model_5 \
  --benchmark
