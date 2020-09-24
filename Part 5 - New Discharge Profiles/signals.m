load('CALCE_A123_FUDS_30', 'DYNData') % 30°C
teste = DYNData.script1;
current = teste.current; %Current 
time = teste.time; %Time

load('A123_DYN_50_P25', 'DYNData') % 30°C
teste2 = DYNData.script1;
current2 = teste2.current; %Current 
time2 = teste2.time; %Time
 
 %Plot FUDS 30°C
figure(01); 
plot(time(1:2910), current(1:2910))
title('FUDS Signal')
xlabel('Time') 
ylabel('Current')
hold on
hold off

 %Plot UDDS 25°C
figure(02); 
plot(time2(1800:3500), current2(1800:3500))
title('UDDS Signal')
xlabel('Time') 
ylabel('Current')
hold on
hold off