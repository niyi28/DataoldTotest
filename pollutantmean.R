WD = setwd("C:/Users/Peter/Music/Rprojects/DataoldTotest/Data")

pollutantmean = function(directory, pollutant, id = 1:332){
        data_location = paste(WD, directory, sep="/")
        mean_columns = c()
        temp = list.files(path =data_location ,pattern="*.csv")
        
        for (monitor_id in id){
          print(monitor_id)
                monitordataCSV = read.csv(paste(data_location, temp[monitor_id], sep = "/"))
                
                Bothpollutants1 = monitordataCSV[[2]]
                Bothpollutants2 = monitordataCSV[[3]]
                
                completeCases = complete.cases(Bothpollutants1, Bothpollutants2)
                
                mean_columns = append(mean_columns, monitordataCSV[[pollutant]])
               
        }
        
       mean_columnsID = mean(mean_columns, na.rm = TRUE)
       mean_columnsID
        
       
}

pollutantmean("specdata", "sulfate", 34)

pollutantmean("specdata", "nitrate", 70:72)

pollutantmean("specdata", "nitrate")
