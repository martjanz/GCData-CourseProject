setwd("/Users/martianz/Cursos/3. Getting and Cleaning Data/Course Project")

# Download zipped dataset file
if (!file.exists("UCI HAR Dataset.zip")) {
    download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
                  destfile = "UCI HAR Dataset.zip")
}

# Unzip file
if (!file.exists("UCI HAR Dataset")) {
    unzip("UCI HAR Dataset.zip")
}

# Set working directory
setwd("UCI HAR Dataset")

# Read datasets
x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")
subject_test <- read.table("test/subject_test.txt")

# Label columns
names(y_test) <- "activity"
names(subject_test) <- "subject"

# Horizontally merge test datasets 
test <- cbind(x_test, y_test, subject_test)

# Remove unused objects
rm(x_test)
rm(y_test)
rm(subject_test)


# Load datasets
x_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")
subject_train <- read.table("train/subject_train.txt")

# Label columns
names(y_train) <- "activity"
names(subject_train) <- "subject"

# Horizontally merge train datasets
train <- cbind(x_train, y_train, subject_train)

# Remove unused objects
rm(x_train)
rm(y_train)
rm(subject_train)

# Merge test and train datasets
data <- rbind(test, train)

# Remove unused objects
rm(test)
rm(train)

# Merge columns names
column_names <- read.table("features.txt")
column_names <- rbind(column_names, data.frame(V1=length(column_names)+1, V2="activity"))
column_names <- rbind(column_names, data.frame(V1=length(column_names)+1, V2="subject"))

# Add columns names
colnames(data) <- column_names[,2]

# Remove unused objects
rm(column_names)

# List columns to keep (means & standard deviation)
selected_columns <- grep("mean()|std()|activity|subject", colnames(data))

# Keep only selected columns
data <- data[,selected_columns]

# Remove unused objects
rm(selected_columns)

# Replace activity numeric codes with corresponding factors
activities <- read.table("activity_labels.txt")
data$activity <- factor(data$activity, labels = activities$V2)
rm(activities)

# Average of each variable by activity and subject
means <- aggregate(data[,1:79], list(data$activity, data$subject), mean)

# Rename group columns
colnames(means)[1] <- "activity"
colnames(means)[2] <- "subject"