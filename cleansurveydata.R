library(tidyverse)
library(janitor)
library(dplyr)
library(lubridate)

SurveyData <- read_csv("surveydata.csv") #call the csv file to open 

head(SurveyData) #check to see if survey data frame is shown

SurveyData <- clean_names(SurveyData) |>  #clean SurveyData names
              clean_names(case= "upper_camel") #clean up using upper_camel

head(SurveyData) #check to see changes made to SurveyData

CleanSurveyData <- SurveyData |> #delete unwated rows and columns
                        slice(-c(1:2)) |>
                        select(-EndDate,-IpAddress,-Status,-RecordedDate,-ResponseId,-RecipientLastName,-RecipientFirstName,-RecipientEmail,-ExternalReference,-LocationLatitude, -LocationLongitude, -DistributionChannel, -UserLanguage, -QRecaptchaScore)
    
head(CleanSurveyData) #check to see if columns are deleted

#change startdate to Date
CleanSurveyData$StartDate <- as.Date(CleanSurveyData$StartDate, format = "%m/%d/%y")
head(CleanSurveyData) #made sure StartDate is a <date> type 

#change variable names
CleanSurveyData <- CleanSurveyData |>
  rename(
    Consent = Qid2,
    PracticeYogaInterest = Question1,
    YogaExperience = Question2,
    YogaActivities = Question3,
    YogaActivitiesText = Question3_8Text,
    YogaFrequency = Question4,
    YogaLifestyle = Question5_1,
    YogaContentInterest = Question5_2,
    YogaInfoSeeking = Question5_3,
    PreferredVideoFormats = Question6,
    BeginnerFlowInterest = Question7_1,
    StressReliefFlowInterest = Question7_2,
    BreathworkInterest = Question7_3,
    FullLengthClassInterest = Question7_4,
    MonthlyProgramInterest = Question7_5,
    ShortsInterest = Question7_6,
    ChineseMedicineInterest = Question7_7,
    SubscriptionInterest = Question8,
    WillingnessToPay = Question9,
    WillingnessToPayText = Question9_5Text,
    VisitLikelihood = Question10,
    SocialPlatforms = Question11,
    AgeGroup = Question12,
    Gender = Question13,
    IncomeBracket = Question14,
    Languages = Question15,
    LanguagesText = Question15_5Text,
    Country = Question16,
    SearchInterest = Question17
  )

View(CleanSurveyData)

library(stringr)

CleanSurveyData <- CleanSurveyData |>
  mutate(across(
    c(PracticeYogaInterest,YogaExperience,YogaFrequency,YogaLifestyle,YogaContentInterest,YogaInfoSeeking,BeginnerFlowInterest,StressReliefFlowInterest,BreathworkInterest,FullLengthClassInterest,MonthlyProgramInterest,SubscriptionInterest,WillingnessToPay,VisitLikelihood,SearchInterest,ShortsInterest),
    as.integer
  ))
str(CleanSurveyData)

# Create dummy variables for Languages
CleanSurveyData <- CleanSurveyData %>%
  mutate(
    lang_english =   ifelse(str_detect(Languages, "1"), 1, 0),
    lang_mandarin =  ifelse(str_detect(Languages, "2"), 1, 0),
    lang_cantonese = ifelse(str_detect(Languages, "3"), 1, 0),
    lang_spanish =   ifelse(str_detect(Languages, "4"), 1, 0),
    lang_other =     ifelse(str_detect(Languages, "5"), 1, 0)
  )

head(CleanSurveyData[, c("Languages", "lang_english", "lang_mandarin", "lang_cantonese", "lang_spanish", "lang_other")])

CleanSurveyData[1, "Languages"]

write.csv(CleanSurveyData,"CleanSurveyDataNew.csv")

#install.packages("readxl")
library(readxl)

data <- read_excel("lifetime download with translations.xlsx")
View(data)


#install.packages("haven")
library(haven)
survey <- read_sav("Sino Yoga Project Practrice or Interested Yoga.sav")
View(survey)

#change variable names
CleanSurvey<- survey |>
  rename(
    PracticeYogaInterest = Question_1,
    YogaExperience = Question_2,
    YogaActivities = Question_3_1,
    YogaActivitiesText = Question_3_8_TEXT,
    YogaFrequency = Question_4,
    YogaLifestyle = Question_5_1,
    YogaContentInterest = Question_5_2,
    YogaInfoSeeking = Question_5_3,
    PreferredVideoFormats = Question_6_1,
    BeginnerFlowInterest = Question_7_1,
    StressReliefFlowInterest = Question_7_2,
    BreathworkInterest = Question_7_3,
    FullLengthClassInterest = Question_7_4,
    MonthlyProgramInterest = Question_7_5,
    ShortsInterest = Question_7_6,
    ChineseMedicineInterest = Question_7_7,
    SubscriptionInterest = Question_8,
    WillingnessToPay = Question_9,
    WillingnessToPayText = Question_9_5_TEXT,
    VisitLikelihood = Question_10,
    SocialPlatforms = Question_11_1,
    AgeGroup = Question_12,
    Gender = Question_13,
    IncomeBracket = Question_14,
    Languages = Question_15_1,
    LanguagesText = Question_15_5_TEXT,
    Country = Question_16,
    SearchInterest = Question_17
  )

View(CleanSurvey)
