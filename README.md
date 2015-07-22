# Run Analysis

## Introduction

This R script was written for the Getting and Cleaning Data course project in the Johns Hopkins Coursera Data Science sequence. 

It is intended to be used with data from the University of California, Irvine, Human Activity Recognition Using Smartphones Data Set. The script reads in datasets from the "test" and "train" directories of the dataset, applies descriptive labels to variables and to the recorded activities using files within the set, and then cleans and combines the data. Additionally, the script creates a summary tidy data set of averages for each measurement for each subject and activity in the dataset.

## Dependencies
*R packages:
    + dplyr
    + reshape2

*Data:
    + UCI HAR Dataset

*Optional:
    + R Studio

## Using this script

1. Download and unzip the UCI HAR dataset. 
2. Set working directory to unzipped UCI HAR dataset folder.
3. Download and source run_analysis.R from this repository
4. Access the tidy, merged data set with the "merged_set" variable. The tidy, summarized data set can be accessed with the "tidy_set" variable.
