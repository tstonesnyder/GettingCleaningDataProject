#Code Book

###Source of the Data
The data used to generate the files in this repository was provided through the "Getting and Cleaning Data" course on Coursera.  It was downloaded from 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip on 7/27/2014.  It represents data collected from the accelerometers on Samsung Galaxy S smartphones. A full description is available at the site where the data was obtained: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

##Description of the Raw Data
The files X_test.txt and X_train.txt contain the data for the test and training sets, respectively.  The variable names (column headings) that apply to both of these datasets can be found in features.txt. The file features_info.txt contains further information about this data. I excerpt some of that information below:

>The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
>  
>Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 
>  
>Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 
>  
>These signals were used to estimate variables of the feature vector for each pattern:  
> '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
>tBodyAcc-XYZ
>tGravityAcc-XYZ
>tBodyAccJerk-XYZ
>tBodyGyro-XYZ
>tBodyGyroJerk-XYZ
>tBodyAccMag
>tGravityAccMag
>tBodyAccJerkMag
>tBodyGyroMag
>tBodyGyroJerkMag
>fBodyAcc-XYZ
>fBodyAccJerk-XYZ
>fBodyGyro-XYZ
>fBodyAccMag
>fBodyAccJerkMag
>fBodyGyroMag
>fBodyGyroJerkMag
>
>The set of variables that were estimated from these signals are: 
>mean(): Mean value
>std(): Standard deviation
>mad(): Median absolute deviation 
>max(): Largest value in array
>min(): Smallest value in array
>sma(): Signal magnitude area
>energy(): Energy measure. Sum of the squares divided by the number of values. 
>iqr(): Interquartile range 
>entropy(): Signal entropy
>arCoeff(): Autorregresion coefficients with Burg order equal to 4
>correlation(): correlation coefficient between two signals
>maxInds(): index of the frequency component with largest magnitude
>meanFreq(): Weighted average of the frequency components to obtain a mean frequency
>skewness(): skewness of the frequency domain signal 
>kurtosis(): kurtosis of the frequency domain signal 
>bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
>angle(): Angle between to vectors.
>
>Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:
>gravityMean
>tBodyAccMean
>tBodyAccJerkMean
>tBodyGyroMean
>tBodyGyroJerkMean
>

The activity numbers that correspond to each test and training set observation can be found in y_test.txt and y_train.txt. The labels that are associated with each activity number can be found in activity_labels.txt.

The subject numbers that correspond to each test and training set observation can be found in subject_test.txt and subject_train.txt


###Running the run_analysis.R Script
The file run_analysis.R is an R script that cleans and processes the raw data to create an output file (tidydata.csv). See the file README.md for details on the steps this script performs.


##Columns in tidydata.csv
The file tidydata.csv contains the following columns of data:

- subjectID = A number from 1 to 30 identifying the subject to whom the measurements apply

- activity = Text indicating the activity the subject was engaged in when the measurements were recorded.  Can be one of the following 6 text values:
    walking
    walking upstairs
    walking downstairs
    sitting
    standing
    laying

The remaining 66 columns contain measurements that range from -1 to 1 (exclusive). They contain the mean of the related column in the full dataset, calculated by individual subject and activity. Columns labels ending in "X", "Y", or "Z" contain data related to 3-axial signals in the X, Y, or Z direction. The remaining columns are:

- timeBodyAccMeanX
- timeBodyAccMeanY
- timeBodyAccMeanZ
- timeBodyAccStdDevX
- timeBodyAccStdDevY
- timeBodyAccStdDevZ
- timeGravityAccMeanX
- timeGravityAccMeanY
- timeGravityAccMeanZ
- timeGravityAccStdDevX
- timeGravityAccStdDevY
- timeGravityAccStdDevZ
- timeBodyAccJerkMeanX
- timeBodyAccJerkMeanY
- timeBodyAccJerkMeanZ
- timeBodyAccJerkStdDevX
- timeBodyAccJerkStdDevY
- timeBodyAccJerkStdDevZ
- timeBodyGyroMeanX
- timeBodyGyroMeanY
- timeBodyGyroMeanZ
- timeBodyGyroStdDevX
- timeBodyGyroStdDevY
- timeBodyGyroStdDevZ
- timeBodyGyroJerkMeanX
- timeBodyGyroJerkMeanY
- timeBodyGyroJerkMeanZ
- timeBodyGyroJerkStdDevX
- timeBodyGyroJerkStdDevY
- timeBodyGyroJerkStdDevZ
- timeBodyAccMagMean
- timeBodyAccMagStdDev
- timeGravityAccMagMean
- timeGravityAccMagStdDev
- timeBodyAccJerkMagMean
- timeBodyAccJerkMagStdDev
- timeBodyGyroMagMean
- timeBodyGyroMagStdDev
- timeBodyGyroJerkMagMean
- timeBodyGyroJerkMagStdDev
- freqBodyAccMeanX
- freqBodyAccMeanY
- freqBodyAccMeanZ
- freqBodyAccStdDevX
- freqBodyAccStdDevY
- freqBodyAccStdDevZ
- freqBodyAccJerkMeanX
- freqBodyAccJerkMeanY
- freqBodyAccJerkMeanZ
- freqBodyAccJerkStdDevX
- freqBodyAccJerkStdDevY
- freqBodyAccJerkStdDevZ
- freqBodyGyroMeanX
- freqBodyGyroMeanY
- freqBodyGyroMeanZ
- freqBodyGyroStdDevX
- freqBodyGyroStdDevY
- freqBodyGyroStdDevZ
- freqBodyAccMagMean
- freqBodyAccMagStdDev
- freqBodyAccJerkMagMean
- freqBodyAccJerkMagStdDev
- freqBodyGyroMagMean
- freqBodyGyroMagStdDev
- freqBodyGyroJerkMagMean
- freqBodyGyroJerkMagStdDev
