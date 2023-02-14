#!/usr/bin/bash

SAMPLE_DIR="~/my_shared_data_folder/epilepsy/data/rnaseq/fastq"
TRIM_DIR="~/my_shared_data_folder/epilepsy/data/rnaseq/trim"

SAMPLE_ID="SRR9733947 SRR9733948 SRR9733949 SRR9733950 SRR9733951 SRR9733952 SRR9733953 
SRR9733954 SRR9733955 SRR9733956 SRR9733957 SRR9733958 SRR9733959 SRR9733960 SRR9733961 
SRR9733962 SRR9733963 SRR9733964 SRR9733965 SRR9733966 SRR9733967 SRR9733968 SRR9733969 
SRR9733970 SRR9733971 SRR9733972 SRR9733973 SRR9733974 SRR9733975 SRR9733976 SRR9733977 
SRR9733978 SRR9733979 SRR9733980 SRR9733981 SRR9733982"

# Run trimmomactic

for SAMPLE in $SAMPLE_ID; do
    trimmomatic PE \
    -threads 4 \
    -phred33 \
    ${SAMPLE_DIR}/${SAMPLE}_1.fastq ${SAMPLE_DIR}/${SAMPLE}_2.fastq \
    ${TRIM_DIR}/${SAMPLE}_1P.fastq ${TRIM_DIR}/${SAMPLE}_1U.fastq ${TRIM_DIR}/${SAMPLE}_2P.fastq ${TRIM_DIR}/${SAMPLE}_2U.fastq \
    TRAILING:10
done