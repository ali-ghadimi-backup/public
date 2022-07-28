days <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Saturday",  "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday" , "Saturday",  "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday" , "Saturday",  "Sunday")

fot_vector <- c()

for( i in 1:length(days)) {
        
        if (days[i]  == "Saturday" && days[i-1] == "Friday" )
                
        {
                print("Friday")
                fot_vector <- c(fot_vector, days[i-1])
                
                
        } else if (days[i] == "Saturday" && days[i-1] == "Thursday" ) 
                
        {
                print("Thursday")
                fot_vector <- c(fot_vector, days[i-1])
                
        }
        
}
fot_vector




if  (weekdays(  as.Date(  ((ir_data2 %>% select(date))[,1]) [i] , origin = "1970-01-01"  )   )  == "Saturday"  && weekdays(  as.Date(  ((ir_data2 %>% select(date))[,1])[i-1] , origin = "1970-01-01"  ))  == "Friday" ) 
        
days

