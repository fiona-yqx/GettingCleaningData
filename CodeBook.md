##1. Merges the training and the test sets to create one data set.
3 types of train data sets, measurements(x), labels(y) and subjects, were merged with the corresponding data set in "test" by rows. The resulted datasets were named X, Y, and subjects.

##2. Extracts only the measurements on the mean and standard deviation for each measurement.
Any column name in the measurement dataset(X) containing "mean" or "std" are selected.

##3. Uses descriptive activity names to name the activities in the data set
The data combined in step 1, the measurements(X), labels(Y) and subjects, were merged by columns. Activity IDs are then replaced by the corresponding activity labels.

##4. Appropriately labels the data set with descriptive variable names.
According to features_info.txt, abbrieviations in column names are replaced by a complete word. E.g. "Acc" replaced by "Accerleration", "JerkMag" replaced by "JerkMagnitude". 

##5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
With the dataset in step 4, group by subject, then activity. Then summarize the rest of the columns using the summarize() function.
