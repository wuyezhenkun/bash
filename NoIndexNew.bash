#!/bin/bash
#SBATCH -N 1
#SBATCH -p PM --mem=128GB
#SBATCH --ntasks-per-node 28
#SBATCH -t 24:00:00
# echo commands to stdout 
set –x

## Method used: copy commands from section 3. 
## Use command 4.2

## 4.2 copy data from 735_catalogs
##$ cp 72164642_SF08..cat /pylon5/cc5fpcp/weiliang/BMBL/metaqubic/no_Index_new_hGEM/results/cat
##$ cp 72164642_SF08_.cat /pylon5/cc5fpcp/weiliang/BMBL/metaqubic/no_Index_new_hGEM/results/cat
##$ cp 30756617_SF06..cat /pylon5/cc5fpcp/weiliang/BMBL/metaqubic/no_Index_new_hGEM/results/cat
##$ cp 30756617_SF06_.cat /pylon5/cc5fpcp/weiliang/BMBL/metaqubic/no_Index_new_hGEM/results/cat
##$ cp 30756617_SF05..cat /pylon5/cc5fpcp/weiliang/BMBL/metaqubic/no_Index_new_hGEM/results/cat
##$ cp 30756617_SF05_.cat /pylon5/cc5fpcp/weiliang/BMBL/metaqubic/no_Index_new_hGEM/results/cat



##Then replace "./meta_data/data" with "/pylon5/cc5fpcp/weiliang/BMBL/metaqubic/no_Index_new_hGEM/data"
##Replace "./meta_data/results" with "/pylon5/cc5fpcp/weiliang/BMBL/metaqubic/no_Index_new_hGEM/results"
##Replace "./master" with "/home/weiliang/BMBL/metaqubic-master"



## general_pipeline command 1  (mapping)
/home/weiliang/BMBL/metaqubic-master/runmeta --mapping -s /pylon5/cc5fpcp/weiliang/BMBL/metaqubic/no_Index_new_hGEM/data/samples/ -ref /pylon5/cc5fpcp/weiliang/BMBL/metaqubic/no_Index_new_hGEM/data/ref/IGC_ref.fa -o1 /pylon5/cc5fpcp/weiliang/BMBL/metaqubic/no_Index_new_hGEM/results/align_out/ -o2 /pylon5/cc5fpcp/weiliang/BMBL/metaqubic/no_Index_new_hGEM/results/cat/


## general_pipeline command 2  (CatToMat)
/home/weiliang/BMBL/metaqubic-master/runmeta --CatToMat -i /pylon5/cc5fpcp/weiliang/BMBL/metaqubic/no_Index_new_hGEM/results/cat/ -o /pylon5/cc5fpcp/weiliang/BMBL/metaqubic/no_Index_new_hGEM/results/hGEM/


## general_pipeline command 3  (filtering)
/home/weiliang/BMBL/metaqubic-master/runmeta --filtering -i /pylon5/cc5fpcp/weiliang/BMBL/metaqubic/no_Index_new_hGEM/results/hGEM/ -minTPM 1 -NominTPM 2 -o /pylon5/cc5fpcp/weiliang/BMBL/metaqubic/no_Index_new_hGEM/results/hGEM_filt/


## general_pipeline command 4  (biclustering)
/home/weiliang/BMBL/metaqubic-master/runmeta --biclustering -i /pylon5/cc5fpcp/weiliang/BMBL/metaqubic/no_Index_new_hGEM/results/hGEM_filt/ -o /pylon5/cc5fpcp/weiliang/BMBL/metaqubic/no_Index_new_hGEM/results/bic/ --QUBIC -c 1 -f 0.8 -o 100 


## general_pipeline command 5  (enrichment)
/home/weiliang/BMBL/metaqubic-master/runmeta --enrichment -i /pylon5/cc5fpcp/weiliang/BMBL/metaqubic/no_Index_new_hGEM/results/bic -g /pylon5/cc5fpcp/weiliang/BMBL/metaqubic/no_Index_new_hGEM/data/annotation/KEGG_ann.txt -o /pylon5/cc5fpcp/weiliang/BMBL/metaqubic/no_Index_new_hGEM/results/enrich_out/




