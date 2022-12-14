### Chapter 3 ####
### Petro Price
#linux setwd("~/GitDoc/introTS/chap3/")
library(quantmod)
da=read.table("w-petroprice.txt",header=T)
da1=read.table("w-gasoline.txt")
pgs=log(da1[,1])
pus=log(da$US)
tdx=c(1:717)/52+1997  # calendar time
par(mfcol=c(2,1))
plot(tdx,pgs,xlab='year',ylab='ln(price)',type='l')
title(main='(a) Gasoline')
plot(tdx,pus,xlab='year',ylab='ln(price)',type='l')
title(main='(b) Crude oil')
dpgs=diff(pgs)
plot(dpgs,type='l')
acf(dpgs,lag=20)
pacf(dpgs,lag=20)
m1=ar(diff(pgs),method='mle')
m1$order
t.test(dpgs)
m1=arima(dpgs,order=c(5,0,0),include.mean=F)
m1
m1=arima(dpgs,order=c(5,0,0),include.mean=F,fixed=c(NA,NA,NA,0,NA))
m1
tsdiag(m1,gof=20)
dpus=diff(pus)
plot(pus)
m3=lm(dpgs~-1+dpus)
summary(m3)
acf(m3$residuals,lag=20)
pacf(m3$residuals,lag=20)
m4=ar(m3$residuals,method='mle')
m4$order
m4=arima(dpgs,order=c(6,0,0),include.mean=F,xreg=dpus)
m4
m4=arima(dpgs,order=c(5,0,0),include.mean=F,xreg=dpus)
m4
m4=arima(dpgs,order=c(5,0,0),include.mean=F,xreg=dpus,fixed=c(NA,NA,NA,0,NA,NA))
m4
tsdiag(m4,gof=20)
c1=c(NA,NA,NA,0,NA)
pm1=backtest(m1,dpgs,316,1,fixed=c1,inc.mean=F)
c4=c(NA,NA,NA,0,NA,NA)
pm4=backtest(m4,dpgs,316,1,xre=dpus,inc.mean=F,fixed=c4)
tdx=tdx[2:717]
pm4fit=dpgs[317:716]-pm4$error
pm1fit=dpgs[317:716]-pm1$error
plot(tdx[317:716],dpgs[317:716],xlab='year',ylab='growth',type='l')
points(tdx[317:716],pm1fit,pch='*')
plot(tdx[317:716],dpgs[317:716],xlab='year',ylab='growth',type='l')
points(tdx[317:716],pm4fit,pch='*')
m6=lm(dpgs[2:716]~-1+dpus[1:715])
summary(m6)
acf(m6$residuals,lag=20)
pacf(m6$residuals,lag=20)
m7=ar(m6$residuals,method='mle')
m7$order
m7=arima(dpgs[2:716],order=c(9,0,0),include.mean=F,xreg=dpus[1:715])
m7
m7=arima(dpgs[2:716],order=c(9,0,0),include.mean=F,xreg=dpus[1:715],fixed=c(NA,NA,NA,0,NA,0,0,0,NA,NA))
m7
tsdiag(m7,gof=20)
c7=c(NA,NA,NA,0,NA,0,0,0,NA,NA)
pm7=backtest(m7,dpgs[2:716],315,1,xre=dpus[1:715],inc.mean=F,fixed=c7)
## Global temperature
Gt=scan(file='m-GLBTs.txt')
Gtemp=ts(Gt,frequency=12,start=c(1880,1))
plot(Gtemp,xlab='year',ylab='temperature',type='l') # Plot the data
acf(diff(Gt),lag=36)
pacf(diff(Gt),lag=36)
m1=arima(Gt,order=c(1,1,2))
m1
acf(m1$residuals,lag=36)
m1=arima(Gt,order=c(1,1,2),seasonal=list(order=c(0,0,1),period=24))
m1
tsdiag(m1,gof=36)
## trend-stationarity
time=c(1:1568) # time index
m2=lm(Gt~time)
summary(m2)
par(mfcol=c(2,1))
acf(m2$residuals,lag=36)
pacf(m2$residuals,lag=36) 
m2=arima(Gt,order=c(2,0,1),xreg=time)
m2
tsdiag(m2,gof=36)  # Significant ACF at lag 24.
m2=arima(Gt,order=c(2,0,1),seasonal=list(order=c(0,0,1),period=24),xreg=time)
m2
tsdiag(m2,gof=36) # model checking
### Comparison 
source("../chap2/backtest.R")
pm1=backtest(m1,Gt,1368,1)
time=as.matrix(time)
pm2=backtest(m2,Gt,1368,1,xre=time)
###
Gt=scan(file='m-GLBTs.txt')
time=c(1:1568)
time1=c(rep(0,1212),time[1213:1568])
mm1=lm(Gt~time+time1)
summary(mm1)
x1=cbind(time,time1)
mm1=arima(Gt,order=c(2,0,1),seasonal=list(order=c(0,0,1),period=24),xreg=x1)
mm1
tsdiag(mm1,gof=36)
Box.test(mm1$residuals,lag=8,type='Ljung')
####
da=read.table("m-ncdc-noaa-glbtemp.txt")
head(da)
tail(da)
da=da[1:1568,]
temp=da[,3]
m3=arima(temp,order=c(1,1,2),seasonal=list(order=c(0,0,1),period=24))
m3
tsdiag(m3,gof=36)
m4=arima(temp,order=c(2,0,1),seasonal=list(order=c(0,0,1),period=24),xreg=time)
m4
m4$coef
sqrt(diag(m4$var.coef))
m4$coef/sqrt(diag(m4$var.coef))  # Compute t-ratios 
tsdiag(m4,gof=36)
### Backtesting 
pm3=backtest(m3,temp,1368,1)
pm4=backtest(m4,temp,1368,1,xre=time)
## U.S. Monthly Unemployment Rates
da=read.table(``m-unrate.tct'',header=T)
dim(da)
head(da)
unemp=da$rate
unrate=ts(unemp,frequency=12,start=c(1948,1))
plot(unrate,xlab='year',ylab='unrate',type='l')
par(mfcol=c(2,2))
acf(unemp,lag=36)
pacf(unemp,lag=36)
acf(diff(unemp),lag=36)
pacf(diff(unemp),lag=36)
m1=arima(unemp,order=c(1,1,5),seasonal=list(order=c(1,0,1),period=12)
m1 
c1=c(NA,NA,NA,0,0,NA,NA,NA)
m1=arima(unemp,order=c(1,1,5),seasonal=list(order=c(1,0,1),period=12),fixed=c1)
m1
tsdiag(m1,gof=36)
Box.test(m1$3$residuals,lag=24,type='Ljung')
Box.test(m1$residuals,lag=36,type='Ljung')
###
mm=arima(unemp,order=c(0,1,0),seasonal=list(order=c(1,0,1),period=12))
mm
par(mfcol=c(2,1))
acf(mm$residuals,lag=24)
pacf(mm$residuals,lag=24) 
mm1=arima(unemp,order=c(5,1,0),seasonal=list(order=c(1,0,1),period=12))
mm1
cc1=c(0,NA,NA,NA,NA,NA,NA)
mm1=arima(unemp,order=c(5,1,0),seasonal=list(order=c(1,0,1),period=12),fixed=cc1)
mm1
tsdiag(mm1,gof=36)
# Backtesting
source("backtest.R")
pm1=backtest(m1,unemp,700,1,fixed=c1,inc.mean=F)
pmm1=backtest(mm1,unemp,700,1,fixed=cc1,inc.mean=F)
# Use of initial jobless claims
da=read.table("m-unrateic.txt",header=T)
head(da)
unrate=da$rate
x=da[,5:9]/1000
nm1=lm(unrate~icm1,data=x)
summary(nm1)
par(mfcol=c(2,1))
acf(nm1$residuals,lag=36)
pacf(nm1$residuals,lag=36)
nm1=arima(unrate,order=c(2,0,3),xreg=x[,5],seasonal=list(order=c(1,0,1),period=12))
nm1
nm1=arima(unrate,order=c(2,0,2),seasonal=list(order=c(1,0,1),period=12),xreg=x[,5])
nm1
tsdiag(nm1,gof=36)
###
nm2=lm(unrate~w1m1+w2m1+w3m1+w4m1,data=x)
summary(nm2)
nm2=lm(unrate~w1m1+w2m1+icm1,data=x)
summary(nm2)
nm2=lm(unrate~w1m1+w2m1,data=x)
summary(nm2)
acf(nm2$residuals,lag=36)
pacf(nm2$residuals,lag=36)
nm2=arima(unrate,order=c(2,0,2),seasonal=list(order=c(1,0,1),period=12),xreg=x[,1:2])
nm2
tsdiag(nm2,gof=36)
##
