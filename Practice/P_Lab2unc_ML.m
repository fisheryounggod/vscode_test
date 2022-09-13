function [loglik, LLs] = P_Lab2unc_ML(params, data)
beta = params(1);
rho = params(2);
y = data(:,1); % income
edu = data(:,2); % education

beta_i = 1./(beta+edu);

LLs = rho*log(beta_i) -log(gamma(rho))+(rho-1)*log(y)-y.*beta_i; %Equation (46)
loglik = -sum(LLs);


if isnan(loglik)||isinf(loglik)||(~isreal(loglik))
    loglik = 1e8;
end