
library(tidyverse)

jhu_url <- paste("https://raw.githubusercontent.com/CSSEGISandData/", 
                 "COVID-19/master/csse_covid_19_data/", "csse_covid_19_time_series/", 
                 "time_series_19-covid-Confirmed.csv", sep = "")

ConfirmedData <- read_csv(jhu_url) %>% rename(province = "Province/State", 
                                                      country_region = "Country/Region")

View(ConfirmedData)

Country_name = "China"

Germany_numbers = ConfirmedData%>%
  filter(country_region== Country_name)%>%
  select(-country_region, -Lat, -Long)


casing = c()
  for (days in 1:ncol(Germany_numbers)){
    
  casesDays = sum(Germany_numbers[[days]])
  casing = append(casing, casesDays)
  }


days = 1:ncol(Germany_numbers)
plot(days, casing)
plot(days, c(0,diff(casing)))

new_confirmedTable = function(ConfirmedDf){
  uniqueCountryA =c()
  tabledf = data.frame()
  for (i in 1:length(unique(ConfirmedDf[[2]]))){
    uniqueCountry = unique(ConfirmedDf[[2]])[i]
    uniqueCountryA = append(uniqueCountryA, uniqueCountry)

  
  sortedNames = sort(uniqueCountryA)
  
  Country_name = sortedNames[i]
  
   countryNumbers = ConfirmedDf%>%
     filter(country_region== Country_name)%>%
     select(-province,-country_region, -Lat, -Long)
  #   
   casesTest = c()
   for (days in 1:ncol(countryNumbers)){
  #   
     casesDays = sum(countryNumbers[[days]])
     casesTest = append(casesTest, casesDays)
   }
   casesDaysDf = data.frame(matrix(casesTest, nrow = 1, ncol = length(casesDays)))
  # 
   ConfirmedDataF = cbind.data.frame(sortedNames[i], casesDaysDf)
   colnames(ConfirmedDataF)[2:ncol(ConfirmedDataF)] = 1:ncol(countryNumbers)
   
   tabledf = append(tabledf, ConfirmedDataF)
  }
  return(ConfirmedDataF)
}