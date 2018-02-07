## make a data.frame called cats
cats <- data.frame(coat = c("calico", "black", "tabby"),
                   weight = c(2.1, 5.0, 3.2),
                   likes_string = c(1, 0, 1))
## save that data frame
write.csv(x = cats, file = "data/feline_data.csv", row.names = FALSE)

## manipulate the 'weight' column of the cats data.frame
cats$weight
cats$weight <- cats$weight + 1

## manipulate the 'coat' column of the cats data.frame
paste("My cat is", cats$coat, sep = " ")
cats$coat <- as.character(cats$coat)

##### Move on from cats to a larger data.frame
## load gapminder data
gapminder <- read.csv(file = "data/gapminder-FiveYearData.csv", stringsAsFactors = FALSE)

## plot GDP per Capita vs Life Expectancy
library("ggplot2")
ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp)) +
  geom_point()  

## make the same plot, but colour the points by continent
ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp, colour = continent)) + 
  geom_point()

## plot Year vs Life Expectancy, coloured by the country & with one line per country
ggplot(data = gapminder, aes(x = year, y = lifeExp, by = country, color = continent)) + 
  geom_line() + 
  geom_point()

## go back to the GDP per Capita vs Life Expectancy plot, scale the x-axis onto a log scale & make the points slightly transparent
ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp)) + 
  geom_point(alpha = 0.5) + 
  scale_x_log10()

## this adds a line to show the relationship between log GDP per Capita & Life Expectancy
ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp)) + 
  geom_point(alpha = 0.5) + 
  scale_x_log10() + 
  geom_smooth(method = "lm")

## this is the same plot, but notice how the line is under the points, this is because we have added geom_smooth as the first option
ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp)) + 
  geom_smooth(method = "lm") + 
  geom_point(alpha = 0.5) + 
  scale_x_log10()

## this recreates the Year vs Life Expectancy (per country) line graph, but creates a plot per continent (this is called faceting)
ggplot(data = gapminder, aes(x = year, y = lifeExp, by = country, colour = continent)) + 
  geom_line() + 
  facet_wrap( ~ continent) + 
  theme_bw()
  
