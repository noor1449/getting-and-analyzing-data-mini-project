# Getting and Cleaning Data Course Project

This repository contains the R script and documentation for the Johns Hopkins Getting and Cleaning Data Coursera course project.

## Files in this Repository
* `run_analysis.R`: The R script used to download, clean, transform, and output the tidy dataset.
* `tidy_data.txt`: The resulting independent tidy data set containing averages per subject and activity.
* `CodeBook.md`: A code book describing the variables, data, and transformations.
* `README.md`: This file explaining how everything works.

## How to Run the Script
1. Open R or RStudio.
2. Set your working directory to the folder containing `run_analysis.R`.
3. Run the script using `source("run_analysis.R")`.
4. The script will automatically download the dataset, execute all 5 processing steps, and output `tidy_data.txt` in your working directory.