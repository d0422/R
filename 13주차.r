library(caret)
train_list=createDataPartition(y=iris$Species, p=0.6, list=FALSE)
train_list
library(rpart)
r=rpart(Species~.,data=iris)
library(rpart.plot)
rpart.plot(r, extra=1, digits=3)
