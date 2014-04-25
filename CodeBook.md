# CodeBook.md


## Data Source

The original data of accelerometer was downloaded from the following link:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

For the detailed description of the data, refer to the following link:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Dataset Directory

Dataset directory should be set to the directory called "data/".

## Merging the training and the test set

The merging procedure is as follows.
* Load X_train.txt, y_train.txt, and subject_train.txt and create a traing set.
* Load X_test.txt, y_test.txt, and subject_test.txt and create a test set.
* Append the test set to the training set, creating a df variable.
* Output df to the tab-delimitered file called "accelerometer.txt".

## Labeling

* Assign the value of activities to variable activity by reading activity_labels.txt file.

## Analytics

* Extract variables having mean() and std() in their variable labels.
* Obtain the table of average values for each activities and subjects.
* result variable indicates a table of average for each activities and subjects.
* Write the table to the file called average_table.txt.

# VARIABLE DESCRIPTION OF average_table.txt

Row vaiables show measurement of the data. Column variables show conditions of activity and subject.

## Column Variables

Activity were classified into 6 classes (WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING). Subjects (volunteers) were indicated as an integer. The column labels were shown as the form of activity and subject with a period symbol. For example, "WALKING.1" denotes the condition of WALKING and subject 1.

## Row
The feature label description should be referred to feature_info.txt in the original data source.
