setwd("project4")
fileziped <- "getdata_dataset.zip"

## Download and unzip the dataset:
if (!file.exists(fileziped)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "
  download.file(fileURL, fileziped,mode = "wb")
}  
if (!file.exists("UCI HAR Dataset")) { 
  unzip(fileziped) 
}

# Load activity labels + features
activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt")
activityLabels[,2] <- as.character(activityLabels[,2])
features <- read.table("UCI HAR Dataset/features.txt")
features[,2] <- as.character(features[,2])

# Extract subsets from the Data only on mean and standard deviation out of the 561 obs in features
#Edit the names
featuresNeeded <- grep(".*mean.*|.*std.*", features[,2])
featuresNeeded.names <- features[featuresNeeded,2]
featuresNeeded.names <- gsub('-mean', 'Mean', featuresNeeded.names)
featuresNeeded.names <- gsub('-std', 'Std', featuresNeeded.names)
featuresNeeded.names <- gsub('[-()]', '', featuresNeeded.names)


# Load the datasets in to R with the subseted columns from train data
train <- read.table("UCI HAR Dataset/train/X_train.txt")[featuresNeeded]#reads only subseted columns 
train_Activities <- read.table("UCI HAR Dataset/train/Y_train.txt")
train_Subjects <- read.table("UCI HAR Dataset/train/subject_train.txt")
train <- cbind(trainSubjects, trainActivities, train)

test <- read.table("UCI HAR Dataset/test/X_test.txt")[featuresNeeded]
test_Activities <- read.table("UCI HAR Dataset/test/Y_test.txt")
test_Subjects <- read.table("UCI HAR Dataset/test/subject_test.txt")
test <- cbind(test_Subjects, test_Activities, test)

# merge datasets and add labels
Data <- cbind(train, test)
colnames(Data) <- c("subject", "activity", featuresNeeded.names)

# turn activities & subjects into factors
Data$activity <- factor(Data$activity, levels = activityLabels[,1], labels = activityLabels[,2])
Data$subject <- as.factor(Data$subject)

Data.melted <- melt(Data, id = c("subject", "activity"))
Data.mean <- dcast(Data.melted, subject + activity ~ variable, mean)

write.table(Data.mean, "tidy_Data.txt", row.names = FALSE, quote = FALSE)