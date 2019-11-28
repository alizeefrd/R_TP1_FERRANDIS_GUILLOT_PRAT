library(shiny)
library(ggplot2)

dataset <- airquality

fluidPage(
  
  titlePanel("Air Quality"),
  

  sidebarPanel(
    
    sliderInput('sampleSize', 'Sample Size', min=1, max=nrow(dataset),
                value=min(1000, nrow(dataset)), step=2, round=0),
    
    h3("Correlation graph : "),
    selectInput('x', 'X : ', names(dataset)),
    selectInput('y', 'Y : ', names(dataset), names(dataset)[[2]]),
    selectInput('color', 'Colored By', c('None', names(dataset))),
  
    
    checkboxInput('jitter', 'Jitter'),
    checkboxInput('smooth', 'Smooth'),
    
    h3("Histogram : "),
    selectInput('x2', 'X :', c("Month" = "Month",
                                         "Day" = "Day")),
    selectInput('y2', 'Y :', c("Ozone" = "Ozone",
                                         "Solar.R" = "Solar.R"))
  ),
  
  mainPanel(
    plotOutput('plot'),
    plotOutput('plot2')
  )
)