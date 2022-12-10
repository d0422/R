library(dplyr)
library(ggplot2)
library(rpart.plot)
library(caret)
library(rpart)
library(randomForest)

wisconsin=read.csv('wisconsin.csv',header=T,fileEncoding="euc-kr" )
str(wisconsin)
View(wisconsin)
table(wisconsin$Diagnosis) 
summary(wisconsin$Radius_mean)
summary(wisconsin$Texture_mean)
summary(wisconsin$Perimeter_mean)
summary(wisconsin$Area_mean)
summary(wisconsin$Smoothness_mean)
summary(wisconsin$Compactness_mean)
summary(wisconsin$Concavity_mean)
summary(wisconsin$Nconcave_mean)
summary(wisconsin$Symmetry_mean)
summary(wisconsin$Fractaldim_mean)
summary(wisconsin$Radius_se)
summary(wisconsin$Area_se)
summary(wisconsin$Smoothness_se)
summary(wisconsin$Compactness_se)
summary(wisconsin$Concavity_se)
summary(wisconsin$Nconcave_se)
summary(wisconsin$Symmetry_se)
summary(wisconsin$Radius_se)
summary(wisconsin$Texture_extreme)
summary(wisconsin$Perimeter_extreme)
summary(wisconsin$Area_extreme)
summary(wisconsin$Smoothness_extreme)
summary(wisconsin$Compactness_extreme)
summary(wisconsin$Concavity_extreme)
summary(wisconsin$Nconcave_extreme)
summary(wisconsin$Symmetry_extreme)
summary(wisconsin$Fractaldim_extreme)
#결측값 확인
sum(is.na(wisconsin))
# 결측값 제거
wisconsin=na.omit(wisconsin)
#결측값 제거 확인
sum(is.na(wisconsin))

#범주형 데이터로 Diagnosis변경
wisconsin$Diagnosis=factor(wisconsin$Diagnosis)

#데이터 상관관계 분석
wisconsin %>%
    ggplot(aes(Diagnosis,Radius_mean))+geom_jitter(aes(col=factor(Diagnosis)),width=0.1, height=0.1)+geom_boxplot(alpha=0.1)+ coord_flip()
wisconsin %>%
    ggplot(aes(Diagnosis,Radius_se))+geom_jitter(aes(col=factor(Diagnosis)),width=0.1, height=0.1)+geom_boxplot(alpha=0.1)+ coord_flip()
wisconsin %>%
    ggplot(aes(Diagnosis,Radius_extreme))+geom_jitter(aes(col=factor(Diagnosis)),width=0.1, height=0.1)+geom_boxplot(alpha=0.1)+ coord_flip()
wisconsin %>%
    ggplot(aes(Diagnosis,Area_mean))+geom_jitter(aes(col=factor(Diagnosis)),width=0.1, height=0.1)+geom_boxplot(alpha=0.1)+ coord_flip()
wisconsin %>%
    ggplot(aes(Diagnosis,Area_se))+geom_jitter(aes(col=factor(Diagnosis)),width=0.1, height=0.1)+geom_boxplot(alpha=0.1)+ coord_flip()
wisconsin %>%
    ggplot(aes(Diagnosis,Area_extreme))+geom_jitter(aes(col=factor(Diagnosis)),width=0.1, height=0.1)+geom_boxplot(alpha=0.1)+ coord_flip()

#각 진단항목의 평균값만을 가진 wisconsinData를 새롭게 생성(성능비교)
wisconsinData=wisconsin%>% 
    select(Diagnosis, Radius_mean,Texture_mean,Perimeter_mean,Area_mean,Smoothness_mean,Compactness_mean,Concavity_mean,Nconcave_mean,Symmetry_mean,Fractaldim_mean)

#================== 결정트리 ====================
#결정트리 생성
rtree=rpart(Diagnosis~.,data=wisconsin)
print(rtree)
#결정트리 출력
rpart.plot(rtree, extra=2, digit=4)
#결정트리 훈련집합에 대한 예측
predictTree=predict(rtree, wisconsin,type='class')
table(predictTree, wisconsin$Diagnosis)
confusionMatrix(predictTree,wisconsin$Diagnosis)

#평균값만 사용한 결정트리 생성
rMeantree=rpart(Diagnosis~.,data=wisconsinData)
print(rMeantree)
#평균 결정트리 훈련집합에 대한 예측
predictMeanTree=predict(rMeantree, wisconsinData,type='class')
table(predictMeanTree, wisconsinData$Diagnosis)
confusionMatrix(predictMeanTree,wisconsinData$Diagnosis)

#================ 랜덤 포레스트 ======================
#랜덤포레스트 생성
rForest=randomForest(Diagnosis~.,data=wisconsin)

plot(rForest)
varImpPlot(rForest)

#랜덤포레스트에 대한 예측
predictForest=predict(rForest,wisconsin)
confusionMatrix(predictForest, wisconsin$Diagnosis)

#평균값만 사용한 랜덤 포레스트 생성
rMeanForest=randomForest(Diagnosis~.,data=wisconsinData)

#평균값만 사용한랜덤포레스트에 대한 예측
meanPredict=predict(rForest,wisconsinData)
confusionMatrix(meanPredict, wisconsinData$Diagnosis)

#============================ 교차검증 ======================
#5겹 교차검증

control=trainControl(method='cv',number=5)
r=train(Diagnosis~.,data=wisconsin,method='rpart',metric='Accuracy',trControl=control)
f=train(Diagnosis~.,data=wisconsin,method='rf',metric='Accuracy',trControl=control)
s=train(Diagnosis~.,data=wisconsin,method='svmRadial',metric='Accuracy',trControl=control)
k=train(Diagnosis~.,data=wisconsin,method='knn',metric='Accuracy',trControl=control)
glm=train(Diagnosis~.,data=wisconsin,method='glm',metric='Accuracy',trControl=control)
resamp=resamples(list(결정트리=r, 랜덤포레스트=f, SVM=s, kNN=k, GLM=glm))
summary(resamp)
sort(resamp,decreasing=TRUE)