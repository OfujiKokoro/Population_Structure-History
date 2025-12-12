#!/bin/bash
set -eu

# Directory to store merged files
MERGE_DIR="merge_Pacific_Atlantic_HongKong"

# Create the merge directory if it doesn't exist
mkdir -p "$MERGE_DIR"

# Directory containing Atlantic VCF files
Atlantic_VCF_DIR="../Atlantic/05VCF_Filter/03DP_GQ"
Pacific_VCF_DIR="../Pacific/04Vcf_Filter/04GQ"
HongKong_VCF_DIR="../HongKong/06VCF_Filter/03DP_GQ"

# Process each VCF file in the Atlantic directory
for vcf_file in "$Atlantic_VCF_DIR"/*.vcf.gz; do
  # Extract the sample name (without .vcf.gz extension)
  sample_name=$(basename "$vcf_file" .vcf.gz)
  
  echo "Processing file: $sample_name"

  # Copy the VCF file to the merge directory
  cp "$vcf_file" "$MERGE_DIR/"

    # Index the copied VCF file
  bcftools index "$MERGE_DIR/$sample_name.vcf.gz"


done

# Process each VCF file in the Pacific directory
for vcf_file in "$Pacific_VCF_DIR"/*.vcf.gz; do
  # Extract the sample name (without .vcf.gz extension)
  sample_name=$(basename "$vcf_file" .vcf.gz)
  
  echo "Processing file: $sample_name"

  # Copy the VCF file to the merge directory
  cp "$vcf_file" "$MERGE_DIR/"
  
  # Index the copied VCF file
  bcftools index "$MERGE_DIR/$sample_name.vcf.gz"
done
 
# Process each VCF file in the HongKong directory
for vcf_file in "$HongKong_VCF_DIR"/*.vcf.gz; do
  # Extract the sample name (without .vcf.gz extension)
  sample_name=$(basename "$vcf_file" .vcf.gz)
  
  echo "Processing file: $sample_name"

  # Copy the VCF file to the merge directory
  cp "$vcf_file" "$MERGE_DIR/"

    # Index the copied VCF file
  bcftools index "$MERGE_DIR/$sample_name.vcf.gz"


done
