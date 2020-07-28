## Slide 3 ---------------------------------------------
day <- c(14, 18:20)
month <- "September"
year <- 2018
#Paste0 merge all strings without space
paste0(month, day, year)
paste(month, day, year)
paste(month, day, year, sep="-")

## Slide 4 ---------------------------------------------
main_dir <- "C:/Users/Scottg16/Desktop/output_training/"
paste0(main_dir, "data/us_state_cigarette_data.rdata")

## Slide 5 ---------------------------------------------
states <- c("North Carolina", "North Dakota", "South Dakota")
#Grep1 returns true if text is matched in list
grepl("Dakota", states)
#returns index if value is found
grep("Dakota", states)
# returs value
grep("Dakota", states, value=T)

## Slide 6 ---------------------------------------------
mmr <- c(31.66, 33.02, 81.42, 79.54, 88.74, 52.57,
         50.42, 1246.75, 419.74, 489.17, 779.53)
location_name <- c("Chile", "United Kingdom", "Guatemala", "Iraq", 
                   "Bangladesh", "China", "Cambodia", "Central African Republic", 
                   "Uganda", "Botswana", "Nigeria")
region_name <- c("Southern Latin America", "Western Europe", 
                 "Central Latin America", "North Africa and Middle East", 
                 "South Asia", "East Asia", "Southeast Asia", 
                 "Central Sub-Saharan Africa", "Eastern Sub-Saharan Africa", 
                 "Southern Sub-Saharan Africa", "Western Sub-Saharan Africa")
super_region_name <- c("High-income", "High-income", 
                       "Latin America and Caribbean", "North Africa and Middle East", 
                       "South Asia", "Southeast Asia, East Asia, and Oceania", 
                       "Southeast Asia, East Asia, and Oceania", "Sub-Saharan Africa", 
                       "Sub-Saharan Africa", "Sub-Saharan Africa", "Sub-Saharan Africa")
data <- data.frame(mmr, location_name, region_name, super_region_name)
head(data)

## Slide 7 ---------------------------------------------
data <- data[grepl("Asia", data$region_name),]
head(data)

## Slide 8 ---------------------------------------------
data <- data[, grep("name", names(data))]
head(data)

## Slide 9 ---------------------------------------------
data$region_name
data$region_name <- gsub("South", "S.", data$region_name)
data$region_name <- gsub("East|east", "E.", data$region_name)
data$region_name

## Slide 10 ---------------------------------------------
colors <- c("red_blue_green", "red_green_orange", "orange_blue_red", "red_orange_green")
grep("orange", colors, value=T)
grep("^orange", colors, value=T)
grep("orange$", colors, value=T)
grep("red_.*_green", colors, value=T)

## Slide 11 ---------------------------------------------
tolower(states)
toupper(states)
substr(states, 1, 5)
nchar(data$region_name)

