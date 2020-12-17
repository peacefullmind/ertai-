clc,clear;
N=[6808913,5845917,5845582,6922202,7241102,7755360,8473689,8344187,9179220,9514668,10700157,12492561,11992640,12021985,12742189,11110508,9923144,8937975,8746573,9843569,8595768,8521535,9086442,8979448,8805393,10190867,10421867,11148237,11928672,12035666,12729740,13285136,12549924,13338194,11031861,12247031,12206434,12367363,13907264,9807651,6466841,7856606,7016276,9104201,9601576,9142587,9539806,9274300,8510078,8254824,8079428,7365520,6904320,6058030,6155106,5547857,5037014,4800518,4687228,4553641,4843865,4473447,4201645,4423803,4265291,4281839,3913295,3804091,3853400,3279246,3346977,3073300,2628648,2706632,2358722,2087255,2120015,1784568,1642603,1498428,1387349,1098999,973583,765762,638135,557491,493960,382881,335448,238706,702116];
N0=N'/100000000;%第0年（2001年）女性各个年龄（0-90 岁）的人口数(亿）
A=eye(90);
b=[0.974906966,0.999321231,0.99772433,0.999247616,0.999567418,0.999180663,0.999887948,0.999387596,0.999618586,0.999985672,0.999389434,0.999724354,0.999801796,0.999627626,0.999704795,0.999639686,0.999728462,0.999974533,0.999173327,0.998954118,0.999441067,0.999357392,0.999290675,0.998999176,0.999881604,0.998896347,0.998355939,0.999135339,0.999074527,0.998872652,0.999180794,0.998918159,0.999046112,0.999042354,0.999396027,0.998624972,0.998252716,0.999597855,0.998710945,0.999003274,0.999443444,0.999141415,0.998772101,0.998940505,0.997905005,0.998374562,0.997783774,0.997596666,0.997344906,0.996954499,0.996669784,0.996030759,0.995006639,0.996157488,0.994647744,0.995779435,0.995652313,0.99577713,0.992477806,0.994969564,0.988130537,0.989284868,0.988703961,0.988302563,0.98420824,0.984495416,0.985298735,0.980062089,0.978928307,0.977358446,0.971126989,0.969303899,0.969979818,0.96405059,0.961740312,0.96729706,0.948302346,0.946571559,0.949641387,0.935949391,0.912489482,0.9261805,0.923757863,0.928757906,0.918230333,0.887761389,0.885306858,0.875178086,0.882495752,0.824428701,0.7717624]; %存活率（1-死亡率）
for i=1:90
A(i,:)=A(i,:)*b(1,i);
end
A;
c=[0,0,0,0,0,0,0,0,0,0,0,0,0,0,4.478E-05,0.000322169,0.000358246,0.001004604,0.004683367,0.011011165,0.033616492,0.057875394,0.074871727,0.069182006,0.076039141,0.06724895,0.052429406,0.043732464,0.034350502,0.024632733,0.023252532,0.018343847,0.014701275,0.011039961,0.007117557,0.005094843,0.00359291,0.002514858,0.002484781,0.001764709,0.001471644,0.000676953,0.000265476,0.000401474,0.000408779,0.000110447,0.000192401,0.000389421,0.000224069,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]; 
%由2001年原始数据得到的生育率
c1=1.2953*c;p=0.49; %女性占总人口的比例  
M=sum(c1'); %总合生育率  
d=zeros(91,1); B=[c1;A]; L=[B,d]; %构造的 lestie 矩阵 
for i=0:1:29  X=L^i*N0; %第 i 年后女性各个年龄段的人口数(亿） 
Z=X./p; %第 i 年在各个年龄段的人口总数预测  
W(i+1,1)=sum(Z);  
S1=sum(Z([1:15],:)); %第 i 年 0-14 岁的人数 
V1(1,i+1)=S1;
S2=sum(Z([16:65],:)); %第 i 年 15-64 岁的人数
V2(1,i+1)=S2;  
S3=sum(Z([66:91],:)); %第 i 年 65-90 岁的人数 
V3(1,i+1)=S3;
end  
W %2001-2030 的总人数  
V1 %年龄在 0-14 岁总人数 
V2 %年龄在 15-64 岁总人数 
V3 %年龄在 65-90 岁总人数 
x=2001:2030; plot(x,W,'-r')%成图 
xlabel('年份');ylabel('人口数（亿）'); 
title('2001-2030 年 leslie 人口预测');legend('拟合曲线');grid on;
