## Project Work
## Coursera Course Getting and Cleaning Data
## Week 04, 2017-07-23

## libraries
library(dplyr)

## load file
## if not exists download
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
## filename of zip based on URL
fzip <- sub("^http.*(getdata.*zip)$", "\\1", fileUrl)
## target extraction folder
fds <- "./UCI HAR Dataset/"

if (!(file.exists(fzip))) {
  download.file(fileUrl, destfile = f, method = "auto")
  unzip(f)
}

## read activity labels and feature list
act <- read.csv(paste0(fds, "activity_labels.txt"), header = FALSE, sep = "", stringsAsFactors = FALSE)
fea <- read.csv(paste0(fds, "features.txt"), header = FALSE, sep = "", stringsAsFactors = FALSE)

## function merges files in a given folder (train or test)
## returns dataframe
files2df <- function(folder = "train") {
  ## read subjects, features and activities
  df_sub <- read.csv(paste0(fds, folder, "/subject_", folder, ".txt"), header = FALSE,
                     col.names = "subject", colClasses = "integer")
  df_act <- read.csv(paste0(fds, folder, "/y_", folder, ".txt"), header = FALSE,
                     col.names = "activity", colClasses = "factor")
  levels(df_act[, 1]) <- act[, 2]

  df_fea <- read.csv(paste0(fds, folder, "/X_", folder, ".txt"), 
                     header = FALSE, sep = "", col.names = fea[, 2], 
                     check.names = FALSE, colClasses = "numeric")

  ## only means and standard deviations of features => mean() or std() in col name
  df_fea <- df_fea[, grep("mean\\(\\)|std\\(\\)", names(df_fea))]
  
  ## merge data frames to one and return
  df_all <- cbind(df_sub, df_act, df_fea)
  return(df_all)
}

## get merged data sets
df_train <- files2df(folder = "train")
df_test <- files2df(folder = "test")

## Create complete set
df_complete <- rbind(df_train, df_test)

## 2nd set for each subject and activity
df_means <- df_complete %>% group_by(subject, activity) %>% summarize_each(funs(mean))

## tidy up column names
names(df_means) <- sub("()", "", names(df_means), fixed = TRUE)

## write output
write.table(df_means, file = "subject_activity_mean.txt", row.names = FALSE)
