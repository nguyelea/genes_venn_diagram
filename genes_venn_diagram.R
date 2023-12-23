# Load packages
library("tidyverse")
library("grid")
library("ggvenn")

# Set working directory
setwd("~/Dropbox/Projects/genes_venn_diagram")

# Import genes as dataframes
condition_1 <- read.csv("condition_1_genes.csv")
condition_2 <- read.csv("condition_2_genes.csv")
condition_3 <- read.csv("condition_3_genes.csv")
condition_4 <- read.csv("condition_4_genes.csv")

# Put genes from each dataframe into a list
genes_df <- list(condition_1$Gene, condition_2$Gene, condition_3$Gene, condition_4$Gene)

# Iterate over the lists of genes to keep only unique genes
unique_genes_df <- list()
unique_genes_df <- lapply(genes_df, unique)
unique_genes_no_na <- lapply(unique_genes_df, function(x){x[!is.na(x) & x != ""]})

# Generate Venn diagram from unique genes of each condition
v <- list('Condition 1' = unique_genes_no_na[[1]], 
          'Condition 2' = unique_genes_no_na[[2]],
          'Condition 3' = unique_genes_no_na[[3]],
          'Condition 4' = unique_genes_no_na[[4]])

ggvenn(v, set_name_size = 0, fill_color = c("#5fb200", "#305900", "#c676e8", "#7c4a91")) + theme(text=element_text(family="Arial"))
