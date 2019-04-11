#108 hourly air pollution data

#Clean environmemnt
rm(list=ls())

#ene feb mar abr may jun jul ago sep oct nov dic

filename = "Data/108_2/Anio2017/oct17"

con_r = file(paste(filename,"txt",sep="."), "r")
con_w = file(paste(filename,"csv",sep="."), "w")
writeLines("PROVINCIA;MUNICIPIO;ESTACION;MAGNITUD;PUNTO_MUESTREO;PERIODO_ANALISIS;ANO;MES;DIA;H01;V01;H02;V02;H03;V03;H04;V04;H05;V05;H06;V06;H07;V07;H08;V08;H09;V09;H10;V10;H11;V11;H12;V12;H13;V13;H14;V14;H15;V15;H16;V16;H17;V17;H18;V18;H19;V19;H20;V20;H21;V21;H22;V22;H23;V23;H24;V24", con_w)

while ( TRUE ) {
  line_r = readLines(con_r, n = 1)
  if ( length(line_r) == 0 ) {
    break
  }
  n_line <- nchar(line_r)
  #POS NUMBER CHANGES AFTER OCT 2017 (ANO)
  pos <- c(c(2,3,3,2,2,2,2,2,2),rep(c(5,1),24))
  lev_o <- cumsum(c(0,pos)) +  c(0,rep(1, length(pos)))
  lev_c <- c(cumsum(pos),n_line)
  line_w = substr(line_r,lev_o[1], lev_c[1])
  for (i in c(2:length(pos))) {
    line_w <- paste(line_w, substr(line_r, lev_o[i], lev_c[i]), sep=";")
  }
  writeLines(line_w, con_w)
}

close(con_r)
close(con_w)

