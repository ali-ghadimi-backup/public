
# call necessary R pkgs

library("tidyverse")


# set working directory

setwd("~/Google Drive/My Connect/R_WD")

# --- import data

ir_data2 <- read.delim(paste(getwd(),"/","ir_exchange_gold/data/usd_gold_data.csv", sep =""), header = TRUE, sep = "," , colClasses = c("Date", "NULL", "numeric", "numeric"))


# --- start of for loop


foth_v <- c()
week_mean <- c()


for (i in  1:length((ir_data2 %>% select(date))[,1])) {
        
       if  (weekdays(  as.Date(  ((ir_data2 %>% select(date))[,1])[i] , origin = "1970-01-01"  ))  == "Saturday"  && weekdays(  as.Date(  ((ir_data2 %>% select(date))[,1])[i-1] , origin = "1970-01-01"  ))  == "Friday" ) 
                
               {
                foth_v <- c(foth_v, ((ir_data2 %>% select(date))[,1])[i-1])
                
                wm <- mean(   (ir_data2 %>% filter(date >= (((ir_data2 %>% select(date))[,1])[i-1]-7) & date <= ((ir_data2 %>% select(date))[,1])[i-1]) %>% select("usd_t"))[,1]     ) 
                week_mean <- c(week_mean, wm)
                
                
                
       } else if (weekdays(  as.Date(  ((ir_data2 %>% select(date))[,1])[i] , origin = "1970-01-01"  ))  == "Saturday"  && weekdays(  as.Date(  ((ir_data2 %>% select(date))[,1])[i-1] , origin = "1970-01-01"  ))  == "Thursday" )  
                
               {
                
               foth_v  <- c(foth_v , ((ir_data2 %>% select(date))[,1])[i-1])
               wm <- mean(   (ir_data2 %>% filter(date >= (((ir_data2 %>% select(date))[,1])[i-1]-7) & date <= ((ir_data2 %>% select(date))[,1])[i-1]) %>% select("usd_t"))[,1]     ) 
               week_mean <- c(week_mean, wm)
               
# to collect saturday if friday and thursdays are not there!
                
        
       } else if (weekdays(  as.Date(  ((ir_data2 %>% select(date))[,1])[i] , origin = "1970-01-01"  ))  == "Saturday"  && weekdays(  as.Date(  ((ir_data2 %>% select(date))[,1])[i-1] , origin = "1970-01-01"  ))  != "Thursday" )  

{
        
        foth_v  <- c(foth_v , ((ir_data2 %>% select(date))[,1])[i])
        wm <- mean(   (ir_data2 %>% filter(date >= (((ir_data2 %>% select(date))[,1])[i]-7) & date <= ((ir_data2 %>% select(date))[,1])[i]) %>% select("usd_t"))[,1]     ) 
        week_mean <- c(week_mean, wm)
        
        
}
        
        
        
        
        
}


# --- End of loop

weekly_data <- data.frame("date" = as.Date(foth_v, origin = "1970-01-01") , "weekday" = weekdays(as.Date(foth_v, origin = "1970-01-01")), "mean" = week_mean)
 
# --- Result

weekly_data

ggplot(weekly_data,aes(x= date , y= mean)) + geom_line()
