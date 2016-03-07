library(dplyr)

#Load training and test data
train_data <- read.table("X_train.txt")
test_data <- read.table("X_test.txt")

#Load features (which describes the variables in train_data and test_data)
features <- read.table("features.txt")

#Select variables involving mean and standard deviation, but NOT meanFreq
train_data <- train_data[,grepl("mean[^F]|std", features$V2)]
test_data <- test_data[,grepl("mean[^F]|std", features$V2)]

#Merge training and test rows
combined_data <- rbind(train_data, test_data)

subjects <- rbind(read.table("subject_train.txt"), read.table("subject_test.txt"))
activities <- rbind(read.table("y_train.txt"), read.table("y_test.txt"))

subjects <- rename(subjects, subject=V1)
activities <- rename(activities, activity=V1)

#Add columns indicating which of 30 subjects and which of 6 activities each row involved
combined_data <- cbind(activities, combined_data)
combined_data <- cbind(subjects, combined_data)

#Make variable names descriptive
names(combined_data)[3:68] <- as.character(features[as.numeric(gsub("[A-Z]", "", names(combined_data)[3:68])),2])

combined_data <- arrange(combined_data, subject, activity)

activity_labels <- read.table("activity_labels.txt")

#Under activity, replace 1 through 6 with the activity that each number represents
combined_data[,2] <- as.character(activity_labels[combined_data[,2],2])

#Create new tidy data set, which gives the average of each of the 66 mean and std variables for
#each of the 180 subject-activity combinations
melted_data <- melt(combined_data, id.vars=c("subject", "activity"))
data_mean <- dcast(melted, subject + activity ~ variable, fun.aggregate=mean)

#Create .txt file of last tidy data set
write.table(data_mean, "tidy.txt", row.name=FALSE)