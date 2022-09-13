function [loglik, LLs] = P_Lab2con_ML(params, data)
beta = params(1);
y = data(:,1); %income
edu = data(:,2); %education

beta_i = 1./(beta+edu);

LLs = log(beta_i)-y.*beta_i; % equation (47)

loglik = -sum(LLs);


if isnan(loglik)||isinf(loglik)||(~isreal(loglik))
    loglik = 1e8;
end