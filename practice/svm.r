#비선형svm
library(e1071)
s=svm(Species~., data=iris)
print(s)
#하이퍼파라미터
#커널함수 : 
# linear, polynomial, radial basis function, sigmoid
#C(cost) : 잘못 분류하는 샘플의 수 허용치 조정 : 클수록 에러 x
# gamma: 결정경계의 곡률을 조정함 : 클수록 구불구불
# 두 값이 클 수록 정확하나, 과잉적합될 수 있음
#K-부류 분류기로 확장가능

