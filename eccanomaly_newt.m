function E = eccanomaly_newt(E0,M,e)
% Calculate Eccentricity (E) from Newton's iteration
E = E0;
while (true)
    % Newton's Iteration
    Enew = E - ((E - e*sin(E) - M)/(1 - e*cos(E)));

    % Converge condition
    if abs(Enew - E) < 1e-8
        break
    end
    
    E = Enew;
end
end







