#!/bin/sh                                                                                                         
#Submission script for HTCF                                                                                       
#SBATCH --job-name=extracting_fasta                                                                               
#SBATCH --time=1-00:00:00 # days-hh:mm:ss                                                                         
#SBATCH --mem=32G                                                                                                 
#SBATCH -n 1                                                                                                      
#SBATCH --array 1-322                                                                                             
#SBATCH --output=slurm_out/extract/z_extract_%A.out                                                               
#SBATCH --error=slurm_out/extract/z_extract_%A.out                                                                
#SBATCH --mail-type=END                                                                                           
#SBATCH --mail-user=kevin.blake@wustl.edu                                                                         

eval $( spack load --sh python@3.9.12 )

basedir="$PWD"
seqs="seqs_hmm01_3000"
dbdir="/scratch/gdlab/kblake/prot_databases"
indir="${basedir}/d03_out"
outdir="${basedir}/d04_${seqs}_hits"

mkdir -p ${outdir}

ID=`sed -n ${SLURM_ARRAY_TASK_ID}p ${basedir}/small_mapping.txt`

echo "ID=$ID"

srun python test_extract.py \
     ${dbdir}/small_file_${ID}.fasta \
     ${outdir}/${seqs}_hits_${ID}.fasta \
     ${indir}/nodupe_parsed_${seqs}_v2.out # manually remove the HMM header and all spaces from nodupe file
