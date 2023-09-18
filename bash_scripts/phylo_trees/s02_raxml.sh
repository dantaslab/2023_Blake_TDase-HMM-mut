#!/bin/bash

#===============================================================================
# Name         : raxml.sh
# Description  : Infers a maximum-likelihood phylogenetic tree
#                from alignments of nucleotide or protein sequences.
# Usage        : sbatch raxml.sh
# Author       : Luke Diorio-Toth, ldiorio-toth@wustl.edu
# Version      : 2.1
# Created On   : Tue Aug 20 15:51:17 CDT 2019
# Modified On  : Wed Oct 19 14:53:39 CDT 2022
#===============================================================================

#SBATCH --job-name=raxml
#SBATCH --time=7-00:00:00 #days-hh:mm:ss
#SBATCH --cpus-per-task=12
#SBATCH --mem=10G
#SBATCH --output=slurm_out/raxml/z_raxml_%A.out
#SBATCH --error=slurm_out/raxml/z_raxml_%A.out
#SBATCH --mail-type=END
#SBATCH --mail-user=kevin.blake@wustl.edu

eval $( spack load --sh raxml+pthreads )

aln="figS1_v5"
basedir="$PWD"
indir="${basedir}/d01_clustalo"
outdir="${basedir}/d02_raxml"

mkdir -p ${outdir}

set -x
time raxmlHPC-PTHREADS \
    -s ${indir}/${aln}-alignment.fa \
    -w ${outdir} \
    -n ${aln}_rax \
    -m PROTGAMMAJTT \
    -f a \
    -T ${SLURM_CPUS_PER_TASK} \
    -N 100 \
    -p 12345 \
    -x 54321
RC=$?
set +x

if [ $RC -eq 0 ]
then
  echo "Job completed successfully"
else
  echo "Error occurred!"
  exit $RC
fi
