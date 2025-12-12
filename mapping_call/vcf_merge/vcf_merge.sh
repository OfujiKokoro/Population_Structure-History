#!/bin/bash
set -eu

VCF_MERGE_DIR=.
MERGE_DIR="merge_Pacific_Atlantic_HongKong"


cd $MERGE_DIR
ls $MERGE_DIR > merge_file.txt

sed -i '/csi/d' merge_file.txt

bcftools merge --threads 12 -l merge_file.txt -Oz -o $VCF_MERGE_DIR/vcf_merge_Pacific_Atlantic_HongKong_e_indel_DP_GQ_135.vcf.gz

