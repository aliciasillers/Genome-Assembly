#!/bin/bash
#
#SBATCH --job-name=seqkit
#SBATCH --ntasks=2 # Number of cores
#SBATCH --nodes=1 # Ensure that all cores are on one machine
#SBATCH --mem=30G # Memory pool for all cores in MB (see also --mem-per-cpu)
#SBATCH --partition=bmh # Partition to submit to
#SBATCH --output=seqkit2.out # File to which STDOUT will be written
#SBATCH --error=seqkit2.err # File to which STDERR will be written
#SBATCH --mail-type=END,FAIL # Type of email notification- BEGIN,END,FAIL,ALL
#SBATCH --mail-user=asillers@ucdavis.edu # Email to which notifications will be$
#SBATCH --time=12:00:00

module load conda
conda activate seqkit

seqkit stats -a Hifiasm_out/E1G0*ctg.fasta > SeqStats/E1_hifiasm.stats

seqkit stats -a Hifiasm_out/E2G0*ctg.fasta > SeqStats/E2_hifiasm.stats

seqkit stats -a Hifiasm_out/G1G0*ctg.fasta > SeqStats/G1_hifiasm.stats
