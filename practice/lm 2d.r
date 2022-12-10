X=c(10.0,12.0,9.5,22.2,8.0)
Y=c(360.2,420.0,359.5,679.0,315.3)
data=data.frame(x=X,y=Y)
m=lm(y~x, data)
coef(m)
deviance(m)/length(m)
summary(m)
#훈련집합과 모델 그리기
plot(data)
abline(m, col='red')

#예측데이터와 모델 그리기
newdata=data.frame(x=c(10.5,25.0,15.0))
p=predict(m, newdata)
plot(newdata$x, p, col="red")
abline(m)
