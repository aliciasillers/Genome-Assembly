#!/bin/bash
#
#SBATCH --job-name=hifiasm_G1
#SBATCH --ntasks=12 # Number of cores
#SBATCH --nodes=1 # Ensure that all cores are on one machine
#SBATCH --mem=32G # Memory pool for all cores in MB (see also --mem-per-cpu)
#SBATCH --partition=bmh # Partition to submit to
#SBATCH --output=hifiasm_G1.out # File to which STDOUT will be written
#SBATCH --error=hifiasm_G1.err # File to which STDERR will be written
#SBATCH --mail-type=END,FAIL # Type of email notification- BEGIN,END,FAIL,ALL
#SBATCH --mail-user=asillers@ucdavis.edu # Email to which notifications will be$
#SBATCH --time=2-00:00:00

module load conda/hifiasm/0.25.0

hifiasm -o G1G0.asm -t 6 /quobyte/feldmanngrp/globus-write/asillers/PBmixRevio1848_2_D01_PLGD_30hours_17kbExpressCCSv3SPRQ2hrPE_350pM_FragariachiloensisGoldenGate-1_bc2080_CCSExpressIndex/m84053_260107_125803_s1.hifi_reads.bc2080.fastq.gz


