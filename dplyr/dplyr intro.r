######### Introduction to data manipulation with dplyr
## Install dplyr
install.packages("dplyr")
library(dplyr)

gapminder <- read.csv("https://raw.githubusercontent.com/resbaz/r-novice-gapminder-files/master/data/gapminder-FiveYearData.csv")

#Summarize data
summary(gapminder)
# Display
View(gapminder)
?filter

### 1. filter() is used to pick observations...
# logical operators
# only Australia data
australia <- filter(gapminder,country == "Australia")
head(australia)
# only life expectancy higher than 81
life80 <- filter(gapminder,lifeExp > 81)

### 2. arrange(): reorder rows...
# ascending GDP capital
arrange(gapminder,gdpPercap)
head(arrange(gapminder,gdpPercap))
# descending GDP capital
head(arrange(gapminder,desc(gdpPercap)))

### 3. select(): to pick variables
# only pick 3 variables
gap_small <- select(gapminder,year,country,gdpPercap)
head(gap_small)

# combine two operations...
gap_small_97 <- filter(gap_small,year==1997)
View(gap_small_97)
# other way: nesting in one statement...
filter(select(gapminder,country,year),year==1997)
# third method, same thing using pipe operator '%>%'
gap_small_97 <- gapminder %>% select(country,year, gdpPercap) %>% filter(year==1997)
# basically %>% passes result to next statement...

gapminder %>% summary()
# is same as
summary(gapminder)

# 2002 life expectancy for country Eritrea
eritrea <- gapminder %>% filter(year == 2002 , country == 'Eritrea') %>% select(lifeExp)

### 4. mutate(): to create new variables
gap_gdp <- gapminder %>% mutate(gdp = gdpPercap * pop)
gap_gdp <- gapminder %>% mutate(gdp = gdpPercap * pop, gdpMillion = gdp/1000000)

### 5. summarize(): collapse to a single summary
gapminder %>% summarise(meanLE = mean(lifeExp))

### 6. group+by(): change the scope
gapminder %>% group_by(country)
# find mean life expectancy for each continent in 2007
countries_avg_life <- gapminder %>% filter(year==2007) %>% group_by(continent) %>% summarise(mean(lifeExp))

# find max life expectancy ever recorded for each country
max_country_life <- gapminder %>% group_by(country) %>% summarise(maxLe = max(lifeExp)) %>% arrange(maxLe)

## using starwars data
?starwars
View(starwars)
starwars %>% group_by(species) %>% summarise(n = n(), mass = mean(mass,na.rm = TRUE)) %>% filter(n>1)


# associating dplyer with ggplot2
library(ggplot2)

gapminder  %>% filter(continent == "Asia") %>% group_by(year) %>% summarise(sum = sum(pop)) %>% 
  ggplot(aes(x=year,y=sum))  + geom_line()
