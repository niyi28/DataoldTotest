library(readxl)
IEA_HeadlineEnergyDataMimic <- read_excel("Data/IEA_HeadlineEnergyData.xlsx", 
                                     sheet = "Mimic", col_types = c("text", 
                                                                    "text", "text", "numeric", "numeric", 
                                                                    "numeric", "numeric", "numeric", "numeric", "numeric", 
                                                                    "numeric", "numeric", "numeric", "numeric", "numeric", 
                                                                    "numeric", "numeric", "numeric", "numeric", "numeric", 
                                                                    "numeric", "numeric", "numeric", "numeric", "numeric", 
                                                                    "numeric", "numeric", "numeric", "numeric", "numeric", 
                                                                    "numeric", "numeric", "numeric", "numeric", "numeric", 
                                                                    "numeric", "numeric", "numeric", "numeric", 
                                                                    "numeric", "numeric", "numeric", 
                                                                    "numeric", "numeric", "numeric", 
                                                                    "numeric", "numeric", "numeric", 
                                                                    "numeric", "numeric"))
View(IEA_HeadlineEnergyData)

library(tidyverse)
library(dplyr)

library(readxl)
IEA_HeadlineEnergyData <- read_excel("Data/IEA_HeadlineEnergyData.xlsx", 
                                     sheet = "TimeSeries_1971-2018", 
                                     skip = 1, col_types = c("text", 
                                                             "text","text", "text", "text", "text", "text", "numeric", "numeric", 
                                                             "numeric", "numeric", "numeric", "numeric", "numeric", 
                                                             "numeric", "numeric", "numeric", "numeric", "numeric", 
                                                             "numeric", "numeric", "numeric", "numeric", "numeric", 
                                                             "numeric", "numeric", "numeric", "numeric", "numeric", 
                                                             "numeric", "numeric", "numeric", "numeric", "numeric", 
                                                             "numeric", "numeric", "numeric", "numeric", "numeric", 
                                                             "numeric", "numeric", "numeric", "numeric", 
                                                             "numeric", "numeric", "numeric", 
                                                             "numeric", "numeric", "numeric", 
                                                             "numeric", "numeric", "numeric", ))

Total_Load_Day_Ahead <- read_excel("Data/Total Load - Day Ahead _ Actual_202001010000-202101010000.xlsx", 
                                   col_types = c("text", "numeric", "numeric"), 
                                   skip = 6)
mutatedtibbleLoad =Total_Load_Day_Ahead%>% 
  rename(forecastData = `Day-ahead Total Load Forecast`, 
         ActualData = `Actual Total Load`)%>%
  mutate(
  differenceAcPred = ActualData - forecastData) %>%
  plot(ActualData, type = "l")



primary_energy_consumptionUS <- read_excel("Data/primary-energy-consumption-by-region-and-fuel-eu-eo19-p66-tr.xlsx", 
                                           sheet = "66", range = "A4:X10")

  