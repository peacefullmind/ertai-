%�����Ա��
clear;clc
%2007��2011��ĳ����Ա��
RateBsex=fliplr([1.15	1.16	1.16	1.17	1.17]);
%2012��2018���˿���
YRateBsex201218=huise1(RateBsex,7);
RateBsex201218=fliplr([1.13	1.13	1.13	1.14	1.14	1.15	1.15]);

time=2007:2018;
RateBsex1=[RateBsex RateBsex201218];%ʵ��
RateBsex2=[RateBsex YRateBsex201218];


plot(time,RateBsex1*100,time,RateBsex2*100)
xlabel('���')
set(gca,'XTick',2007:1:2020);
ylabel('�����Ա��')
set(gca,'YTick',105:120);
legend('�ſ���̥���ʵ��ֵ','ԭ�����µ�Ԥ��ֵ')
