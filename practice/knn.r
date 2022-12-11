library(class)
train=iris
test=data.frame(Sepal.Lenght=c(5.11,7.01,6.32),Sepal.Width=c(3.51,3.2,3.31),Petal.Length=c(1.4,4.71,6.02),Petal.Width=c(0.19,1.4,2.49))
k=knn(train[,1:4],test,train$Species, k=5)
k