time = 1:36814;

%Plot UDDS 05°C - Parametros 1
figure(01); 
plot(time, UDDS_05_NNSOC,'r')
title('UDDS validation profile at 05°C - NN Parameters 1')
xlabel('Time') 
ylabel('SOC')
hold on
plot(time, realSOC_05,'b')
legend({'Neural Network','Real SOC'},'Location','southwest')
hold off

%Plot UDDS 05°C - Parametros 2
figure(02); 
plot(time, UDDS_05_NNSOC_parametro2,'r')
title('UDDS validation profile at 05°C - NN Parameters 2')
xlabel('Time') 
ylabel('SOC')
hold on
plot(time, realSOC_05,'b')
legend({'Neural Network','Real SOC'},'Location','southwest')
hold off

%Plot UDDS 15°C - Parametros 1
figure(03); 
plot(time, UDDS_15_NNSOC,'r')
title('UDDS validation profile at 15°C - NN Parameters 1')
xlabel('Time') 
ylabel('SOC')
hold on
plot(time, realSOC_15,'b')
legend({'Neural Network','Real SOC'},'Location','southwest')
hold off

%Plot UDDS 15°C - Parametros 2
figure(04); 
plot(time, UDDS_15_NNSOC_parametro2,'r')
title('UDDS validation profile at 15°C - NN Parameters 2')
xlabel('Time') 
ylabel('SOC')
hold on
plot(time, realSOC_15,'b')
legend({'Neural Network','Real SOC'},'Location','southwest')
hold off

%Plot UDDS 35°C - Parametros 1
figure(05); 
plot(time, UDDS_35_NNSOC,'r')
title('UDDS validation profile at 35°C')
xlabel('Time') 
ylabel('SOC')
hold on
plot(time, realSOC_35,'b')
legend({'Neural Network','Real SOC'},'Location','southwest')
hold off

%Plot UDDS 45°C - Parametros 1
figure(06); 
plot(time, UDDS_45_NNSOC,'r')
title('UDDS validation profile at 45°C')
xlabel('Time') 
ylabel('SOC')
hold on
plot(time, realSOC_45,'b')
legend({'Neural Network','Real SOC'},'Location','southwest')
hold off
