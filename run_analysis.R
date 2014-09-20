directory<-"UCI HAR Dataset"

# saving paths to variables
X_testpath<-paste(directory, "test", "X_test.txt", sep="/")
X_trainpath<-paste(directory, "train", "X_train.txt", sep="/")
y_testpath<-paste(directory, "test", "y_test.txt", sep="/")
y_trainpath<-paste(directory, "train", "y_train.txt", sep="/")
subject_testpath<-paste(directory, "test", "subject_test.txt", sep="/")
subject_trainpath<-paste(directory, "train", "subject_train.txt", sep="/")
featurespath<-paste(directory, "features.txt", sep="/")
activitypath<-paste(directory, "activity_labels.txt", sep="/")

# loading data into R
X_test<-read.table(X_testpath)
X_train<-read.table(X_trainpath)
y_test<-read.table(y_testpath)
y_train<-read.table(y_trainpath)
subject_test<-(read.table(subject_testpath))
subject_train<-(read.table(subject_trainpath))
features<-read.table(featurespath)
features$V2<-as.character(features$V2)
activity<-read.table(activitypath)

# labeling the data set with descriptive variable names
colnames(X_test)<-features$V2
colnames(X_train)<-features$V2

# extracting only the measurements on the mean and standard deviation for each measurement
x<-grep("mean()", features$V2, fixed=TRUE)
y<-grep("std()", features$V2, fixed=TRUE)
X_test<-X_test[ ,c(x, y)]
X_train<-X_train[ ,c(x, y)]

# merging the data set with data on subjects and labels
test<-cbind(X_test, y_test)
colnames(test)[67]<-"activity_id"
test<-cbind(test, subject_test)
colnames(test)[68]<-"subject"
train<-cbind(X_train, y_train)
colnames(train)[67]<-"activity_id"
train<-cbind(train, subject_train)
colnames(train)[68]<-"subject"

# merging the training and the test sets to create one data set
dataset<-rbind(test, train)

# using descriptive activity names to name the activities in the data set
colnames(activity)[1]<-"activity_id"
colnames(activity)[2]<-"activity_label"
joined<-join(dataset, activity)
joined<-joined[,-67]

# creating a second, independent tidy data set with the average of each variable for each activity and each subject
second <- aggregate(. ~ subject + activity_label, joined, mean)

# creating a txt file
write.table(second, "tidy_dataset.txt", row.names=FALSE)