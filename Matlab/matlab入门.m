%%
% 运行：            Com + enter
% 运行选中部分：     Shift + F7
% 选中部分的帮助：   F1
% 注释：            Com + /
% 取消注释          Com + T
% 智能缩进：        Com + I
% 函数浏览器：      Shift + F1
% 函数提示：        Ctrl + F1
%%
clc,clear
f=-[1.15 1.15 1.15 1.15 1.25 1.4 1.06 1.06 1.06 1.06 1.06];
A=[1 0 0 0 0 0 1 0 0 0 0
    0 1 0 0 0 1 -0.06 1 0 0 0
    -0.15 0 1 0 1 0 0  -0.06 1 0 0
    0 -0.15 0 1 0 0 0 0 -0.06 1 0
    0 0 -0.15 0 0 0 0 0 0  -0.06 1];
b=[10 0 0 0 0];
lb=zeros(1,11);
ub=[inf inf inf inf 3 4 inf inf inf inf inf];
[x,f] = linprog(f,A,b,[],[],lb,ub)
%%  summary ststistics
x = normrnd(0, 10, 10, 10);    % 生成10X10个正态随机数
mean(x)
median(x)
var(x)
std(x)
corcoef(x)
cov(x)
%%  K-S test
clc,clear
x = [459,624,509,43,815,612,434,640,565,593,926,164,734,428,593,527,513,474,824,862,775,75,697,628,71,402,885,292,473,358,699,555,84,606,484,447,564,280,687,790,621,531,57,468,544,764,378,666,217,310];
x =x';
m = mean(x)
s =std(x)
[h, p] = kstest(x,[x, normcdf(x,m,s)])
norminv((0.5-0.3)/(0.5-0.05),m,s)       % 分位点
%%
l = 2,sigma = 0.20;
% ml =[];
for i = 1:100
    m = 1.5+i*0.02;  % 0,1
    ml(i) = m;
    f(i) = jm(l,m,sigma);
end
plot(ml,f,'r')

%%  计算机模拟
clc,clear
L =2;
sigma = 0.20;
N = 100;
minj = inf;
for m = 1:0.0001:4
    y = 0;
    z = 0;
    for i = 1:N
        x = normrnd(m,sigma);
        z = z+x;
        if x>=L
            y = y+L;
        end
    end

    if (z-y)/y<minj
        minj = (x-y)/y;
        m0 = m;
    end
end
m0
  %%
  x1 = [.2 .5 .6 .8 1.0 1.1]';
  x2 = [.1 .3 .4 .9 1.1 1.4]';
  A = [ones(size(x1)) x1 x2] ;
  b = [.17 .26 .28 .23 .27 .34]' ;
  a1 = A\b ;
  a2 = lscov(A, b)
%% fints
d1 = (today:today+10)';
d2 = exp(randn(1,11))';
d = [d1 d2];
fts = fints(d)
%%  加载文件
load dji30short  % 读入文件
d = myfts1
candle(d)

%% 金融时间序列GUI
!type Disney.dat
% load Disney
ftsgui
%% stopwatch 计时
t = zeros(1,100);
for n = 1:100
    A = rand(n,n);
    b = rand(n,1);
    tic;
    x = A\b;
    t(n) = toc;
end
plot(t)

%%  读Excel的数据？

values = [1, 2, 3 ; 4, 5, 6 ; 7, 8, 9];
headers = {'First', 'Second', 'Third'};
csvwrite('Mat2Excel.csv', [headers; values]);

% A = xlsread('Mat2Excel.csv')
%%

format longEng
format compact
format short
%%
A = xlsread('eg_Mat2Excel.xlsx')
%%  如何删掉缺失值？

A = [1 NaN 3]

A( isnan(A) ) = []
%% 如何去掉数据中的重复元素？

A = [1 1 2 2 3 4 5 6 6]

A_unique = unique(A)
%% 如何从一组数据中随机抽取数据？

out = randsrc(5,5,[-3 -1 1 3; .2 .3 .3 .2])
%% 如何将数据标准化？

x = [1 1 2 3 5 8 11]

Z = zscore(x)

Ztemp = ( x-mean(x) )./std(x)
%% 如何计算积分？

syms x
int(sin(x))

integral(@sin, 0,pi)
%%  如何在MATLAB里面求（偏）导数？

syms x
dy_dx = diff( sin(x)/x )

