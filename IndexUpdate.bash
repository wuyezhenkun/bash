#!/bin/bash
#SBATCH -N 1
#SBATCH -p PM --mem=128GB
#SBATCH --ntasks-per-node 28
#SBATCH -t 24:00:00
# echo commands to stdout 
set –x

## Method used: copy commands from section 3.
## And use command in 4.1

## 4.1 
## Move the index to the data folder by "$ find /pylon5/cc5fpcp/weiliang/BMBL/metaqubic/IGC_index/ -type f -print0 | xargs -0 cp -t /pylon5/cc5fpcp/weiliang/BMBL/metaqubic/Index_updata_hGEM/data/ref_index/"


##Then replace "./meta_data/data" with "/pylon5/cc5fpcp/weiliang/BMBL/metaqubic/Index_update_hGEM/data"
##Replace "./meta_data/results" with "/pylon5/cc5fpcp/weiliang/BMBL/metaqubic/Index_update_hGEM/results"
##Replace "./master" with "/home/weiliang/BMBL/metaqubic-master"



## general_pipeline command 1  (mapping)
/home/weiliang/BMBL/metaqubic-master/runmeta --mapping -s /pylon5/cc5fpcp/weiliang/BMBL/metaqubic/Index_update_hGEM/data/samples/ -ind /pylon5/cc5fpcp/weiliang/BMBL/metaqubic/Index_update_hGEM/data/ref_index/ -o /pylon5/cc5fpcp/weiliang/BMBL/metaqubic/Index_update_hGEM/results/align_out/ 


## general_pipeline command 2  (CatToMat)
/home/weiliang/BMBL/metaqubic-master/runmeta --CatToMat -i /pylon5/cc5fpcp/weiliang/BMBL/metaqubic/Index_update_hGEM/results/cat/ -m /pylon5/cc5fpcp/weiliang/BMBL/metaqubic/Index_update_hGEM/data/735_hGEM/ -o /pylon5/cc5fpcp/weiliang/BMBL/metaqubic/Index_update_hGEM/results/hGEM/


## general_pipeline command 3  (filtering)
/home/weiliang/BMBL/metaqubic-master/runmeta --filtering -i /pylon5/cc5fpcp/weiliang/BMBL/metaqubic/Index_update_hGEM/results/hGEM/ -minTPM 1 -NominTPM 2 -o /pylon5/cc5fpcp/weiliang/BMBL/metaqubic/Index_update_hGEM/results/hGEM_filt/


## general_pipeline command 4  (biclustering)
/home/weiliang/BMBL/metaqubic-master/runmeta --biclustering -i /pylon5/cc5fpcp/weiliang/BMBL/metaqubic/Index_update_hGEM/results/hGEM_filt/ -o /pylon5/cc5fpcp/weiliang/BMBL/metaqubic/Index_update_hGEM/results/bic/ --QUBIC -c 1 -f 0.8 -o 100 


## general_pipeline command 5  (enrichment)
/home/weiliang/BMBL/metaqubic-master/runmeta --enrichment -i /pylon5/cc5fpcp/weiliang/BMBL/metaqubic/Index_update_hGEM/results/bic -g /pylon5/cc5fpcp/weiliang/BMBL/metaqubic/Index_update_hGEM/data/annotation/KEGG_ann.txt -o /pylon5/cc5fpcp/weiliang/BMBL/metaqubic/Index_update_hGEM/results/enrich_out/








