# Getting-and-Cleaning-Data-Course-Project
This submission completes the Course Project for the Cleaning Data Course.

The main script is the run_analysis.r file.

to run the script execute: run_analysis()

# Preconditions for run_analysis():
- library(dplyr)
- library(reshape)

# What run_analysis() does:
    1. Merges the training and the test sets to create one data set.
    2. Extracts only the measurements on the mean and standard deviation for each measurement. 
    3. Uses descriptive activity names to name the activities in the data set
    4. From the data set in step 3, creates a second, independent tidy data set with the average         of each variable for each activity and each subject.
    5. The "." (dots) in the variables are removed
    6. write tidy data to "tidydata.txt"
    
# More about the Data:
The Raw Data needs to be available in the same directory, for run_analysis to be able to run.
To find more about the Raw Data read Readme.txt
The code book of the tidy data is in codebook.md