students=read.table('Sources/students1.txt', fileEncoding='euc-kr', header=T)
# fileEncoding-> 메모장이라서 맞춰준 것
# header=T -> 첫번째 줄은 header라는 뜻
# 기본값
# read.table ->  header=F
# read.csv -> header = T
students2=read.csv('Sources/students2.csv',header=T,fileEncoding="euc-kr")
test=c(15,20,30,NA,45)
# NA는 값이 없어서 계산할 수 없다!
test[test<40]
test[test%%3!=0]
test[!is.na(test)&test%%2==0]
sex=c(1,2,2,1,1,2)
sex
# 1인경우 M, 아닌경우 F
ifelse(sex==1,'M','F')

for ( i in 2:4){
    students2[,i]=ifelse(students2[,i]>=0 &students2[,i]<=100, students2[,i],NA)
}
students2
# summary -> 연속적인 값을 가지는 변수
summary(mtcars$gear)
# table -> 종류별로 몇개 나오는지 확인
table(mtcars$gear)

str(airquality)
head(airquality)
summary(airquality)
table(head(is.na(airquality)))
table(is.na(airquality$Temp))
airquality$Ozone
mean(!is.na(airquality$Ozone))

