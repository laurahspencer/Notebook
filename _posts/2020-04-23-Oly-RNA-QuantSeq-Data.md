---
layout: post
title: Oly OA RNA isolation - raw data 
--- 

Erica at the NWGC worked very quickly to get my samples sequenced on the NovaSeq. On Monday she pooled them and ran each pool on the Bioanalyzer. [Here is the bioanalyzer report](https://github.com/fish546-2018/laura-quantseq/blob/master/data/library-prep/Sequencing-pool-QC_High%20Sensitivity%20DNA%20Assay_DE72902247_2020-04-20_12-02-44.pdf), and a note from Erica about the pool concentrations: 

Here is the QC: I did dilute an aliquot of the pool down further to run the samples better.  The original qubit pools were as follows and these were what was loaded on the bioanalyzer.
  - Batch1_69plex	10.966ng/ul  
  - Batch2_77plex	11.649ng/ul  

The diluted qubit values are:
  - Batch1_69plex	2.777ng/ul  
  - Batch2_77plex	2.43ng/ul  

Once the samples were finished on the NovaSeq, she sent me a summary of the run, and files for each pool with the # reads per sample: 

  - [Batch1_69plex_lane1.stats.csv](https://github.com/fish546-2018/laura-quantseq/blob/master/data/2020-QuantSeq/Batch1_69plex_lane1.stats.csv)  

  - [Batch2_77plex_lane2.stats.csv](https://github.com/fish546-2018/laura-quantseq/blob/master/data/2020-QuantSeq/Batch2_77plex_lane2.stats.csv)  

Date | Lane | Lane | Concentration (pM) | SAV Clusters/mm^2 | % Clusters PF | Overall Q30 | Read 1 Q30
-- | -- | -- | -- | -- | -- | -- | --
200420 | 1 | Batch1_69plex | 270 | 506.12 | 79.29 | 89.73 | 88.93
  | 2 | Batch2_77plex

I received a link to the raw data, which is not yet demultiplexed (I will need to do that). The data is stored on Globus.org. I will need to transfer it from there to the Nightengales directory on Owl in the O. lurida folder, which is where all raw NGS data is housed for the Roberts Lab. This could be done in a few ways, but I will follow Shelly's lead, with a few changes based on my work-at-home situation. She directed me to this [notebook post](https://shellytrigg.github.io/130th-post/), and this [github issue](https://github.com/RobertsLab/resources/issues/713) as references. Globus endpoints are set up via a GUI, so since I am working at home I opted to tranfer the files to my external hard drive, and then to other locations.  

### Set up Globus personal endpoint on my external hard drive, download data 

Following these [Globus setup instructions](https://docs.globus.org/how-to/get-started/) I set my laptop up as a personal endpoint on Globus. I edited my Globus settings to be able to write to my external hard drive. I then transferred the two FASTQ files with their md5 files to my external hard drive. 

![image](https://user-images.githubusercontent.com/17264765/80173043-7a863280-85a3-11ea-9695-19e6830148bc.png)

![image](https://user-images.githubusercontent.com/17264765/80173099-a30e2c80-85a3-11ea-8bb4-ef5ce2bf7fc9.png)

### Set up Globus personal endpoint on Ostrich, download data 

I tried to upload the data from my external hard drive to Owl/Nightengales, but it took forever (upload speed from my house is bubkiss). So, I remoted in to Ostrich using Mac's Screen Sharing option, set Ostrich up as a personal endpoint on Globus, and downloaded the data to Ostrich. 

### Mount Owl, transfer files from Ostrich to Nightengales 

I mounted Owl on Ostrich using Finder --> Go --> Connect to Server.  I entered owl's IP address, then my username and pw. 

I then used `rsync` to transfer the files from my external hard drive to Owl, using the following settings: 

`rsync --archive --progress --verbose /Users/lhs3/Documents/2020-04-21_QuantSeq-data /Volumes/web-1/nightingales/O_lurida`

Updated readme file in the O_lurida folder on Nightengales, and updated the [Nightengales GoogleSheet](https://docs.google.com/spreadsheets/d/1_XqIOPVHSBVGscnjzDSWUeRL7HUHXfaHxVzec-I-8Xk/edit) 

To do - once files are finished transferring, will update the md5 file too, _To be continued..._ 
