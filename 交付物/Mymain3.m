%出生性别比
clear;clc
%2007到2011年的出生性别比
RateBsex=fliplr([1.15	1.16	1.16	1.17	1.17]);
%2012到2018总人口数
YRateBsex201218=huise1(RateBsex,7);
RateBsex201218=fliplr([1.13	1.13	1.13	1.14	1.14	1.15	1.15]);

time=2007:2018;
RateBsex1=[RateBsex RateBsex201218];%实际
RateBsex2=[RateBsex YRateBsex201218];


plot(time,RateBsex1*100,time,RateBsex2*100)
xlabel('年份')
set(gca,'XTick',2007:1:2020);
ylabel('出生性别比')
set(gca,'YTick',105:120);
legend('放开二胎后的实际值','原政策下的预测值')
