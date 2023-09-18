#!/bin/bash

#===============================================================================
# File Name    : fasttree.sh
# Description  : Infers a approximately-maximum-likelihood phylogenetic tree
#                from alignments of nucleotide or protein sequences.
# Usage        : sbatch fasttree.sh
# Author       : Luke Diorio-Toth, ldiorio-toth@wustl.edu
# Version      : 1.1
# Created On   : Wed Jul  1 17:27:41 CDT 2020
# Modified On  : Wed Oct 19 14:42:11 CDT 2022
#===============================================================================

#SBATCH --job-name=fasttree
#SBATCH --cpus-per-task=8
#SBATCH --mem=50G
#SBATCH --output=slurm_out/fasttree/z_fasttree_%A.out
#SBATCH --error=slurm_out/fasttree/z_fasttree_%A.out
#SBATCH --mail-type=END
#SBATCH --mail-user=kevin.blake@wustl.edu

eval $( spack load --sh fasttree )

aln="fig1_v5"
basedir="$PWD"
indir="${basedir}/d01_clustalo"
outdir="${basedir}/d03_fasttree"
mkdir -p ${outdir}

time FastTreeMP < ${indir}/${aln}-alignment.fa > ${outdir}/${aln}_fasttree.newick
