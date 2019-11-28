library(shiny)
library(ggplot2)

dataset <- airquality

fluidPage(
  
  titlePanel("Air Quality"),

  sidebarPanel(
    
    sliderInput('sampleSize', 'Sample Size', min=1, max=nrow(dataset),
                value=min(100, nrow(dataset)), step=2, round=0),
    
    h3("Correlation graph : "),
    selectInput('x', 'X : ', names(dataset)),
    selectInput('y', 'Y : ', names(dataset), names(dataset)[[2]]),
    selectInput('color', 'Colored By', c('None', names(dataset))),
  
    checkboxInput('smooth', 'Smooth'),
    
    h3("Bar Plot : "),
    selectInput('x2', 'Periode :', c( "Month" = "Month",
                                      "Day" = "Day")),
    selectInput('y2', 'Mesure :', c("Ozone" = "Ozone",
                              "Solar.R" = "Solar.R"))
  ),
  
  mainPanel(
    plotOutput('plot'),
    plotOutput('plot2')
  )
)