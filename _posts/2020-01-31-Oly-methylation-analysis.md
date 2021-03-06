---
layout: post
title: Oly methylation analysis, Jan 31st, 2020 
--- 

Revisiting my task list: 

### New methylation distance matrix to include just loci with new 75% threshold <- not needed   

I reviewed Steven's MethylKit and he had already took necessary steps to select only loci with high coverage across samples. 

- Upon calling methylation status for each locus (using sorted BAM files, function `processBismarkAln`) he set the "minimum read coverage to call a methylation status for a base" to 2.  
- Then, he used the `filterByCoverage` function to filter out bases with coverage <10x or >100x. This was done on each locus within each sample, and did not discard loci that had <10x across all samples.  
- However, he then used the `unite` function to "merge all samples to one object for base-pair locations that are covered in all samples ... The [resulting] methylBase object contains methylation information for regions/bases that are covered in all samples." This step in particular should control for genetic differences that could influence methylation status.  

### Re-do MACAU <- DONE 
- With pre-filtered count files (5x and 10x across 75% of samples). NOTE: to generate my count files I had used the same filter settings as Steven (`low.count=10`, `hi.count=100`.   
- Reannontated new MACAU results  

### Reannonate DMLs <- not needed 
Wasn't necessary, since the DMLs were already filtered.   

### DMG analysis <- DONE 
- Figure out something comparable to Fst on DMLs and MACAU to do a correlation analysis  
- GO_MWU analysis redo with genes: https://github.com/sr320/paper-oly-mbdbs-gen/blob/master/code/GO_MWU.ipynb  

### Get manhattan distance for just DMLs <- DONE
- This is saved as a .csv file on github here: [paper-oly-mbdbs-gen/analyses/dist.manhat.DMLs.csv](https://github.com/sr320/paper-oly-mbdbs-gen/blob/master/analyses/dist.manhat.DMLs.csv)   
- Note: 51 loci were identified as differentially methylated (DMLs were determined to be those with 25% differences, qvalue < 0.01)   
- Out of curiosity, I did a PCA on the DML percent methylation distance matrix with the package `FactoMineR::PCA()`  
![image](https://user-images.githubusercontent.com/17264765/73574877-ab831b00-442b-11ea-9fc1-7fa0a499930e.png) 

## To do still  

### GO_MWU enrichment analysis redo with genes: 
Follow Katherine's analysis - https://github.com/sr320/paper-oly-mbdbs-gen/blob/master/code/GO_MWU.ipynb. I may try to do this in RMarkdown, though.  

### Figure out something comparable to Fst on DMLs and MACAU to do a correlation analysis   
Calculate Pst values; description of Pst from the [Carja et al. 2017](https://doi-org/10.1038/s41559-017-0299-z) paper -  

"The P st values P st is a measure of the proportion of variance explained by between-population divergence. It is the phenotypic analog of the population genetics parameter F st 27,29. For a single probe, P st was calculated as σ 2 b /(σ 2 b  + 2σ 2 w ), where σ 2 b is the between population variance and σ 2 w is the average within population variance. P st values range from 0 to 1, with values near 1 signifying that the majority of epigenetic variance for a probe is between populations rather than within populations."

### Get methods down on paper  

### Re-do MACAU using a genotype value as the predictor variable! (instead of length) 
I was re-reading the MACAU paper [Lea et al. 2015](https://journals.plos.org/plosgenetics/article?id=10.1371/journal.pgen.1005650) and noticed that one can, in fact, use a genotype value as the predictor variable ... 

![image](https://user-images.githubusercontent.com/17264765/73584580-31b05900-444e-11ea-825f-0f7e416e2aaa.png)

