function [brake_release_kpi,brake_release_kpi_mean] = bmeanrelease(brake_release,interations,k)
j = 0;
l = 1;
for k = 1:interations,
    
    if brake_release(k) > 0
       j = j + 1;
       brake_release_kpi(j) = (brake_release(k));
       if j == 1
           brake_release_kpi_mean(l) = (brake_release_kpi(j)/2);
           l = l + 1;
       else
           brake_release_kpi_mean(l) = ((brake_release_kpi(j-1))+((brake_release_kpi(j))/2))/2;
           l = l + 1;
       end
    else
        if j == 0
            brake_release_kpi_mean(l) = 0;
            l = l + 1;
        else
            brake_release_kpi_mean(l) = brake_release_kpi_mean(l-1);
            l = l + 1;
        end
    end
end