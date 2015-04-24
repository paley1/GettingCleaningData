setwd("~/R_coursera/GettingData")
#part1
#Merges the training and the test sets to create one data set.
library(plyr)

x.train<-read.table("project Dataset/train/X_train.txt")
y.train<-read.table("project Dataset/train/y_train.txt")
subject.train <- read.table("project Dataset/train/subject_train.txt")

x.test <- read.table("project Dataset/test/X_test.txt")
y.test <- read.table("project Dataset/test/y_test.txt")
subject.test <- read.table("project Dataset/test/subject_test.txt")

# create 'x' data set
x.data <- rbind(x.train, x.test)
# create 'y' data set
y.data <- rbind(y.train, y.test)
# create 'subject' data set
subject.data <- rbind(subject.train, subject.test)

#part2
#Extracts only the measurements on the mean and standard deviation for each measurement.

features <- read.table("project Dataset/features.txt")

mean.std.features <- grep("-(mean|std)\\(\\)", features[, 2])#obtain only those with mean or std in name

x.data <- x.data[, mean.std.features]#subset for only those columns

names(x.data) <- features[mean.std.features, 2]#add right column names

#part3
#Uses descriptive activity names to name the activities in the data set.
activities <- read.table("project Dataset/activity_labels.txt")

y.data[, 1] <- activities[y.data[, 1], 2]

# correct column name
names(y.data) <- "Activity"

#part4
#Appropriately labels the data set with descriptive variable names. 
names(subject.data) <- "Subject"

#combine all the datasets in one
all.data <- cbind(x.data, y.data, subject.data)

#part 5
#From the data set in part 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

average.data <- ddply(all.data, .(Subject, Activity), function(x) colMeans(x[, 1:66]))
#68 total columns, but only first 66 are used as the last two are the Activity and Subject columns

write.table(average.data, "averagedata.txt", row.name=FALSE)
