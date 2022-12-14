library(scatterplot3d)
str(trees)
g=scatterplot3d(trees$Girth, trees$Height, trees$Volume, pch=20, type='h', angle=55)
m=lm(Volume~Girth+Height, trees)
g$plane3d(m)
ndata=data.frame(Girth=c(8.5,13.0,19.0),Height=c(72,86,85))
p=predict(m,newdata=ndata)
s=scatterplot3d(ndata$Girth, ndata$Height, p,pch=20, type='h', angle=55)
s$plane3d(m)

#practice1
x=c(3.0,6.0,3.0,6.0,7.5,7.5,15.0)
y=c(10.0,10.0,20.0,20.0,5.0,10.0,12.0)
z=c(4.65,5.9,6.7,8.02,7.7,8.1,6.1)
data=data.frame(x,y,z)
model=lm(z~x+y, data)
scatter=scatterplot3d(data$x,data$y, data$z, pch=20, angle=55,type='h')
scatter$plane3d(model)
