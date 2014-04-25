#!/usr/bin/Rscript
#
#			run_analysis.R
#

## TRAIN DATA LOADING ##
x_train <- read.table('data/train/X_train.txt')
str(x_train)
y_train <- read.table('data/train/y_train.txt')
names(y_train) <- "activity"
str(y_train)
subject_train <- read.table('data/train/subject_train.txt')
str(subject_train)
names(subject_train) <- "subject"

train <- data.frame(x_train, y_train, subject_train)
str(train)

## TEST DATA LOADING ##
x_test <- read.table('data/test/X_test.txt')
str(x_test)
y_test <- read.table('data/test/y_test.txt')
names(y_test) <- "activity"
str(y_test)
subject_test <- read.table('data/test/subject_test.txt')
str(subject_test)
names(subject_test) <- "subject"

test <- data.frame(x_test, y_test, subject_test)
str(test)

## Append data ##
df <- data.frame(train)
df <- rbind(df, test)
str(df)

## Write Tidy Data ##
write.table(df, "accelerometer.txt")

## Labeling ##
features <- read.table("data/features.txt")
str(features)
index <- grep("(mean\\(\\)|std\\(\\))", features$V2)
index2 <- c(index, 562, 563)
index2
label <- features[ index, ]$V2
label <- gsub("-", ".", label)
label <- gsub("\\(\\)", "", label)
label
label2 <- c(label, "activity", "subject")
label2

## Extract data ##
d <- df[, index2]
names(d) <- label2
str(d)

## Acitivity Labels ##
act <- read.table("data/activity_labels.txt")
str(act)
d$activity <- factor(d$activity, labels = act$V2)

## Average of each activity and each subject ###
act.sub <- split(d, list(d$activity, d$subject), drop = TRUE)
result <- sapply(act.sub, function (x) colMeans(x[, 1:length(label)]))

## Write Average Data of Each Activities and Subjects ##
write.table(result, "average_table.txt")
