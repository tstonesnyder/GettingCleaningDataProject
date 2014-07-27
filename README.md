This repository contains my work for the course project in the "Getting and Cleaning Data" course offered by Coursera.

This repository contains the following files:
- README.md (this file)
- run_analysis.R
- tidydata.csv
- CodeBook.md


###run_analysis.R
The run_analysis.R file contains R code written by me that will download and process data collected from the smartphone accelerometers.

This script will do the following:

1. Download the raw dataset from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip to your working directory in R.

2. Unzip the downloaded data and create a folder named "UCI HAR Dataset" in your working directory.

3. Load the raw test and training data, along with their labels and the associated activity and subject information for each observation.

4. Merge the test and training datasets.

5. Extract the columns that contain the activity and subject information, as well as those that contain mean or standard deviation calculations.

6. Clean up the labels for the extracted columns by removing periods, parentheses, and underscores; by converting to camel case where necessary; and by making names more descriptive where necessary.  

7. Clean up the activity labels by converting them to lowercase and replacing underscores with spaces.

8. Create a new tidy dataset that contains the mean of each extracted column by subject and activity.

9. Write this tidy dataset to a comma-delimited file in the working directory called tidydata.csv.  This file can be found in this repository.  For a description of the columns in this file, see the CodeBook.md file.


###tidydata.csv
tidydata.csv is the output file generated by running the run_analysis.R script. For a description of the columns in this file, see the CodeBook.md file.


###CodeBook.md
The CodeBook.md file explains the raw data, the transformations performed by the script run_analysis.R, and the resulting data and variables in the tidydata.csv file.


