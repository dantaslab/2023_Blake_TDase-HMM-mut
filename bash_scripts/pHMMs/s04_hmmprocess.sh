#!/bin/sh
#Submission script for HTCF
#SBATCH --job-name=hmm_process
#SBATCH --time=1-00:00:00 # days-hh:mm:ss
#SBATCH --mem=32G
#SBATCH -n 1
#SBATCH --array 1
#SBATCH --output=slurm_out/hmm_process/z_hmm_process_%A.out
#SBATCH --error=slurm_out/hmm_process/z_hmm_process_%A.out
#SBATCH --mail-type=END
#SBATCH --mail-user=kevin.blake@wustl.edu 

eval $( spack load --sh python@3.9.12 )

basedir="$PWD"
seqs="seqs_hmm01"
indir="${basedir}/d03_out"

python parsehmm.py ${indir}/${seqs}_3000.out

python removedupe.py ${indir}/parsed_${seqs}_3000.out
