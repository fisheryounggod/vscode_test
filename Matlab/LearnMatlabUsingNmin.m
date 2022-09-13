%% 《量化投资：以MATLAB为工具》-基础篇-N分钟学会MATLAB(60<N<180)
% Learn Matlab Using N minutes(60<N<180)
%
% by LiYang
% 
% Email:farutoliyang@gmail.com
% 
% Last Updated 2013/08
%% A Little Clean Work
tic;    % stopwatch
clear;
clc;
close all;
format compact;
%% 能否简单举一个MATLAB的例子？

Mean_Value = 0;
STD_Value = 1;
Data_Num = 100;

x = random('Normal', Mean_Value, STD_Value, Data_Num, 1);
x_dataset = dataset(x);

whos
mean_x = mean(x)
std_x = std(x)
summary(x_dataset)
%% 如何查看函数的代码？

% edit mean;

%% MATLAB里面可以使用科学计数法么？

format longG
1e10
1.2e-4

format short

%% 如何恢复MATLAB的文件关联？

% cwd=pwd;
% cd([matlabroot '\toolbox\matlab\winfun\private']);
% fileassoc('add',{'.m','.mat','.fig','.p','.mdl',['.' mexext]});%重点
% cd(cwd);
% disp('Changed Windows file associations. FIG, M, MAT, MDL, MEX, andP files are now associated with MATLAB.') 

%% MATLAB可以读Excel的数据？

% values = {1, 2, 3 ; 4, 5, 'x' ; 7, 8, 9};
% headers = {'First', 'Second', 'Third'};
% xlswrite('eg_Mat2Excel.xlsx', [headers; values]);
% 
% A = xlsread('eg_Mat2Excel.xlsx')

%% 如何删掉缺失值？

A = [1 NaN 3]

A( isnan(A) ) = []

%% 如何将字符串转变为命令执行？
A = 3;
B = 5;

string = [num2str(A),'+',num2str(B)]

eval(string);

%% 如何向一个向量追加元素？

A = [1 2 3 4]

A(end+1) = 5


%% 如何移除矩阵的某行（列）数据？

A = magic(5)
B = A;
C = A;

B(5,:) = []
C(:,5) = []

%% 如何比较两个矩阵是否相同呢？

A = magic(5)
B = A;

B(1) = 888

whetherAequalsB = all( all( A == B ) )
%% 如何去掉数据中的重复元素？

A = [1 1 2 2 3 4 5 6 6]

A_unique = unique(A)
%% 如何求数据的极值？

A = 1:10

A_min = min(A)

A_max = max(A)

%% 如何求矩阵最大(小)值并返回其行列号？

