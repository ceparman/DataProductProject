
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#
options("getSymbols.warning4.0"=FALSE)
library(shiny)
library(quantmod)
library(markdown)
library(rmarkdown)

shinyUI(fluidPage(

  # Application title
  titlePanel("IBM Stock Price (Documentation below)"),


   verticalLayout(
   
    #basic plot
      plotOutput("stockPlot"),
      

    #checkboxes
    
    wellPanel(
      checkboxGroupInput("indicators", "Indicators", 
                c("MACD","Bolinger Bands","EMA","ATR","Volatility"), selected = NULL, inline = TRUE)
     
                     
       
    ,width=2),  
    
    #documentation
    includeMarkdown("doc.md")
  
   
   
    
  )
))
