#install.packages('nycflights13')


#install.packages("Lahman")

##### To run script - Ctrl + Shift + S

library(Lahman)

library(nycflights13)

library(tidyverse)

library(dplyr)

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

arrange(flights, dep_delay)[1,]

arrange(flights, dep_delay)[,1]

select(flights, year, month, day)

select(flights, year:day)

select(flights, year:sched_dep_time)

rename(flights, tail_num = tailnum)

attach(flights)

names(select(flights, time_hour, air_time, everything()))

flights%>% select(carrier, sched_dep_time , arr_time , sched_arr_time )%>%
  group_by(carrier)%>%
  summarise(Averagetime = length(arr_time), Averagetime1 = length(sched_dep_time), 
            Averagetime2 = length(sched_arr_time))

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

### Rename name of column
flights%>% arrange(dep_delay)%>%
  rename(DepTime = dep_time)

flights%>% transmute(dep_time,
  hour = dep_time%/% 100,
  minute = dep_time%%100
)

x= 1:10

lead(x)
lag(x)

cumsum(x)

cummean(x)

y = c(1:4, NA,6, 6:13)

min_rank(air_time)

min_rank(desc(y))

row_number(y)

percent_rank(y)

cume_dist(y)

flights%>% 
  transmute(newDep = dep_time%%100, 
                    newsched = sched_dep_time%%100)%>%
  arrange(newDep, newsched)

flights%>% select(air_time, dep_time)%>%
  transmute(air_time,
    differnt = air_time - dep_time
  )

flights%>% summarise(delay_mean = mean(dep_delay, na.rm = TRUE), 
                     delaymean2 =mean(dep_time, na.rm = TRUE) )

#### For grouping as done in python
flights%>% group_by(year, month, day)%>%
  summarise(delay_mean = mean(dep_delay, na.rm = TRUE))

flights%>% group_by(dest) %>%
  summarise(count=n(), 
            dist = mean(distance, na.rm = TRUE),
            delay = mean(arr_delay, na.rm = TRUE))%>%
  filter(count > 20 & dest != "HNL")%>%
  ggplot(mapping = aes(x=dist, y = delay)) + 
  geom_point(aes(size = count), alpha = 1/3) +
  geom_smooth(se=FALSE)

flights%>% filter(!is.na(dep_delay), !is.na(arr_delay))%>%
  group_by(year, month, day)%>%
  summarise(mean=mean(dep_delay))


flights%>% filter(!is.na(dep_delay), !is.na(arr_delay))%>%
  group_by(tailnum)%>%
  summarise(delay = mean(arr_delay))%>%
  ggplot(mapping = aes(x=delay)) + 
  geom_freqpoly(binwidth = 5)


not_cancelled = flights %>% 
  filter(!is.na(dep_delay), !is.na(arr_delay))

delays = not_cancelled %>%
  group_by(tailnum) %>%
  summarise(
    delay = mean(arr_delay, na.rm = TRUE),
    count = n()
  )

delays %>% 
  ggplot(aes(x=count, y = delay)) + 
  geom_point(alpha=1/10)

delays %>% 
  filter(count > 25) %>%
  ggplot(mapping = aes(x = count, y = delay)) + 
  geom_point(alpha = 1/10)

batting = as_tibble(Lahman::Batting)


first(3:10
      )



