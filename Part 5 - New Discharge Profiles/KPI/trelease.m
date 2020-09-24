function [throttle_release] = trelease(throttle,throttle_speed,interations,k)

for k = 1:interations,
   % if (throttle(k) > 0) && (throttle_speed(k) < 0) && (throttle_speed(k)> -5.0),
    if (throttle_speed(k) < -0.1),   
        
        throttle_release(k) = (-1)*throttle_speed(k);
    else
        throttle_release(k) = 0;
    end
end
