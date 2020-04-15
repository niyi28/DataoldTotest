rankall = function(outcomeafter, num = "best"){
  
  outcomesorted =  outcome %>%
    arrange(state)
  
  uniqueStatearray = unique(outcomesorted[["state"]])
  
  statearray = c()
  
  Hospitalstate = c()
  
  for (st in uniqueStatearray){
    
    if (num == "best"){
     Besthospital = best(st, outcomeafter)
    }
    
    else if (num=="worst"){
      Besthospital = worst(st, outcomeafter)
    }
    
    else if (is.numeric(num)){
      outcomeforAnalysisN = outcomesorted %>%
        filter(state == st)
      
      
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
        
        
          Besthospital = outcomeconditionN[["stateHospitals"]][num]
        
        
      }
      
      else{
        Besthospital = NA
      }
    } 
    statearray = append(statearray, st)
    
    Hospitalstate = append(Hospitalstate, Besthospital)
    
  }
  StateandHospitalDf = data.frame(statearray, Hospitalstate)
  
  StateandHospitalDf
}

View(rankall("heart attack", 20))

tail(rankall("pneumonia", "worst"), 3)

tail(rankall("heart failure"), 10)

testdf = outcome %>%
  arrange(state)

unique(testdf$state)
