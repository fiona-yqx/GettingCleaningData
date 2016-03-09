# Complete dataset

## Merges the training and the test sets to create one data set.
The complete dataset, final, was created by merging the measurements(X, y) and subjects, in test and train dataset by columns, and then merging "test" and "train" datasets by rows.

##Extracts only the measurements on the mean and standard deviation for each measurement.
Any column name in the final dataset containing "mean" or "std" are selected.

##Uses descriptive activity names to name the activities in the data set
Activity IDs are then replaced by the corresponding activity labels.

##Appropriately labels the data set with descriptive variable names.
According to features_info.txt, abbrieviations in column names are replaced by a complete word. E.g. "Acc" replaced by "Accerleration", "JerkMag" replaced by "JerkMagnitude". 

##From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
With the dataset in step 4, group by subject, then activity. Then summarize the rest of the columns using the summarize() function.
