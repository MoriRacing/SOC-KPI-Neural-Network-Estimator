function [brake_aggression] = baggression(brake,brake_speed,interations,k)

for k = 1:interations,
    % if (brake(k) > 0) && (brake_speed(k) > 0) && (brake_speed(k) < 5),
    if (brake_speed(k) > 0.1)
        brake_aggression(k) = brake_speed(k);
    else
        brake_aggression(k) = 0;
    end
end
