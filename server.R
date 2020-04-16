# server.R

#Modified for Lab 8 by Trevor Judd

#1.	Where is the most efficient location to put the above code?
# At the top of the R file, before shinyServer()

source("helpers.R") 
counties <- readRDS("counties.rds")
library(maps) 
library(mapproj)

shinyServer(
  function(input, output) {
    
    output$map <- renderPlot({
      
      data <- switch(input$var, 
                     "Percent White" = counties$white,
                     "Percent Black" = counties$black,
                     "Percent Hispanic" = counties$hispanic,
                     "Percent Asian" = counties$asian)
      
      color <- switch(input$var, 
                      "Percent White" = "darkgreen",
                      "Percent Black" = "black",
                      "Percent Hispanic" = "darkorange",
                      "Percent Asian" = "darkviolet")
      
      legend <- switch(input$var, 
                       "Percent White" = "% White",
                       "Percent Black" = "% Black",
                       "Percent Hispanic" = "% Hispanic",
                       "Percent Asian" = "% Asian")
      
      percent_map(data, color, legend, input$range[1], input$range[2])
    })
      
  }
)
    