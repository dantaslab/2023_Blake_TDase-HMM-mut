#!/bin/sh
#Submission script for HTCF
#SBATCH --job-name=hmmbuild
#SBATCH --time=1-00:00:00 # days-hh:mm:ss
#SBATCH --mem=16G
#SBATCH -n 1
#SBATCH --array 1
#SBATCH --output=slurm_out/hmmbuild/z_hmmbuild_%A.out
#SBATCH --error=slurm_out/hmmbuild/z_hmmbuild_%A.out
#SBATCH --mail-type=END
#SBATCH --mail-user=kevin.blake@wustl.edu

eval $( spack load --sh hmmer )

basedir="$PWD"
seqs="seqs_hmm02-combined_v2"
indir="${basedir}/d01_clustalo"
outdir="${basedir}/d02_phmms"

hmmbuild ${outdir}/${seqs}.hmm ${indir}/${seqs}-alignment.sto 
