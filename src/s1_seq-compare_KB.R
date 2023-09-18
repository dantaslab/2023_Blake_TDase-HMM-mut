
seq_compare <- function(seqs.file, output=c("dist.mat", "tree")){
  
  # Import fasta file  
  seqs.fasta <- readAAStringSet(seqs.file)
  
  # Make MSA
  seqs.aln <- msa(seqs.fasta, "ClustalW") # can also use "Muscle" etc
  
  seqs.aln.2 <- msaConvert(seqs.aln, type="ape::AAbin") # Convert to ape-friendly format
  
  seqs.dist <- dist.gene(seqs.aln.2, "percentage") # Create pairwise distance matrix
  seqs.dist.mat <- as.matrix(seqs.dist)
  seqs.dist.per <- 100 * (1 - seqs.dist.mat) # Make percentage pairwise identity
  
  # Make tree
  seqs.tree <- nj(seqs.dist)
  
  if (output == "dist.mat") {
    seqs_output <- seqs.dist.per
  }
  
  if (output == "tree") {
    seqs_output <- seqs.tree
  }
  
  return(seqs_output)

}
