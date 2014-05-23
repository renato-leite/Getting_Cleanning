Getting and Cleanning Data Repo
=================

This is a repository for the Getting and Cleanning Data course.

The project consists in create a tidy data from the files in:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

* This is the README.md file, that explains the files in this repo, and how they are connected.
* The run_analysis.R file contains the code for all the process.
* The CodeBook.md describes the variables, the data, and any transformations or work that you performed to clean up the data.
 
To execute the run_analysis.R you are supposed to set the R's Work Directory as a paste that contais the files:

* features.txt - Wich contains the names of the measures of the experiment
* features_info.txt - Wich describes the measures of the file above
* activity_labels.txt - Wich contains de codification for each  possible action
* train/subject_train.txt - Identifies the subject that produced the training measures
* train/X_train.txt -  The trainning measures
* train/y_train.txt - The coded register of what action produced the trainning measures
* test/subject_test.txt - Identifies the subject that produced the test measures
* test/X_test.txt - The test measures
* test/y_test.txt - The coded register of what action produced the test measures


The analysis starts with the importation of all the files above, except features_info.
The train files are concatenated (A), as well as the test files (B). The columns receive temporary label.
Both datasets are merged, creating only one big data set (Base).
A new dataset is created selecting only the useful measures from the previous one (NewBase).
To identify each combination of action and subject a vector (CAT) is created.
The current dataset is split according to the vector CAT creating SDT.
The averege os all the measures is calculated for each activity and each subject TD.
The activities labels are merged to the dataset creating the Tidy dataset.
English like descriptive activity names are given to the measures and activities in the data set.
The tidy dataset is ordered in a more intuitive form.
The tidy data is exported.

