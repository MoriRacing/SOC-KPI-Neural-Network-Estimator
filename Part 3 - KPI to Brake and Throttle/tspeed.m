function [throttle_speed] = tspeed(throttle)

throttle_speed = diff(throttle);
% throttle_speed(36880)=0; %Training data : A123_DYN_50_P25
 throttle_speed(36814)=0; %Test data : A123_DYN_50_P35
end