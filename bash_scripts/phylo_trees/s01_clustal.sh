#!/bin/sh
#Submission script for HTCF
#SBATCH --job-name=clustalo
#SBATCH --time=1-00:00:00 # days-hh:mm:ss
#SBATCH --mem=32G
#SBATCH -n 1
#SBATCH --array 1
#SBATCH --output=slurm_out/clustalo/z_clustalo_%A.out
#SBATCH --error=slurm_out/clustalo/z_clustalo_%A.out
#SBATCH --mail-type=END
#SBATCH --mail-user=kevin.blake@wustl.edu

eval $( spack load --sh clustal-omega )

basedir="$PWD"
seqs="lit-functional-shortlist_CONSTRUCTS_nonred_v6"
aln="figS1_v5"
indir="${basedir}/d00_seqs"
outdir="${basedir}/d01_clustalo"

clustalo -i ${indir}/${seqs}.fasta \
	 -t Protein \
	 -o ${outdir}/${aln}-alignment.fa \
	 --outfmt=fa # fa = fasta for fasttree; phy = phylip for raxml
