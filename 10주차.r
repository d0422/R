x=c(3.0,6.0,9.0,12.0)
y=c(3.0,4.0,5.5,6.5)
m=lm(y~x)
m
plot(x,y)
abline(m,col="red")
coef(m)

fitted(m)

residuals(m)

car_model=lm(dist~speed, data=cars)
coef(car_model)
plot(cars)
abline(car_model, col="red")
nx1=data.frame(speed=c(21.5))
predict(car_model,nx1)

install.packages("scatterplot3d")
library(scatterplot3d)
x=c(3.0,6.0,3.0,6.0)
u=c(10.0,10.0,20.0,20.0)
y=c(4.65,5.9,6.7,8.02)
s=scatterplot3d(x,u,y,xlim=2:7,ylim=7:23,zlim=0:10,pch=20, type='h')

m=lm(y~x+u)
coef(m)
s$plane3d(m)

nx=c(7.5,5.0)
nu=c(15.0,12.0)
new data=data.frame(x=nx, u=nu)
ny=predict(m, new_data)
ny

s=scatterplot3d(nx,nu,xlim = 0:10, ylim=7:23, zlim=0:10, pch=20, type='h', color="red",angle=60)
s$plane3d(m)

str(trees)
summary(trees)
s=scatterplot3d(trees$Girth, trees$Height, trees$Volume, pch=20, type='h', angle=55)
m=lm(Volume ~ Girth + Height, data=trees)
s$plane3d(m)

ndata=data.frame(Girth=c(8.5,13.0,19.0),Height=c(72,86,85))
predict(m,newdata=ndata)
