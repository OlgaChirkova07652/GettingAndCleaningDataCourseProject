# Download the data
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./Dataset.zip",method="curl")

#Unzip the data 
unzip(zipfile="./Dataset.zip",exdir="./data")

#Load required packages
library(dplyr)
library(plyr)

# Load raw data
features <- read.table("./data/UCI HAR Dataset/features.txt", colClasses = c("character"))
activity_labels <- read.table("./data/UCI HAR Dataset/activity_labels.txt", 
                              col.names = c("ActivityId", "Activity"))
x_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./data/UCI HAR Dataset/train/Y_train.txt")
subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")
x_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./data/UCI HAR Dataset/test/Y_test.txt")
subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")
# 1. Merges the training and the test sets to create one data set.
# Binding data
train_data <- cbind(cbind(x_train, subject_train), y_train)
test_data <- cbind(cbind(x_test, subject_test), y_test)
data <- rbind(train_data, test_data)
#Label columns
labels <- rbind(rbind(features, c(562, "Subject")), c(563, "ActivityId"))[,2]
names(data) <- labels
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.

data_mean_std <- data[,grepl("-(mean|std)\\(\\)|Subject|ActivityId", 
                                                 names(data))]
#3. Uses descriptive activity names to name the activities in the data set

data_mean_std2 <- merge(data_mean_std, activity_labels, by = "ActivityId")
#Remove the column "ActivityId"
data_mean_std2 <- data_mean_std2[,-1]
# 4. Appropriately labels the data set with descriptive names.
# Remove parentheses
names(data_mean_std2) <- gsub('\\(|\\)',"",names(data_mean_std2), perl = TRUE)
# Make syntactically valid names
names(data_mean_std2) <- make.names(data_mean_std2))
# Make clearer names
names(data_mean_std2) <- gsub('Acc',"Acceleration",names(data_mean_std2))
names(data_mean_std2) <- gsub('GyroJerk',"AngularAcceleration",names(data_mean_std2))
names(data_mean_std2) <- gsub('Gyro',"AngularSpeed",names(data_mean_std2))
names(data_mean_std2) <- gsub('Mag',"Magnitude",names(data_mean_std2))
names(data_mean_std2) <- gsub('^t',"TimeDomain.",names(data_mean_std2))
names(data_mean_std2) <- gsub('^f',"FrequencyDomain.",names(data_mean_std2))
names(data_mean_std2) <- gsub('\\.mean',".Mean",names(data_mean_std2))
names(data_mean_std2) <- gsub('\\.std',".StandardDeviation",names(data_mean_std2))
names(data_mean_std2) <- gsub('Freq\\.',"Frequency.",names(data_mean_std2))
names(data_mean_std2) <- gsub('Freq$',"Frequency",names(data_mean_std2))

# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
tidydata = ddply(data_mean_std2, c("Subject","Activity"), numcolwise(mean))
write.table(tidydata, file = "tidydata.txt")
