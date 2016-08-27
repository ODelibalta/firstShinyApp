library(ggplot2)
# load up the data file
allData <- read.csv("data/data_adjusted.csv", na.strings = "",header=T)

# grab the distinct countries
countries <- union( allData$country, allData$country ); 

countryBirthPlot <- function( selectedCountry ){
    countryData <- subset( allData, country == selectedCountry, select = c(year, lebfm, lebf, lebm) ) 
}

countrySixtyPlot <- function( selectedCountry ){
    countrySixtyData <- subset( allData, country == selectedCountry, select = c(year, lesixtyfm, lesixtyf, lesixtym) ) 
}

library(shiny)

shinyServer(function(input, output) {
    
    output$countrySelector <- renderUI({
        selectInput("country", "Choose Country:", countries, selected="United States of America" ) 
    })
    
    output$plot1 <- renderPlot({
        input$goButton
        if (input$goButton == 0)
            return() 
        pldata <- isolate( countryBirthPlot( input$country ) )
        output$birthTable = renderDataTable({
            data = pldata
            colnames(data) = c("Year", "Both Genders", "Female", "Male")
            return(data)
        })
        
        pl <- ggplot() + 
            ggtitle( paste( input$country, "Life expectancy years at birth") ) +
            geom_point(data = pldata, aes(x = year, y = lebfm, color = "Both Genders")) +
            geom_point(data = pldata, aes(x = year, y = lebf, color = "Female"))  + 
            geom_point(data = pldata, aes(x = year, y = lebm, color = "Male"))  + 
            xlab('Years') +
            ylab('Average life span from birth years')
        print(pl)
    })
    
    output$plot2 <- renderPlot({
        input$goButton
        if (input$goButton == 0)
            return() 
        plsdata <- isolate( countrySixtyPlot( input$country ) )
        output$sixtyTable = renderDataTable({
            data = plsdata
            colnames(data) = c("Year", "Both Genders", "Female", "Male")
            return(data)
        })
        
        pls <- ggplot() + 
            ggtitle( paste( input$country, "Life expectancy years at sixty years") ) +
            geom_point(data = plsdata, aes(x = year, y = lesixtyfm, color = "Both Genders")) +
            geom_point(data = plsdata, aes(x = year, y = lesixtyf, color = "Female"))  + 
            geom_point(data = plsdata, aes(x = year, y = lesixtym, color = "Male"))  + 
            xlab('Years') +
            ylab('Average life span at sixty years old')
        print(pls)
    })
})
