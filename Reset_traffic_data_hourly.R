done = FALSE
while (!done){
  asw <- readline("Are you sure you want to reset the HOURLY dataset? (Yes/No) ")  
  
  if (asw=='Yes'){
    df <- read_csv("RT_traffic_hourly.csv")
    write_csv(head(df,0), "RT_traffic_hourly.csv")
    done =TRUE
  }
  
  if (asw=='No'){ done =TRUE }
}