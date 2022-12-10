library(rpart)
#반응 변수는 범주형이어야 한다. 아닌경우 method='class'를 사용한다.
r=rpart(Species~.,data=iris)
print(r)
summary(r)
#expected loss-> 예측 부류에 맞지 않는 샘플 비율
#P(node) 노드에 도달할 확률
#probabilities 부류확률 -> 해당 리프노드에 도달할 샘플의 확률
#rpart 시각화
library(rpart.plot)
rpart.plot(r, type=4)
