students=read.table('Sources/students1.txt', fileEncoding='euc-kr', header=T)
# fileEncoding-> 메모장이라서 맞춰준 것
# header=T -> 첫번째 줄은 header라는 뜻
# 기본값
# read.table ->  header=F
# read.csv -> header = T
students2=read.csv('Sources/students.csv',header=T,fileEncoding="euc-kr")
test=c(15,20,30,NA,45)
# NA는 값이 없어서 계산할 수 없다!
test[test<40]
test[test%%3!=0]
test[!is.na(test)]

