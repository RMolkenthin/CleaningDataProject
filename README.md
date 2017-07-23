---
title: "README"
author: "R. Molkenthin"
date: "23 Juli 2017"
output: html_document
---

# Description of run_Analyis.R
The following chapters are describing how the script run_Analysis.R is processing the data files to output the subject_activity_mean.txt.

## Loading data file
The script checks if the zip file is available or not. If not the zip will be downloaded and unzipped.
Comment: The file name is taken out of the URL just in case the URL/filename changes later

## Loading activity labels and feature names
Both data set from activity_labels.txt and features.txt are loaded and stored in a separate data frame to provide later the activity levels and the names for the variable in the data sets

## Merging data
In general the structure of the datasets are the same and differ only in the name of the folder and the suffix train or test of each file. Since the data handling is the same a function file2df is written with the parameter folder (train or test)

The base directory was already stored in the fds variable.

### function file2df
1. The function loads the subject_*.txt and sets the class to integer representing the user id.
2. The activities (y_*.txt) are loaded in a specific data frame as factor and the levels are given based on the activity data frame (act)
3. Last the data from X_*.txt is loaded to a new data frame representing the feature data. The class is set to numeric and the column names are taken from the feature list (fea)
4. In the feature data dataframe only these columns are selected matching either mean() or std() in the column name.
5. Finally all single data frames are combined to one and returned (df_all).

### Loading train data
The function file2df is called with the parameter folder="train" to process the train data set. The result is stored in a data frame.

### Loading test data
The function file2df is called with the parameter folder="test" to process the test data set. The result is stored in a data frame.

### Merging train and test data sets
Both data frames are combined to a complete data set, i.e. the test set is appended to the train set.

### Averages of features
For the last part the package dplyr is used. The dataset is grouped by user and activity and for each feature a mean is calculated. 
The variables names are cleaned by removing "()" off the name. mean and std need to be kept to have the reference to the original value. 
The final result is stored in subject_activity_mean.txt.
