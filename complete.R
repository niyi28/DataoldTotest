complete = function(directory, id = 1:332){
        data_location = paste(WD, directory, sep="/")
        nobsArray = numeric(length(id))
        temp = list.files(path =data_location ,pattern="*.csv")
        
        for (monitor_id in id){
          print(monitor_id)
                monitordataCSV = read.csv(paste(data_location, temp[monitor_id], sep = "/"))
                Bothpollutants1 = monitordataCSV[[2]]
                Bothpollutants2 = monitordataCSV[[3]]
                
                completeCases = complete.cases(Bothpollutants1, Bothpollutants2)
                
                nobsArray[monitor_id] = length(Bothpollutants1[completeCases])
        } 
        nobs = nobsArray[id]
        df_cases = data.frame(id, nobs)
        df_cases
        
}
2410.3462
complete("specdata", c(6,10,20,34,100,200,310))

complete("specdata", 54)

RNGversion("3.5.1")
set.seed(42)
cc = complete("specdata", 332:1)
use = sample(332, 10)
cc[use, "nobs"]
