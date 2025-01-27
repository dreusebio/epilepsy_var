#!/usr/bin/bash

SAMPLES="SRR10493735 SRR10493736 SRR10493737 SRRSRR10493738 SRR10493739 SRR10493740"

for SAMPLE in $SAMPLES; do

deduplicate_bismark --parallel 2 --genome ~/my_shared_data_folder/epilepsy/data/bisulfiteseq/ref -1 ${SAMPLE}_1_val_1.fq.bam -2 ${SAMPLE}_2_val_2.fq.gz -o output_directory


done
