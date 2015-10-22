==================================================================
The run_analysis.R script will be pullling 8 files from 3 subdirectories and transform them into 1 tidy dataset.

The data to be consolidated are from the experiments perfomed by 30 volunteers , doing 6 activities(WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist.


Multiple files will come from 3 subdirectories of the working directory

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

==================================================================
2 R packages will be used in the project

install.packages("dplyr")
install.packages("sqldf")