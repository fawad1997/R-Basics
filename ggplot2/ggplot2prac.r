install.packages("ggplot2")

library(ggplot2)

### Introduction to ggplot2 visualizations ####

# 3 essential elements
# shortcut function: qplot()
qplot(data=msleep, x= conservation , geom= "bar")

msleep
?msleep

# scatterplot
# data: economics
# full ggplot2 syntax
View(economics)

# point graph
ggplot(data = economics, mapping = aes(x=date, y=unemploy)) + geom_point()

# data: mpg - miles per gallon
# is a bigger engine more fuel efficient
?mpg
ggplot(data = mpg, mapping = aes(x= displ, y = hwy,color=class)) + geom_point()

# trend line
ggplot(data = mpg, mapping = aes(x=displ, y= hwy)) + geom_point(mapping = aes(color=class)) + geom_smooth()

#economics again
ggplot(data = economics, mapping = aes(x=date, y=unemploy)) + geom_point(mapping = aes(color=uempmed))

# bar charts with diamonds dataset
?diamonds
View(diamonds)
# Only one variable is needed for barchart
ggplot(data = diamonds,mapping = aes(x=cut,fill=clarity)) +geom_bar()
ggplot(data = diamonds,mapping = aes(x=cut,color=clarity)) +geom_bar() # fill is better for bar chart


# theaming, theme the whole graph of same color
ggplot(diamonds, aes(x=cut)) + geom_bar(fill="tomato") +labs(title="Where are the bad ones",x="Quality of the cuts",y="Number of diamonds")
# flipping x and y axis
ggplot(diamonds, aes(x=cut)) + geom_bar(fill="tomato") +labs(title="Where are the bad ones",x="Quality of the cuts",y="Number of diamonds") + coord_flip()

ggplot(diamonds, aes(x=cut)) + geom_bar(fill="tomato") +labs(title="Where are the bad ones",x="Quality of the cuts",y="Number of diamonds") + theme_minimal()


########## Intermediate

library(ggplot2)
dir.create("plots")

# Data to use gapminder

gapminder <- read.csv("https://raw.githubusercontent.com/resbaz/r-novice-gapminder-files/master/data/gapminder-FiveYearData.csv")


# familiarize yourself with the data
summary(gapminder)
View(gapminder)


# growth in population over the years

ggplot(data = gapminder, mapping = aes(x=year,y=pop)) + geom_point()

ggplot(gapminder,aes(x=year,y=pop,color=continent)) +geom_point()

# more control over color
?scale_color_brewer

ggplot(gapminder,aes(x=year,y=pop,color=continent)) +geom_point() + scale_color_brewer(palette = "Set1")

# visualise color brewer palettes
library(RColorBrewer)
display.brewer.all()

display.brewer.all(colorblindFriendly = TRUE)

# custome palette
p <- ggplot(data = gapminder, mapping = aes(x=year,y=pop,color=continent)) + geom_point()

p + scale_color_manual(values = c("red","blue","purple","green","orange"))

# find out abour R color names
colors()
# more comfortable to use the colorpicker
install.packages("colourpicker")

p + scale_color_manual(values = c("#F71F1B", "#5922E3", "#1DEDE6", "#C25023", "#18DE5A"))

# graph is too much complicated at y axis, it may look better with
p+scale_y_log10()

# modify our x axis breaks
# create a list of years
unique_years <- unique(gapminder$year)

p + scale_x_continuous(breaks = unique_years)

p + scale_x_continuous(breaks = unique_years) + 
  scale_y_continuous(breaks = c(0,70000000,100000000,200000000,500000000,1000000000),labels = c("0","70 m","100 m","200 m","500 m","1 b"))

# modify y scale range

p + ylim(c(1,360000000))


# histogram
ggplot(gapminder,aes(x=lifeExp)) +geom_histogram()


ggplot(gapminder,aes(x=lifeExp)) +geom_histogram(binwidth = 5)


ggplot(gapminder,aes(x=lifeExp)) +geom_histogram(bins = 10)

ggplot(gapminder,aes(x=lifeExp, fill=continent)) +geom_histogram(bins = 10)
# histogram , modify positions
# default is stack
ggplot(gapminder,aes(x=lifeExp, fill=continent)) +geom_histogram(bins = 10,position = "fill")
ggplot(gapminder,aes(x=lifeExp, fill=continent)) +geom_histogram(bins = 10,position = "dodge")

# faceting

ggplot(gapminder,aes(x=lifeExp, fill = continent)) + geom_histogram(bins = 40) + facet_wrap(~continent)
# faceting and theming
ggplot(gapminder,aes(x=lifeExp, fill = continent)) + geom_histogram(bins = 40) + facet_wrap(~continent) +
  theme(legend.position = "none")

ggplot(gapminder,aes(x=lifeExp, fill = continent)) + geom_histogram(bins = 40) + facet_wrap(~continent) +
  theme(legend.position = "none") + theme_minimal()
ggplot(gapminder,aes(x=lifeExp, fill = continent)) + geom_histogram(bins = 40) + facet_wrap(~continent) +
  theme(legend.position = "none") + theme_gray()

install.packages("ggthemes")
