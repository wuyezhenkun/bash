#!/bin/bash
#SBATCH -N 1
#SBATCH -p PM --mem=128GB
#SBATCH --ntasks-per-node 28
#SBATCH -t 24:00:00
# echo commands to stdout 
set –x


## Method: use command 3.4 and 3.5

## Copy the RDRPK_735_hGEM_filt.txt file to the meta_data/results/hGEM_filt folder
## "$ cp RDRPK_735_hGEM_filt.txt /pylon5/cc5fpcp/weiliang/BMBL/metaqubic/4.3_test/results/hGEM_filt"


##Then replace "./meta_data/data" with "/pylon5/cc5fpcp/weiliang/BMBL/metaqubic/4.3_test/data"
##Replace "./meta_data/results" with "/pylon5/cc5fpcp/weiliang/BMBL/metaqubic/4.3_test/results"
##Replace "./master" with "/home/weiliang/BMBL/metaqubic-master"



## general_pipeline command 4  (biclustering)
/home/weiliang/BMBL/metaqubic-master/runmeta --biclustering -i /pylon5/cc5fpcp/weiliang/BMBL/metaqubic/4.3_test/results/hGEM_filt/ -o /pylon5/cc5fpcp/weiliang/BMBL/metaqubic/4.3_test/results/bic/ --QUBIC -c 1 -f 0.8 -o 100 


## general_pipeline command 5  (enrichment)
/home/weiliang/BMBL/metaqubic-master/runmeta --enrichment -i /pylon5/cc5fpcp/weiliang/BMBL/metaqubic/4.3_test/results/bic -g /pylon5/cc5fpcp/weiliang/BMBL/metaqubic/4.3_test/data/annotation/KEGG_ann.txt -o /pylon5/cc5fpcp/weiliang/BMBL/metaqubic/4.3_test/results/enrich_out/

