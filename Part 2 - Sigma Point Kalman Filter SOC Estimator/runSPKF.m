% runSPKF: Runs a sigma-point Kalman filter for saved E2 dynamic data and 
% an E2 cell model.
%
% Copyright (c) 2016 by Gregory L. Plett of 
% University of Colorado Colorado Springs (UCCS). 
%
% This work is licensed under a Creative Commons 
% Attribution-NonCommercial-ShareAlike 4.0 Intl. License, v. 1.0
%
% It is provided "as is", without express or implied warranty, for 
% educational and informational purposes only.
%
% This file is provided as a supplement to: Plett, Gregory L., "Battery
% Management Systems, Volume II, Equivalent-Circuit Methods," Artech House, 
% 2015.

% Load model file corresponding to a cell of this type
load A123model.mat

% Load cell-test data to be used for this batch experiment
% Contains variable "DYNData" of which the field "script1" is of 
% interest. This has sub-fields time, current, voltage, soc.
% load('A123_DYN_45_P05'); T = 05; % 05°C
% load('A123_DYN_45_P15'); T = 15; % 15°C
 load('Copy_of_A123_DYN_50_P25'); T = 25; % 25°C
% load('A123_DYN_50_P30'); T = 25; %25°C
% load('A123_DYN_50_P35'); T = 35; % 35°C
% load('A123_DYN_50_P45'); T = 45; % 45°C

time    = DYNData.script1.time(:);   deltat = time(2)-time(1);
time    = time-time(1); % start time at 0
current = DYNData.script1.current(:); % discharge > 0; charge < 0.
voltage = DYNData.script1.voltage(:);
soc     = DYNData.script1.soc(:);

% Reserve storage for computed results, for plotting
sochat = zeros(size(soc));
socbound = zeros(size(soc));

% Covariance values
SigmaX0 = diag([1e-6 1e-8 2e-4]); % uncertainty of initial state
SigmaV = 2e-1; % Uncertainty of voltage sensor, output equation
SigmaW = 2e-1; % Uncertainty of current sensor, state equation

% Create spkfData structure and initialize variables using first
% voltage measurement and first temperature measurement
spkfData = initSPKF(voltage(1),T,SigmaX0,SigmaV,SigmaW,model);

% Now, enter loop for remainder of time, where we update the SPKF
% once per sample interval
hwait = waitbar(0,'Computing...'); 
for k = 1:length(voltage),
  vk = voltage(k); % "measure" voltage
  ik = current(k); % "measure" current
  Tk = T;          % "measure" temperature
  
  % Update SOC (and other model states)
  [sochat(k),socbound(k),spkfData] = iterSPKF(vk,ik,Tk,deltat,spkfData);
  % update waitbar periodically, but not too often (slow procedure)
  if mod(k,1000)==0,
    waitbar(k/length(current),hwait);
  end;
end
close(hwait);

% Plot estimate of SOC
figure(1); clf; plot(time/60,100*soc,'k',time/60,100*sochat,'b'); hold on
plot([time/60; NaN; time/60],[100*(sochat+socbound); NaN; 100*(sochat-socbound)],'r');
title('SOC estimation using SPKF'); xlabel('Time (min)'); ylabel('SOC (%)');
legend('Truth','Estimate','Bounds'); 
grid on; ylim([0 120])

% Display RMS estimation error to command window
fprintf('RMS SOC estimation error = %g%%\n',sqrt(mean((100*(soc-sochat)).^2)));

% Plot estimation error and bounds
figure(2); clf; plot(time/60,100*(soc-sochat),'b'); hold on
plot([time/60; NaN; time/60],[100*socbound; NaN; -100*socbound],'r');
title('SOC estimation errors using SPKF');
xlabel('Time (min)'); ylabel('SOC error (%)'); ylim([-6 6]); 
set(gca,'ytick',-6:2:6);
legend('SPKF error','location','northwest'); 
grid on

% Display bounds errors to command window
ind = find(abs(soc-sochat)>socbound);
fprintf('Percent of time error outside bounds = %g%%\n',...
        length(ind)/length(soc)*100);
