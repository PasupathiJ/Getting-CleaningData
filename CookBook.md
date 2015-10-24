This is a code book that describes the variables, the data, and transformations applied on this data to get the tidy dataset.

##1. Raw Data

The dataset for this assignment represent data collected from the accelerometers from the Samsung Galaxy S smartphone.The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist.


The data for this project is obtained from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and extracted in the local folder.The local folder contains the following files and folders.

* activity_labels.txt - activity identifier and name of the activity performed. This file is used to map the descriptive activity names in the transformation step

* features_info.txt - Details of features in the dataset. This file is to understand more about the data and not used in the transformation

* features.txt- File containing names of the features. This file is used to create the column names in the dataset

* test folder- containing test data
 * * test/subject_test.txt - subject id for the test data
 * * test/X_test.txt - measurements for the test subjects for the features mentioned in features.txt
 * * test/y_test.txt - activity performed by the subject for each observation

* train folder - containing training data
*  * train/subject_test.txt - subject id for the train data
* *  train/X_test.txt - measurements for the train subjects for the features mentioned in features.txt
* * train/y_test.txt - activity performed by the subject for each observation


##2. Transformation

* load activity names and feature names
* * change duplicates in feature names using make names

* read test data - subject_test.txt and X_test and y_text.txt
* * assign colnames to each data frame
* * use cbind and merge the three data frames to create test data frame

* read train data - subject_train.txt and X_train and y_train.txt
* * assign colnames to each data frame
* * use cbind and merge the three data frames to create test data frame

* use rbind ( row bind) and combine train data and test data to create combined data set

* extract only the columns with mean() and std() using select function in dplyr
* replace the activity id with activity name using left join of dataframewithMeanandSd and activities data frame and drop the activity id column

* make descriptive column names by replacing abbreviations to expanded lables using substitution

* group the data set by subject and activity

* calculate the mean for each variable

* write the tidy data set as output2.txt file







