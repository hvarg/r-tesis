explorer <- read.csv(file="explorer.csv")
wikidata <- read.csv(file="wikidata.csv")

#old paired t test, same results

data <- data.frame(group = rep(c("explorer", "wikidata"), each = 28),
		   weight = c(rowMeans(explorer), rowMeans(wikidata)))

ex <- rowMeans(explorer)
wd <- rowMeans(wikidata)

#wilcox test

t.test(ex, wd, paired=T) # p-value de old es 0.00329 < 0.05
wilcox.test(ex, wd, alt="two.sided", paired=T, exact=F) # p-value de res es 0.007268 < 0.05

t.test(ex, wd, paired=T, alternative="greater") # explorer > wikidata 0.001647 < 0.05 ?
wilcox.test(ex, wweight ~ group, data=datad, alt="greater", paired=T, exact=F) # explorer > wikidata 0.003634 < 0.05 ?


# Con todo p-value = 4.904e-11, por si acaso.
all <- c(ex, wd)
wilcox.test(all, exact=F)
