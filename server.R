
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(quantmod)
#get data for plotting
#getSymbols("IBM", src="yahoo", from = "2013-1-1")
#Use stored version because of slow response on shiny.io

if (!(exists("IBM"))) load("IBM.Rdata")

shinyServer(function(input, output) {
 
  output$stockPlot <- renderPlot({
 
   #base plot
    
    if(is.null(input$indicators)) {
      chartSeries(IBM,theme=chartTheme('white'))
    }     else {  chartSeries(IBM,theme=chartTheme('white'),plot=FALSE)}
  
  #add indicators
  
   if( "Bolinger Bands" %in% input$indicators) print(addBBands());
   if( "EMA" %in% input$indicators) print(addEMA())
   if( "MACD" %in% input$indicators) print(addMACD())
   if( "ATR" %in% input$indicators) print(addATR()) 
   if( "Volatility" %in% input$indicators) print(addVolatility()) 
   is.null(input$indicators)
   
  })
 
})

