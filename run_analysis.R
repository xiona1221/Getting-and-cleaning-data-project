library(plyr)

# Merges the training and the test sets to create one data set
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "./data/smartphone.zip")
unzip(zipfile="./data/smartphone.zip",exdir="./data")
list <- file.path("./data" , "UCI HAR Dataset")
files<-list.files(list, recursive=TRUE)
files

train <- read.table(file.path(list, "train", "X_train.txt"))
train_label <- read.table(file.path(list, "train", "y_train.txt"))
train_subject <- read.table(file.path(list, "train", "subject_train.txt"))

test <- read.table(file.path(list, "test" , "X_test.txt" ))
test_label <- read.table(file.path(list, "test" , "y_test.txt" ))
test_subject <- read.table(file.path(list, "test" , "subject_test.txt"))

prepare <- rbind(train,test)
label <- rbind(train_label, test_label) 
subject <- rbind(train_subject, test_subject)

# Extracts only the measurements on the mean and standard deviation for each measurement
 
features <- read.table(file.path(list, "features.txt"))
features_subset <- prepare[,grep("mean\\(\\)|std\\(\\)", features[, 2])]
names(features_subset) <- features[grep("(mean|std)\\(\\)", features[, 2]), 2]

# Uses descriptive activity names to name the activities in the data set

activities <- read.table(file.path(list, "activity_labels.txt")) 
label[,1] <- activities[label[,1],2]
names(label) <- "activity"

# Appropriately labels the data set with descriptive variable names

names(subject) <- "subject"  
all <- cbind(features_subset, label, subject) 

# From the data set in previous datast, creates a second, independent tidy data set with the average of each variable for each activity and each subject

tidy <- ddply(all, .(subject, activity), function(x) colMeans(x[, 1:66])) 
write.table(tidy, "tidy.txt", row.name=FALSE) 