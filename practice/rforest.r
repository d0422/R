library(randomForest)
f=randomForest(Species~.,data=iris)
#오류율 시각화
plot(f)
#많이 사용된 변수 확인하기
varUsed(f)
#설명 변수 중요도 표기하기
varImpPlot(f)
#결정트리 리프 노드 개수 확인하기
treesize(f)
#예측하기 -> type='response'가 기본값
newd=data.frame(Sepal.Length=c(5.11,7.01,6.32),Sepal.Width=c(3.51,3.2,3.31),Petal.Length=c(1.4,4.71,6.01),Petal.Width=c(0.19,1.4,2.49))
predict(f, newdata=newd)
#확률 확인하기
predict(f, newdata=newd, type='prob')
#득표수 확인하기 norm.votes=FALSE-> 정규화 여부로 T이면 type=prob과 동일한결과
predict(f, newdata=newd, type='vote', norm.votes=FALSE)

#하이퍼 매개변수 변경
#ntree 결정트리 개수
#nodesize 리프노드에 있는 샘플의 최소개수 (크게 설정할수록 작은 결정트리)
#maxnodes 최대 리프노드수
small_forest=randomForest(Species~., data=iris, ntree=20, nodesize=6, maxnodes=12)
small_forest
