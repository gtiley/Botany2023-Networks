#setwd("YOUR_PATH/BotanyWorkshop/Converge-finished/4/")
library(ggplot2)
library(gridExtra)
library(stringr)


x1 <- read.table("4.1.mcmc",header=TRUE,sep="\t")
x2 <- read.table("4.2.mcmc",header=TRUE,sep="\t")
x3 <- read.table("4.3.mcmc",header=TRUE,sep="\t")
x4 <- read.table("4.4.mcmc",header=TRUE,sep="\t")

paramNames <- colnames(x1)

thetaStart <- 0
thetaStop <- 0
ntheta <- 0
tauStart <- 0
tauStop <- 0
ntau <- 0
extraStart <- 0
extraStop <- 0
nextra <- 0

plotList <- vector(mode = "list", length = (length(paramNames)+1))

for (i in 1:length(paramNames))
{
	if (str_detect(paramNames[i], "tau") == TRUE)
	{
		if (tauStart == 0)
		{
			tauStart = i
		}
		ntau = ntau+1
	}
	if (str_detect(paramNames[i], "theta") == TRUE)
	{
		if (thetaStart == 0)
		{
			thetaStart = i
		}
		ntheta = ntheta+1
	}
	if ((str_detect(paramNames[i], "theta") == FALSE) && (str_detect(paramNames[i], "tau") == FALSE) && (paramNames[i] != "Gen"))
	{
		if (extraStart == 0)
		{
			extraStart = i
		}
		nextra = nextra+1
	}
}
thetaStop = thetaStart + (ntheta - 1)
tauStop = tauStart + (ntau - 1)
extraStop = extraStart + (nextra - 1)

#vectors of median node heights for plotting
mnh12 <- c()
mnh34 <- c()
mnhCounter <- 1
maxNodeHeight <- 0
#####

for (i in thetaStart:length(paramNames))
{

		x1p2 <- x1[,i]
		x2p2 <- x2[,i]
		x3p2 <- x3[,i]
		x4p2 <- x4[,i]

		d1 <- data.frame(value = x1p2, variable = "chain 1")
		d2 <- data.frame(value = x2p2, variable = "chain 2")
		d3 <- data.frame(value = x3p2, variable = "chain 3")
		d4 <- data.frame(value = x4p2, variable = "chain 4")

		
		dat <- rbind(d1,d2,d3,d4)
		dat$variable <- factor(dat$variable, c("chain 1", "chain 2", "chain 3", "chain 4"))
		p <- ggplot(dat, aes(x = variable, y = value)) + geom_violin(scale = "width", adjust = 1, width = 0.5,aes(fill=variable)) + scale_fill_manual(values=c("#5ab4ac", "#5ab4ac", "#5ab4ac", "#5ab4ac")) + theme_bw() + theme(axis.title.x=element_blank(),axis.title.y=element_blank(),axis.text.x=element_blank(),legend.position="none") + labs(title=paste("",paramNames[i],sep=""))
		plotList[[i]] <- p
		
	if (i >= tauStart && i <= tauStop)
	{
		temp1 <- c(x1[,i],x2[,i])
		temp2 <- c(x3[,i],x4[,i])
		mnh12[mnhCounter] <- median(temp1)
		mnh34[mnhCounter] <- median(temp2)
		mnhCounter <- mnhCounter + 1
		if (median(temp1) > maxNodeHeight)
		{
			maxNodeHeight = median(temp1)
		}
		if (median(temp2) > maxNodeHeight)
		{
			maxNodeHeight = median(temp2)
		}
	}	
}


####Throw in the node height plot
paddedHeight <- (maxNodeHeight * 1.05)
mnhData <- as.data.frame(cbind(mnh12,mnh34))
p <- ggplot(data=mnhData,aes(x=mnh12,y=mnh34,alpha=0.7)) + geom_point(size=3) + geom_segment(aes(x=0.0,y=0.0,xend=paddedHeight,yend=paddedHeight), linetype=2) + theme_bw() + theme(legend.position="none") + labs(title="Median Node Heights",x="chain 1 + chain 2",y="chain 3 + chain 4") + xlim(0.0,paddedHeight) + ylim(0.0,paddedHeight)
plotList[[length(paramNames) + 1]] <- p


####
#Determine the plotting dimensions
####
thetaPlots <- list()
thetaCol <- 0
thetaRow <- 0
thetaMinDist <- 1000
tauPlots <- list()
tauCol <- 0
tauRow <- 0
tauMinDist <- 1000
extraPlots <- list()
extraCol <- 0
extraRow <- 0
extraMinDist <- 1000

for (i in thetaStart:thetaStop)
{
	thetaPlots <- append(thetaPlots,list(plotList[[i]]))
}
for (i in tauStart:tauStop)
{
	tauPlots <- append(tauPlots,list(plotList[[i]]))
}
for (i in extraStart:extraStop)
{
	extraPlots <- append(extraPlots,list(plotList[[i]]))
}

#Determine the number of panels used for the plots. Constrained to probably upper limit of Params for BPP
for (j in 1:6)
{
	if (ntheta/j >= 1)
	{
		tempRow <- ceiling(ntheta/j)
		tempCol <- j
		if ((tempRow - tempCol) <= thetaMinDist && (tempRow - tempCol) > 0)
		{
			thetaRow <- ceiling(ntheta/j)
			thetaCol <- j
			thetaMinDist <- (tempRow - tempCol)
		}
	}

	if (ntau/j >= 1)
	{
		tempRow <- ceiling(ntau/j)
		tempCol <- j
		if ((tempRow - tempCol) <= tauMinDist && (tempRow - tempCol) > 0)
		{
			tauRow <- ceiling(ntau/j)
			tauCol <- j
			tauMinDist <- (tempRow - tempCol)
		}
	}
	if (nextra/j >= 1)
	{
		tempRow <- ceiling(nextra/j)
		tempCol <- j
		if ((tempRow - tempCol) <= extraMinDist && (tempRow - tempCol) > 0)
		{
			extraRow <- ceiling(nextra/j)
			extraCol <- j
			extraMinDist <- (tempRow - tempCol)
		}
	}
}

ggsave(file = "ThetaPosteriors.png", height=8, width=6.5, units="in", dpi=300, arrangeGrob(grobs = thetaPlots,ncol=thetaCol,nrow=thetaRow))
ggsave(file = "TauPosteriors.png", height=8, width=6.5, units="in", dpi=300, arrangeGrob(grobs = tauPlots,ncol=tauCol,nrow=tauRow))
if (nextra > 1)
{
	ggsave(file = "ExtraPosteriors.png", height=8, width=6.5, units="in", dpi=300, arrangeGrob(grobs = extraPlots,ncol=extraCol,nrow=extraRow))
}
if (nextra == 1)
{
	ggsave(file = "lnL.png", height=6.5, width=6.5, units="in", dpi=300, plotList[[length(paramNames)]])
}
ggsave(file = "NodeHeights.png", height=6.5, width=6.5, units="in", dpi=300, plotList[[length(paramNames)+1]])

