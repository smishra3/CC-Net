#!/bin/bash

python3 main.py --cuda --gpu 0 --model ucunet train --datadir /path/to/original_data/train/ --input_dir /path/to/original_data/test/images/ --output_dir ./result/ --mask_dir /path/to/original_data/test/labels/ --data_type .png
