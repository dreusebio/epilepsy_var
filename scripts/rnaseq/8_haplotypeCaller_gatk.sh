#!/usr/bin/bash

mkdir /srv/data/my_shared_data_folder/epilepsy/rnaseq_results/alignment
mkdir /srv/data/my_shared_data_folder/epilepsy/rnaseq_results/varcall


ALGN_DIR="/srv/data/my_shared_data_folder/epilepsy/rnaseq_results/alignment"
REF_DIR="/srv/data/my_shared_data_folder/epilepsy/data/rnaseq/ref"
VAR_DIR="/srv/data/my_shared_data_folder/epilepsy/rnaseq_results/varcall"

SAMPLE_ID="SRR8669931 SRR8669932 SRR8669933 SRR8669934 SRR8669935 SRR8669936 SRR8669937 
SRR8669938 SRR8669939 SRR8669940 SRR8669941 SRR8669942 SRR9733947 SRR9733948 SRR9733949 
SRR9733950 SRR9733951 SRR9733952 SRR9733953 SRR9733954 SRR9733955 SRR9733956 SRR9733957 
SRR9733958 SRR9733959 SRR9733960 SRR9733961 SRR9733962 SRR9733963 SRR9733964 SRR9733965 
SRR9733966 SRR9733967 SRR9733968 SRR9733969 SRR9733970 SRR9733971 SRR9733972 SRR9733973 
SRR9733974 SRR9733975 SRR9733976 SRR9733977 SRR9733978 SRR9733979 SRR9733980 SRR9733981 
SRR9733982"

#======VAR CALLING=========

for SAMPLE in $SAMPLE_ID; do
   gatk --java-options -Xmx30g HaplotypeCaller  \
      -R ${REF_DIR}/GRCh38.fasta \
      -I ${ALGN_DIR}/${SAMPLE}_bqsr.bam \
      --dbsnp ${REF_DIR}/dbsnp138.vcf \
      --native-pair-hmm-threads 16 \
      -O ${VAR_DIR}/${SAMPLE}.vcf.gz

   #rm -r ${ALGN_DIR}/${SAMPLE}_bqsr.bam
done
