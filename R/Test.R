rm(ls = all())
require(lubridate)
require(xts)
ad <- ymd(20140514, tz = "UTC")
marketDates <- c(ad, ad + days(1), ad + weeks(1), ad + months(1), 
                 ad + months(2), ad + months(3), ad + months(6), 
                 ad + months(9), ad +years(1), ad = years(2), 
                 ad + years(3), ad + years(5), ad + years(7), 
                 ad + years(10), ad + years(15), ad + years(20), 
                 ad + years(25), ad + years(30))
marketDates
# use substring() to get rid of the time zone. 
marketDates <- as.Date(substring(marketDates, 1, 10))
marketRates <- c(0.0, 0.08, 0.125, 0.15, 0.20, 0.255, 0.35, 0.55, 
                 1.65, 2.25, 2.85, 3.10, 3.35, 3.65, 3.95, 4.65, 
                 5.15, 5.85) * 0.01
numRates <- length(marketDates)
numRates
numDates <- length(marketRates)
numDates
marketData.xts <- as.xts(marketRates, order.by = marketDates)
head(marketData.xts)
colnames(marketData.xts) <- "ZeroRate"
plot(x = marketData.xts[, "ZeroRate"], xlab = "Time", ylab = "Zero Rate",
     main = "Market Zero Rates 2014-05-14", ylim = c(0.0, 0.06),
     major.ticks= "years", minor.ticks = FALSE, col = "red")