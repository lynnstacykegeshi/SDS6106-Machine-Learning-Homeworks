library(gstat)
library(sp)
library(tidyverse)

#load meuse data which is part of the 'sp' package
data(meuse)

#looking at the meuse data
glimpse(meuse)


#attach
attach(meuse)

mean(copper)


boxplot(copper)

hist(zinc)

#read on Box-Cox transformation
meuse$logzn <- log(zinc)
meuse$logcu <- log(copper)
meuse$logcd <- log(cadmium)
meuse$logpb <- log(lead)

hist(meuse$logzn)

pairs(meuse[,15:18])

coordinates(meuse) <- c("x", "y")

plot(meuse, asp = 1, pch = 1)


data("meuse.riv")
lines(meuse.riv)


pairs <- (length(zinc)-1)/2
pairs 


v <- variogram(logzn ~ 1, meuse)
plot(v)
