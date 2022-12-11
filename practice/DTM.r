#웹서버 접속 및 xml 파싱
install.packages('RCurl')
install.packages('XML')
library(RCurl)
library(XML)
t=readLines('https://en.wikipedia.org/wiki/Data_science')
d=htmlParse(t,asText=TRUE)
clean_doc=xpathSApply(d,'//p',xmlValue)
#전처리
install.packages('tm')
install.packages('SnowballC')
library(tm)
library(SnowballC)
#말뭉치를 다루기 위해 tm 패키지가 정의한 구조로 변환함
doc=Corpus(VectorSource(clean_doc))
#문서나 DTM 상세내용 확인
inspect(doc)
doc=tm_map(doc, content_transformer(tolower))
doc=tm_map(doc, removeNumbers)
doc=tm_map(doc,removeWords, stopwords('english'))
doc=tm_map(doc,removePunctuation)
doc=tm_map(doc,stripWhitespace)

#dtm 구축하기
dtm=DocumentTermMatrix(doc)
#dtm이 너무 큰경우 0.90이 최대 sparsity
dtm_small=removeSparseTerms(dtm,0.90)
#행, 열 개수 확인
dim(dtm)
inspect(dtm)
#<<DocumentTermMatrix (documents: 14, terms: 350)>> 문장 14개 각각 문서로 간주하며 350개 단어를 추출하여 사전
# Non-/sparse entries: 477/4423 14*350=4900개 칸 중 477개는 빈도가 있고 4423은 0임
# Sparsity           : 90% 전체 중 0이 차지하는 비율

#wordCloud
# 문서 마다 단어 중요성이 다르고 연관관계 정보가 있는데 이를 2차원 공간에 표기하는 시각화기법임
# 중요도가 큰 단어는 큰폰트로 표기되고, 연관성이 높으면 가까이에 표기됨
install.packages('wordcloud2')
library(wordcloud2)
#dtm을 행렬 표현으로 변환
m=as.matrix(dtm)
#빈도 높은 순서로 단어 정렬
v=sort(colSums(m), decreasing=T)
#단어이름을 1열, 빈도를 2열로 하는 데이터 프레임 생성
d=data.frame(word=names(v),freq=v)
#시각화
wordcloud2(d)
#옵션들
# 200개 단어만 표기
d1=d[1:200,]
# 워드클라우드 배경모양
wordcloud2(d1,shape='star')
#단어 방향 설정
wordcloud2(d1,minRotation=pi/4, maxRotation=pi/4, rotateRatio=1.0)

#dtm  모델 만들기
install.packages('text2vec')
library(caret)
library(text2vec)

train_list=createDataPartition(y=movie_review$sentiment,p=0.6,list=FALSE)
mtrain=movie_review[train_list,]
mtest=movie_revie[-train_list,]
#전처리, dtm 구축
doc=Corpus(VectorSource(mtrain$review))
doc=tm_map(doc,content_transformer(tolower))
doc=tm_map(doc,removeNumbers)
doc=tm_map(doc,removeWords,stopwords('english'))
doc=tm_map(doc,removePunctuation)
doc=tm_map(doc,stripWhitespace)
dtm=DocumentTermMatrix(doc)
dim(dtm)
#dtm변환
dtm_small=removeSparseTerms(dtm,0.90)
X=as.matrix(dtm_small)
#특징과 레이블 결합
dataTrain=as.data.frame(cbind(mtrain$sentiment,X))
#범주형 변환
dataTrain$V1=as.factor(dataTrain$V1)
#반응변수 이름 변경
colnames(dataTrain)[1]='y'

#결정트리 학습
r=rpart(y~., dataTrain)
printcp(r)
#랜덤 포레스트 학습
f=randomForest(y~., dataTrain)

#테스트
#테스트 데이터도 전처리 해야함
docTest=Corpus(VectorSource(mtest$review))
...
dtmTest=DocumnetTermMatrix(docTest,control=list(dictionary=dtm_small$dimnames$Terms))
X=as.matrix(dtmTest)
dataTest=as.data.frame(cbind(mtest$sentiment,X))
...
pr=predict(r, newdata=dataTest,type='class')
pf=predict(f, newdata=dataTest)
