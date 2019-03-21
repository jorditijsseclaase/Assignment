done = FALSE
while (!done){
  asw <- readline("Are you sure you want to reset the 5MIN dataset? (Yes/No) ")  
  
  if (asw=='Yes'){
    df <- read_csv("RT_traffic_5min.csv")
    write_csv(head(df,0), "RT_traffic_5min.csv")
    done =TRUE
  }
  
  if (asw=='No'){ done =TRUE }
}