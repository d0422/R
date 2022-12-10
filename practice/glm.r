muffler=data.frame(discount=c(2.0,4.0,6.0,8.0,10.0), profit=c(0,0,0,1,1))
#family=binomial 중요
g=glm(profit~discount, data=muffler, family=binomial)
coef(g)
plot(muffler)
abline(g, col="blue")
newd=data.frame(discount=c(1,5,12,20,30))
#type=response 중요
p=predict(g,newd,type='response')
print(p)

#예측데이터까지 시각화
plot(muffler, pch=20, cex=2, xlim=c(0,32))
abline(g,col='blue', lwd=2)
res=data.frame(discount=newd, profit=p)
points(res,pch=20,cex=2,col='red')
legend('bottomright',legend=c('train data','new data'), pch=c(20,20), cex=2, col=c('black','red'),bg='gray')
