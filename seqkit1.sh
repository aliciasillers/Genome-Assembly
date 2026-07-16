#!/bin/bash
#
#SBATCH --job-name=seqkit
#SBATCH --ntasks=2 # Number of cores
#SBATCH --nodes=1 # Ensure that all cores are on one machine
#SBATCH --mem=30G # Memory pool for all cores in MB (see also --mem-per-cpu)
#SBATCH --partition=bmh # Partition to submit to
#SBATCH --output=seqkit1.out # File to which STDOUT will be written
#SBATCH --error=seqkit1.err # File to which STDERR will be written
#SBATCH --mail-type=END,FAIL # Type of email notification- BEGIN,END,FAIL,ALL
#SBATCH --mail-user=asillers@ucdavis.edu # Email to which notifications will be$
#SBATCH --time=12:00:00

module load conda
conda activate seqkit

seqkit stats -a /quobyte/feldmanngrp/globus-write/asillers/PBmixRevio1857_1_D01_PLIM_30hours_16kbExpressCCSv3SPRQ2hrPE_350pM_FragariaxananassaEclipse-1_bc2025_CCSExpressIndex/m84053_260218_024559_s1.hifi_reads.bc2025.fastq.gz > SeqStats/E1_original.stats

seqkit stats -a /quobyte/feldmanngrp/globus-write/asillers/PBmixRevio1848_2_C01_PLGC_30hours_22kbExpressCCSv3SPRQ2hrPE_350pM_FragariaxananassaEclipse-2_bc2079_CCSExpressIndex/m84053_260107_105452_s4.hifi_reads.bc2079.fastq.gz > SeqStats/E2_original.stats

seqkit stats -a /quobyte/feldmanngrp/globus-write/asillers/PBmixRevio1848_2_D01_PLGD_30hours_17kbExpressCCSv3SPRQ2hrPE_350pM_FragariachiloensisGoldenGate-1_bc2080_CCSExpressIndex/m84053_260107_125803_s1.hifi_reads.bc2080.fastq.gz > SeqStats/G1_original.stats
