percents <- c()
naviMean <- c()
naviLength <- c()

for(i in 1:3){
    p <- 5 + i * 5
    cat("Percent: ",p,"\n")

    cat("Reading file ...\n")
    dat <- read.csv(paste("agents.dens.",p,".csv",sep=""), header=FALSE, sep=";")
    names(dat) <- c("Id","Changes")
    # plot1
    png(paste("agents.",p,".png",sep=""))
    plot(hist(dat$Changes))
    dev.off()

}

