%Plot KPI Graphics
figure(01); %UDDS Current Signal
plot(time, current)
title('Current Signal UDDS Dynamic ')
xlabel('Time') 
ylabel('Current UDDS Signal') 
legend({'UDDS'},'Location','southwest')

figure(02); %Extract Throttle and Brake Signal
plot(time, throttle)
title('Throttle and Brake')
xlabel('Time') 
ylabel('Current') 
hold on
plot(time, brake)
legend({'Throttle','Brake'},'Location','southwest')
hold off

%Plot Brake Graphics
figure(03); 
%Brake Speed
plot(time, brake)
title('Brake and Brake Speed')
xlabel('Time') 
ylabel('Current / Current Derivate')
hold on
plot(time, brake_speed)
legend({'Brake','Brake Speed'},'Location','southwest')
hold off

figure(04);  %Brake Aggression
plot(time, brake)
title('Brake and Brake Aggression')
xlabel('Time') 
ylabel('Current / Current Derivate')
hold on
plot(time, brake_aggression)
legend({'Brake','Brake Aggression'},'Location','southwest')
hold off

figure(05); %Brake Release
plot(time, brake)
title('Brake and Brake Release')
xlabel('Time') 
ylabel('Current / Current Derivate')
hold on
plot(time, brake_release)
legend({'Brake','Brake Release'},'Location','southwest')
hold off

figure(06); %KPI Brake Agression and Brake Release
plot(time, brake_aggression_kpi_mean)
title('KPI - Brake Aggression (Mean) and Brake Release (Mean)')
xlabel('Time') 
ylabel('KPI')
hold on
plot(time, brake_release_kpi_mean)
legend({'Brake Aggression KPI','Brake Release KPI'},'Location','southwest')
hold off

%Plot Throttle Graphics 
figure(07); 
%Throttle Speed
plot(time, throttle)
title('Throttle and Throttle Speed')
xlabel('Time') 
ylabel('Current / Current Derivate')
hold on
plot(time, throttle_speed)
legend({'Throttle','Throttle Speed'},'Location','southwest')
hold off

figure(08);  %Throttle Aggression
plot(time, throttle)
title('Throttle and Throttle Aggression')
xlabel('Time') 
ylabel('Current / Current Derivate')
hold on
plot(time, throttle_aggression)
legend({'Throttle','Throttle Aggression'},'Location','southwest')
hold off

figure(09); %Throttle Release
plot(time, throttle)
title('Throttle and Throttle Release')
xlabel('Time') 
ylabel('Current / Current Derivate')
hold on
plot(time, throttle_release)
legend({'Throttle','Throttle Release'},'Location','southwest')
hold off

figure(10); %KPI Throttle Agression and Throttle Release
plot(time, throttle_aggression_kpi_mean)
title('KPI - Throttle Aggression (Mean) and Throttle Release (Mean)')
xlabel('Time') 
ylabel('KPI')
hold on
plot(time, throttle_release_kpi_mean)
legend({'Throttle Aggression KPI','Throttle Release KPI'},'Location','southwest')
hold off