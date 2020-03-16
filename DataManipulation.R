install.packages('nycflights13')

library(nycflights13)

library(tidyverse)

data(package ="nycflights13")

nrow(filter(flights, month == 1&day == 1))

nrow(filter(flights, month == 1, day == 1))

dec25 = filter(flights, month == 12, day == 25)

dec251 = filter(flights, month == 12 & day == 25)

month1 = filter(flights, month == 1)

sqrt(2)^2 == 2

near(sqrt(2)^2, 2)

nov_dec1 = filter(flights, month==11|month==12)

nov_dec = filter(flights, month %in% c(11,12))

nrow(nov_dec1)

nrow(nov_dec)

#####Flights lower than 2 hours
filter(flights, !(arr_delay >120 | dep_delay >120))

x = NA 

dfwithNA = tibble(x= c(1, NA, 3))

filter(dfwithNA, x>2)

filter(dfwithNA, is.na(x)|x>1)

View(arrange(flights, year, month, day))

View(flights)

View(arrange(flights, dep_delay))

View(arrange(flights, desc(dep_delay)))

dfnew = tibble(x= c(2, NA, 3,7, 1, 0))

arrange(dfnew, x)

arrange(dfnew, desc(x))

arrange(dfnew, asc(x))

arrange(flights, dep_delay)[1,]

arrange(flights, dep_delay)[,1]

select(flights, year, month, day)

select(flights, year:day)

select(flights, year:sched_dep_time)

rename(flights, tail_num = tailnum)

names(select(flights, time_hour, air_time, everything()))

select(flights, year, year)

vars = c("time_hour", "air_time", "year", "dep_delay", "arr_delay")

select(flights, one_of(c("time_hour", "air_time", "year", "dep_delay", "arr_delay")))

flights %>% select(one_of(c("time_hour","air_time","dep_delay")))

select(flights, contains("TIME"))

attach(flights)

flights_sml = select(flights, year:day, ends_with("delay"), distance, air_time)

flights_sml =mutate(flights_sml, 
       gain = dep_delay-arr_delay,
       speed = distance/air_time *60)

arrange(flights_sml, desc(gain))

mutate(flights_sml, 
       hours = air_time/60,
       gains_hour =gain/hours)

transmute(flights, 
          gain = dep_delay-arr_delay,
          speed = distance/air_time *60)