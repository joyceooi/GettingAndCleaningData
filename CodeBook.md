This file consists of data source and variables descriptions used in the script run_analysis.R

# Data Source
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

# Variables
### TestActivity
* data from y_test.txt
* class = data frame

### TrainActivity
* data from y_train.txt 
* class = data frame

### TestSubject
* read data from subject_test.txt
* class = data frame

### TrainSubject
* data from subject_train.txt
* class = data frame

### TestData
* read data from X_test.txt
* class = data frame

### TrainData
* read data from X_train.txt
* class = data frame

### Subject
* combine TestSubject and TrainSubject
* class = data frame

### Activity
* combine TestActivity and TrainActivity
* class = data frame

### Data
* combine TestData and TrainData
* class = data frame

### Subject_Activity
* combine Subject and Activity
* class = data frame

### MergeData
* combine Subject_Activity and Data
* class = data frame

### Features
* read data from features.txt
* class = data frame

### ExtractFeatures
* List of features with mean and standard deviation
* class = factor

### ExtractData
* subset of MergeData with only columns of ExtractFeatures, "subject" and "activity"
* class = data frame

### ActivityLabels
* read data from activity_labels.txt
* class = data frame

### TidyData
* tidy data with descriptive variable names

