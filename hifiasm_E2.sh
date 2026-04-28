#!/bin/bash
#
#SBATCH --job-name=hifiasm_E2
#SBATCH --ntasks=12 # Number of cores
#SBATCH --nodes=1 # Ensure that all cores are on one machine
#SBATCH --mem=32G # Memory pool for all cores in MB (see also --mem-per-cpu)
#SBATCH --partition=bmh # Partition to submit to
#SBATCH --output=hifiasm_E2.out # File to which STDOUT will be written
#SBATCH --error=hifiasm_E2.err # File to which STDERR will be written
#SBATCH --mail-type=END,FAIL # Type of email notification- BEGIN,END,FAIL,ALL
#SBATCH --mail-user=asillers@ucdavis.edu # Email to which notifications will be$
#SBATCH --time=2-00:00:00

module load conda/hifiasm/0.25.0

hifiasm -o E2G0.asm -t 6 /quobyte/feldmanngrp/globus-write/asillers/PBmixRevio1848_2_C01_PLGC_30hours_22kbExpressCCSv3SPRQ2hrPE_350pM_FragariaxananassaEclipse-2_bc2079_CCSExpressIndex/m84053_260107_105452_s4.hifi_reads.bc2079.fastq.gz

