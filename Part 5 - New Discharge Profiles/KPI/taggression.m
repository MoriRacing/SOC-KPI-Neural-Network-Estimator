function [throttle_aggression] = taggression(throttle,throttle_speed,interations,k)

for k = 1:interations,
    % if (throttle(k) > 0) && (throttle_speed(k) > 0) && (throttle_speed(k) < 5),
    if (throttle_speed(k) > 0.1),
        
        throttle_aggression(k) = throttle_speed(k);
    else
        throttle_aggression(k) = 0;
    end
end