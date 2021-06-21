# Getting-and-cleaning-data-assignment
The Data Management Process

1. Raw data are unzipped and loaded from the below source from course website

 https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip  

2. Training and the test datasets from the zip file above are merged to create one dataset.

3. Only the measurements on the mean and standard deviation for each measurement are selected. 

4. Descriptive activity names are used to name the activities in the dataset.

5. Descriptive variable names are used to clearly labelled the dataset.

6. A second and independent tidy dataset was created by containing the average of each variable for each activity and each subject.



The attached R Script "run_analysis.R" can be used to run in R each step above and get the final dataset.



Description of Variable and dataset

labels---imported from dataset activity_lables.txt

features---imported from dataset features.txt

Test_x---imported from dataset X_test.txt

Test_y---imported from dataset y_test.txt

Train_x---imported from dataset X_train.txt

Train_y---imported from dataset y_train.txt

Test_Sub---imported from dataset subject_test.txt

Train_Sub---imported from dataset subject_train.txt

Combined---dataset after initial merge before columns selection

final----dataset with needed columns, updated variable names and correct order

final_mean---final dataset containing step 6 above for submission

