## This script will collect data from 8 different scripts and combine them into 1 tidy dataset.
## created on 10/16/2015


#############################################
## Lookup tables
a_features <- read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/features.txt")
a_activity <- read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/activity_labels.txt")

## Experiment train data 
a_tr_subject <- read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt")
a_tr_x <- read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt")
a_tr_y <- read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/y_train.txt")


## Experiment test data
a_ts_subject <- read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt")
a_ts_x <- read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt")
a_ts_y <- read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/y_test.txt")
#############################################
## Install R packages needed for this project

install.packages("dplyr")
library(dplyr)

install.packages("sqldf")
library(sqldf)

#############################################
## ---------DATA MANIPULATION---------------
##This will pull the features description
getname <- a_features[, 2]

## Combine the Train and Test data
combined_x_data <- tbl_df(rbind(a_ts_x,a_tr_x))
names(combined_x_data) <- getname

## Allow header to have duplicate names
names(combined_x_data) <- make.names(names = names(combined_x_data),unique= TRUE, allow_ = TRUE)

## Pull only variables that pertains to standard deviations and means
mean_std_data_only <- tbl_df(cbind(select(combined_x_data,contains("std")),select(combined_x_data,contains("mean"))))


##---------ACTIVITIES----------------------

## Combine activities from test and train data
combined_y_data <- tbl_df(rbind(a_ts_y,a_tr_y))

## Pull only Activity descriptions
y_data <- sqldf("select a_activity.V2 from combined_y_data inner join a_activity where combined_y_data.V1 = a_activity.V1")
names(y_data) = "Activities"



##---------SUBJECT-------------------------

## Combine subjects from test and train data
combined_subject_data <- tbl_df(rbind(a_ts_subject,a_tr_subject))
names(combined_subject_data) <- "Subject"


#############################################
## CONSOLIDATE THE 3 information into 1 tidy dataset (subject, activities and data)
## Merge the training and test data
all_data <- tbl_df(cbind(combined_subject_data,y_data,mean_std_data_only))

## Compute the mean per subject and activities
all_data_average <- tbl_df(aggregate(all_data[,3:88],list(all_data$Subject,all_data$Activities),mean))

#############################################

##Display the tidy datasets
all_data
all_data_average

## Export the dataset
write.table(all_data_average, file = "./all_data_average.txt", row.name = FALSE)



 


 