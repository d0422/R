library(dplyr)
data=read.csv('data.csv',header=T,fileEncoding="euc-kr" )
data=data[!is.na(data$연차휴가부여)&!is.na(data$연차휴가사용),]
str(data)
data$성별=ifelse(data$성별==1, "남성","여성")
barplot(table(data$성별))

barplot(table(data$연차휴가사용))
barplot(table(data$연차휴가부여))
data= data %>% 
    mutate(휴가사용비율 =연차휴가사용/연차휴가부여*100)
str(data)
data=data[!is.na(data$휴가사용비율),] 
sum(is.na(data))
tmp=data %>%
    group_by(연령대) %>%
    summarise(평균휴가사용비율=mean(휴가사용비율))

