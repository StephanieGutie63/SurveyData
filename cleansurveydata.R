library(tidyverse)
library(janitor)

SurveyData <- read_csv("surveydata.csv") #call the csv file to open 

head(SurveyData)

SurveyData <- clean_names(SurveyData) |>
              clean_names(case= "upper_camel")

head(SurveyData)
