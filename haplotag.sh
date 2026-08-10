#!/bin/bash
#
#SBATCH --job-name=haplotag
#SBATCH --ntasks=12 # Number of cores
#SBATCH --nodes=1 # Ensure that all cores are on one machine
#SBATCH --mem=20G # Memory pool for all cores in MB (see also --mem-per-cpu)
#SBATCH --partition=bmh # Partition to submit to
#SBATCH --output=haplotag.out # File to which STDOUT will be written
#SBATCH --error=haplotag.err # File to which STDERR will be written
#SBATCH --mail-type=END,FAIL # Type of email notification- BEGIN,END,FAIL,ALL
#SBATCH --mail-user=asillers@ucdavis.edu # Email to which notifications will be$
#SBATCH --time=1-00:00:00
#SBATCH --array=1-3

module load conda
conda activate hapbridge

prefix=$(ls *.bam | sed -n ${SLURM_ARRAY_TASK_ID}p | awk -F. '{print $1}')

whatshap haplotag -o ${prefix}.haplotagged.bam --reference Hifiasm_out/${prefix}G0.asm.bp.p_ctg.fasta.gz ${prefix}.phased.vcf ${prefix}.bam --ignore-read-groups --output-threads=6
