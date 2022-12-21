# library to load the reader 
library(readr)
# set working directory 
setwd("C:\\Users\\Jerry.Craft\\Documents\\R")
# read spider output into ness data frame 
ness <- read.csv('export.csv')
# cut out unecessary data
df = subset(ness, select = -c(Internal.ID,Parent.ID,Date.Found, Type, Risky, Module, Children, Correlations, Distance, Starred, Annotation, Source.Data))
# tail data for audit purposes
tail(df)
# write data to email.txt so we have all emails.
write.table(df,"email.txt",sep="\t",row.names = FALSE, quote=FALSE)
# remove email domain for user list
df$Data <- gsub('@nksfb.com',"",df$Data)
# tail that so we can audit results
tail(df)
# pull out unique usernames
uniqdf <- unique(df)
# write out uniq usernames
write.table(uniqdf,"username.txt",sep="\t",row.names = FALSE, quote=FALSE)
