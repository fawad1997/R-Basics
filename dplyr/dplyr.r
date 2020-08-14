library(dplyr)
# importing file
gapminder <- read.csv("https://raw.githubusercontent.com/resbaz/r-novice-gapminder-files/master/data/gapminder-FiveYearData.csv")
View(gapminder)
nlevels(gapminder$country)
?nlevels
class(gapminder$country)
gapminder <- as_tibble(gapminder)
View(gapminder)
gapminder

### 1. filter():Pick observations by their values with filter()
australia <- gapminder %>% filter(country == 'Australia')
pakistan <- gapminder %>% filter(country == 'Pakistan')

life81 <- gapminder %>% filter(lifeExp > 81)

### 2. Reorder observations with arrange()
arrange(life81,lifeExp)
arrange(life81,desc(lifeExp))

### 3. Pick values with select()
gap_small <- gapminder %>% select(country,year,gdpPercap)

### 4. Create new variables with mutate()
gap_gdp <- gapminder %>% mutate(gdp = gdpPercap * pop)
# dim shows dimensions of the data.frame
dim(gap_gdp)
head(gap_gdp)

### 5. Collapse to a single value with summarise()
gapminder %>% summarise(meanLE = mean(lifeExp))

### 6. Change the scope with group_by()
gapminder
gapminder %>% filter(year==2007) %>%  group_by(continent) %>% summarise(pop = sum(pop))


starwars
starwars %>% mutate(bmi = mass/(height/100)^2) %>% select(name:mass, bmi)

View(starwars)

starwars %>% group_by(species) %>% summarise(n = n(), mass = mean(mass,na.rm = T)) %>% filter(n>1)


### Visualizing them
library(ggplot2)
gapminder %>%  group_by(continent,year) %>% summarise(pop = sum(pop)) %>% 
  ggplot(aes(x=year,
             y=pop,
             colour = continent)) + geom_line()

gapminder %>%  group_by(continent,year) %>% summarise(pop = sum(pop))


gapminder %>% 
  group_by(country) %>% 
  summarise(maxLifeExp = max(lifeExp),
            minLifeExp = min(lifeExp)) %>% 
  mutate(dif = maxLifeExp - minLifeExp) %>% 
  arrange(desc(dif)) %>% 
  slice(1:10, (nrow(.)-10):nrow(.)) %>% 
  ggplot(aes(x = reorder(country, dif), y = dif)) +
  geom_col() +
  coord_flip()
