#Directory where the run_analysis.R file is present
#This directory contains the data directory UCI HAR Dataset
ProgPath<-getwd()
#Directory where the data files are present
DataPath<-file.path(ProgPath,"UCI HAR Dataset")
#Getting the path to the train data set
#******************************************
#Activity Labels
ActivityData<-read.table(file.path(DataPath,"activity_labels.txt"),header=F)
ActivityData[,2]<-as.character(ActivityData[,2])
#*****************************************
#Features Information
FeaturesData<-read.table(file.path(DataPath,"features.txt"),header=F)
FeaturesNames<-as.character(FeaturesData[,2])

#******************************************
TrainDataPath<-file.path(DataPath,"train")
#Getting the path to the test data set
TestDataPath<-file.path(DataPath,"test")
#*************************************************
#Reading the test files
#Reading the subject test file
SubTest<-read.table(file.path(TestDataPath,"subject_test.txt"),header=F)
#Reading the X test file
XTest<-read.table(file.path(TestDataPath,"X_test.txt"),header=F)
#Reading the y test file
yTest<-read.table(file.path(TestDataPath,"y_test.txt"),header=F)
#**************************************************
#Reading the train files
#Reading the subject train files
SubTrain<-read.table(file.path(TrainDataPath,"subject_train.txt"),header=F)
#Reading the X train file
XTrain<-read.table(file.path(TrainDataPath,"X_train.txt"),header=F)
#Reading the y train file
yTrain<-read.table(file.path(TrainDataPath,"y_train.txt"),header=F)
#*******************************************************************
#Getting the Test data together
TestTotal<-cbind(SubTest,yTest,XTest)
#*******************************************************************
#Getting the Train data together
TrainTotal<-cbind(SubTrain,yTrain,XTrain)
#*******************************************************************
#Item 1 on the list of to do things
#All data together
#By merging TestTotal and TrainTotal
FinalData<-rbind(TestTotal,TrainTotal)
#Setting the column names
colnames(FinalData)<-c("Subject","Activity",FeaturesNames)
#***********************************************************************************
#Item 3 on the list of to do things
#Replacing the index of activities with the activity names
ActivityNames<-c(WALKING=1,WALKING_UPSTAIRS=2,
                 WALKING_DOWNSTAIRS=3,SITTING=4,STANDING=5,LAYING=6)
