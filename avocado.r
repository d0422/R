library(dplyr)
library(gapminder)
library(ggplot2)
m=ggplot2::midwest
m %>%
    filter(poptotal>=100000)%>%
    select(county, state,poptotal,popasian) %>%
    group_by(state) %>%
    summarise(count_county=n(),pop_rate=mean(popasian/poptotal))

str(gapminder)
View(gapminder)
gapminder[gapminder$continent=="Oceania", c("pop","gdpPercap")]
apply(gapminder[gapminder$continent=="Oceania", c("pop","gdpPercap")],2, mean)
gapminder %>% 
    filter(continent=="Oceania") %>%
    select(country, year, gdpPercap) %>%
    group_by(country,year) %>%
    ggplot(aes(year,gdpPercap)) +geom_line()+facet_wrap(~country)
airquality
str(airquality)