% 方法1
disp('方法1');
A=[0 17 50;-12 40 3;5 -10 2;30 4 3]
[C,I]=max(A(:))
[m,n]=ind2sub(size(A),I)
% 方法2
disp('方法2');
A=[0 17 50;-12 40 3;5 -10 2;30 4 3]
[M,I]=max(A)
[N,J]=max(M)
[I(J),J]
% 方法3
disp('方法3');
A=[0 17 50;-12 40 3;5 -10 2;30 4 3]
N=max(max(A))    %或者N=max(A(:))
[r,c]=find(N==A)
% 方法4
disp('方法4');
A=[0 17 50;-12 40 3;5 -10 2;30 4 3]
[Y_col,Ind_row]=max(A)   %每列的最大值及行号
[Y_row,Ind_col]=max(A')    %每行的最大值及列号

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

%% MATLAB如何进行复数计算？

Z = complex(3,4) 

% 实部
Z_real = real( Z )
% 虚部
Z_imag = imag( Z )
% 模
Z_abs = abs( Z )
% 辐角
Z_angle = angle( Z )
% 共轭
ZC = conj( Z )

%% 如何生成对角矩阵？

X = diag([1 1 2 3 5 8])

x = magic(5)

x_diag = diag(x)

%% 如何构造上（下）三角矩阵？

tl = tril(ones(4,4),-1)

tu = triu(ones(4,4),-1)

%% MATLAB常用的运算符号有哪些？

a=magic(3)
b=pascal(3)

disp('a/b')
a/b
disp('a*inv(b)')
a*inv(b)

disp('a\b')
a\b
disp('inv(a)*b')
inv(a)*b

a/b-(b'\a')'

disp('a^3')
a^3
disp('a*a*a')
a*a*a

disp('a.*b')
a.*b
disp('a.\b')
a.\b
disp('a./b')
a./b
disp('a.^b')
a.^b

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

%%  如何在MATLAB里面求（偏）导数？

syms x
dy_dx = diff( sin(x)/x )

%% 如何求一元方程的根？

syms x

s1 = solve( x^2-1 )

s2 = solve(x^2 + 4*x + 1 == 0)

s3 = solve(x^4 + 1 == 2*x^2 - 1)

%% 如何在字符串中选取特定位置的字符？

str = 'abcdef'   

substr1 = str( [2 4] )

substr2 = str( 1:3 )

%% 如何返回字符个数？

str = 'abcdef'
strlen = length(str)

%%  日期可以做算术运算么？

n1 = datenum( '01/08/2013', 'dd/mm/yyyy' )

n2 = datenum( '08/08/2013', 'dd/mm/yyyy' )

n3 = n1 + 2

d1 = datestr( n1, 'dd/mm/yyyy' )

d2 = datestr( n2, 'dd/mm/yyyy' )

d3 = datestr( n3, 'dd/mm/yyyy' )

%% 如何将日期表示为“07-Aug- 2013”这种格式？

d = datestr( datenum( '07/08/2013', 'dd/mm/yyyy' ), 'dd-mmm-yyyy' )

%% 如何在同一画面画出多张图？

figure;
income = [3.2,4.1,5.0,5.6];
outgo = [2.5,4.0,3.35,4.9];

subplot(2,1,1); 
plot(income);
title('Income');

subplot(2,1,2); 
plot(outgo);
title('Outgo');

%% 怎么做饼图？

x = [1 3 0.5 2.5 2];
explode = [0 1 0 0 0];

figure;
subplot(2,1,1); 
pie(x,explode);
title('二维饼图');
colormap jet

subplot(2,1,2); 
pie3(x,explode);
title('三维饼图');
colormap hsv

%% MATLAB如何做双坐标？

figure
x = 0:0.01:20;
y1 = 200*exp(-0.05*x).*sin(x);
y2 = 0.8*exp(-0.5*x).*sin(10*x);
[AX,H1,H2] = plotyy(x,y1,x,y2,'plot');

set(get(AX(1),'Ylabel'),'String','Slow Decay') 
set(get(AX(2),'Ylabel'),'String','Fast Decay') 
xlabel('Time (\musec)') 
title('Multiple Decay Rates') 
set(H1,'LineStyle','--')
set(H2,'LineStyle',':')
%% 如果绘图时标题太长，如何换行？

figure
subplot(2,1,1);
ezplot( @sin );
title('First line+Second line');

subplot(2,1,2); 
ezplot( @sin );
str = {'First line';'Second line'};
title( str );

%% 如何用不同的颜色来代表数据？

figure;
x = -pi:.1:pi;
y = sin(x);
z = cos(x);
RGB = [1 0 0];
plot( y, 'Color', RGB )
hold on;
RGB = [0 0.5 0.5];
plot( z, 'Color', RGB )
legend('sinx', 'cosx');

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
x = a*sin(t);
y = b*cos(t);
figure;
plot(x,y);
xlim( [-pi/2, pi/2] );
ylim( [-3, 3] );

%%  在MATLAB中如何绘制K线图？

load disney;
candle(dis_HIGH(end-20:end), dis_LOW(end-20:end), dis_CLOSE(end-20:end),...
        dis_OPEN(end-20:end), 'b');

%%  如何做线性回归模型？

x1 = [.2 .5 .6 .8 1.0 1.1]'; 
x2 = [.1 .3 .4 .9 1.1 1.4]'; 

A = [ones(size(x1)) x1 x2]
b = [.17 .26 .28 .23 .27 .34]'

a1 = A\b

a2 = lscov(A, b) 

%% 如何做主成分分析？

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

%% 如何做聚类分析？

% kmeans
figure;
X = [randn(100,2)+ones(100,2);...
     randn(100,2)-ones(100,2)];
opts = statset('Display','final');

[idx,ctrs] = kmeans(X,2,...
                    'Distance','city',...
                    'Replicates',5,...
                    'Options',opts);

plot(X(idx==1,1),X(idx==1,2),'r.','MarkerSize',12)
hold on
plot(X(idx==2,1),X(idx==2,2),'b.','MarkerSize',12)
plot(ctrs(:,1),ctrs(:,2),'kx',...
     'MarkerSize',12,'LineWidth',2)
plot(ctrs(:,1),ctrs(:,2),'ko',...
     'MarkerSize',12,'LineWidth',2)
legend('Cluster 1','Cluster 2','Centroids',...
       'Location','NW')

% FCM
data = rand(100,2); 
options = [2;100;1e-5;1]; 
[center,U,obj_fcn] = fcm(data,2,options); 
figure; 
plot(data(:,1), data(:,2),'o'); 
title('DemoTest of FCM Cluster'); 
xlabel('1st Dimension'); 
ylabel('2nd Dimension'); 
grid on; 
hold on; 
maxU = max(U); 
index1 = find(U(1,:) == maxU); 
index2 = find(U(2,:) == maxU); 
line(data(index1,1),data(index1,2),'marker','*','color','g'); 
line(data(index2,1),data(index2,2),'marker','*','color','r'); 
plot([center([1 2],1)],[center([1 2],2)],'*','color','k') 
hold off;

%% 如何利用MATLAB获取免费的金融数据？

conn = yahoo;
test = fetch(conn,{'600409.SS'},{'Close'},'08/01/13','08/08/13','d');

d = fints(test(:,1), test(:,2), 'Close', 'D', '600409.SS_Close')

close(yahoo)
%%  在MATLAB中如何处理地图数据？

% 世界地图
figure;
ax = worldmap('World');
% setm(ax, 'Origin', [0 180 0])
land = shaperead('landareas', 'UseGeoCoords', true);
geoshow(ax, land, 'FaceColor', [0.5 0.7 0.5])
lakes = shaperead('worldlakes', 'UseGeoCoords', true);
geoshow(lakes, 'FaceColor', 'blue')
rivers = shaperead('worldrivers', 'UseGeoCoords', true);
geoshow(rivers, 'Color', 'blue')
cities = shaperead('worldcities', 'UseGeoCoords', true);
geoshow(cities, 'Marker', '.', 'Color', 'red')
title('世界地图','FontSize',14,'FontWeight','Bold');

% 中国地图
figure;
worldmap([15 55],[70 140])%纬度经度范围显示
%显示矢量数据
sh1 = shaperead('bou2_4p', 'UseGeoCoords', true);
geoshow(sh1, 'FaceColor', [0.5 1.0 0.5]);

setm(gca,'MLineLocation',5)%设置经度间隔为5
setm(gca,'PLineLocation',10)%设置经度间隔为10
setm(gca,'MLabelLocation',5)%设置经度标签为每隔5度
setm(gca,'PLabelLocation',10)%设置纬度标签为每隔10度
title('中国地图','FontSize',14,'FontWeight','Bold');

% 美国地图
figure;
ax = worldmap('USA');
load coast
geoshow(ax, lat, long,...
'DisplayType', 'polygon', 'FaceColor', [.45 .60 .30])
states = shaperead('usastatelo', 'UseGeoCoords', true);
faceColors = makesymbolspec('Polygon',...
    {'INDEX', [1 numel(states)], 'FaceColor', ...
    polcmap(numel(states))}); % NOTE - colors are random
geoshow(ax, states, 'DisplayType', 'polygon', ...
  'SymbolSpec', faceColors)
title('美国地图','FontSize',14,'FontWeight','Bold');

%% 如何计算一个资金流的最大回撤？

load FundMarketCash
fund = TestData(:,1);

[DrawDownPercent,DrawDownAbs] = RetraceRatio(fund);

figure;
subplot(3,1,1:2);
plot(fund);
xlim([1 length(fund)]);
title('Fund', 'FontWeight', 'Bold');

subplot(313);
plot( DrawDownPercent );
xlim([1 length(fund)]);
title('最大回撤比例', 'FontWeight', 'Bold');

%% Test 


%% Record Time
toc;