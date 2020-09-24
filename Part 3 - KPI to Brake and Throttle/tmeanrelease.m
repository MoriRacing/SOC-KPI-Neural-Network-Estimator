function [throttle_release_kpi,throttle_release_kpi_mean] = tmeanrelease(throttle_release,interations,k)
j = 0;
l = 1;
for k = 1:interations,
    
    if throttle_release(k) > 0
       j = j + 1;
       throttle_release_kpi(j) = (throttle_release(k));
       if j == 1
           throttle_release_kpi_mean(l) = (throttle_release_kpi(j)/2);
           l = l + 1;
       else
           throttle_release_kpi_mean(l) = ((throttle_release_kpi(j-1))+((throttle_release_kpi(j))/2))/2;
           l = l + 1;
       end
    else
        if j == 0
            throttle_release_kpi_mean(l) = 0;
            l = l + 1;
        else
            throttle_release_kpi_mean(l) = throttle_release_kpi_mean(l-1);
            l = l + 1;
        end
    end
end