#!/bin/bash
#
#SBATCH --job-name=minimap_E2
#SBATCH --ntasks=10 # Number of cores
#SBATCH --nodes=1 # Ensure that all cores are on one machine
#SBATCH --mem=200G # Memory pool for all cores in MB (see also --mem-per-cpu)
#SBATCH --partition=bmh # Partition to submit to
#SBATCH --output=minimap_E2.out # File to which STDOUT will be written
#SBATCH --error=minimap_E2.err # File to which STDERR will be written
#SBATCH --mail-type=END,FAIL # Type of email notification- BEGIN,END,FAIL,ALL
#SBATCH --mail-user=asillers@ucdavis.edu # Email to which notifications will be$
#SBATCH --time=4-00:00:00

module load conda
conda activate hapbridge

samtools fastq -T MM,ML /quobyte/feldmanngrp/globus-write/asillers/PBmixRevio1848_2_C01_PLGC_30hours_22kbExpressCCSv3SPRQ2hrPE_350pM_FragariaxananassaEclipse-2_bc2079_CCSExpressIndex/m84053_260107_105452_s4.hifi_reads.bc2079.bam | minimap2 -k17 -ax map-pb -y ../E2G0.asm.bp.p_ctg.fasta.gz - | samtools sort -@4 - > E2.bam
