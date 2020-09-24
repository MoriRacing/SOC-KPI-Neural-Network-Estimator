function [throttle, brake] = signals(current,throttle,brake,interations,k)

for k = 1:interations,
    if current(k) > 0,
        throttle(k) = current(k);
        brake(k) = 0;
    else
        throttle(k) = 0;
        brake(k) = (-1)*current(k);
    end
end
