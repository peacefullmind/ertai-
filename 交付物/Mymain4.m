clear;clc
%2007��2011������˿���Ŀ
numSum=fliplr([134735	134091	133450	132802	132129]);
%2012��2019���˿���
YnumSum201219=huise1(numSum,8)
numSum201219=fliplr([140005	139538	139008	138271	137462	136782	136072	135404]);
%numSum201219-YnumSum

%========================================================================================
%2007��2011���65�꼰�����˿���Ŀ
num65shang=fliplr([12288	11894	11307	10956	10636]);
%2012��2019���˿���
Ynum65shang201219=huise1(num65shang,8)
num65shang201219=fliplr([17599	16658	15831	15003	14386	13755	13161	12714]);
%numSum201219-YnumSum

%=================================================================

time=2007:1:2019;
numSum1=[numSum numSum201219];
numSum2=[numSum YnumSum201219];
% plot(time,numSum1,time,numSum2)
% legend('ʵ��ֵ','Ԥ��ֵ')
num65shang1=[num65shang num65shang201219];
num65shang2=[num65shang Ynum65shang201219];

oldrate1=num65shang1./numSum1;
oldrate2=num65shang2./numSum2;

title('���仯����')
plot(time,oldrate1*100,time,oldrate2*100)
xlabel('���')
set(gca,'XTick',2007:1:2020);
ylabel('���仯����/%')
legend('�ſ���̥���ʵ��ֵ','ԭ�����µ�Ԥ��ֵ')


