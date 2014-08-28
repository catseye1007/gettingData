gettingData
===========
Hi, it's very nice of you to take time to review my work.I'm going to give you a brief introduction here.

*If you want to run the code on your local computer, please make sure that you place the dataset and the R script in the same folder at your working depository.*

##Variables

xtrain: Content of X_train.txt
ytrain: Content of y_train.txt
train: records for training data

*Same rule applies for (xtest, ytest and test) and (testsub, trainsub and subject).*

result: Combination of train and test data
activity: activity_lables.txt
features: features.txt

rowname: going to be colnames of "result"
resultname: names of "result"
std: all the column number of whose names contain "std"
mean: all the column number of whose names contain "mean"
measure: std and mean numbers together

mresult: the requested dataset
sresult: a list that was split by Subject and Label in mresult
result1: to store all the average numbers of each record

splitnames: the rownames of result1 is like **1.STANDING**, the splitnames is a dataframe that like **1 STANDING**
<<<<<<< HEAD
=======

>>>>>>> a16cbd315871fe1df49f5c0b7d4a068df582667a
result2: bind splitnames(indicates the subjects and lables) and result1

result2.txt: the final output


*please note that there are some head() and class() function used in the script, which are just for watching the process. I understand that they are not necessary.*

###Thank you for your time!:smile:
