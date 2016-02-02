Feature Selection 
=================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

The set of variables that were estimated from these signals are: 

* __mean()__: Mean value
* __std()__: Standard deviation
* __meanFreq()__: Weighted average of the frequency components to obtain a mean frequency

#### Note

This dataset contains only the average values for each activity and subject.
All processing were done with the script run_analysis.R included in this repo.

### run_analysis process steps

1. Set working directory
2. Download zip file if not exists in local directory
3. Unzip file if unzipped folder does not exists
4. Horizontally merge X_test, y_test and subject_test datasets
5. Same as step 4 with train datasets
6. Merge train and test datasets
7. Keep only mean and standard deviation columns
8. Calculate mean values of all columns for each activity and subject
9. Export result dataframe as csv file