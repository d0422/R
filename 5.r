patients=data.frame(name=c("환1","환2","환3","환4"),age=c(22,20,25,30), gender=c(1,2,3,2),blood.type=c(1,3,2,4))
patients$gender=ifelse((patients$gender<1|patients$gender>2),NA,patients$gender)
patients$blood.type=ifelse((patients$blood.type<1|patients$blood.type>4),NA,patients$blood.type)
patients[!is.na(patients$gender)&!is.na(patients$blood.type),]
boxplot(airquality[,1])$stats
gapminder[1:15,c("country","lifeExp","year")]
gapminder[,c("country","lifeExp","year")]
gapminder[gapminder$country=="Korea, Rep.",c("lifeExp","pop")]
gapminder[gapminder$country=="Crotia"&gapminder$year>1990,c("lifeExp","pop")]
View(gapminder)

apply(gapminder[gapminder$country=="Croatia",c("lifeExp","pop")],2,mean)
select(gapminder,country,year,lifeExp)
filter(gapminder, country=="Croatia"& year>1990)
summarise(gapminder,mean(pop))
