library(dplyr)
library(ggplot2)
mpg %>%
    ggplot(aes(drv)) +
    geom_bar(stat="count")

mpg %>%
    group_by(drv) %>%
    summarise(avg_hwy=mean(hwy))
mpg %>%
    ggplot(aes(drv)) + 
    geom_bar()

mpg %>%
    group_by(drv) %>%
    summarise(avg_hwy=mean(hwy)) %>%
    ggplot(aes(drv,avg_hwy)) +
    geom_col()

mpg %>%
    ggplot(aes(class))+geom_bar()
mpg %>% 
    ggplot(aes(class, fill=factor(year))) +geom_bar()
mpg %>%
    ggplot(aes(class, fill=factor(year))) + geom_bar(position='identity')
mpg %>%
    ggplot(aes(class, fill=factor(year)))+geom_bar(position="dodge")
library(gapminder)
gapminder %>%
    filter(year==1952&continent=="Asia") %>%
    ggplot(aes(reorder(country,pop),pop))+geom_bar(stat="identity") + coord_flip() + scale_y_log10()
gapminder %>% 
    filter(country=="Korea, Rep.") %>%
    ggplot(aes(year,lifeExp,col=country))+geom_point()+geom_line()
gapminder %>%
    ggplot(aes(x=year, y=lifeExp, col=continent)) +geom_point(alpha=0.2) + geom_smooth()

gapminder %>%
    filter(year==1952) %>%
    ggplot(aes(lifeExp)) + geom_histogram(stat="bin")

gapminder %>%
    filter(year==1952) %>%
    ggplot(aes(continent,lifeExp)) +
    geom_col()

gapminder %>% filter(country=="Korea, Rep.") %>%
ggplot(aes(year,gdpPercap)) + geom_point()+geom_line()

gapminder %>% filter(country=="Korea, Rep.")%>%
ggplot(aes(year,pop))+geom_point()+geom_line()

gapminder %>%
    filter(country=="Kuwait"|country=="Korea, Rep.") %>%
    mutate(gdp=gdpPercap*pop) %>%
    ggplot(aes(year,gdp,col=country))+
    geom_point() + geom_line()

gapminder %>%
    filter(country=="Korea, Rep."|country=="China"|country=="Japan"|country=="Kuwait"|country=="Saudi Arabia"|country=="Iran"|country=="Iraq") %>%
    ggplot(aes(year,gdpPercap,col=country))+geom_point()+geom_line()
