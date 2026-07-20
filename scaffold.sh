#!/bin/bash
#
#SBATCH --job-name=scaffold
#SBATCH --ntasks=10 # Number of cores
#SBATCH --nodes=1 # Ensure that all cores are on one machine
#SBATCH --mem=30G # Memory pool for all cores in MB (see also --mem-per-cpu)
#SBATCH --partition=bmh # Partition to submit to
#SBATCH --output=scaffold.out # File to which STDOUT will be written
#SBATCH --error=scaffold.err # File to which STDERR will be written
#SBATCH --mail-type=END,FAIL # Type of email notification- BEGIN,END,FAIL,ALL
#SBATCH --mail-user=asillers@ucdavis.edu # Email to which notifications will be$
#SBATCH --time=1-00:00:00
#SBATCH --array=1-9

module load conda
conda activate ragtag

query=$(ls *ctg.fasta.gz | sed -n ${SLURM_ARRAY_TASK_ID}p)
prefix=$(ls *ctg.fasta.gz | sed -n ${SLURM_ARRAY_TASK_ID}p | awk -F. '{print $1$4}')

ragtag.py scaffold ../Genome/farr1.fa $query -r -w -o ./ragtag_output/$prefix/
