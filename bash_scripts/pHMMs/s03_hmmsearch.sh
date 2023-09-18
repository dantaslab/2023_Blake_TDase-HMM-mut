#!/bin/sh
#Submission script for HTCF
#SBATCH --job-name=hmmsearch
#SBATCH --time=1-00:00:00 # days-hh:mm:ss
#SBATCH --mem=16G
#SBATCH -n 1
#SBATCH --array 1
#SBATCH --output=slurm_out/hmmsearch/z_hmmsearch_%A.out
#SBATCH --error=slurm_out/hmmsearch/z_hmmsearch_%A.out
#SBATCH --mail-type=END
#SBATCH --mail-user=kevin.blake@wustl.edu

eval $( spack load --sh hmmer )

basedir="$PWD"
hmm="seqs_hmm01"
db="seqs_constructs_hmm02"
indir="${basedir}/d02_phmms"
outdir="${basedir}/d03_out"
#dbdir="/scratch/gdlab/kblake/prot_databases"

hmmsearch --tblout ${outdir}/${db}_${hmm}.out ${indir}/${hmm}.hmm /scratch/gdlab/kblake/TDase_HMM-rerun/d00_seqs/seqs_constructs_hmm02.fasta #/scratch/gdlab/kblake/prot_databases/oneline_combined_database_labeled.fasta
#-E 1e-10
