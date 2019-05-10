#!/bin/bash
#SBATCH -N 1
#SBATCH -p PM --mem=128GB
#SBATCH --ntasks-per-node 28
#SBATCH -t 24:00:00
# echo commands to stdout 
set –x

## Method used: copy commands 3, 4, 5 from general pipeline and use 4.1 and 4.2 in advance executions

## ad1 
## Move the index to the data folder by "$find /pylon5/cc5fpcp/weiliang/BMBL/metaqubic/IGC_index/ -type f -print0 | xargs -0 cp -t /pylon5/cc5fpcp/weiliang/BMBL/metaqubic/advance_executions/data/ref_index/"

## ad2 moving cat
##$ cp /pylon5/cc5fpcp/weiliang/BMBL/metaqubic/735_catalogs/72164642_SF08..cat /pylon5/cc5fpcp/weiliang/BMBL/metaqubic/advance_executions/results/cat
##$ cp /pylon5/cc5fpcp/weiliang/BMBL/metaqubic/735_catalogs/72164642_SF08_.cat /pylon5/cc5fpcp/weiliang/BMBL/metaqubic/advance_executions/results/cat
##$ cp /pylon5/cc5fpcp/weiliang/BMBL/metaqubic/735_catalogs/30756617_SF06..cat /pylon5/cc5fpcp/weiliang/BMBL/metaqubic/advance_executions/results/cat
##$ cp /pylon5/cc5fpcp/weiliang/BMBL/metaqubic/735_catalogs/30756617_SF06_.cat /pylon5/cc5fpcp/weiliang/BMBL/metaqubic/advance_executions/results/cat
##$ cp /pylon5/cc5fpcp/weiliang/BMBL/metaqubic/735_catalogs/72164642_SF07..cat /pylon5/cc5fpcp/weiliang/BMBL/metaqubic/advance_executions/results/cat
##$ cp /pylon5/cc5fpcp/weiliang/BMBL/metaqubic/735_catalogs/72164642_SF07_.cat /pylon5/cc5fpcp/weiliang/BMBL/metaqubic/advance_executions/results/cat



##Then replace "./meta_data/data" with "/pylon5/cc5fpcp/weiliang/BMBL/metaqubic/advance_executions/data"
##Replace "./meta_data/results" with "/pylon5/cc5fpcp/weiliang/BMBL/metaqubic/advance_executions/results"
##Replace "./master" with "/home/weiliang/BMBL/metaqubic-master"



## Advance_executions command 1  (mapping)
/home/weiliang/BMBL/metaqubic-master/runmeta --mapping -s /pylon5/cc5fpcp/weiliang/BMBL/metaqubic/advance_executions/data/samples -ref /pylon5/cc5fpcp/weiliang/BMBL/metaqubic/advance_executions/data/ref/IGC_ref.fa -ind /pylon5/cc5fpcp/weiliang/BMBL/metaqubic/advance_executions/data/ref_index -o1 /pylon5/cc5fpcp/weiliang/BMBL/metaqubic/advance_executions/results/align_out -o2 /pylon5/cc5fpcp/weiliang/BMBL/metaqubic/advance_executions/results/cat


## Advance_executions command 2  (CatToMat)
/home/weiliang/BMBL/metaqubic-master/runmeta --CatToMat -i /pylon5/cc5fpcp/weiliang/BMBL/metaqubic/advance_executions/results/cat/ -o /pylon5/cc5fpcp/weiliang/BMBL/metaqubic/advance_executions/results/hGEM/



## general_pipeline command 3  (filtering)
/home/weiliang/BMBL/metaqubic-master/runmeta --filtering -i /pylon5/cc5fpcp/weiliang/BMBL/metaqubic/advance_executions/results/hGEM/ -minTPM 1 -NominTPM 2 -o /pylon5/cc5fpcp/weiliang/BMBL/metaqubic/advance_executions/results/hGEM_filt/



## general_pipeline command 4  (biclustering)
/home/weiliang/BMBL/metaqubic-master/runmeta --biclustering -i /pylon5/cc5fpcp/weiliang/BMBL/metaqubic/advance_executions/results/hGEM_filt/ -o /pylon5/cc5fpcp/weiliang/BMBL/metaqubic/advance_executions/results/bic/ --QUBIC -c 1 -f 0.8 -o 100 



## general_pipeline command 5  (enrichment)
/home/weiliang/BMBL/metaqubic-master/runmeta --enrichment -i /pylon5/cc5fpcp/weiliang/BMBL/metaqubic/advance_executions/results/bic -g /pylon5/cc5fpcp/weiliang/BMBL/metaqubic/advance_executions/data/annotation/KEGG_ann.txt -o /pylon5/cc5fpcp/weiliang/BMBL/metaqubic/advance_executions/results/enrich_out/




