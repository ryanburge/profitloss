all <- read.csv("D:/profitloss/all.csv", stringsAsFactors = FALSE, strip.white = TRUE)


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

all$deducts <- all$Waivers + all$Scholarships
all$deductper <- all$deducts/all$Total

all$Total.Expenses <- all$Net.Tuition - all$Amount
all$Other.Expenses <- all$Total.Expenses - all$Personnel


agg <- aggregate(all$Personnel, list(all$Year), sum)
agg2 <- aggregate(all$Net.Tuition, list(all$Year), sum)
agg3 <- aggregate(all$deducts, list(all$Year), sum)
agg4 <- aggregate(all$Total.Expenses, list(all$Year), sum)
agg$type <- c("Personnel Expenses")
agg2$type <- c("Net Tuition")
agg3$type <- c("Waivers + Scholarships")
agg4$type <- c("Total Expenses")
agg5 <- aggregate(all$Amount, list(all$Dept), sum)


### This can be done with dplyr and reshape

a1 <- all %>% group_by(Year) %>% summarise(per_exp = sum(Personnel), net_tuition = sum(Net.Tuition), deduct_total = sum(deducts))
a2 <- melt(a1, id= "Year")
ggplot(a2, aes(x=Year, y=value/1000, colour = variable, group = variable)) + geom_line() + 
  scale_colour_hue(name= "", labels=c("Personnel Expenses", "Net Tuition", "Deductions")) + ylab("Dollar Amount (in Thousands)")

