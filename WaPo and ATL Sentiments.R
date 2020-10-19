library(tidyverse)
#install.packages("tidytext")
library(tidytext)
#install.packages("ggwordcloud")
library(ggwordcloud)
#install.packages("gutenbergr") 
library(gutenbergr)
#install.packages('textdata')
library(textdata)
save.image("tidytext.RData")




waPoData <- read_lines("WaPo Articles.RTF")

waPoData <- tibble(waPoData)
waPoData

waPoData$word <- as.character(waPoData$waPoData)

waPoData <- waPoData %>%
  unnest_tokens(word, waPoData)%>%
  anti_join(stop_words)%>%
  count(word, sort=TRUE)
View(waPoData)

get_sentiments('afinn') 

get_sentiments('nrc')

wapo_sentiment_afinn <- waPoData %>%
  inner_join(get_sentiments("afinn"))

wapo_sentiment_nrc <- waPoData %>%
  inner_join(get_sentiments("nrc"))

wapo_sentiment_bing <- waPoData %>%
  inner_join(get_sentiments("bing"))

View(wapo_sentiment_bing)

#Atlanta Datq

atlData <- read_lines("ATL Articles.RTF")

atlData <- tibble(atlData)
atlData

atlData$word <- as.character(atlData$atlData)

atlData <- atlData %>%
  unnest_tokens(word, atlData)%>%
  anti_join(stop_words)%>%
  count(word, sort=TRUE)
View(atlData)

get_sentiments('afinn') 

get_sentiments('nrc')

atl_sentiment_afinn <- atlData %>%
  inner_join(get_sentiments("afinn"))

atl_sentiment_nrc <- atlData %>%
  inner_join(get_sentiments("nrc"))

atl_sentiment_bing <- atlData %>%
  inner_join(get_sentiments("bing"))

View(atl_sentiment_bing)