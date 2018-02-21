
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(

  headerPanel("Twitter Analysis"),
  
  sidebarPanel( textInput("term", "Enter a term", ""),
                sliderInput("count", 
                            label = "Number of tweets to load:",
                            min = 0, max = 200, value = 0),
                numericInput("obs", "Number of tweets to view:", 5),
                selectInput("lang","Select the language",
                             c("English"="en",
                               "French"="fr",
                               "Spanish"="es"), selected = "en"),
#                 dateInput("date", "Since :", 
#                           value = "2013-01-01"),
                  submitButton(text="Run")
  ),
  
  mainPanel(
    h4("Last few Tweets"),
    tableOutput("table"),
    plotOutput("wordcl"))
))