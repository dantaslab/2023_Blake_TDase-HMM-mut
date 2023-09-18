
#---Global options for Markdown-------------------------------------------------

options(digits = 3)

knitr::opts_chunk$set(
  comment = "#>",
  #collapse = TRUE,
  echo = TRUE,
  message = FALSE,
  warning = FALSE,
  cache = FALSE,
  #out.width = "80%",
  rows.print = 10,
  max.print = 1000,
  fig.align = "center",
  fig.width = 8,
  fig.asp = 0.7,
  fig.show = "hold"
)

rootdir <- dirname(dirname(getwd()))

knitr::opts_knit$set(root.dir = rootdir)
knitr::opts_knit$set(width=75)

options(DT.options = list(
  pageLength = 5,
  dom = 'itlp', 
  scrollX=TRUE, 
  scrollY=TRUE, 
  font_size=10
))

options(dplyr.print_min = 6, dplyr.print_max = 6)

###---Load packages-------------------------------------------------------------

library(msa) #BiocManager::install("msa")
library(ggmsa) #BiocManager::install("ggmsa")
library(ape)
library(seqinr)
library(Biostrings)

library(xtable)
library(readxl)
library(ggplot2)
library(ggtree)
library(pheatmap)
library(rstatix)

library(rmarkdown)
library(dplyr)
library(ggpubr)
library(RColorBrewer)
library(cowplot)
library(knitr)
library(reshape2)
library(tidyverse) #install.packages("tidyverse")
library(pROC)

###---Load data-----------------------------------------------------------------

# Excel sheet input
TDase_HMM_mut.data <- "data/TDase_HMM-mut_data_v3_KB.xlsx"

  HMM.score <- read_excel(TDase_HMM_mut.data, "Tab01_HMM-scores")
  HMM.MIC.raw <- read_excel(TDase_HMM_mut.data, "Tab02_HMM-MIC")
  hmm.kinetics <- read_excel(TDase_HMM_mut.data, "Tab03_HMM-kinetics")
  mut.MIC.raw <- read_excel(TDase_HMM_mut.data, "Tab04_mut-MIC")
  mut.kinetics <- read_excel(TDase_HMM_mut.data, "Tab05_mut-kinetics")
  mut.therm <- read_excel(TDase_HMM_mut.data, "Tab06_mut-therm")
  
  X7.domain <- read_excel(TDase_HMM_mut.data, "Tab07a_dom-X7")
  tet50.domain <- read_excel(TDase_HMM_mut.data, "Tab07b_dom-50")
  all.domain <- read_excel(TDase_HMM_mut.data, "Tab07c_dom-all")

  
# Sequences
seqs_des1 <- "data/sequences/seqs_MSA-DES1.fasta"
seqs_des2 <- "data/sequences/seqs_MSA-DES2.fasta"
seqs_nonred <- "data/sequences/seqs_MSA-combined.fasta"
seqs_allnamed <- "data/sequences/seqs_allnamed.fasta"
seqs_m01B <- "data/sequences/seqs_M01B.fasta"
seqs_FMO <- "data/sequences/seqs_MSA-combined_FMO.fasta"
seqs_FMO_shortlist <- "data/sequences/seqs_MSA-combined_FMO_shortlist.fasta"  
  
seqs_named <- "data/sequences/lit-named_confirmed_DLFMshort_v3.fasta"
seqs_nonred <- "data/sequences_test/lit-functional_confirmed_DLFMshort_nonredundant_rename_v3.fasta"
seqs_fig1 <- "data/sequences/lit-functional-shortlist_confirmed_nonred_v2.fasta"
seqs_all <- "data/sequences/seqs-all_lit-named_DLFM_constructs.fasta"

seqs_des2_pre <- "data/sequences/clade_comparison/DES2_pre.fasta"
seqs_des2_post <- "data/sequences/clade_comparison/DES2_post.fasta"
seqs_des1_pre <- "data/sequences/clade_comparison/DES1_pre.fasta"
  seqs_des1_pre_shortlist <- "data/sequences/clade_comparison/DES1_pre_shortlist.fasta"
seqs_des1_post <- "data/sequences/clade_comparison/DES1_post.fasta"

constructs_hmm02_type1 <- "data/sequences/constructs_hmm02-type1.fasta"
constructs_hmm02_type2 <- "data/sequences/constructs_hmm02-type2.fasta"
constructs_hmm02_all <- "data/sequences/constructs_hmm02-combined.fasta"

# Additional functions
source("https://raw.github.com/kevinsblake/ConPosER/main/ConPosE.R")
source("src/s0_utilities_KB.R")
source("src/s1_seq-compare_KB.R")

###---Directory structure-------------------------------------------------------

cur.date <- format(Sys.Date(), "%y%m%d")
fln.prfx <- stringr::str_interp("${cur.date}")
main.dir <- file.path(getwd(), "reports")

out.path <- file.path(main.dir, fln.prfx)

if (!dir.exists(out.path)){
  dir.create(out.path)
} else {
  print("output dir already exists!")
}
