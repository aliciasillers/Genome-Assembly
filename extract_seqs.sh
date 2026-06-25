#!/bin/bash
#
#SBATCH --job-name=extract_seqs
#SBATCH --ntasks=2 # Number of cores
#SBATCH --nodes=1 # Ensure that all cores are on one machine
#SBATCH --mem=60G # Memory pool for all cores in MB (see also --mem-per-cpu)
#SBATCH --partition=bmh # Partition to submit to
#SBATCH --output=extract_seqs.out # File to which STDOUT will be written
#SBATCH --error=extract_seqs.err # File to which STDERR will be written
#SBATCH --mail-type=END,FAIL # Type of email notification- BEGIN,END,FAIL,ALL
#SBATCH --mail-user=asillers@ucdavis.edu # Email to which notifications will be$
#SBATCH --time=1-00:00:00

for ctg in *_ctg.gfa; do
    awk '/^S/{print ">"$2"\n"$3}' ${ctg} > ${ctg%.gfa}.fasta
done
