#!/bin/bash
#
#SBATCH --job-name=scaffold
#SBATCH --ntasks=10 # Number of cores
#SBATCH --nodes=1 # Ensure that all cores are on one machine
#SBATCH --mem=60G # Memory pool for all cores in MB (see also --mem-per-cpu)
#SBATCH --partition=bmh # Partition to submit to
#SBATCH --output=scaffold.out # File to which STDOUT will be written
#SBATCH --error=scaffold.err # File to which STDERR will be written
#SBATCH --mail-type=END,FAIL # Type of email notification- BEGIN,END,FAIL,ALL
#SBATCH --mail-user=asillers@ucdavis.edu # Email to which notifications will be$
#SBATCH --time=2-00:00:00
#SBATCH --array=1-3

module load conda
conda activate ragtag

prefix=$(ls *.hap1.fa | sed -n ${SLURM_ARRAY_TASK_ID}p | awk -F. '{print $1}')

ragtag.py scaffold ../Genome/farr1.fa ${prefix}.hap1.fa -r -w -o ./ragtag_output/${prefix}hap1/
ragtag.py scaffold ../Genome/farr1.fa ${prefix}.hap2.fa -r -w -o ./ragtag_output/${prefix}hap2/
