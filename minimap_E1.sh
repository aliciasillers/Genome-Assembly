#!/bin/bash
#
#SBATCH --job-name=minimap_E1
#SBATCH --ntasks=10 # Number of cores
#SBATCH --nodes=1 # Ensure that all cores are on one machine
#SBATCH --mem=200G # Memory pool for all cores in MB (see also --mem-per-cpu)
#SBATCH --partition=bmh # Partition to submit to
#SBATCH --output=minimap_E1.out # File to which STDOUT will be written
#SBATCH --error=minimap_E1.err # File to which STDERR will be written
#SBATCH --mail-type=END,FAIL # Type of email notification- BEGIN,END,FAIL,ALL
#SBATCH --mail-user=asillers@ucdavis.edu # Email to which notifications will be$
#SBATCH --time=4-00:00:00

module load conda
conda activate hapbridge

samtools fastq -T MM,ML /quobyte/feldmanngrp/globus-write/asillers/PBmixRevio1857_1_D01_PLIM_30hours_16kbExpressCCSv3SPRQ2hrPE_350pM_FragariaxananassaEclipse-1_bc2025_CCSExpressIndex/m84053_260218_024559_s1.hifi_reads.bc2025.bam | minimap2 -k17 -ax map-pb -y Hifiasm_out/E1G0.asm.bp.p_ctg.fasta.gz - | samtools sort -@4 - > E1.bam
