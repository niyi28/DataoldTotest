rankhospital = function(states, outcomeafter, num = "best"){
  
  if (num == "best"){
    best(states, outcomeafter)
  }
  
  else if (num=="worst"){
    worst(states, outcomeafter)
  }
  
  else if (is.numeric(num)){
    outcomeforAnalysisN = outcome %>%
      filter(state == states)
    
    
    stateHospitals = outcomeforAnalysisN[["hospital name"]]
    
    #print(length(stateHospitals))
    
    if (num < length(stateHospitals)){
    
      namesofOutcomeN = names(outcomeforAnalysisN)
    
   
    
    condtionarrayN = c()
    mortalityarrayN = c()
    
    for (i in seq_along(namesofOutcomeN)){
      containsConditionN = sjmisc::str_contains(namesofOutcomeN[i], outcomeafter)
      containsmortalityN = sjmisc::str_contains(namesofOutcomeN[i], "mortality")
      
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
    
    #print(nrow(outcomeconditionN))
    
    for (m in seq_len(ncol(outcomeconditionN))){
      outcomeconditionN[, m] =  suppressWarnings(as.numeric(outcomeconditionN[, m]))
    }
    
    outcomeconditionN$stateHospitals= stateHospitals
    
    colnames(outcomeconditionN)[1] = "MortalityRate" 
    
     outcomeconditionN = outcomeconditionN %>%
       arrange(stateHospitals) %>%
       arrange(MortalityRate)
     
    HospitalBestN = outcomeconditionN[["stateHospitals"]][num]
    
    HospitalBestN
    
    }
    
     else{
        NA
     }
  } 
}
system.time(rankhospital("TX", "heart failure", 4))

rankhospital("TX", "heart failure", "best")

rankhospital("MD", "heart attack", "worst")
