library(tidyverse)
library(janitor)
library(dplyr)
library(lubridate)

SurveyData <- read_csv("surveydata.csv") #call the csv file to open 

head(SurveyData) #check to see if survey data frame is shown

SurveyData <- clean_names(SurveyData) |>  #clean SurveyData names
              clean_names(case= "upper_camel") #clean up using upper_camel

head(SurveyData) #check to see changes made to SurveyData

CleanSurveyData <- SurveyData[-c(1,2), -c(2,3,4,8,9,10,11,12,13,14,15,16,17,18)]#delete rows1&2#delete columns 2,3,9,10,11,12,13,14,15,16,17
head(CleanSurveyData) #check to see if columns are deleted

#change startdate to Date
CleanSurveyData$StartDate <- as.Date(CleanSurveyData$StartDate, format = "%m/%d/%y")
head(CleanSurveyData) #made sure StartDate is a <date> type 

#change variable names



