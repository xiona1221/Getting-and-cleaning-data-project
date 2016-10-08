README
The purpose of this project is to prepare tidy data that can be used for later analysis. The R script called run_analysis.R does the following:
1.	Downloaded and upziped the required dataset
2.	Read train, train_label, train_subject, test, test_label and test_subject dataset
3.	Merged train and test sets to create prepare dataset; merged train_label and test_label sets to create label dataset; merged train_subject and test_subject sets to create subject dataset
4.	Created features dataset and extracted only the measurements on the mean and standard deviation for each measurement
5.	Created activities dataset and used descriptive activity names to name the activities in the data set
6.	Created all dataset by merging prepare, features and activities sets and appropriately labeled the data set with descriptive variable names
7.	From the data set in step 6, created a second, independent tidy data set with the average of each variable for each activity and each subject
The output is the file tidy.txt
# Getting-and-cleaning-data-project
