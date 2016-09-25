
library(ggplot2)
library(plotly)
library(extrafontdb)
library(extrafont)
library(DT)
library(dplyr)

Sys.setenv("plotly_username"="ryanburge")
Sys.setenv("plotly_api_key"="bvzv16do7x")

all <- read.csv("D:/profit.csv", stringsAsFactors = FALSE, strip.white = TRUE)


all$Year <- trimws(all$Year)
all$Scholarships <- trimws(all$Scholarships)
all$Amount <- trimws(all$Amount)
all$Summer <- trimws(all$Summer)
all$Amount <- gsub("^[(]", "-", all$Amount)
all$Amount <- gsub("[)]", "", all$Amount)
all$Amount <- as.numeric(all$Amount)
all$Scholarships <- as.numeric(all$Scholarships)
all$Summer <- as.numeric(all$Summer)

all$Year <- factor(all$Year, levels=unique(all$Year))

agg <- aggregate(all$Personnel, list(all$Year), sum)
agg2 <- aggregate(all$Net.Tuition, list(all$Year), sum)
agg3 <- aggregate(all$deducts, list(all$Year), sum)
agg$type <- c("Personnel Expenses")
agg2$type <- c("Net Tuition")
agg3$type <- c("Waivers + Scholarships")


total <- rbind(agg, agg2, agg3)

cah <- filter(all, College == "CAH")
cos <- filter(all, College == "COS")
bus <- filter(all, College == "Business")
ceps <- filter(all, College == "CEPS")

last <- filter(all, Year == "2015-2016")


all$deducts <- all$Waivers + all$Scholarships
all$deductper <- all$deducts/all$Total

displaylast <- select(last, Dept, College, Amount, Personnel, Total, Net.Tuition, deductper)

arrange(displaylast, desc(deductper))
arrange(displaylast, desc(Net.Tuition))
arrange(displaylast, desc(Personnel))
arrange(displaylast, desc(Amount))

