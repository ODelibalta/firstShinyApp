# Shiny App for Developing Data Products Coursera class
For a direct access to the shiny app [click here](https://odelibalta.shinyapps.io/LifeExpentancyWHOrg/)

## Assignment requirements
1. Write a shiny application with associated supporting documentation. The documentation should be thought of as whatever a user will need to get started using your application.
2. Deploy the application on Rstudio's shiny server
3. Share the application link by pasting it into the provided text box
4. Share your server.R and ui.R code on github

The application must include the following:
1. Some form of input (widget: textbox, radio button, checkbox, ...)
2. Some operation on the ui input in sever.R
3. Some reactive output displayed as a result of server calculations
4. You must also include enough documentation so that a novice user could use your application.
The documentation should be at the Shiny website itself. Do not post to an external link.
The Shiny application in question is entirely up to you. However, if you're having trouble coming up with ideas, you could start from the simple prediction algorithm done in class and build a new algorithm on one of the R datasets packages. Please make the package simple for the end user, so that they don't need a lot of your prerequisite knowledge to evaluate your application. You should emphasize a simple project given the short time frame.


## Introduction to the app
This shiny app uses data gathered from (World Health Organization)[http://apps.who.int/gho/data/node.main.688?lang=en]. It focuses on the life expectancy years at birth and at sixty years old categorized by gender. Data spans across multiple years but the number of years available may vary depending on the selected country. 

## How to use this app 
You may use this app on shinyapps.io servers by following (this link)[https://odelibalta.shinyapps.io/LifeExpentancyWHOrg]
If you wish to run the app locally, please use the following commands in R 
```r
library(shiny)
runApp('LifeExpentancyWHOrg')
```




