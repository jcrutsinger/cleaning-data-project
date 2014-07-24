## run_Analysis.R
## Created by: Joseph Crutsinger
## Date: 07/23/2014
## Course rprog-004

library(reshape2)

# Load data
subject_test <- read.table("./data/test/subject_test.txt")
X_test <- read.table("./data/test/X_test.txt")
y_test <- read.table("./data/test/y_test.txt")
subject_train <- read.table("./data/train/subject_train.txt")
X_train <- read.table("./data/train/X_train.txt")
y_train <- read.table("./data/train/y_train.txt")

# Load activity names
activity_labels <- read.table("./data/activity_labels.txt")


# Load feature names
features <- read.table("./data/features.txt")
headers <- features[,2]

# Name columns for test & train features
names(X_test) <- headers
names(X_train) <- headers

# Select only mean and std headers
mean_and_std <- grepl("mean\\(\\)|std\\(\\)", headers)

# Filter mean and std columns for test and train
X_test_mean_and_std <- X_test[,mean_and_std]
X_train_mean_and_std <- X_train[,mean_and_std]

# Merging all test and train rows
subject_all <- rbind(subject_test, subject_train)
X_all <- rbind(X_test_mean_and_std, X_train_mean_and_std)
y_all <- rbind(y_test, y_train)

# Combine all vectors/data.frames into 1 data.frame
merged <- cbind(subject_all, y_all, X_all)
names(merged)[1] <- "SubjectID"
names(merged)[2] <- "Activity"

# Aggregate by subjectid and activity
agg <- aggregate(. ~ SubjectID + Activity, data=merged, FUN = mean)

# Give better names for activities better names
agg$Activity <- factor(agg$Activity, labels=activity_labels[,2])

# Write out tidy data file
write.table(agg, file="./tidy_aggregate.txt", sep="\t", row.names=FALSE)
