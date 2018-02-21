library(shiny)

library(twitteR)
library(httr)   	#install version 0.6.0; latest version not compatible with twitteR 1.1.8 refer installingHTTRv0.6.0
library(wordcloud) 
library(tm)
source("twitterAppCredentials.R")

shinyServer(function (input, output) {
  
  setup_twitter_oauth(api_key,api_secret,access_token,access_token_secret)
  
  rawData = reactive(function(){
    tweets = searchTwitter(input$term, n=input$count,lang=input$lang)
    tweets = twListToDF(tweets)
    
  })
  
  output$wordcl = renderPlot(function(){
    tw.text = enc2native(rawData()$text)
    tw.text = tolower(tw.text)
    tw.text = removeWords(tw.text,c(stopwords(input$lang),"rt","htt\\*"))
    tw.text = removePunctuation(tw.text,TRUE)
    tw.text = unlist(strsplit(tw.text," "))
    
    word = sort(table(tw.text),TRUE)
    
    wordc = head(word,n=50)
    
    wordcloud(names(wordc),wordc,random.color=TRUE,colors=rainbow(10),scale=c(15,2))
  })
})
