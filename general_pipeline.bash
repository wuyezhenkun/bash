#!/bin/bash
#SBATCH -N 1
#SBATCH -p PM --mem=128GB
#SBATCH --ntasks-per-node 28
#SBATCH -t 24:00:00
# echo commands to stdout 
set –x

## Method used: copy commands from section 3. 
##Then replace "./meta_data/data" with "/pylon5/cc5fpcp/weiliang/BMBL/metaqubic/general_pipeline/data"
##Replace "./meta_data/results" with "/pylon5/cc5fpcp/weiliang/BMBL/metaqubic/general_pipeline/results"
##Replace "./master" with "/home/weiliang/BMBL/metaqubic-master"



## general_pipeline command 1  (mapping)
/home/weiliang/BMBL/metaqubic-master/runmeta --mapping -s /pylon5/cc5fpcp/weiliang/BMBL/metaqubic/general_pipeline/data/samples/ -ref /pylon5/cc5fpcp/weiliang/BMBL/metaqubic/general_pipeline/data/ref/IGC_ref.fa -o1 /pylon5/cc5fpcp/weiliang/BMBL/metaqubic/general_pipeline/results/align_out/ -o2 /pylon5/cc5fpcp/weiliang/BMBL/metaqubic/general_pipeline/results/cat/


## general_pipeline command 2  (CatToMat)
/home/weiliang/BMBL/metaqubic-master/runmeta --CatToMat -i /pylon5/cc5fpcp/weiliang/BMBL/metaqubic/general_pipeline/results/cat/ -m /pylon5/cc5fpcp/weiliang/BMBL/metaqubic/general_pipeline/data/735_hGEM/ -o /pylon5/cc5fpcp/weiliang/BMBL/metaqubic/general_pipeline/results/hGEM/


## general_pipeline command 3  (filtering)
/home/weiliang/BMBL/metaqubic-master/runmeta --filtering -i /pylon5/cc5fpcp/weiliang/BMBL/metaqubic/general_pipeline/results/hGEM/ -minTPM 1 -NominTPM 2 -o /pylon5/cc5fpcp/weiliang/BMBL/metaqubic/general_pipeline/results/hGEM_filt/


## general_pipeline command 4  (biclustering)
/home/weiliang/BMBL/metaqubic-master/runmeta --biclustering -i /pylon5/cc5fpcp/weiliang/BMBL/metaqubic/general_pipeline/results/hGEM_filt/ -o /pylon5/cc5fpcp/weiliang/BMBL/metaqubic/general_pipeline/results/bic/ --QUBIC -c 1 -f 0.8 -o 100 


## general_pipeline command 5  (enrichment)
/home/weiliang/BMBL/metaqubic-master/runmeta --enrichment -i /pylon5/cc5fpcp/weiliang/BMBL/metaqubic/general_pipeline/results/bic -g /pylon5/cc5fpcp/weiliang/BMBL/metaqubic/general_pipeline/data/annotation/KEGG_ann.txt -o /pylon5/cc5fpcp/weiliang/BMBL/metaqubic/general_pipeline/results/enrich_out/


