function [throttle_aggression_kpi_mean, throttle_aggression_kpi] = tmeanaggression(throttle_aggression,interations,k)
j = 0;
l = 1;
for k = 1:interations,
    
    if throttle_aggression(k) > 0
       j = j + 1;
       throttle_aggression_kpi(j) = (throttle_aggression(k));
       if j == 1
           throttle_aggression_kpi_mean(l) = (throttle_aggression_kpi(j)/2);
           l = l + 1;
       else
           throttle_aggression_kpi_mean(l) = ((throttle_aggression_kpi(j-1))+((throttle_aggression_kpi(j))/2))/2;
           l = l + 1;
       end
    else
        if j == 0
            throttle_aggression_kpi_mean(l) = 0;
            l = l + 1;
        else
            throttle_aggression_kpi_mean(l) = throttle_aggression_kpi_mean(l-1);
            l = l + 1;
        end
    end
end
