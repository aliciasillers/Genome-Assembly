#!/bin/bash
#
#SBATCH --job-name=minimap_G1
#SBATCH --ntasks=10 # Number of cores
#SBATCH --nodes=1 # Ensure that all cores are on one machine
#SBATCH --mem=200G # Memory pool for all cores in MB (see also --mem-per-cpu)
#SBATCH --partition=bmh # Partition to submit to
#SBATCH --output=minimap_G1.out # File to which STDOUT will be written
#SBATCH --error=minimap_G1.err # File to which STDERR will be written
#SBATCH --mail-type=END,FAIL # Type of email notification- BEGIN,END,FAIL,ALL
#SBATCH --mail-user=asillers@ucdavis.edu # Email to which notifications will be$
#SBATCH --time=4-00:00:00

module load conda
conda activate hapbridge

samtools fastq -T MM,ML /quobyte/feldmanngrp/globus-write/asillers/PBmixRevio1848_2_D01_PLGD_30hours_17kbExpressCCSv3SPRQ2hrPE_350pM_FragariachiloensisGoldenGate-1_bc2080_CCSExpressIndex/m84053_260107_125803_s1.hifi_reads.bc2080.bam | minimap2 -k17 -ax map-pb -y ../G1G0.asm.bp.p_ctg.fasta.gz - | samtools sort -@4 - > G1.bam
