xtrain<-read.table("UCI HAR Dataset/train/X_train.txt")
head(xtrain)
ytrain<-read.table("UCI HAR Dataset/train/y_train.txt")
head(ytrain)
train<-cbind(xtrain,ytrain)


xtest<-read.table("UCI HAR Dataset/test/X_test.txt")
head(xtest)
ytest<-read.table("UCI HAR Dataset/test/y_test.txt")
head(ytest)
test<-cbind(xtest,ytest)

result<-NULL
result<-rbind(test, train)
head(result)


activity<-read.table("UCI HAR Dataset/activity_labels.txt")
activity
for (i in 1:6) {
        result[result[,562] == i, 563] <- activity[activity[,1]==i,2] 
}

result$V1.1 <- NULL
head(result)

testsub<-read.table("UCI HAR Dataset/test/subject_test.txt")
trainsub<-read.table("UCI HAR Dataset/train/subject_train.txt")
subject<-rbind(testsub, trainsub)
result<-cbind(result,subject)

features<-read.table("UCI HAR Dataset/features.txt")
rowname<-features
rowname<-t(rowname)
class(rowname)
rowname<-cbind(rowname,c("562","Label"), c("563","Subject"))

colnames(result)<-rowname[2,]

resultname<-names(result)
std<-grep("std", resultname)
mean<-grep("mean", resultname)
measure<-c(std, mean)

mresult<-cbind(result[,measure], result[,562:563])
class(mresult[,1])
mresult[, 1:79]<-lapply(mresult[,1:79], as.numeric)

head(mresult)
sresult<-split(mresult,list(mresult$Subject, mresult$Label))
head(sresult, 1)
class(sresult)

result1<-numeric()
for (i in 1:79) {
        result1<- cbind(result1,sapply(sresult, function(x) mean(x[, i]))) 
}
str(result1)
head(result1)
splitNames<-strsplit((rownames(result1)),"\\.")
splitNames<- as.data.frame(splitNames, row.names = c("Subject", "Activity"))
splitNames<-t(splitNames)
rownames(splitNames)<-NULL
head(splitNames)
class(splitNames)

result2<-cbind(splitNames, result1)
result2<-as.data.frame(result2)
names(result2)[3:81]<-names(mresult)[1:79]
head(result2)

write.table(result2, file = "result2.txt", row.names = FALSE)
read.table("result2.txt")
