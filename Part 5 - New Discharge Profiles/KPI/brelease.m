function [brake_release] = brelease(brake,brake_speed,interations,k)

for k = 1:interations,
    if (brake(k) > 0.2) && (brake_speed(k) < -0.3) && (brake_speed(k) > -1.5),
        brake_release(k) = (-1)*brake_speed(k);
    else
        brake_release(k) = 0;
    end
end
