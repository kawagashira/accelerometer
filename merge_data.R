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
