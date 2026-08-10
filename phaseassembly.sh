#!/bin/bash
#
#SBATCH --job-name=phaseassembly
#SBATCH --ntasks=2 # Number of cores
#SBATCH --nodes=1 # Ensure that all cores are on one machine
#SBATCH --mem=30G # Memory pool for all cores in MB (see also --mem-per-cpu)
#SBATCH --partition=bmh # Partition to submit to
#SBATCH --output=phaseassembly.out # File to which STDOUT will be written
#SBATCH --error=phaseassembly.err # File to which STDERR will be written
#SBATCH --mail-type=END,FAIL # Type of email notification- BEGIN,END,FAIL,ALL
#SBATCH --mail-user=asillers@ucdavis.edu # Email to which notifications will be$
#SBATCH --time=2-00:00:00
#SBATCH --array=1-3

module load bcftools

prefix=$(ls *.hapbridge.vcf.gz | sed -n ${SLURM_ARRAY_TASK_ID}p | awk -F. '{print $1}')

bcftools consensus -f Hifiasm_out/${prefix}G0.asm.bp.p_ctg.fasta.gz -H 1 ${prefix}.hapbridge.vcf.gz > ${prefix}.hap1.fa

bcftools consensus -f Hifiasm_out/${prefix}G0.asm.bp.p_ctg.fasta.gz -H 2 ${prefix}.hapbridge.vcf.gz > ${prefix}.hap2.fa
