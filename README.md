#Getting and Cleaning Data course Project
This repository contains my work for the course project for the Coursera course "Getting and Cleaning data", part of the Data Science specialization.

##About the raw data
The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

##About the project
You should create one R script called run_analysis.R that does the following.

1. Merges the training and the test sets to create one data set.

2. Extracts only the measurements on the mean and standard deviation for each measurement.

3. Uses descriptive activity names to name the activities in the data set

4. Appropriately labels the data set with descriptive activity names.

5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

##Steps to work on this course project
Download the data source and put into a folder on your local drive. You'll have a UCI HAR Dataset folder.

Put `run_analysis.R` in the parent folder of UCI HAR Dataset, then set it as your working directory using `setwd()` function in RStudio.

Run `source("run_analysis.R")`, then it will generate a new file `tidydata.txt` in your working directory.
