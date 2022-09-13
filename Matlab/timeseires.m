%%
d1 = (today:today+10)';
d2 = exp(randn(1,11))';
d = [d1 d2];
fts1 = fints(d)

%%
load dji30short  % 读入文件
d = myfts1       % 取出时间序列数据myftsl
candle(d)

%%
ftsgui

%%  相关系数
x = [2 4 6 9 3]';
y = [1 3 7 8 4]';
r = corrcoef(x,y);

%% 自相关系数
y1 = [1.01, 0.85];
for i = 3:150
    y1(i) = 0.4*y1(i-1)+0.35*y1(i-2)+normrnd(0,1);
end
y = y1(26:125);     % 去掉头25个数
t = 1:100;
plot(t,y);
mean(y);
std(y);
autocorr(y);
autocorr(y,99);   % 自相关系数
parcorr(y)        % 偏自相关系数
ar(y,2)           % 参数估计
%% 金融时间序列的预测
x(1) = y1(124);
x(2) = y1(125);
for i =3:27
    x(i) = 0.4321*y1(124+i-1)+0.3368*y1(124+i-2);
end
z = y1(124:150);
t = 1:27
plot(t,x,'-r',t,z,'-b')