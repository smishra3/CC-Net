#!/bin/bash
#$ -M smishra3@nd.edu
#$ -q gpu@@csecri-p100 -l gpu=1
#$ -m abe
#$ -r y
#$ -N UCUNET-4-4-RT-DR

if [ -n ${SGE_HGR_gpu_card+x} ]; then
    cvd=""
    for i in ${SGE_HGR_gpu_card//gpu/}; do
        cvd+=$(($i-1)),
    done
    export CUDA_VISIBLE_DEVICES=$cvd
fi


module load tensorflow	         # Required modules

python3 main.py --cuda --gpu 0 --model ucunet train --datadir /path/to/original_data/train/ --input_dir /path/to/original_data/test/images/ --output_dir ./result/ --mask_dir /path/to/original_data/test/labels/ --data_type .png
