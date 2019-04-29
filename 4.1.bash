#!/bin/bash
#SBATCH -N 1
#SBATCH -p PM --mem=128GB
#SBATCH --ntasks-per-node 28
#SBATCH -t 24:00:00
# echo commands to stdout 
set –x

## Method used: copy commands from section 4.1

## Copy the folder IGC_index to data/ref_index
## $ find /pylon5/cc5fpcp/weiliang/BMBL/metaqubic/IGC_index/ -type f -print0 | xargs -0 cp -t /pylon5/cc5fpcp/weiliang/BMBL/metaqubic/4.1_test/data/ref_index

##Then replace "./meta_data/data" with "/pylon5/cc5fpcp/weiliang/BMBL/metaqubic/4.1_test/data"
##Replace "./meta_data/results" with "/pylon5/cc5fpcp/weiliang/BMBL/metaqubic/4.1_test/results"
##Replace "./master" with "/home/weiliang/BMBL/metaqubic-master"


## command 1  (mapping)
/home/weiliang/BMBL/metaqubic-master/runmeta --mapping -s /pylon5/cc5fpcp/weiliang/BMBL/metaqubic/4.1_test/data/samples/ -ind /pylon5/cc5fpcp/weiliang/BMBL/metaqubic/4.1_test/data/ref_index/ -o /pylon5/cc5fpcp/weiliang/BMBL/metaqubic/4.1_test/results/align_out/
