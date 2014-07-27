## Getting and Cleaning Data: Course Project
##
## Instructions:
## You should create one R script called run_analysis.R that does the following.
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each
## measurement.
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive variable names.


## DOWNLOAD AND LOAD THE DATA==================================================

## Download the zipped data file to the working directory.
data_url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
dest_file <- "dataset.zip"
## This seems line to be necessary when using https under Windows:
setInternet2(use = TRUE)
download.file(data_url, destfile = dest_file)

## Unzip the downloaded data file in the working directory. This will create the
## subdir "UCI HAR Dataset", which will contain "test" and "train" suddirs.
unzip(dest_file)
base_dir <- "./UCI HAR Dataset"

## Load the column names for both the train and test datasets.
cols <- read.table(paste0(base_dir, "/features.txt"), 
                   header=F, 
                   sep=" ", 
                   col.names=c("colNbr", "colName"))

## Load the activity labels
activities <- read.table(paste0(base_dir, "/activity_labels.txt"), 
                         header=F, 
                         sep=" ", 
                         col.names=c("activityNbr", "activityName"))

## Load the training dataset using the descriptive column names from the cols
## dataset. Note that these column names will be cleaned up below.
train <- read.table(paste0(base_dir, "/train/X_train.txt"), 
                    header=F, 
                    col.names=cols$colName)

## Load the activity nbrs for the training set (only 1 col)
trainActivities <- read.table(paste0(base_dir, "/train/Y_train.txt"), 
                              header=F, 
                              col.names="activityNbr")

## Load the subject information for the training set (only 1 col)
trainSubjects <- read.table(paste0(base_dir, "/train/subject_train.txt"), 
                            header=F, 
                            col.names="subjectNbr")


## Load the test dataset using the descriptive column names from the cols
## dataset. Note that these column names will be cleaned up below.
test <- read.table(paste0(base_dir, "/test/X_test.txt"), 
                   header=F, 
                   col.names=cols$colName)

## Load the activity nbrs for the test set (only 1 col)
testActivities <- read.table(paste0(base_dir, "/test/Y_test.txt"), 
                             header=F, 
                             col.names="activityNbr")

## Load the subject information for the test set (only 1 col)
testSubjects <- read.table(paste0(base_dir, "/test/subject_test.txt"), 
                           header=F, 
                           col.names="subjectNbr")


## MERGE THE TRAINING AND TEST DATA SETS==============================

## Add the activity number to each dataset
train <- cbind(train, trainActivities)
test <- cbind(test, testActivities)

## Add the subject number to each dataset
train <- cbind(train, trainSubjects)
test <- cbind(test, testSubjects)

## Merge the training and test datasets
data <- rbind(train, test)



## CLEAN UP THE DATA AND EXTRACT MEAN & STD DEV INFO==========================

## Clean up the activity labels, converting them to lowercase and replacing
## underscores with spaces.
activities$activityName <- tolower(activities$activityName) 
activities$activityName <- gsub("_", " ", activities$activityName)

## Factor the activity nbr using the activity names as labels
data$activityNbr <- factor(as.character(data$activityNbr), 
                           labels=activities[order(activities$activityNbr), 
                                             "activityName"])
## Change the col name (since it's now a factor w/ both the nbr and the name)
names(data)[names(data)=="activityNbr"] <- "activity"

## Factor the subject nbr
data$SubjectNbr <- factor(as.character(data$subjectNbr))
# Change the col name (since it's now a factor)
names(data)[names(data)=="subjectNbr"] <- "subjectID"

## Extract cols whose names include "mean()" or "std()".
## So this does NOT include the cols whose names include "meanFreq()".
## (also include the activity & subject info).
dataMeanStdDev <- data[, c(grep("mean\\(\\)|std\\(\\)", cols$colName), 
                           match("activity",names(data)), 
                           match("subjectID",names(data)))]

## Clean up the column names of the extracted info to use more descriptive
## variable names and remove parentheses and periods.
names(dataMeanStdDev) <- gsub("\\.mean", "Mean", names(dataMeanStdDev))
names(dataMeanStdDev) <- gsub("\\.std", "StdDev", names(dataMeanStdDev))
names(dataMeanStdDev) <- gsub("tBody", "timeBody", names(dataMeanStdDev))
names(dataMeanStdDev) <- gsub("tGravity", "timeGravity", names(dataMeanStdDev))
names(dataMeanStdDev) <- gsub("fBodyBody", "freqBody", names(dataMeanStdDev))
names(dataMeanStdDev) <- gsub("fBody", "freqBody", names(dataMeanStdDev))
names(dataMeanStdDev) <- gsub("\\.", "", names(dataMeanStdDev))



## CREATE A TIDY DATA SET WITH THE AVG OF EACH VARIABLE
## FOR EACH ACTIVITY AND EACH SUBJECT==============================
tidyData <- aggregate(dataMeanStdDev[, 1:(ncol(dataMeanStdDev)-2)], 
                      by=list(subjectID=dataMeanStdDev$subjectID, 
                              activity=dataMeanStdDev$activity), 
                      FUN=mean)

## Write the tidy data to a csv file
write.csv(tidyData, file="tidydata.csv", row.names=F)


