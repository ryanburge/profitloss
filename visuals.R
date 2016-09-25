ggplot(data = total, aes(x = Group.1, y = x/1000, color = type, label = type)) +
  geom_line(aes(group = type), size=1) + ylab("Dollar Amount (in thousands)")

ggplotly()


ggplot(data = cah, aes(x = Year, y = Amount/1000, color = Dept, label = Dept)) +
  geom_line(aes(group = Dept), size=1) + geom_hline(yintercept = 0, linetype = "longdash") + ylab("Profit/Loss (in thousands)")

ggplotly()


ggplot(data = cos, aes(x = Year, y = Amount/1000, color = Dept, label = Dept)) +
  geom_line(aes(group = Dept), size=1) + geom_hline(yintercept = 0, linetype = "longdash") + ylab("Profit/Loss (in thousands)")

ggplotly()


ggplot(data = ceps, aes(x = Year, y = Amount/1000, color = Dept, label = Dept)) +
  geom_line(aes(group = Dept), size=1) + geom_hline(yintercept = 0, linetype = "longdash") + ylab("Profit/Loss (in thousands)")

ggplotly()


ggplot(data = bus, aes(x = Year, y = Amount/1000, color = Dept, label = Dept)) +
  geom_line(aes(group = Dept), size=1) + geom_hline(yintercept = 0, linetype = "longdash") + ylab("Profit/Loss (in thousands)")

ggplotly()

ggplot(data = cah, aes(x = Year, y = Amount)) + geom_line(aes(group = Dept)) + theme(axis.text.x = element_text(angle = 90)) + facet_wrap(~Dept) + ylab("Total Expenses") + geom_hline(yintercept = 0, linetype = "longdash")

ggplot(data = cos, aes(x = Year, y = Amount)) + geom_line(aes(group = Dept)) + theme(axis.text.x = element_text(angle = 90)) + facet_wrap(~Dept) + ylab("Total Expenses") + geom_hline(yintercept = 0, linetype = "longdash")

ggplot(data = ceps, aes(x = Year, y = Amount)) + geom_line(aes(group = Dept)) + theme(axis.text.x = element_text(angle = 90)) + facet_wrap(~Dept) + ylab("Total Expenses") + geom_hline(yintercept = 0, linetype = "longdash")

ggplot(data = bus, aes(x = Year, y = Amount)) + geom_line(aes(group = Dept)) + theme(axis.text.x = element_text(angle = 90)) + facet_wrap(~Dept) + ylab("Total Expenses") + geom_hline(yintercept = 0, linetype = "longdash")