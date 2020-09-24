function [throttle_aggression] = taggression(throttle,throttle_speed,interations,k)

for k = 1:interations,
    if (throttle(k) > 3) && (throttle_speed(k) > 3) && (throttle_speed(k) < 4.5),
        throttle_aggression(k) = throttle_speed(k);
    else
        throttle_aggression(k) = 0;
    end
end