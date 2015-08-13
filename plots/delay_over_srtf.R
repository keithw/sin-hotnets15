library(ggplot2)
library(reshape2)
d <- read.csv("delay_over_srtf.dat", sep="")
fig1data <- d[c("num.users", "SRTF", "SIN", "Rate.Sharing")]
fig1data <- melt(fig1data, id.vars="num.users")

pdf("r-test-plot.pdf", width=10, height=10)
print(ggplot(fig1data, aes(factor(num.users), value, fill=variable))+geom_bar(stat="identity", position="dodge") +xlab("Number of concurrent flows") + ylab("Milliseconds")+ ggtitle("Mean flow completion time over simulated 12Mb/s link"))
dev.off()
