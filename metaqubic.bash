#!/bin/bash
#SBATCH -N 1
#SBATCH -p PM --mem=128GB
#SBATCH --ntasks-per-node 28
#SBATCH -t 24:00:00
# echo commands to stdout 
set –x



/home/weiliang/BMBL/metaqubic/metaqubic-master/runmeta --mapping -s /pylon5/cc5fpcp/weiliang/metaqubic/meta_data/data/samples/ -ref /pylon5/cc5fpcp/weiliang/metaqubic/meta_data/data/ref/IGC_ref.fa -o1 /pylon5/cc5fpcp/weiliang/metaqubic/meta_data/results/align_out/ -o2 /pylon5/cc5fpcp/weiliang/metaqubic/meta_data/results/cat/

/home/weiliang/BMBL/metaqubic/metaqubic-master/runmeta --CatToMat -i /pylon5/cc5fpcp/weiliang/metaqubic/meta_data/results/cat/ -m /pylon5/cc5fpcp/weiliang/metaqubic/meta_data/data/735_hGEM/ -o /pylon5/cc5fpcp/weiliang/metaqubic/meta_data/results/hGEM/

/home/weiliang/BMBL/metaqubic/metaqubic-master/runmeta --filtering -i /pylon5/cc5fpcp/weiliang/metaqubic/meta_data/results/hGEM/ -minTPM 1 -NominTPM 2 -o /pylon5/cc5fpcp/weiliang/metaqubic/meta_data/results/hGEM_filt/

/home/weiliang/BMBL/metaqubic/metaqubic-master/runmeta --biclustering -i /pylon5/cc5fpcp/weiliang/metaqubic/meta_data/results/hGEM_filt/ -o /pylon5/cc5fpcp/weiliang/metaqubic/meta_data/results/bic/ --QUBIC -c 1 -f 0.8 -o 100 

/home/weiliang/BMBL/metaqubic/metaqubic-master/runmeta --enrichment -i /pylon5/cc5fpcp/weiliang/metaqubic/meta_data/results/bic -g /pylon5/cc5fpcp/weiliang/metaqubic/meta_data/data/annotation/KEGG_ann.txt -o /pylon5/cc5fpcp/weiliang/metaqubic/meta_data/results/enrich_out/
