library(dplyr)
data=read.csv('data.csv',header=T,fileEncoding="euc-kr" )
str(data)
# 각 컬럼별 데이터 파악-> 범주인지, 양인지 확인
table(data$지역)
table(data$업종)
table(data$사업체규모)
summary(data$연차휴가부여)
summary(data$연차휴가사용)
table(data$연령대)
table(data$성별)
table(data$학력)
table(data$직업)
table(data$월평균소득구간)

sum(is.na(data))
# NA 총 갯수 파악
colNames=names(data) # data의 컬럼을 가져옴
for (colName in colNames){ # 각 컬럼의 NA 갯수 파악 및 제거
    print(sum(is.na(data[colName])))
    data=data[!is.na(data[colName]),]
}
sum(is.na(data)) #결측값 삭제 확인
# ===============데이터 정제 및 파악 완료

# 그룹별 연차휴가부여와 연차휴가사용 비교
data %>% group_by(학력) %>% summarise(연차휴가부여=mean(연차휴가부여), 연차휴가사용=mean(연차휴가사용),비율=mean(연차휴가사용)/mean(연차휴가부여)*100)
data %>% group_by(직업) %>% summarise(연차휴가부여=mean(연차휴가부여), 연차휴가사용=mean(연차휴가사용),비율=mean(연차휴가사용)/mean(연차휴가부여)*100)
data %>% group_by(성별) %>% summarise(연차휴가부여=mean(연차휴가부여), 연차휴가사용=mean(연차휴가사용),비율=mean(연차휴가사용)/mean(연차휴가부여)*100)
data %>% group_by(월평균소득구간) %>% summarise(연차휴가부여=mean(연차휴가부여), 연차휴가사용=mean(연차휴가사용),비율=mean(연차휴가사용)/mean(연차휴가부여)*100)
data %>% group_by(업종) %>% summarise(연차휴가부여=mean(연차휴가부여), 연차휴가사용=mean(연차휴가사용), 비율=mean(연차휴가사용)/mean(연차휴가부여)*100)
data %>% group_by(사업체규모) %>% summarise(연차휴가부여=mean(연차휴가부여), 연차휴가사용=mean(연차휴가사용),비율=mean(연차휴가사용)/mean(연차휴가부여)*100)

# 20~30대의 학력별 분포
data %>% filter(연령대=="20대"|연령대=="30대")%>% group_by(학력)%>% summarise(명수=n())
# 50~60대의 학력별 분포
data %>% filter(연령대=="50대"|연령대=="60대")%>% group_by(학력)%>% summarise(명수=n())


# 사업체 규모가 1~3인 사업장에 대해 성별로 월평균소득구간의 평균 비교
data %>% filter(사업체규모>=1 &사업체규모<=3) %>% group_by(성별) %>% summarise(월평균소득구간평균=mean(월평균소득구간))
# 사업체 규모가 4~6인 사업장에 대해 성별로 월평균소득구간의 평균 비교
data %>% filter(사업체규모>=4 &사업체규모<=6) %>% group_by(성별) %>% summarise(월평균소득구간평균=mean(월평균소득구간))