%% 如何求矩阵各行（列）的均值？

a = magic(4)
% 各行均值
a_rowmean = mean(a , 2)
% 各列均值
a_colmean = mean(a , 1)
%% 如何计算组合数或得到所有组合？

combnum = nchoosek(4, 2)

comb = nchoosek([1 2 3 4], 2)

fac = factorial(4)
%% 如何求一元方程的根？

syms x

s1 = solve( x^2-1 )

s2 = solve(x^2 + 4*x + 1 == 0)

s3 = solve(x^4 + 1 == 2*x^2 - 1)
%%
S = solve([2*u + v == 0, u - v == 1], [u, v])
S.u,S.v
%% 如何在字符串中选取特定位置的字符？

str = 'abcdef'

substr1 = str( [2 4] )

substr2 = str( 1:3 )
%% 如何返回字符个数？

str = 'abcdef'
strlen = length(str)
%% date
Date = today('datetime')
d = datetime('today')
datestr( datenum(Date), 'dd-mmm-yyyy' )
%% 怎么做饼图？

x = [1 3 0.5 2.5 2];
explode = [0 0 0 0 1];   %  突出第N部分

figure;
subplot(2,1,1);
pie(x,explode);
title('二维饼图');
colormap jet

subplot(2,1,2);
pie3(x,explode);
title('三维饼图');
colormap hsv
%% 如何调整所绘图形的大小？

left = 100;
bottom = 100;
width = 500;
height = 500;
figure( 'Position', [left, bottom, width, height]);
ezplot(@sin)
%% 如何绘制椭圆或双曲线？

t = 0:0.01:2*pi;
a = 1;
b = 2;
x = 1.2*a*sin(t);
y = b*cos(t);
figure;
plot(x,y);
xlim( [-pi/2, pi/2] );
ylim( [-3, 3] );
str = {'椭   圆';'参数做图'};
title( str );
%%  在MATLAB中如何绘制K线图？

load disney;
candle(dis_HIGH(end-20:end), dis_LOW(end-20:end), dis_CLOSE(end-20:end),...
        dis_OPEN(end-20:end), 'b');

%%  如何做线性回归模型？

x1 = [.2 .5 .6 .8 1.0 1.1]';
x2 = [.1 .3 .4 .9 1.1 1.4]';

A = [ones(size(x1)) x1 x2];
b = [.17 .26 .28 .23 .27 .34]';

a1 = A\b

a2 = lscov(A, b)
%%  如何做线性回归模型2

x1 = [.2 .5 .6 .8 1.0 1.1]';
x2 = [.1 .3 .4 .9 1.1 1.4]';

x = [ones(size(x1)) x1 x2];
y = [.17 .26 .28 .23 .27 .34]';

[b,bint,r,rint,stats] = regress(y,x)
%% 如何做主成分分析

% 载入数据
load cities;

whos
%   Name             Size         Bytes  Class
%   categories    9x14          252  char array
%   names          329x43       28294  char array
%   ratings         329x9         23688  double array

% % ratings数据的box图
figure;
boxplot(ratings,'orientation','horizontal','labels',categories);
grid on;

% % 标准化预处理
stdr = std(ratings);
sr = ratings./repmat(stdr,329,1);
% % 使用princomp函数进行主成分分析
[coef,score,latent,t2] = princomp(sr);

% % 输出参数讲解

% coef:9*9矩阵
% 主成分系数:即原始数据线性组合生成主成分数据中每一维数据前面的系数.
% coef的每一列代表一个新生成的主成分的系数.
% 比如你想取出前三个主成分的系数, 如下可实现: pca3 = coef(:,1:3);

% score:329*9矩阵
% 字面理解:主成分得分
% 即原始数据在新生成的主成分空间里的坐标值.

% latent:9*1矩阵
% 一个列向量,由sr的协方差矩阵的特征值组成.
% 即 latent = sort(eig(cov(sr)),'descend');
% 测试如下:
% sort(eig(cov(sr)),'descend') =
%     3.4083
%     1.2140
%     1.1415
%     0.9209
%     0.7533
%     0.6306
%     0.4930
%     0.3180
%     0.1204
% latent =
%     3.4083
%     1.2140
%     1.1415
%     0.9209
%     0.7533
%     0.6306
%     0.4930
%     0.3180
%     0.1204

