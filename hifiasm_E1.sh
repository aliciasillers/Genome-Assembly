#!/bin/bash
#
#SBATCH --job-name=hifiasm_E1
#SBATCH --ntasks=20 # Number of cores
#SBATCH --nodes=1 # Ensure that all cores are on one machine
#SBATCH --mem=180G # Memory pool for all cores in MB (see also --mem-per-cpu)
#SBATCH --partition=bmh # Partition to submit to
#SBATCH --output=hifiasm_E1.out # File to which STDOUT will be written
#SBATCH --error=hifiasm_E1.err # File to which STDERR will be written
#SBATCH --mail-type=END,FAIL # Type of email notification- BEGIN,END,FAIL,ALL
#SBATCH --mail-user=asillers@ucdavis.edu # Email to which notifications will be$
#SBATCH --time=3-00:00:00

module load conda/hifiasm/0.25.0

hifiasm -o E1G0.asm -t 10 --dual-scaf --telo-m TTTAGGG /quobyte/feldmanngrp/globus-write/asillers/PBmixRevio1857_1_D01_PLIM_30hours_16kbExpressCCSv3SPRQ2hrPE_350pM_FragariaxananassaEclipse-1_bc2025_CCSExpressIndex/m84053_260218_024559_s1.hifi_reads.bc2025.fastq.gz

