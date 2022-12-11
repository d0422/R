library(caret)
#테스트 집합 분할
train_list=createDataPartition(y=iris$Species,p=0.6,list=FALSE)
train_list
#trainlist만 가져오기
iris_train=iris[train_list,]
#trainlist만 빼기
iris_test=iris[-train_list,]
f=randomForest(Species~.,data=iris_train)
p=predict(f,newdata=iris_test)
#confusionMatrix확인하기
table(p,iris_test$Species)

#createDataPartition() 훈련집합과 테스트 집합 분할
#confusionMatrix() 혼동행렬 확인
#train() 여러 회귀와 분류모델 일관성 있게 평가하는데 유용
#trainControl() 교차검증
#resamples() 모델 비교하기

#5겹 교차검증
control=trainControl(method='cv', number=5)
r=train(Species~., data=iris, method='rpart', metric='Accuracy', trControl=control)
f=train(Species~., data=iris, method='rf', metric='Accuracy', trControl=control)
s=train(Species~., data=iris, method='svmRadial', metric='Accuracy', trControl=control)
k=train(Species~., data=iris, method='knn', metric='Accuracy', trControl=control)
resamp=resamples(list(결정트리=r, 랜덤포레스트=f, SVM=s, kNN=k))
summary(resamp)
sort(resamp, decreasing=TRUE)
#성능 비교 시각화
dotplot(resamp)

#svm 최적화
s=train(Species~., data=iris, method='svmRadial', metric='Accuracy', trControl=control)
s=train(Species~., data=iris, method='svmLinear', metric='Accuracy', trControl=control)
s=train(Species~., data=iris, method='svmLinearWeights', metric='Accuracy', trControl=control)
s=train(Species~., data=iris, method='svmPoly', metric='Accuracy', trControl=control)
s=train(Species~., data=iris, method='svmRadialWeight', metric='Accuracy', trControl=control)
#rf 최적화
f=train(Species~., data=iris, method='rf', ntree=100, metric='Accuracy', trControl=control)
f=train(Species~., data=iris, method='rf',ntree=500, metric='Accuracy', trControl=control)