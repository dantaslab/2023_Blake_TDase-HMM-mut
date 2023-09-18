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
seqs="seqs_hmm01_2000"
indir="${basedir}/d04_${seqs}_hits"
outdir="${basedir}/d05_clustalo"

mkdir -p ${outdir}

clustalo -i ${indir}/results_${seqs}_v3b.fasta \
	 -t Protein \
	 -o ${outdir}/${seqs}_v3b-alignment.fa \
	 --outfmt=fa # fa = fasta for fasttree; phy = phylip for raxml
