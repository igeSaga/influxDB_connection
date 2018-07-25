#install.packages("remotes")
#remotes::install_github("dleutnant/influxdbr@dev")

library(influxdbr)

con<-influx_connection(host = "10.180.26.130")

show_databases(con = con)

result <- influx_query(con = con,
                        db = "huettengraben", 
                        query = 'select mean("currentValue") from "HK02_00_TMP_MET_AT_RT" group by time(2h) fill(previous)',
                        simplifyList = T
                       )

plot(result)

plot(decompose(ts(result, frequency=12)))
