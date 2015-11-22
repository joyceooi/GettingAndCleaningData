This is the course project for the Getting and Cleaning Data Coursera course.
The R script, run_analysis.R, does the following for Samsung data which is available at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Notes: This script assume Samsung data is available at working directory

## 1. Merges the training and the test sets to create one data set.
* Use read.table() command to read the text files into the variables(Activity, Subject and Data).
* Use rbind function to concatenate the data tables by rows.
* Set names to variables with names function.
* Use cbind function to combine columns for all data tables.

## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
* Use grepl function to get features consist of the word mean and std and assign to variable ActivityLabels.
* Subset the data with column name matching those in variable ActivityLabels.

## 3. Uses descriptive activity names to name the activities in the data set
* Read descriptive activity names from activity_labels.txt.
* Replace activity variable in Data using descriptive activity names.

## 4. Appropriately labels the data set with descriptive variable names.
* Use gsub function for pattern replacement to clean up the data labels.

## 5. creates a second, independent tidy data set with the average of each variable for each activity and each subject.
* Get the aggregated information with plyr package.
* Use write.table() using row.name=FALSE to generate text file, tidydata.txt.




