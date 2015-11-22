# This script does the following:
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. creates a second, independent tidy data set with the average of each variable for each activity and each subject.
# Notes: This script assume Samsung data is available at working directory
# Data Source: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## 1. Merges the training and the test sets to create one data set.
# Read data set
TestData  <- read.table("./UCI HAR Dataset/test/X_test.txt")
TrainData <- read.table("./UCI HAR Dataset/train/X_train.txt")

# Read activity
TestActivity <- read.table("./UCI HAR Dataset/test/y_test.txt")
TrainActivity <- read.table("./UCI HAR Dataset/train/y_train.txt")

# Read subject
TestSubject <- read.table("./UCI HAR Dataset/test/subject_test.txt")
TrainSubject <- read.table("./UCI HAR Dataset/train/subject_train.txt")

# Concatenate data tables by rows
Data <- rbind(TestData,TrainData)
Activity <- rbind(TestActivity,TrainActivity)
Subject <- rbind(TestSubject,TrainSubject)

# set names to data column
names(Subject) <- c("subject")
names(Activity) <- c("activity")
Features <- read.table("./UCI HAR Dataset/features.txt")
names(Data) <- Features$V2

# Concatenate data tables by columns
Subject_Activity <- cbind(Subject,Activity)
MergeData <- cbind(Subject_Activity,Data)

## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
ExtractFeatures <- Features$V2[grepl("mean|std", Features$V2)]
ExtractData = MergeData[,c(as.character(ExtractFeatures),"subject","activity")]

## 3. Uses descriptive activity names to name the activities in the data set
ActivityLabels <- read.table("./UCI HAR Dataset/activity_labels.txt")
ExtractData$activity <- ActivityLabels[ExtractData[,c("activity")],2]

## 4. Appropriately labels the data set with descriptive variable names.
names(ExtractData)<-gsub("^t", "time", names(ExtractData))
names(ExtractData)<-gsub("^f", "frequency", names(ExtractData))
names(ExtractData)<-gsub("Acc", "Accelerometer", names(ExtractData))
names(ExtractData)<-gsub("Gyro", "Gyroscope", names(ExtractData))
names(ExtractData)<-gsub("Mag", "Magnitude", names(ExtractData))

## 5. creates a second, independent tidy data set with the average of each variable for each activity and each subject.
TidyData<-aggregate(. ~subject + activity, ExtractData, mean)
TidyData<-TidyData[order(TidyData$subject,TidyData$activity),]
write.table(TidyData, file = "./tidydata.txt",row.name=FALSE)
