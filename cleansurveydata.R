library(tidyverse)
library(janitor)

SurveyData <- read_csv("surveydata.csv") #call the csv file to open 

head(SurveyData)

SurveyData <- clean_names(SurveyData)
head(SurveyData)
