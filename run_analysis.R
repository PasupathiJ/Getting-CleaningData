library(tidyr)
library(dplyr)
#url<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

#download.file(url,destfile="samsung.zip",mode="wb")
#unzip("samsung.zip",exdir="./data")

subTrain<-read.table("train/subject_train.txt")
colnames(subTrain)<-c("Subject")
xTrain<-read.table("train/X_train.txt")
features<-read.table("features.txt",stringsAsFactors = F)


  
featureNames<-make.names(features[,2],unique=T,allow_=T)

activities<-read.table("activity_labels.txt")
colnames(activities)<-c("ActivityId","ActivityName")
colnames(xTrain)<-featureNames
yTrain<-read.table("train/Y_train.txt")
colnames(yTrain)<-"ActivityId"
trainData<-cbind(subTrain,xTrain,yTrain)

subTest<-read.table("test/subject_test.txt")
colnames(subTest)<-c("Subject")
xTest<-read.table("test/X_test.txt")
colnames(xTest)<-featureNames
yTest<-read.table("test/Y_test.txt")
colnames(yTest)<-"ActivityId"
testData<-cbind(subTest,xTest,yTest)

completeData<-rbind(trainData,testData)
dataWithMeanAndSd<-select(completeData,c(Subject,ActivityId,contains(".mean."),contains(".std.")))
dataWithMeanAndSd<-left_join(dataWithMeanAndSd,activities,by=c("ActivityId"="ActivityId"))
dataWithMeanAndSd<-select(dataWithMeanAndSd,-ActivityId)
column_names<-colnames(dataWithMeanAndSd)

makeDescriptiveColName<-function(column_names){
  column_names<-gsub("^t","time",column_names)
  column_names<-gsub("^f","frequency",column_names)
  column_names<-gsub("BodyAcc","bodyacceleration",column_names)
  column_names<-gsub("GravityAcc","gravityacceleration",column_names)
  column_names<-gsub("BodyGyro","bodygyro",column_names)
  column_names<-gsub("\\.","",column_names)
  
}

  
#column_names<-gsub("tBodyAcc","timebodyacceleration",column_names)
column_names<-makeDescriptiveColName(column_names)
colnames(dataWithMeanAndSd)<-column_names
dataWithMeanAndSd<-group_by(dataWithMeanAndSd,Subject,ActivityName)
finalDataSet<-summarise_each(dataWithMeanAndSd,funs(mean))

