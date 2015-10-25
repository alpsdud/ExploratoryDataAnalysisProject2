Running the run_analysis.R script will produce 180 records with 88 variables.  The objective is to consolidate 8 different files and transform them into 1 tidy dataset.
Merges the training and the test sets to create one data set.
-- Use the rbind function to combine the data from X_test.txt and X_train.txt.

Extracts only the measurements on the mean and standard deviation for each measurement. 
-- Use the cbind function, select/contain dplyr function to pulll only standard deviation and mean data.  

Uses descriptive activity names to name the activities in the data set
Appropriately labels the data set with descriptive variable names
-- Use the rbind function to combine the data from y_test.txt and y_train.txt. Use the sqldf function to pull the activity description.

From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
-- Use the aggregate function to return the mean of each variable

--====================================================================
Files will come from 3 subdirectories in the working directory.
Multiple files will come from 3 subdirectories of the working directory


-- These tables contain 
A) "./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/" 
	 features.txt
	 activity_labels.txt



B) "./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/"
	subject_test.txt   
	X_test.txt
	y_test.txt

C) "./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/"
	subject_train.txt
	X_train.txt
	y_train.txt
--====================================================================
Install R packages needed for this project

install.packages("dplyr")
library(dplyr)

install.packages("sqldf")
library(sqldf)



--====================================================================
Variables

1) Subject
	1 to 30. 30 volunteers

2)Activities
	WALKING
 	WALKING_UPSTAIRS
	WALKING_DOWNSTAIRS
	SITTING
	STANDING
	LAYING

3- 88) Experimental data

Variable Meaning
t  = denotes time 
f = indicate frequency domain signals
Acc = Acceleration
Gyro = GyroScope
std = Standard Deviation
mean = Mean value
mag = Magnitude
XYZ = 3-axial signals in the X, Y and Z directions
angle = Angle between to vectors
	

tBodyAcc.std...X
tBodyAcc.std...Y
tBodyAcc.std...Z
tGravityAcc.std...X
tGravityAcc.std...Y
tGravityAcc.std...Z
tBodyAccJerk.std...X
tBodyAccJerk.std...Y
tBodyAccJerk.std...Z
tBodyGyro.std...X
tBodyGyro.std...Y
tBodyGyro.std...Z
tBodyGyroJerk.std...X
tBodyGyroJerk.std...Y
tBodyGyroJerk.std...Z
tBodyAccMag.std..
tGravityAccMag.std..
tBodyAccJerkMag.std..
tBodyGyroMag.std..
tBodyGyroJerkMag.std..
fBodyAcc.std...X
fBodyAcc.std...Y
fBodyAcc.std...Z
fBodyAccJerk.std...X
fBodyAccJerk.std...Y
fBodyAccJerk.std...Z
fBodyGyro.std...X
fBodyGyro.std...Y
fBodyGyro.std...Z
fBodyAccMag.std..
fBodyBodyAccJerkMag.std..
fBodyBodyGyroMag.std..
fBodyBodyGyroJerkMag.std..
tBodyAcc.mean...X
tBodyAcc.mean...Y
tBodyAcc.mean...Z
tGravityAcc.mean...X
tGravityAcc.mean...Y
tGravityAcc.mean...Z
tBodyAccJerk.mean...X
tBodyAccJerk.mean...Y
tBodyAccJerk.mean...Z
tBodyGyro.mean...X
tBodyGyro.mean...Y
tBodyGyro.mean...Z
tBodyGyroJerk.mean...X
tBodyGyroJerk.mean...Y
tBodyGyroJerk.mean...Z
tBodyAccMag.mean..
tGravityAccMag.mean..
tBodyAccJerkMag.mean..
tBodyGyroMag.mean..
tBodyGyroJerkMag.mean..
fBodyAcc.mean...X
fBodyAcc.mean...Y
fBodyAcc.mean...Z
fBodyAcc.meanFreq...X
fBodyAcc.meanFreq...Y
fBodyAcc.meanFreq...Z
fBodyAccJerk.mean...X
fBodyAccJerk.mean...Y
fBodyAccJerk.mean...Z
fBodyAccJerk.meanFreq...X
fBodyAccJerk.meanFreq...Y
fBodyAccJerk.meanFreq...Z
fBodyGyro.mean...X
fBodyGyro.mean...Y
fBodyGyro.mean...Z
fBodyGyro.meanFreq...X
fBodyGyro.meanFreq...Y
fBodyGyro.meanFreq...Z
fBodyAccMag.mean..
fBodyAccMag.meanFreq..
fBodyBodyAccJerkMag.mean..
fBodyBodyAccJerkMag.meanFreq..
fBodyBodyGyroMag.mean..
fBodyBodyGyroMag.meanFreq..
fBodyBodyGyroJerkMag.mean..
fBodyBodyGyroJerkMag.meanFreq..
angle.tBodyAccMean.gravity.
angle.tBodyAccJerkMean..gravityMean.
angle.tBodyGyroMean.gravityMean.
angle.tBodyGyroJerkMean.gravityMean.
angle.X.gravityMean.
angle.Y.gravityMean.
angle.Z.gravityMean.




--====================================================================