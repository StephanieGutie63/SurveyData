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






