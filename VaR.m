clc;clear;

alpha = 0.95;
p = 1 - alpha;
% n = 2500;
% Sn = 113;
n = 3917;
Sn = 385;

LRuc0 = -2*log((1-p)^(n-Sn)*p^Sn/((1-Sn/n)^(n-Sn)*(Sn/n)^Sn))
pVal = chi2cdf(LRuc0,1,'upper')

LRuc1 = -2*((n-Sn)*log(1-p) + Sn*log(p) - (n-Sn)*log(1-Sn/n) - Sn*log(Sn/n))
pVal = chi2cdf(LRuc1,1,'upper')

