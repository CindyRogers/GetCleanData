GetCleanData
============

This project is for Coursera's Getting And Cleaning Data course.

The project contains 3 elements:
* this README file, which describes how to run the script, and design decisions involved in the project implementation.
* a CodeBook.md file, which describes the data in the resulting tidy dataset.
* the run_analysis.R script, which transforms the raw data into tidy data.

In addition to these elements, the resulting tidy data set (file "tidy.txt") was submitted to Coursera separately.

### Running the Script
Pre-requisisites:
* The library dplyr is used by the script.
* The Samsung raw data must be located in the working directory.

The run_analysis.R script will convert the Samsung raw data into a tidy format, stored in a file named "tidy.txt".  To run the script, simply execute the run_analysis.R code.

To view the file in R, you can use the command:  student_data <- read.table(file = "tidy.txt", header = TRUE)

### Design Decisions
(1) Selecting / Omitting columns to meet the requirement:  "Extracts only the measurements on the mean and standard deviation for each measurement."  

I decided to use the columns whose names included "mean()" and "std()".  Other columns included the terms "mean" and "std" - in the form "...meanFreq()" and "angle(...Mean, ...Mean)" - and could possibly be candidates, but I decided to exclude them because they did not seem to be measurements on the mean and standard deviation.   

(2) Transforming Column names. 
I tried to balance readability with reasonable lengths for the column names.  For example, column names with the "f" prefix were changed to use the "freq" prefix; I could have changed the prefix to "frequency" but that would increase the length of the column names. 

Also, I decided to keep the camelCase format for the column names, to improve readability.  Week 4 lectures for the class recommend using all lower-case names, but I felt using camelCase made the column names more readable.

Transformations:
* Removed the parenthesis characters 
* Removed the hyphen (dash) characters, and changed the next character in the name to upper-case.  
* Replaced "std" with "StdDev" (typically was "-std()", which was replaced by "StdDev" due to above rules).
* Replaced "t" prefix with "time".
* Replaced "f" prefix with "freq".
* Corrected some column names which contained "BodyBody" to have only "Body".

### Program Logic 
The run_analysis.R script processes the following raw data files (located in the working directory): 

* features.txt 
* activity_labels.txt
* test/subject_test.txt 
* test/X_test.txt
* test/y_test.txt
* train/subject_train.txt
* train/X_train.txt
* train/y_train.txt

(1) Merges the raw data into one data set.    

(2) Extracts only the measurements on the mean and standard deviation for each measurement.   The Design Decision #1 section above describes the columns which were selected/omitted from the resulting data set.

(3) Uses descriptive activity names to name the activities in the data set.   

(4) Appropriately labels the data set with descriptive variable names.  The Design Decision #2 section above describes the mapping process that I used in this step.  

(5) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.  The new data set is written to a text file named "tidy.txt". 







