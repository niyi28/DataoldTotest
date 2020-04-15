install.packages("sjmisc")

library(tidyverse)

library(stringr)

library(xlsReadWrite)
filenames = list.files("[path_name]", pattern="*.csv", full.names=TRUE)
for(i in 1:length(filenames)){
  a = read.csv(filenames[i])
  write.xls(a, paste("file",i,".xls", sep=""))
}

hospital_data = read.csv("C:/Users/Peter/Music/Rprojects/DataoldTotest/Data/hospital-data.csv",
                         header=TRUE, colClasses = "character")

library(readxl)
outcomeExcel = read_excel("Data/outcome_of_care_measures.xlsx")


outcome = read.csv("C:/Users/Peter/Music/Rprojects/DataoldTotest/Data/outcome-of-care-measures.csv",
                         header=TRUE, colClasses = "character")


outcome[,11] = as.numeric(outcome[,11])




namesofOutcome = names(outcome)

namesofOutcome = tolower(namesofOutcome)

namesofOutcome = str_replace_all(namesofOutcome, "[.]", " ")

names(outcome) = namesofOutcome

condtionarray = c()
mortalityarray = c()

for (i in seq_along(namesofOutcome)){
  containsCondition = sjmisc::str_contains(namesofOutcome[i], "heart attack")
  
  containsmortality = sjmisc::str_contains(namesofOutcome[i], "mortality")
  condtionarray = append(condtionarray, containsCondition)
  mortalityarray = append(mortalityarray, containsmortality)
}
condtionarray = ifelse(condtionarray == FALSE, NA, condtionarray)

mortalityarray = ifelse(mortalityarray == FALSE, NA, mortalityarray)

combinedConditions = complete.cases(condtionarray, mortalityarray)
containingoutcomeTrue = namesofOutcome[combinedConditions]

for (i in seq_along(containingoutcomeTrue)){
  contains = sjmisc::str_contains(containingoutcomeTrue[i], "mortality")
  
  containingoutcome = append(containingoutcome, contains)
}

sum(outcome[containingoutcomeTrue], na.rm = TRUE)

outcomeTest = outcome

sumarray = numeric(nrow(outcome))


for (m in seq_len(ncol(outcomeTest))){
  outcomeTest[, m] =  as.numeric(outcomeTest[, m])
}
  for (j in seq_along(nrow(outcomeTest))){
    sumarray[j] = sum(outcomeTest[j,seq_len(ncol(outcomeTest))], na.rm = TRUE)
}

columnsum = function(dftable){
  sumcolumn = numeric(ncol(dftable))
  for (i in 1:ncol(dftable)){
    
  }
}

######

best = function(states, outcomeafter){
  
  if (is.na(match(states, outcome[["state"]]))) {
    stop("invalid state")
  }

   
  outcomeforAnalysisN = outcome %>%
    filter(state == states)
  
  stateHospitals = outcomeforAnalysisN[["hospital name"]]
  
  namesofOutcomeN = names(outcomeforAnalysisN)
  
  condtionarrayN = c()
  mortalityarrayN = c()
  
  for (i in seq_along(namesofOutcomeN)){
    containsConditionN = sjmisc::str_contains(namesofOutcomeN[i], outcomeafter)
    containsmortalityN = sjmisc::str_contains(namesofOutcomeN[i], "lower mortality")
    
    condtionarrayN = append(condtionarrayN, containsConditionN)
    mortalityarrayN = append(mortalityarrayN, containsmortalityN)
  }
   if (sum(as.numeric(condtionarrayN)) == 0){
     stop("invalid condition")
   }
  
  condtionarrayN = ifelse(condtionarrayN == FALSE, NA, condtionarrayN)
  
  mortalityarrayN = ifelse(mortalityarrayN == FALSE, NA, mortalityarrayN)
  
  combinedConditionsN = complete.cases(condtionarrayN, mortalityarrayN)
  
  outcomeconditionN = outcomeforAnalysisN[combinedConditionsN]
  
  print(ncol(outcomeconditionN))
  
  for (m in seq_len(ncol(outcomeconditionN))){
    outcomeconditionN[, m] =  suppressWarnings(as.numeric(outcomeconditionN[, m]))
  }
  
  HospitalBestN = stateHospitals[which.min(outcomeconditionN[[1]])]
  
  Hospital.NameN =  sort(HospitalBestN)[1]

  
  Hospital.NameN
}



best("TX", "heart attack")

best("TX", "heart failure")

best("MD", "heart attack")

best("MD", "pneumonia")
