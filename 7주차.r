library(dplyr)
library(ggplot2)
library(gapminder)
ggplot(data=mpg, aes(x=displ, y=hwy, col=drv))+geom_point()
ggplot(gapminder, aes(gdpPercap, lifeExp, col=continent, size=pop))+geom_point(alpha=0.5)+scale_x_log10()+facet_wrap(~year)
korea=gapminder %>%
    filter(country=="Korea, Rep.") 
ggplot(korea, aes(year, lifeExp))+geom_line()
ggplot(korea, aes(gdpPercap, lifeExp))+geom_line()
