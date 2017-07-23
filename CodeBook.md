---
title: "CodeBook"
author: "R. Molkenthin"
date: "23 Juli 2017"
output: html_document
---

# Codebook UCI HAR Dataset processed for Coursera Project

## Raw data: Sources
### General sources
- source: feature.txt
- usage: list of features is used as column names in final dataset
- format: characters
- transformation: none

- source: activity_labels.txt
- usage: list of activities used as levels for activity in final dataset
- format: characters
- transformation: none

### Train and Test sources
The following data sources are found in the folder train and test. They are having the same structure.

- source: subject_(train|test).txt
- usage: subject id related to data rows in X and y
- format: integer

- source: y_(train|test).txt
- usage: activity
- format: integer

- source: X_(train|test).txt
- usage: measurements for each feature
- format: numeric

## Data Load
### General sources load
Activity and feature are loaded as their final data type.

### Train and Test data load
The train and test data is loaded as 
- subject (integer)
- y as activity(factor with levels based on activity_labels.txt)
- X as feature measurements (numeric)

## Transformations
1. Activities data (y) is joined with activity descriptions as levels
2. Feature data subset matching only mean() or std() measurements based on column name provided by feature.txt
3. For train and test sets subject data, activity (y) and subset of feature measurements (X) is merged
4. Train and test data is concatenated to one dataset
5. Data reduction by grouping by subject and activity and calculating the mean of every columns based on grouping
6. Tidy up variable names by removing () but keeping the reference to std or mean variable in sources

## Complete Variable list
subject,"integer"

activity, "factor", levels: "WALKING" "WALKING_UPSTAIRS" "WALKING_DOWNSTAIRS" "SITTING" STANDING" "LAYING"

tBodyAcc-mean-X,"numeric"

tBodyAcc-mean-Y,"numeric"

tBodyAcc-mean-Z","numeric"

tBodyAcc-std-X","numeric"

tBodyAcc-std-Y","numeric"

tBodyAcc-std-Z","numeric"

tGravityAcc-mean-X","numeric"

tGravityAcc-mean-Y","numeric"

tGravityAcc-mean-Z","numeric"

tGravityAcc-std-X","numeric"

tGravityAcc-std-Y","numeric"

tGravityAcc-std-Z","numeric"

tBodyAccJerk-mean-X","numeric"

tBodyAccJerk-mean-Y","numeric"

tBodyAccJerk-mean-Z","numeric"

tBodyAccJerk-std-X","numeric"

tBodyAccJerk-std-Y","numeric"

tBodyAccJerk-std-Z","numeric"

tBodyGyro-mean-X","numeric"

tBodyGyro-mean-Y","numeric"

tBodyGyro-mean-Z","numeric"

tBodyGyro-std-X","numeric"

tBodyGyro-std-Y","numeric"

tBodyGyro-std-Z","numeric"

tBodyGyroJerk-mean-X","numeric"

tBodyGyroJerk-mean-Y","numeric"

tBodyGyroJerk-mean-Z","numeric"

tBodyGyroJerk-std-X","numeric"

tBodyGyroJerk-std-Y","numeric"

tBodyGyroJerk-std-Z","numeric"

tBodyAccMag-mean","numeric"

tBodyAccMag-std","numeric"

tGravityAccMag-mean","numeric"

tGravityAccMag-std","numeric"

tBodyAccJerkMag-mean","numeric"

tBodyAccJerkMag-std","numeric"

tBodyGyroMag-mean","numeric"

tBodyGyroMag-std","numeric"

tBodyGyroJerkMag-mean","numeric"

tBodyGyroJerkMag-std","numeric"

fBodyAcc-mean-X","numeric"

fBodyAcc-mean-Y","numeric"

fBodyAcc-mean-Z","numeric"

fBodyAcc-std-X","numeric"

fBodyAcc-std-Y","numeric"

fBodyAcc-std-Z","numeric"

fBodyAccJerk-mean-X","numeric"

fBodyAccJerk-mean-Y","numeric"

fBodyAccJerk-mean-Z","numeric"

fBodyAccJerk-std-X","numeric"

fBodyAccJerk-std-Y","numeric"

fBodyAccJerk-std-Z","numeric"

fBodyGyro-mean-X","numeric"

fBodyGyro-mean-Y","numeric"

fBodyGyro-mean-Z","numeric"

fBodyGyro-std-X","numeric"

fBodyGyro-std-Y","numeric"

fBodyGyro-std-Z","numeric"

fBodyAccMag-mean","numeric"

fBodyAccMag-std","numeric"

fBodyBodyAccJerkMag-mean","numeric"

fBodyBodyAccJerkMag-std","numeric"

fBodyBodyGyroMag-mean","numeric"

fBodyBodyGyroMag-std","numeric"

fBodyBodyGyroJerkMag-mean","numeric"

fBodyBodyGyroJerkMag-std","numeric"