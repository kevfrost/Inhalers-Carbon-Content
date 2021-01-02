
require("janitor")

require("data.table")
require("tidyverse")
require("httr")
require("jsonlite")
require("rlist")
library(readxl)
library(janitor)
library(foreach)
library(tidylog)
library(ggplot2)
library(ggrepel)
library(httr)
library(jsonlite)
library(rlist)
library(tidyverse)
library(foreach)

# mainDir <- getwd()
# subDir <- "InhalersOuput"


#Load carbon per inhaler
Inhaler <- read.csv("C:/Users/kev/Documents/GitHub/Inhalers-Carbon-Content/Inhalers.csv")
Inhalers <- na.omit(Inhaler)
Inhalers <- subset(Inhalers, Carbon.per.device>0)
#View(Inhalers)

  # if (file.exists(subDir)){
  #     setwd(file.path(mainDir, subDir))
  #     } else {
  #     dir.create(file.path(mainDir, subDir))
  #     setwd(file.path(mainDir, subDir))
  # 
  # }  


rm(df)
df <- c("items","quantity","actual_cost","date","row_id","row_name","ccg","setting","Org","drugCode","drug","carbon")
names(df)<-c("items","quantity","actual_cost","date","row_id","row_name","ccg","setting","Org","drugCode","drug","carbon")

request <- function(drugCode,orgCode,Drugname,CarbonPI) {
  print(drugCode)
   orgCode="36J"
    #drugCode="0302000N0AAACAC"
   
   RequestString <- paste0("https://openprescribing.net/api/1.0/spending_by_practice/?code=",drugCode,"&org=",orgCode,"&format=json")
#   
#   
   response <- GET(RequestString)
   contains <- content(response, as = "text", encoding = "UTF-8")
   
   newdf <- fromJSON(contains, flatten = TRUE) %>% data.frame()
   
   if (nrow(newdf)== 0)
   {return()}
   
   newdf$Org <- orgCode
   newdf$drugCode <-drugCode
   newdf$drug <- Drugname 
   newdf$carbon <- CarbonPI
   write.table(newdf, 'output.csv', sep = ",", col.names = !file.exists("output.csv"), append = T)
   return()
}

i <- 1
j = NROW(Inhalers)
while (i < j)
  {RequestID = as.character(Inhalers[i,]$id)
  
  request(RequestID,"36J",Inhalers[i,]$name,Inhalers[i,]$Carbon.per.device)
  i = i+1
  }