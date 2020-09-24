function [brake_aggression] = baggression(brake,brake_speed,interations,k)

for k = 1:interations,
    if (brake(k) > 2) && (brake_speed(k) > 2) && (brake_speed(k) < 3.0),
        brake_aggression(k) = brake_speed(k);
    else
        brake_aggression(k) = 0;
    end
end
