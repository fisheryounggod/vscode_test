%% ������Ͷ�ʣ���MATLABΪ���ߡ�-����ƪ-N����ѧ��MATLAB(60<N<180)
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
%% �ܷ�򵥾�һ��MATLAB�����ӣ�

Mean_Value = 0;
STD_Value = 1;
Data_Num = 100;

x = random('Normal', Mean_Value, STD_Value, Data_Num, 1);
x_dataset = dataset(x);

whos
mean_x = mean(x)
std_x = std(x)
summary(x_dataset)
%% ��β鿴�����Ĵ��룿

% edit mean;

%% MATLAB�������ʹ�ÿ�ѧ������ô��

format longG
1e10
1.2e-4

format short

%% ��λָ�MATLAB���ļ�������

% cwd=pwd;
% cd([matlabroot '\toolbox\matlab\winfun\private']);
% fileassoc('add',{'.m','.mat','.fig','.p','.mdl',['.' mexext]});%�ص�
% cd(cwd);
% disp('Changed Windows file associations. FIG, M, MAT, MDL, MEX, andP files are now associated with MATLAB.') 

%% MATLAB���Զ�Excel�����ݣ�

% values = {1, 2, 3 ; 4, 5, 'x' ; 7, 8, 9};
% headers = {'First', 'Second', 'Third'};
% xlswrite('eg_Mat2Excel.xlsx', [headers; values]);
% 
% A = xlsread('eg_Mat2Excel.xlsx')

%% ���ɾ��ȱʧֵ��

A = [1 NaN 3]

A( isnan(A) ) = []

%% ��ν��ַ���ת��Ϊ����ִ�У�
A = 3;
B = 5;

string = [num2str(A),'+',num2str(B)]

eval(string);

%% �����һ������׷��Ԫ�أ�

A = [1 2 3 4]

A(end+1) = 5


%% ����Ƴ������ĳ�У��У����ݣ�

A = magic(5)
B = A;
C = A;

B(5,:) = []
C(:,5) = []

%% ��αȽ����������Ƿ���ͬ�أ�

A = magic(5)
B = A;

B(1) = 888

whetherAequalsB = all( all( A == B ) )
%% ���ȥ�������е��ظ�Ԫ�أ�

A = [1 1 2 2 3 4 5 6 6]

A_unique = unique(A)
%% ��������ݵļ�ֵ��

A = 1:10

A_min = min(A)

A_max = max(A)

%% �����������(С)ֵ�����������кţ�

