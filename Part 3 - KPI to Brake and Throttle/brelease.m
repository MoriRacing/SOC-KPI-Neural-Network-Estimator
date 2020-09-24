function [brake_release] = brelease(brake,brake_speed,interations,k)

for k = 1:interations,
    if (brake(k) > 3.5) && (brake_speed(k) < -2.5) && (brake_speed(k) > -3.0),
        brake_release(k) = (-1)*brake_speed(k);
    else
        brake_release(k) = 0;
    end
end
