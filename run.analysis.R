#load the raw data
getwd()
filepath<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(filepath,destfile="raw_data.zip",method="curl")
unzip("raw_data.zip")

labels<-read.table("UCI HAR Dataset/activity_labels.txt")
colnames(labels)<-c("ID_label","Description")
features<-read.table("UCI HAR Dataset/features.txt")
colnames(features)<-c("ID_features","Description")
Test_x<-read.table("UCI HAR Dataset/test/X_test.txt")
colnames(Test_x)=features[,2]
Train_x<-read.table("UCI HAR Dataset/train/X_train.txt")
colnames(Train_x)=features[,2]
Test_y<-read.table("UCI HAR Dataset/test/y_test.txt")
colnames(Test_y)<-c("ID_label")
Train_y<-read.table("UCI HAR Dataset/train/y_train.txt")
colnames(Train_y)<-c("ID_label")
Test_Sub<-read.table("UCI HAR Dataset/test/subject_test.txt")
colnames(Test_Sub)<-c("ID_Sub")
Train_Sub<-read.table("UCI HAR Dataset/train/subject_train.txt")
colnames(Train_Sub)<-c("ID_Sub")


#Merges the training and the test sets to create one data set
Combine_Train=cbind(Train_x,Train_y,Train_Sub)
Combine_Test=cbind(Test_x,Test_y,Test_Sub)
Combined<-rbind(Combine_Test,Combine_Train)

#Extracts only the measurements on the mean and standard deviation for each measurement
check_mean<-grepl("mean",names(Combined),fixed=TRUE)
check_std<-grepl("std",names(Combined),fixed=TRUE)
final<-Combined[,check_mean==TRUE|check_std==TRUE]
id_label=Combined$ID_label
id_sub=Combined$ID_Sub
final=cbind(id_label,id_sub,final)

#Uses descriptive activity names to name the activities in the data set.
final$id_label=labels[final$id_label,2]

#Appropriately labels the data set with descriptive variable names.
names(final)=gsub("std()","standard deviation",names(final))
names(final)<-gsub("Gyro", "Gyroscope", names(final))
names(final)<-gsub("Acc", "Accelerometer", names(final))
names(final)<-gsub("BodyBody", "Body", names(final))
names(final)<-gsub("Mag", "Magnitude", names(final))
names(final)

#creates a second, independent tidy data set with the average of each variable for each activity and each subject.
library(plyr)
final_mean=aggregate(.~id_label+id_sub,final,mean)
write.table(final_mean,"final.txt",row.name=FALSE)

