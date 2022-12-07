install.packages('rpart')
library(rpart)
r=rpart(Species~., data=iris)
print(r)
install.packages('rpart.plot')
library(rpart.plot)
rpart.plot(r,extra=1, digits=3)
install.packages('randomForest')
library(randomForest)
f=randomForest(Species~.,data=iris)
f
need=data.frame(Sepal.Length=c(5.11,7.01,6.32),Sepal.Width=c(3.51,3.2,3.31),Petal.Length)

#매개변수 -> 데이터로부터 학습됨 -> 모델이 최적화 되는 값
#하이퍼변수 -> 학습훈련을 위해 외부에서 모델의 동작을 조정하는 값 -> 사용자가 조정하는 ㄱ밧

install.packages('e1071')
library(e1071)
s=svm(Species~.,data=iris)
s
