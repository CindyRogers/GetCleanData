##Code Book for Getting and Cleaning Data project

This file describes the contents of the tidy data file 'tidy.txt' produced by the run_analysis.R script. 

The raw data and its descriptions are located at:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

###Column Descriptions

subject: identifies the person being observed.  The range is 1 - 30, for each of the 30 people involved.

activity:  the activities performed by the person while they were being monitored.  Each person did all of the 6 activities:
WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING

timeBodyAccMeanX / timeBodyAccMeanY / timeBodyAccMeanZ: the body acceleration signal, in standard gravity units 'g'.  On the X, Y, and Z axis, respectively. 

timeBodyAccStdDevX / timeBodyAccStdDevY / timeBodyAccStdDevZ: the standard deviation of signal for timeBodyAccMeanX/Y/Z.
On the X, Y, and Z axis, respectively. 

timeGravityAccMeanX / timeGravityAccMeanY / timeGravityAccMeanZ: the gravity acceleration signal, in standard gravity units 'g'.
On the X, Y, and Z axis, respectively. 

timeGravityAccStdDevX / timeGravityAccStdDevY / timeGravityAccStdDevZ:  the standard deviation of signal for 
timeGravityAccMeanX/Y/Z.
On the X, Y, and Z axis, respectively. 

timeBodyAccJerkMeanX /timeBodyAccJerkMeanY / timeBodyAccJerkMeanZ:  the jerk signal associated with timeBodyAccMeanX, in standard gravity units 'g'.
On the X, Y, and Z axis, respectively. 

timeBodyAccJerkStdDevX / timeBodyAccJerkStdDevY / timeBodyAccJerkStdDevZ: the standard deviation of signal for 
timeBodyAccJerkMeanX/Y/Z.
On the X, Y, and Z axis, respectively. 

timeBodyGyroMeanX / timeBodyGyroMeanY /  timeBodyGyroMeanZ: 
the gyroscope measurement.
On the X, Y, and Z axis, respectively. 

timeBodyGyroStdDevX / timeBodyGyroStdDevY /timeBodyGyroStdDevZ: the standard deviation of signal for timeBodyGyroMeanX/Y/Z.
On the X, Y, and Z axis, respectively. 

timeBodyGyroJerkMeanX / timeBodyGyroJerkMeanY / timeBodyGyroJerkMeanZ: the jerk signal associated with timeBodyGyroMeanX/Y/Z.
On the X, Y, and Z axis, respectively. 

timeBodyGyroJerkStdDevX / timeBodyGyroJerkStdDevY /  timeBodyGyroJerkStdDevZ:  the standard deviation of signal for timeBodyGyroJerkMeanX/Y/Z.
On the X, Y, and Z axis, respectively. 

timeBodyAccMagMean: the magnitude of timeBodyAccMean signal, in standard gravity units 'g'. 

timeBodyAccMagStdDev: the standard deviation associated with
timeBodyAccMagMean.

timeGravityAccMagMean: the magnitude of timeGravityAccMean signal, in standard gravity units 'g'.

timeGravityAccMagStdDev: the standard deviation associated with
timeGravityAccMagMean.

timeBodyAccMagMean: the jerk signal associated with timeBodyAccMeanX, in standard gravity units 'g'. 

timeBodyAccMagStdDev: the standard deviation associated with timeBodyAccMagMean.  

timeGravityAccMagMean: the magnitude of the timeBodyGyroMean signal. 

timeGravityAccMagStdDev: the standard deviation associated with
timeGravityAccMagMean.

timeBodyAccJerkMagMean: the jerk signal associated with timeBodyGyroMeanX. 

timeBodyAccJerkMagStdDev: the standard deviation associated with timeBodyAccJerkMagMean.   

timeBodyGyroMagMean: the magnitude of the gyroscope measurement.

timeBodyGyroMagStdDev: the standard deviation associated with timeBodyGyroMagMean.

timeBodyGyroJerkMagMean: the jerk signal associated with
timeBodyGyroMagMean.

timeBodyGyroJerkMagStdDev: the standard deviation associated with timeBodyGyroJerkMagMean.

freqBodyAccMeanX / freqBodyAccMeanY / freqBodyAccMeanZ: 
the frequency variable associated with timeBodyAccMeanX/Y/Z.

freqBodyAccStdDevX / freqBodyAccStdDevY / freqBodyAccStdDevZ:
the frequency variable associated with timeBodyAccStdDevX/Y/Z.

freqBodyAccJerkMeanX / freqBodyAccJerkMeanY / freqBodyAccJerkMeanZ: the frequency variable associated with 
timeBodyAccJerkMeanX/Y/Z.

freqBodyAccJerkStdDevX / freqBodyAccJerkStdDevY / freqBodyAccJerkStdDevZ: the frequency variable associated with 
timeBodyAccJerkStdDevX/Y/Z. 

freqBodyGyroMeanX / freqBodyGyroMeanY / freqBodyGyroMeanZ:
the frequency variable associated with timeBodyGyroMeanX/Y/Z. 

freqBodyGyroStdDevX / freqBodyGyroStdDevY / freqBodyGyroStdDevZ:
the frequency variable associated with timeBodyGyroStdDevX/Y/Z.

freqBodyAccMagMean:  the frequency variable associated with timeBodyAccMagMean. 

freqBodyAccMagStdDev: the frequency variable associated with timeBodyAccMagStdDev. 

freqBodyAccJerkMagMean: the frequency variable associated with timeBodyAccJerkMagMean. 

freqBodyAccJerkMagStdDev: the frequency variable associated with timeBodyAccJerkMagStdDev. 

freqBodyGyroMagMean: the frequency variable associated with timeBodyGyroMagMean. 

freqBodyGyroMagStdDev: the frequency variable associated with timeBodyGyroMagStdDev. 

freqBodyGyroJerkMagMean: the frequency variable associated with timeBodyGyroJerkMagMean. 

freqBodyGyroJerkMagStdDev: the frequency variable associated with timeBodyGyroJerkMagStdDev. 
  

###Mapping from original column names 

Some columns in the original data set were excluded; this analysis dealt with only those columns measuring means or standard deviations of measurements.

Other column names were modified to conform better to column naming conventions:
hyphens and parenthesis were removed, 
the 't' prefix was expanded to 'time',
the 'f' prefix was expanded to 'freq',
'mean()' was converted to 'Mean',
'std()' was converted to 'StdDev',
and the names containing "BodyBody" were changed to only "Body".  

More technical details from original code book:

[The following is copied from features_info.txt]

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).

These signals were used to estimate variables of the feature vector for each pattern:
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

The complete list of variables of each feature vector is available in 'features.txt'.

[End of copy]

