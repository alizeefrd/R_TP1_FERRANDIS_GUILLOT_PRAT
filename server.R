library(shiny)
library(ggplot2)

function(input, output) {
  
  dataset <- reactive({
    airquality[sample(nrow(airquality), input$sampleSize),]
  })
  
  
  output$plot <- renderPlot({
    
    p <- ggplot(dataset(), aes_string(x=input$x, y=input$y)) + geom_point()
    
    if (input$color != 'None')
      p <- p + aes_string(color=input$color)
    
    if (input$jitter)
      p <- p + geom_jitter()
    if (input$smooth)
      p <- p + geom_smooth()
    
    print(p)
    
  }, height=325)
  
  output$plot2 <- renderPlot({
    
    p2 <- ggplot(dataset(), aes_string(x=input$x2, y=input$y2)) + geom_bar(stat="identity")
    
    print(p2)
    
  }, height=325)
  
}