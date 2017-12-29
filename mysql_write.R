## Write some data to an AWS MySQL Instance ##

install.packages("RMySQL")
library(RMySQL)

mysql_host <- "mytestdb.cm5bakhlsxwn.us-east-1.rds.amazonaws.com"
mysql_user <- "root"
mysql_pass <- "123123xx"
mysql_dbname <- "root"
mysql_port <- 3306

mydb = dbConnect(MySQL(), 
                 user=mysql_user, 
                 password=mysql_pass, 
                 dbname=mysql_dbname, 
                 host=mysql_host,
                 port=mysql_port)

dbListTables(mydb)

interest_rates <- read.csv("../data/us_interest_rates.csv")
head(interest_rates)

dbWriteTable(mydb, name='us_interest_rates', value=interest_rates,
             row.names=FALSE, overwrite=TRUE)

dbDisconnect(mydb)

### Method 1
dbGetQuery(mydb, "SELECT * FROM us_interest_rates")

### Method 2
mydata<-dbSendQuery(mydb, "SELECT * FROM us_interest_rates")  
dbFetch(mydata, n=-1) 
dbClearResult(mydata)

### Method 3
dbReadTable(mydb, "us_interest_rates") 

### They can be used to run more queries
dbGetQuery(mydb, "DROP TABLE us_interest_rates")
