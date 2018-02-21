library(shiny)

shinyUI(fluidPage(

  headerPanel("TwitterCloud"),
  
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
                  submitButton(text="Run"),
                    br(), br(),
                  img(src="twitterbrd.png",height = 75, width = 75),
                  a("TwitterCloud",href="http://mngujral.wordpress.com"),
                  "is a sideproject of ",a("mngujral", href="https://in.linkedin.com/in/mngujral")
  ),
  
  mainPanel( 
    tabsetPanel(
      tabPanel("Live Feed",
               h4("Last few Tweets")
               ),
      tabPanel("WordCloud",
               plotOutput("wordcl")
               )
              )
      
    )
    
))
