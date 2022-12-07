library(dplyr)
library(ggplot2)
library(gapminder)
View(gapminder)
gapminder %>% 
    filter(continent=="Africa"&year==2007&lifeExp>=60) %>%
    select(country, gdpPercap) %>% 
    ggplot(aes(country, gdpPercap, col=country))+geom_point()

str(mpg)
View(mpg) 
mpg %>%
    filter(manufacturer=="audi"|manufacturer=="ford"|manufacturer=="nissan") %>%
    mutate(평균연비=(hwy+cty)/2)%>%
    ggplot(aes(displ, 평균연비, col=manufacturer))+facet_wrap(~manufacturer)+geom_line()

 
data %>%
    ggplot(aes(displ, 평균연비, col=manufacturer))+facet_wrap(~manufacturer)+geom_point()

mpg %>%
    group_by(manufacturer) %>%
    mutate(total=(cty+hwy)/2) %>%
    ggplot(aes(displ,total, col=factor(manufacturer)))+geom_point()

mpg %>%
    mutate(total=(cty+hwy)/2) %>%
    group_by(trans, class,year) %>%
    ggplot(aes(class,total, col=trans))+geom_col()+facet_wrap(~trans)

gapminder_africa = gapminder %>%
  filter(continent == 'Africa' & year == 2007 & lifeExp >= 60)

ggplot(data=gapminder_africa, aes(x=country, y=gdpPercap, col=factor(country))) +
  geom_col()

airquality%>%
    summarise(mean_temp=mean(Temp, na.rm=T))

table(mpg$class)
summary(mpg$cty)

air=airquality
air[air$Month==5|air$Month==6,"Temp"]
air$Temp[air$Month==5|air$Month==6]

air %>%
    filter(!is.na(Ozone)&!is.na(Solar.R)) %>%
    group_by(Month) %>%
    summarise(n=n())

mpg %>%
    filter((class=="suv"| class=="pickup")&hwy>=20) %>%
    mutate(size=ifelse(displ>=3.0,"big","small")) %>%
    group_by(class,size) %>%
    summarise(n=n())

gap =gapminder %>%
    filter(continent=="Asia"|continent=="Americas") %>%
    group_by(year,continent) %>%
    summarise(avg_gdp=mean(gdpPercap)) 
ggplot(gap,aes(year,avg_gdp, col=continent))+geom_line()+facet_wrap(~continent)
