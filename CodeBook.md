##Source:
Jorge L. Reyes-Ortiz(1,2), Davide Anguita(1), Alessandro Ghio(1), Luca Oneto(1) and Xavier Parra(2)
1 - Smartlab - Non-Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova, Genoa (I-16145), Italy. 
2 - CETpD - Technical Research Centre for Dependency Care and Autonomous Living
Universitat Politècnica de Catalunya (BarcelonaTech). Vilanova i la Geltrú (08800), Spain
activityrecognition '@' smartlab.ws


##Data Set Information:
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

Check the README.txt file for further details about this dataset. 

##Attribute Information:
For each record in the dataset it is provided: 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

#Edits
##1. Merges the training and the test sets to create one data set.
3 types of train data sets, measurements(x), labels(y) and subjects, were merged with the corresponding data set in "test" by rows using rbind(). The resulted datasets were named X, Y, and subjects.

##2. Extracts only the measurements on the mean and standard deviation for each measurement.
Any column name in the measurement dataset(X) containing "mean" or "std" are selected using grep().

##3. Uses descriptive activity names to name the activities in the data set
The data combined in step 1, the measurements(X), labels(Y) and subjects, were merged by columns using cbind(). Activity IDs are then replaced by the corresponding activity labels using merge().

##4. Appropriately labels the data set with descriptive variable names.
According to features_info.txt, abbrieviations in column names are replaced by a complete word using gsub(). E.g. "Acc" replaced by "Accerleration", "JerkMag" replaced by "JerkMagnitude". 

##5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
With the dataset in step 4, group by subject using group_by(), then activity. Then summarize the rest of the columns using the summarize() function.
