###
### run_analysis.R
###
### This script was written for Coursera's Getting and Cleaning Data project.
###
### Pre-requisites:
### - This script requires that the Samsung data (in folder "UCI HAR Dataset") is in the
###   working directory.
### - This script uses the library dplyr.
###

### 
#  1) Merge the training and test sets to create one data frame.
###

# load the dplyr package (used in Step #5). 
library(dplyr)

# Define constants for the file names
testXFile           <- "UCI HAR Dataset/test/X_test.txt"
testYFile           <- "UCI HAR Dataset/test/y_test.txt"
testSubjectFile     <- "UCI HAR Dataset/test/subject_test.txt"
trainXFile          <- "UCI HAR Dataset/train/X_train.txt"
trainYFile          <- "UCI HAR Dataset/train/y_train.txt"
trainSubjectFile    <- "UCI HAR Dataset/train/subject_train.txt"
featuresFile        <- "UCI HAR Dataset/features.txt"
activityLabelsFile  <- "UCI HAR Dataset/activity_labels.txt"

# Now merge the test data vertically (column bind). 
# Want:  X_test  +  y_test  + subject_test
# which will be a 2947 x 563 data frame.
testData <- cbind(read.table(testXFile), read.table(testYFile))
testData <- cbind(testData, read.table(testSubjectFile))

# Repeat merge process for the training data. 
# Want:  X_train +  y_train +  subject_train 
# which will be a 7352 x 563 data frame.
trainData <- cbind(read.table(trainXFile), read.table(trainYFile))
trainData <- cbind(trainData, read.table(trainSubjectFile))

# Now merge the train and test data horizontally (row bind).
# Want:   training data 
#         test data 
# which will be a 10299 x 563 data frame.
totalData <- rbind(trainData, testData)

### 
#  2) Extract only the measurements on the mean and standard deviation
#     for each measurement.
#
#     There are different ways to interpret this requirement.  I decided to select
#     those features with "std()" or "mean()" in the feature name.  This excludes 
#     features with "...meanFreq()" or "angle(...Mean, ...Mean)", which don't seem
#     to be 'measurements on the mean and standard deviation for each measurement'.
###

# Read in the features
features <- read.table(featuresFile)

# locate features with mean() or std() in name.  
# Note parenthesis must be escaped with double backslashes.
meanStdIndices <- grep("mean\\(\\)|std\\(\\)", features$V2)

# extract only the mean(), std(), activity, and subject columns
subjectIndex <- ncol(totalData)           # index for subject column
activityIndex <- subjectIndex - 1         # index for activity column 
meanStdData <- totalData[ , c(meanStdIndices, activityIndex, subjectIndex)]

### 
#  3) Use descriptive activity names to name the activities in the data set.
###

# Currently the activity column contains a numeric value indicating the activity 
# that the person was doing.  Map the number into text.  
activityLabels <- read.table(activityLabelsFile)
msActivityIndex <- ncol(meanStdData) - 1          # update index of Activity column

meanStdData[,msActivityIndex] <- factor(meanStdData[,msActivityIndex],
                            levels = 1:nrow(activityLabels),
                            labels = activityLabels[,2])

### 
#  4) Appropriately label the data set with descriptive variable names.
#  
#     Many approaches can be taken.  The process I used is:
#
#     a. remove special characters () and -.
#        - remove any parenthesis characters "()"
#        - remove hyphen (dash) characters:  
#          For "...-mean", replace with "...Mean"
#          For "...-std", replace with "...StdDev"
#          For "...-X", replace with "...X"
#          For "...-y" or "...-Y", replace with "...Y"
#          For "...-Z", replace with "...Z"
#
#     b. for readability, replace abbreviations with words.
#        - the prefix "t" is replaced with "time" 
#        - the prefix "f" is replaced with "freq"
#        I could have used a similar process for mapping other abbreviations
#        into full words, but the column names quickly became long.
#
#     c. some column names contained an apparent error:  "...BodyBody...".
#        I changed them to simply "...Body...".
#
#     Note:  I used camel-case for the column names for readability, although Week 4's 
#            videos recommended all lower-case letters.  
#   
###

featureNames <- as.character(features[meanStdIndices,]$V2)

# remove the parenthesis characters "()".  Simply remove them.
featureNames <- gsub("\\(\\)", "", featureNames)

# remove hyphen characters.
featureNames <- gsub("-mean", "Mean", featureNames)
featureNames <- gsub("-std", "StdDev", featureNames)
featureNames <- gsub("-X", "X", featureNames)
featureNames <- gsub("-y", "Y", featureNames)
featureNames <- gsub("-Y", "Y", featureNames)
featureNames <- gsub("-Z", "Z", featureNames)

# replace the prefix "t" with "time" 
featureNames <- gsub("^t", "time", featureNames)

# replace the prefix "f" with "freq" 
featureNames <- gsub("^f", "freq", featureNames)

# fix what appears to be an error:  "BodyBody" should be just "Body"
featureNames <- gsub("BodyBody", "Body", featureNames)

# update the dataset with the new column names 
colnames(meanStdData) <- c(featureNames, "activity", "subject")

### 
#  5) From the dataset in step 4, create a second, independent tidy data set 
#     with the average of each variable for each activity and each subject.
###

# use function in library dplyr to summarize based on activity and subject.
df <- as.tbl(meanStdData)
groups <- group_by( df, subject, activity )
tidyData <- summarise_each(groups, funs(mean))

# Write out the summarized data to disk
write.table(tidyData, "tidy.txt", row.names = FALSE)

# to read in the submitted tidy dataset, 
# student_data <- read.table(file = "tidy.txt", header = TRUE)
#
