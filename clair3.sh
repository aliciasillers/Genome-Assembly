#!/bin/bash
#
#SBATCH --job-name=clair3
#SBATCH --ntasks=12 # Number of cores
#SBATCH --nodes=1 # Ensure that all cores are on one machine
#SBATCH --mem=30G # Memory pool for all cores in MB (see also --mem-per-cpu)
#SBATCH --partition=bmh # Partition to submit to
#SBATCH --output=clair3.out # File to which STDOUT will be written
#SBATCH --error=clair3.err # File to which STDERR will be written
#SBATCH --mail-type=END,FAIL # Type of email notification- BEGIN,END,FAIL,ALL
#SBATCH --mail-user=asillers@ucdavis.edu # Email to which notifications will be$
#SBATCH --time=1-00:00:00
#SBATCH --array=1-3

module load conda
conda activate hapbridge

prefix=$(ls *.bam | sed -n ${SLURM_ARRAY_TASK_ID}p | awk -F. '{print $1}')

run_clair3.sh --bam_fn=${prefix}.bam --ref_fn=Hifiasm_out/${prefix}G0.asm.bp.p_ctg.fasta.gz --threads=6 --platform=hifi --model_path=../.conda/envs/hapbridge/bin/models/hifi_revio --output=${prefix}_clair3 --include_all_ctgs