% ����1
disp('����1');
A=[0 17 50;-12 40 3;5 -10 2;30 4 3]
[C,I]=max(A(:))
[m,n]=ind2sub(size(A),I)
% ����2
disp('����2');
A=[0 17 50;-12 40 3;5 -10 2;30 4 3]
[M,I]=max(A)
[N,J]=max(M)
[I(J),J]
% ����3
disp('����3');
A=[0 17 50;-12 40 3;5 -10 2;30 4 3]
N=max(max(A))    %����N=max(A(:))
[r,c]=find(N==A)
% ����4
disp('����4');
A=[0 17 50;-12 40 3;5 -10 2;30 4 3]
[Y_col,Ind_row]=max(A)   %ÿ�е����ֵ���к�
[Y_row,Ind_col]=max(A')    %ÿ�е����ֵ���к�

%% ��δ�һ�������������ȡ���ݣ�

out = randsrc(5,5,[-3 -1 1 3; .2 .3 .3 .2])

%% ��ν����ݱ�׼����

x = [1 1 2 3 5 8 11]

Z = zscore(x)

Ztemp = ( x-mean(x) )./std(x)

%% ��μ�����֣�

syms x
int(sin(x))

integral(@sin, 0,pi)

%% MATLAB��ν��и������㣿

Z = complex(3,4) 

% ʵ��
Z_real = real( Z )
% �鲿
Z_imag = imag( Z )
% ģ
Z_abs = abs( Z )
% ����
Z_angle = angle( Z )
% ����
ZC = conj( Z )

%% ������ɶԽǾ���

X = diag([1 1 2 3 5 8])

x = magic(5)

x_diag = diag(x)

%% ��ι����ϣ��£����Ǿ���

tl = tril(ones(4,4),-1)

tu = triu(ones(4,4),-1)

%% MATLAB���õ������������Щ��

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

%% ����������У��У��ľ�ֵ��

a = magic(4)
% ���о�ֵ
a_rowmean = mean(a , 2)
% ���о�ֵ
a_colmean = mean(a , 1)

%% ��μ����������õ�������ϣ�

combnum = nchoosek(4, 2)

comb = nchoosek([1 2 3 4], 2)

fac = factorial(4)

%%  �����MATLAB������ƫ��������

syms x
dy_dx = diff( sin(x)/x )

%% �����һԪ���̵ĸ���

syms x

s1 = solve( x^2-1 )

s2 = solve(x^2 + 4*x + 1 == 0)

s3 = solve(x^4 + 1 == 2*x^2 - 1)

%% ������ַ�����ѡȡ�ض�λ�õ��ַ���

str = 'abcdef'   

substr1 = str( [2 4] )

substr2 = str( 1:3 )

%% ��η����ַ�������

str = 'abcdef'
strlen = length(str)

%%  ���ڿ�������������ô��

n1 = datenum( '01/08/2013', 'dd/mm/yyyy' )

n2 = datenum( '08/08/2013', 'dd/mm/yyyy' )

n3 = n1 + 2

d1 = datestr( n1, 'dd/mm/yyyy' )

d2 = datestr( n2, 'dd/mm/yyyy' )

d3 = datestr( n3, 'dd/mm/yyyy' )

%% ��ν����ڱ�ʾΪ��07-Aug- 2013�����ָ�ʽ��

d = datestr( datenum( '07/08/2013', 'dd/mm/yyyy' ), 'dd-mmm-yyyy' )

%% �����ͬһ���滭������ͼ��

figure;
income = [3.2,4.1,5.0,5.6];
outgo = [2.5,4.0,3.35,4.9];

subplot(2,1,1); 
plot(income);
title('Income');

subplot(2,1,2); 
plot(outgo);
title('Outgo');

%% ��ô����ͼ��

x = [1 3 0.5 2.5 2];
explode = [0 1 0 0 0];

figure;
subplot(2,1,1); 
pie(x,explode);
title('��ά��ͼ');
colormap jet

subplot(2,1,2); 
pie3(x,explode);
title('��ά��ͼ');
colormap hsv

%% MATLAB�����˫���ꣿ

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
%% �����ͼʱ����̫������λ��У�

figure
subplot(2,1,1);
ezplot( @sin );
title('First line+Second line');

subplot(2,1,2); 
ezplot( @sin );
str = {'First line';'Second line'};
title( str );

%% ����ò�ͬ����ɫ���������ݣ�

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

%% ��ε�������ͼ�εĴ�С��

left = 100;
bottom = 100;
width = 500;
height = 500;
figure( 'Position', [left, bottom, width, height]);
ezplot(@sin)

%% ��λ�����Բ��˫���ߣ�

t = 0:0.01:2*pi;
a = 1;
b = 2;
x = a*sin(t);
y = b*cos(t);
figure;
plot(x,y);
xlim( [-pi/2, pi/2] );
ylim( [-3, 3] );

%%  ��MATLAB����λ���K��ͼ��

load disney;
candle(dis_HIGH(end-20:end), dis_LOW(end-20:end), dis_CLOSE(end-20:end),...
        dis_OPEN(end-20:end), 'b');

%%  ��������Իع�ģ�ͣ�

x1 = [.2 .5 .6 .8 1.0 1.1]'; 
x2 = [.1 .3 .4 .9 1.1 1.4]'; 

A = [ones(size(x1)) x1 x2]
b = [.17 .26 .28 .23 .27 .34]'

a1 = A\b

a2 = lscov(A, b) 

%% ��������ɷַ�����

% ��������
load cities;

whos
%   Name             Size         Bytes  Class
%   categories    9x14          252  char array
%   names          329x43       28294  char array
%   ratings         329x9         23688  double array

% % ratings���ݵ�boxͼ
figure;
boxplot(ratings,'orientation','horizontal','labels',categories);
grid on;

% % ��׼��Ԥ����
stdr = std(ratings);
sr = ratings./repmat(stdr,329,1);
% % ʹ��princomp�����������ɷַ��� 
[coef,score,latent,t2] = princomp(sr);

% % �����������

% coef:9*9����
% ���ɷ�ϵ��:��ԭʼ������������������ɷ�������ÿһά����ǰ���ϵ��.
% coef��ÿһ�д���һ�������ɵ����ɷֵ�ϵ��.
% ��������ȡ��ǰ�������ɷֵ�ϵ��, ���¿�ʵ��: pca3 = coef(:,1:3);

% score:329*9����
% �������:���ɷֵ÷�
% ��ԭʼ�����������ɵ����ɷֿռ��������ֵ.

% latent:9*1����
% һ��������,��sr��Э������������ֵ���.
% �� latent = sort(eig(cov(sr)),'descend');
% ��������:
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
% һ�ж�Ԫͳ�ƾ���,��¼����ÿһ���۲��������ĵľ���

% % �����ȡ���ɷ�,�ﵽ��ά��Ŀ��
% ͨ��latent,����֪����ȡǰ�������ɷ־Ϳ�����.
figure;
percent_explained = 100*latent/sum(latent);
pareto(percent_explained);
xlabel('Principal Component');
ylabel('Variance Explained (%)');

% ͼ�е��߱�ʾ���ۻ��������ͳ̶�.
% ͨ����ͼ���Կ���ǰ�߸����ɷֿ��Ա�ʾ��ԭʼ���ݵ�90%.
% ������90%��������ֻ����ȡǰ�߸����ɷּ���,�����ﵽ���ɷ���ȡ��Ŀ��.

% % ����Ŀ��ӻ�
figure;
biplot(coef(:,1:2), 'scores',score(:,1:2),... 
'varlabels',categories);
axis([-.26 1 -.51 .51]);
% �������������ֱ��ʾ��һ���ɷֺ͵ڶ����ɷ�
% ��ɫ�ĵ����329���۲���,���������score
% ��ɫ�������ķ���ͳ��ȱ�ʾ��ÿ��ԭʼ�������µ����ɷֵĹ���,���������coef.

%% ����ʽ�ع�Ӧ����ʲô������

x = (-pi: 0.1: pi)';
y = sin(x);

p = polyfit(x,y,3)

f = polyval(p,x);

figure;
plot(x,y,'-', x,f,'ro');
legend('ԭʼ����', '����ʽ�������');

%% ��������������

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

%% �������MATLAB��ȡ��ѵĽ������ݣ�

conn = yahoo;
test = fetch(conn,{'600409.SS'},{'Close'},'08/01/13','08/08/13','d');

d = fints(test(:,1), test(:,2), 'Close', 'D', '600409.SS_Close')

close(yahoo)
%%  ��MATLAB����δ����ͼ���ݣ�

% �����ͼ
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
title('�����ͼ','FontSize',14,'FontWeight','Bold');

% �й���ͼ
figure;
worldmap([15 55],[70 140])%γ�Ⱦ��ȷ�Χ��ʾ
%��ʾʸ������
sh1 = shaperead('bou2_4p', 'UseGeoCoords', true);
geoshow(sh1, 'FaceColor', [0.5 1.0 0.5]);

setm(gca,'MLineLocation',5)%���þ��ȼ��Ϊ5
setm(gca,'PLineLocation',10)%���þ��ȼ��Ϊ10
setm(gca,'MLabelLocation',5)%���þ��ȱ�ǩΪÿ��5��
setm(gca,'PLabelLocation',10)%����γ�ȱ�ǩΪÿ��10��
title('�й���ͼ','FontSize',14,'FontWeight','Bold');

% ������ͼ
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
title('������ͼ','FontSize',14,'FontWeight','Bold');

%% ��μ���һ���ʽ��������س���

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
title('���س�����', 'FontWeight', 'Bold');

%% Test 


%% Record Time
toc;