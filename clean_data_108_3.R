#108 hourly air pollution data

#Clean environmemnt
rm(list=ls())

library(writexl)

df <- read.table("Data/108_2/Anio2017/dic17.txt", sep = ",")
names(df) <- c("PROVINCIA","MUNICIPIO","ESTACION","MAGNITUD","PUNTO_MUESTREO","PERIODO_ANALISIS","ANO","MES","DIA","H01","V01","H02","V02","H03","V03","H04","V04","H05","V05","H06","V06","H07","V07","H08","V08","H09","V09","H10","V10","H11","V11","H12","V12","H13","V13","H14","V14","H15","V15","H16","V16","H17","V17","H18","V18","H19","V19","H20","V20","H21","V21","H22","V22","H23","V23","H24","V24")

write_xlsx(df,"dic17.xlsx")
