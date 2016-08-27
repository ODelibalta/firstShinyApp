library(ggplot2) 
setwd("/home/odelibalta/Study/Coursera/9_DevelopingDataProducts/ShinyApp/YearsLeft/data")

allData <- read.csv("data_adjusted.csv")

selectedCountry <- "Turkey"

countryData <- subset( allData, country == selectedCountry, select = c(year, lebfm, lebf, lebm) ) 

countryData$predFM <- predict( lm( lebfm ~ lebf, data = countryData ) )

countryDataPlot <- ggplot() + 
    geom_point(data = countryData, aes(x = year, y = lebfm , color = "Both Sexes")) +
    geom_point(data = countryData, aes(x = year , y = lebf , color = "Female"))  + 
    geom_point(data = countryData, aes(x = year , y = lebm , color = "Male"))  + 
    xlab('Years') +
    ylab('Average life span from birth years')

# countryData <- subset( allData, country == selectedCountry, select = c(year, lesixtyfm, lesixtyf, lesixtym) ) 

print(countryDataPlot)

# birthLifeMale <- qplot( ggplot(countryData, aes(x=lebfm, y=year, fill=variable)) + geom_bar(stat='identity') )



# print(birthLifeMale)