% t2:329*1
% 一中多元统计距离,记录的是每一个观察量到中心的距离

% % 如何提取主成分,达到降维的目的
% 通过latent,可以知道提取前几个主成分就可以了.
figure;
percent_explained = 100*latent/sum(latent);
pareto(percent_explained);
xlabel('Principal Component');
ylabel('Variance Explained (%)');

% 图中的线表示的累积变量解释程度.
% 通过看图可以看出前七个主成分可以表示出原始数据的90%.
% 所以在90%的意义下只需提取前七个主成分即可,进而达到主成分提取的目的.

% % 结果的可视化
figure;
biplot(coef(:,1:2), 'scores',score(:,1:2),...
'varlabels',categories);
axis([-.26 1 -.51 .51]);
% 横坐标和纵坐标分别表示第一主成分和第二主成分
% 红色的点代表329个观察量,其坐标就是score
% 蓝色的向量的方向和长度表示了每个原始变量对新的主成分的贡献,其坐标就是coef.
%% 多项式回归应该用什么函数？

x = (-pi: 0.1: pi)';
y = sin(x);

p = polyfit(x,y,3)

f = polyval(p,x);

figure;
plot(x,y,'-', x,f,'ro');
legend('原始数据', '多项式拟合数据');
%%  如何做线性回归模型？

x1 = [.2 .5 .6 .8 1.0 1.1]';
x2 = [.1 .3 .4 .9 1.1 1.4]';

x = [ones(size(x1)) x1 x2];
y = [.17 .26 .28 .23 .27 .34]';

[b,bint,r,rint,stats] = regress(y,x)
%% 下料问题
p = [];
for i = 0:floor(180/70)
    for j = 0:floor(180/52)
        for k = 0:floor(180/35)
            s = 70*i+52*j+35*k;
            if s<=180&180-s<35
                p=[p,[i;j;k;180-s]];
            end
        end
    end
end
p
%% 层次分析
%A = [1 3 2 5
    1/3 1 3 2
    1/2 1/3 1 1
    1/5 1/2 1 1];
A = [1 3 2 5
    1/3 1 3 2
    1/2 1/3 1 1
    1/5 1/2 1 1];
B1 = [1 7 2
    1/7 1 1/4
    1/2 4 1];
B2 = [1 1/7 1/6
    7 1 1/2
    6 2 1];
B3 = [1 1/5 1/4
    5 1 1/2
    4 2 1];
B4 = [1 1/3 5
    3 1 7
    1/5 1/7 1];
[v1,d1] = eig(B1),w1 = v1(:,1)/sum(v1(:,1)),lambda1 = d1(1,1)
[v2,d2] = eig(B2),w2 = v2(:,1)/sum(v2(:,1)),lambda2 = d2(1,1)
[v3,d3] = eig(B3),w3 = v3(:,1)/sum(v3(:,1)),lambda3 = d3(1,1)
[v4,d4] = eig(B4),w4 = v4(:,1)/sum(v4(:,1)),lambda4 = d4(1,1)
[v,d] = eig(A),w = v(:,1)/sum(v(:,1)),lambda = d(1,1)
lambda0 = [lambda1 lambda2 lambda3 lambda4]
CI0 = (lambda0 -size(B1,1))/(size(B1,1)-1)
CR0 = CI0/0.58
CI3 = CI0*w
CR3 = CI3/0.58
CI2 = (lambda -size(A,1))/(size(A,1)-1)
CR2 = CI2/0.96
CR = CR2+CR3
ww = [w1 w2 w3 w4]
w0 = ww*w
%%
f = ones(8,1);
% intcon = 1,2,3,4,5,6,7,8;
A = -[2 1 1 1 0 0 0 0
    0 2 1 0 3 2 1 0
    1 0 1 3 0 2 3 5];
b = -[100 150 120];
lb = zeros(8,1);
ub = inf*ones(8,1);
[x,fval] = linprog(f,A,b,[],[],lb,ub)
%%
f = 'x+1=0'
solve(f)
%%
linspace(0,2,3)

%%
clc,clear
p=[];
for i = 0:fix(2/0.5)
    for j = 0:fix(2/0.4)
        for k = 0:fix(2/0.3)
            s = 0.5*i+0.4*j+0.3*k;
            if (s<=2)&(2-s<0.3)
                p = [p,[i;j;k;2-s]];
            end
        end
    end
end
p
format short g


