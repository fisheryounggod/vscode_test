clc;
clear;
warning off;
load Lab2.mat;

% unrestricted estimate
%[x,fval,exitflag,output,grad,hessian] = fminunc(fun,x0,options)
options = optimset('fminunc');
options = optimset(options, 'display', 'iter','TolFun',1e-8);%    off
param0 = [-1; 1];
[params_unc,fval_unc,exitflag_unc,output_unc,grad_unc,hessian_unc] = fminunc('P_Lab2unc_ML', param0,options, [Y, E]);
se_unc = sqrt(diag(inv(hessian_unc)));
params_unc
fval_unc

% restricted estimate
param0 = -2;
[params_con,fval_con,exitflag_con,output_con,grad_con,hessian_con] = fminunc('P_Lab2con_ML', param0,options, [Y, E]);
se_con = sqrt(diag(inv(hessian_con)));  


if (exitflag_unc > 0) & (exitflag_con > 0) %  convergence.
    fprintf('exitflag = %1.0f means convergence\n', exitflag_unc);
    fprintf('=============================Display results===============================\n');
    fprintf('\t\t %s\t\t %s\t  %s\t %s\n', 'Greene_Unc', 'Pan_Unc', 'Greene_Con', 'Pan_Con')
    fprintf('beta\t\t %1.4f\t\t %1.4f\t %2.4f\t\t%2.4f\n', -4.7198, params_unc(1), 15.605, params_con(1))
    fprintf('s.e.\t \t%1.4f\t\t\t %1.4f\t\t %2.4f\t\t\t %2.4f\n', 2.344, se_unc(1), 6.794, se_con(1))
    fprintf('rho\t\t %1.4f\t\t\t %1.4f\t\t %1.4f\t\t\t %1.4f\n', 3.1517,  params_unc(2), 1.000, 1.000)
    fprintf('s.e.\t\t %1.4f\t\t\t %1.4f\t\t %1.4f\t\t\t %1.4f\n', 0.794, se_unc(2), 0.000, 0.000)
    fprintf('lnL\t\t %2.4f\t\t %1.4f\t %1.4f\t\t %1.4f\n', -82.914, -fval_unc, -88.438, -fval_con)
    fprintf('================================End========================================\n');
else
    fprintf('no convergence\n');
end

%
LR = -2*(-fval_con+fval_unc);
pval = 2*(1-chi2cdf(LR,1))
