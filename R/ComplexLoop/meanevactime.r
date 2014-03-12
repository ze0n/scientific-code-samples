percents <- c()
naviMean <- c()
naviLength <- c()

for(i in 0:20){
    p <- i * 5
    cat("Percent: ",p,"\n")

    cat("Reading file ...\n")
    dat <- read.csv(paste("data/evac.3.",p,"p.1m.txt",sep=""), header=FALSE, sep=";")

    cat("Dim: ", dim(dat), "\n")

    names(dat) <- c("Id","RouteStarted","RouteFinished","TurnsMade","TravelLength","MinLengthFromStartToEvacuationPoint","Color","HasNavigation")

    dat$evatime <- dat$RouteFinished - dat$RouteStarted
    d <- density(dat$evatime)

    # Evacuation time density
    png(paste("density/evactime.density.",p,"p.png", sep=""))
    plot(d, col="black", main=paste(p,"%"))
    dev.off()

    #-------------------------
    # Stupid Vs Smart
    #-------------------------
    withNavi <- subset(dat, HasNavigation == 1)
    withoutNavi <- subset(dat, HasNavigation == 0)
    cat(mean(withNavi$evatime), mean(withoutNavi$evatime), "\n")
    
    # travel time
    percents <- c(percents,p)
    naviMean <- c(naviMean,mean(withNavi$evatime), mean(withoutNavi$evatime))
    
    # travel length
    naviLength <- c(naviLength, mean(withNavi$TravelLength), mean(withoutNavi$TravelLength))
}

library(lattice)
require(lattice)


# percents labels
bar <- do.call(rbind, lapply(as.vector(percents), toString))
bar <- factor(percents, ordered = TRUE)

# form tables
means <- data.frame(column1=rep(bar, each=2), column2=rep(c("With DSS", "Without DSS"), 21), column3=naviMean)
meansLen <- data.frame(column1=rep(bar, each=2), column2=rep(c("With DSS", "Without DSS"), 21), column3=naviLength)

# plot1
png("density/evactime.density.means.png")
barchart(column3 ~ column1, groups=column2, means, auto.key = list(columns = 2), horizontal = FALSE, xlab = "Percents, %", ylab = "Time, s", main="Mean evacuation time", ticks=TRUE, ylim=c(0,5000))
dev.off()

# plot2
png("density/evactime.mean.length.png")
barchart(column3 ~ column1, groups=column2, meansLen, auto.key = list(columns = 2), horizontal = FALSE, xlab = "Percents, %", ylab = "Length, m", main="Mean traveled route length", ticks=TRUE, ylim=c(0,8000))
dev.off()
