---
title: "How the scripts in the run_analysis work and how the are connected"
author: "Amanuel K Ghebreab"
date: "November 28, 2016"
output: html_document
---
also it is quite clear in the comments in the R script, run_analysis.R how does the codes operates,for further clarity and direction this file can be used as a quick guide as what the the code does to come out with a tidy data of our desire.it is in detail as follows;

1.Set the working directory to the folder name project 4.<br/>
2.Download the dataset if it does not already exist in the working directory<br/>
3.Load in to R the activity and feature info<br/>
4.Loads both the training and test datasets in to R, with subsets of columns with mean or standard deviation in the variable name.<br/>
6.Loads in to R both the activity and the subject datasets, and merges both those columns with the respective dataset to produce new training and test datasets<br/>
7.Merges the two new datasets(training and tests)<br/>
8.Converts the activity and subject columns into factors of levels and labels.<br/>
9.Creates a tidy dataset that consists of the average (mean) value of each variable for each subject and activity pair.<br/>
10.when the code is run it produces the end Tidy dataset in tidy_Data.txt file whish is saved in the working Directory.
