#---------------------------------------------------------
# This script loads and processes data files from the Human Activity Recognition 
# Using Smartphones Data Set. To run correctly, this script must be loaded into 
# and run from the directory where the data is located.
#
# This script produces an output file in the working directory. It can be
# read using read.table("SamsungDataAnalysis.csv", header = TRUE)
#
# For additional details, please consult the README file associated with this
# script.

#Load necessary libraries
library(dplyr)

# Read in the data
x_train <- read.table("./train/X_train.txt", header=FALSE)
subject_train <- read.table("./train/subject_train.txt", header=FALSE, sep = " ")
y_train <- read.table("./train/y_train.txt", header=FALSE)
x_test <- read.table("./test/X_test.txt", header=FALSE)
subject_test <- read.table("./test/subject_test.txt", header=FALSE, sep = " ")
y_test <- read.table("./test/y_test.txt", header=FALSE)
activity_labels <- read.table("./activity_labels.txt", header=FALSE)
features <- read.table("./features.txt", header=FALSE)

#Combine test and train data for subject, x, and y data frames and convert to
#tbl_df for use with dplyr. Train comes first because it's the larger of the two
#types of data frames
y_train <- tbl_df(rbind(y_train, y_test))
subject_train <- tbl_df(rbind(subject_train, subject_test))
x_train <- tbl_df(rbind(x_train, x_test))

#identify which variables in features contain either the mean or std
selected_features <- grep("mean\\(|std\\(",features$V2)                              

#apply variables names to the measurements
features <- as.vector(features[,2])
features <- make.names(features, unique=TRUE, allow_=TRUE)
features <- gsub("\\.","",features) #strip . from variable names
colnames(x_train) <- c(features)
colnames(y_train) <- "Activity_id"
colnames(subject_train) <- "Subject_id"
colnames(activity_labels) <- c("Activity_id", "Activity")

#append the numerical data in y_test and y_train with human-readable data.  
subject_train <- cbind(subject_train, y_train)

#select only the measurements requested from x data frame
skinny_x <- select(x_train, selected_features)

#combine the test data together in a single data frame
combined_data <- cbind(subject_train, skinny_x)

combined_data <- merge(combined_data,activity_labels, sort=FALSE)

#group by subject and activity
combined_data <- group_by(combined_data, Subject_id, Activity)

#create a new data frame that outputs the average of every variable, grouped by
#subject and activity
output <- summarise_each(combined_data, funs(mean), tBodyAccmeanX:fBodyBodyGyroJerkMagstd)

#write to file
write.table(output,"SamsungDataAnalysis.txt", row.name=FALSE)
