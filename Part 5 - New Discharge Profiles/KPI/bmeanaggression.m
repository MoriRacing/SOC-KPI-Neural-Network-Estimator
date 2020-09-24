function [brake_aggression_kpi_mean, brake_aggression_kpi] = bmeanaggression(brake_aggression,interations,k)
j = 0;
l = 1;
for k = 1:interations,
    
    if brake_aggression(k) > 0
       j = j + 1;
       brake_aggression_kpi(j) = (brake_aggression(k));
       if j == 1
           brake_aggression_kpi_mean(l) = (brake_aggression_kpi(j)/2);
           l = l + 1;
       else
           brake_aggression_kpi_mean(l) = ((brake_aggression_kpi(j-1))+((brake_aggression_kpi(j))/2))/2;
           l = l + 1;
       end
    else
        if j == 0
            brake_aggression_kpi_mean(l) = 0;
            l = l + 1;
        else
            brake_aggression_kpi_mean(l) = brake_aggression_kpi_mean(l-1);
            l = l + 1;
        end
    end
end


  
