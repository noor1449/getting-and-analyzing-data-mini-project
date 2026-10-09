zipUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
zipFile <- "UCI_HAR_Dataset.zip"

if (!file.exists(zipFile)) {
  download.file(zipUrl, destfile = zipFile, mode = "wb")
}

if (!file.exists("UCI HAR Dataset")) {
  unzip(zipFile)
}
# Step 1: Merges the training and the test sets to create one data set.
# Read supporting metadata
featureNames <- read.table("UCI HAR Dataset/features.txt", stringsAsFactors = FALSE)
activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))

# Read training data
subjectTrain <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
xTrain <- read.table("UCI HAR Dataset/train/X_train.txt")
yTrain <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code")

# Read test data
subjectTest <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
xTest <- read.table("UCI HAR Dataset/test/X_test.txt")
yTest <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "code")

# Combine train and test sets respectively
subjectData <- rbind(subjectTrain, subjectTest)
xData <- rbind(xTrain, xTest)
yData <- rbind(yTrain, yTest)

# Combine all data into a single merged data frame
colnames(xData) <- featureNames$V2
mergedData <- cbind(subjectData, yData, xData)
# Step 2: Extracts only the measurements on the mean and standard deviation for each measurement.
# Find columns that represent mean() or std()
selectedColumns <- grep("-(mean|std)\\(\\)", featureNames$V2)

# Subset mergedData to keep only subject, code, and the selected measurements
# Note: indices are +2 because subject and code take up the first two columns
subData <- mergedData[, c(1, 2, selectedColumns + 2)]
# Step 3: Uses descriptive activity names to name the activities in the data set
# Merge with activityLabels to replace numeric codes with descriptive names
subData$code <- activityLabels[subData$code, "activity"]
names(subData)[2] <- "activity"

# Step 4: Appropriately labels the data set with descriptive variable names.
currentNames <- names(subData)

currentNames <- gsub("^t", "Time", currentNames)
currentNames <- gsub("^f", "Frequency", currentNames)
currentNames <- gsub("Acc", "Accelerometer", currentNames)
currentNames <- gsub("Gyro", "Gyroscope", currentNames)
currentNames <- gsub("Mag", "Magnitude", currentNames)
currentNames <- gsub("BodyBody", "Body", currentNames)
currentNames <- gsub("-mean\\(\\)", "Mean", currentNames, ignore.case = TRUE)
currentNames <- gsub("-std\\(\\)", "StandardDeviation", currentNames, ignore.case = TRUE)
currentNames <- gsub("-", "", currentNames)

names(subData) <- currentNames

# Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
tidyData <- subData %>%
  group_by(subject, activity) %>%
  summarise(across(everything(), mean))

# Write the tidy data set to a text file
write.table(tidyData, "tidy_data.txt", row.name = FALSE)
print("Tidy dataset generated successfully as 'tidy_data.txt'!")