FinalData$Activity<-names(ActivityNames)[match(FinalData$Activity,ActivityNames)]
#******************************************************************************************
#Item 2 on the list of to do things
#Ordering based on Subject and Activity
library(plyr)
FinalDataM<-arrange(FinalData,Subject,Activity)
#Getting the columns with either mean or std present
FinalDataM1<-cbind(FinalDataM[,1:2],FinalDataM[,grep("mean()|std()", names(FinalDataM))])
#******************************************************************************************
##Item 4 on the list of to do things
#Getting all the column names
#Avg->Average
#TC->Time Component
#FC->Frequency Component
MasterColName<-c("Subject","Activity",
                 "AvgofTCBodyAccelerationMeanX","AvgofTCBodyAccelerationMeanY",
                 "AvgofTCBodyAccelerationMeanZ","AvgofTCBodyAccelerationStdDevX",
                 "AvgofTCBodyAccelerationStdDevY","AvgofTCBodyAccelerationStdDevZ",
                 
                 "AvgofTCGravityAccelerationMeanX","AvgofTCGravityAccelerationMeanY",
                 "AvgofTCGravityAccelerationMeanZ","AvgofTCGravityAccelerationStdDevX",
                 "AvgofTCGravityAccelerationStdDevY","AvgofTCGravityAccelerationStdDevZ",
                 
                 "AvgofTCBodyAccelerationJerkMeanX","AvgofTCBodyAccelerationJerkMeanY",
                 "AvgofTCBodyAccelerationJerkMeanZ","AvgofTCBodyAccelerationJerkStdDevX",
                 "AvgofTCBodyAccelerationJerkStdDevY","AvgofTCBodyAccelerationJerkStdDevZ",
                 
                 "AvgofTCBodyGyroMeanX","AvgofTCBodyGyroMeanY",
                 "AvgofTCBodyGyroMeanZ","AvgofTCBodyGyroStdDevX",
                 "AvgofTCBodyGyroStdDevY","AvgofTCBodyGyroStdDevZ",
                 
                 "AvgofTCBodyGyroJerkMeanX","AvgofTCBodyGyroJerkMeanY",
                 "AvgofTCBodyGyroJerkMeanZ","AvgofTCBodyGyroJerkStdDevX",
                 "AvgofTCBodyGyroJerkStdDevY","AvgofTCBodyGyroJerkStdDevZ",
                 
                 "AvgofTCBodyAccMagMean","AvgofTCBodyAccMagStdDev",
                 "AvgofTCGravityAccMagMean","AvgofTCGravityAccMagStdDev",
                 "AvgofTCBodyAccJerkMagMean","AvgofTCBodyAccJerkMagStdDev",
                 "AvgofTCBodyGyroMagMean","AvgofTCBodyGyroMagStdDev",
                 "AvgofTCBodyGyroJerkMagMean","AvgofTCBodyGyroJerkMagStdDev",
                 
                 "AvgofFCBodyAccelerationMeanX","AvgofFCBodyAccelerationMeanY",
                 "AvgofFCBodyAccelerationMeanZ","AvgofFCBodyAccelerationStdDevX",
                 "AvgofFCBodyAccelerationStdDevY","AvgofFCBodyAccelerationStdDevZ",
                 
                 "AvgofFCBodyAccelerationMeanFreqX",
                 "AvgofFCBodyAccelerationMeanFreqY",
                 "AvgofFCBodyAccelerationMeanFreqZ",
                 
                 "AvgofFCBodyAccJerkMeanX","AvgofFCBodyAccJerkMeanY",
                 "AvgofFCBodyAccJerkMeanZ","AvgofFCBodyAccJerkStdDevX",
                 "AvgofFCBodyAccJerkStdDevY","AvgofFCBodyAccJerkStdDevZ",
                 
                 "AvgofFCBodyAccJerkMeanFreqX",
                 "AvgofFCBodyAccJerkMeanFreqY",
                 "AvgofFCBodyAccJerkMeanFreqZ",
                 
                 "AvgofFCBodyGyroMeanX","AvgofFCBodyGyroMeanY",
                 "AvgofFCBodyGyroMeanZ","AvgofFCBodyGyroStdDevX",
                 "AvgofFCBodyGyroStdDevY","AvgofFCBodyGyroStdDevZ",
                 "AvgofFCBodyGyroMeanFreqX",
                 "AvgofFCBodyGyroMeanFreqY",
                 "AvgofFCBodyGyroMeanFreqZ",
                 
                 "AvgofFCBodyAccMagMean",
                 "AvgofFCBodyAccMagStdDev",
                 "AvgofFCBodyAccMagMeanFreq",
                 "AvgofFCBodyAccJerkMagMean",
                 "AvgofFCBodyAccJerkMagStdDev",
                 "AvgofFCBodyAccJerkMagMeanFreq",
                 "AvgofFCBodyGyroMagMean",
                 "AvgofFCBodyGyroMagStdDev",
                 "AvgofFCBodyGyroMagMeanFreq",
                 "AvgofFCBodyGyroJerkMagMean",
                 "AvgofFCBodyGyroJerkMagStdDev",
                 "AvgofFCBodyGyroJerkMagMeanFreq")

colnames(FinalDataM1)<-MasterColName
#******************************************************************************************
#Item 5 on the list of to do things
# Reshaping the data.
library(reshape)
# Melting the data
FinalDataM2 <- melt(FinalDataM1, id = c("Subject", "Activity"))
# casting the data
FinalDataM3 <- cast(FinalDataM2, Subject + Activity ~ variable, mean)
#Writing the TIDY Data to text file
write.table(FinalDataM3, file.path(getwd(),"tidydata.txt"), sep="\t")
#******************************************************************************************
