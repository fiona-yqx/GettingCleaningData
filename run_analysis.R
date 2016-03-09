#Load Packages
library(dplyr)
library(stringr)
library(tidyr)

debug_on <- F

# Loading Data
a.labels <- read.table("UCI HAR Dataset/activity_labels.txt", sep = " ")
a.labels <- rename(a.labels, label = V1, activity = V2)


features <- read.table("UCI HAR Dataset/features.txt", sep = " ")
features <- rename(features, no = V1, feature = V2)


subject.test <- read.table("UCI HAR Dataset/test/subject_test.txt")
names(subject.test) <- "subject"
x.test <- read.table("UCI HAR Dataset/test/X_test.txt", header = F)
y.test <- read.table("UCI HAR Dataset/test/y_test.txt", header = F)

subject.train <- read.table("UCI HAR Dataset/train/subject_train.txt")
names(subject.train) <- "subject"
x.train <- read.table("UCI HAR Dataset/train/X_train.txt", header = F)
y.train <- read.table("UCI HAR Dataset/train/y_train.txt", header = F)

# 1. Merges the training and the test sets to create one data set.
X <- rbind(x.train, x.test)
Y <- rbind(y.train, y.test)
subject <- rbind(subject.test, subject.train)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
colnames(X) <- as.character(features[,2])
x <- X[, grep("mean|std", features[, 2])]

# 3. Uses descriptive activity names to name the activities in the data set
final <- cbind(x, Y)
final <- cbind(x, Y, subject)
final <- rename(final, label = V1)
final <- merge(final, a.labels, by = "label")

# 4.Appropriately labels the data set with descriptive variable names.
var.names <- colnames(final)
var.names <- gsub("\\(\\)", "", var.names)
var.names <- gsub("mean", "Mean", var.names)
var.names <- gsub("std", "StandardDeviation", var.names)
var.names <- gsub("^(t)","Time",var.names)
var.names <- gsub("^(f)","Frequency",var.names)
var.names <- gsub("([Gg]ravity)","Gravity",var.names)
var.names <- gsub("([Bb]ody[Bb]ody|[Bb]ody)","Body",var.names)
var.names <- gsub("[Gg]yro","Gyro",var.names)
var.names <- gsub("AccMag","AccMagnitude",var.names)
var.names <- gsub("([Bb]odyaccjerkmag)","BodyAccJerkMagnitude",var.names)
var.names <- gsub("JerkMag","JerkMagnitude",var.names)
var.names <- gsub("GyroMag","GyroMagnitude",var.names)
var.names <- gsub("[Aa]cc", "Accerleration", var.names)

# 5.Create a second, independent tidy data set with the average of each variable for each activity and each subject. 

summary <- group_by(final, subject, activity)
summary <- summarise_each(summary, funs(mean))

write.table(summary, "tidy.txt", row.names = T)
