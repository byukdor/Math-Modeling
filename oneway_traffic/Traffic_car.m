%%% Cars %%%

for b = binlet                                          % Generates car for inlets
    if(rand < dt*R)                                     % Indicates the probaility of car generating
        x_inter = xi(i1(b));                            % X coordinate for i1 of generated car's block
        y_inter = yi(i1(b));                            % Y coordinate for i1 of generated car's block
        nc = nc + 1;
        p(nc) = rand * L(b);                            % Random Position of the new car
        x(nc) = x_inter + p(nc)*ux(b);                  % X coordinates for the new car
        y(nc) = y_inter + p(nc)*uy(b);                  % Y coordinates for the new car
        xrange = [x(nc) + (dmin), x(nc)-(dmin)];        
        yrange = [y(nc) + (dmin), y(nc)-(dmin)];
        
        % If there is a car within the range which is determined by the
        % minimum distance variable, dmin, car would not be generated
        
        if sum(y(find(x(1:(nc-1)) < xrange(1) & x(1:nc-1) > xrange(2))) < yrange(1) & ... 
            y(find(x(1:nc-1) < xrange(1) & x(1:nc-1) > xrange(2))) > yrange(2)) ~= 0
            nc = nc - 1;                    
        else
            Traffic_newcar                              % Matlab code to store information for the new car
            if remover == 0
                Traffic_destination                     % if remover is not indicated, then normal algorithm
            elseif remover > 0
                Traffic_destination_removeblock         % if remover is indicated then remove block
            end
            onroad(nc) = 1;                             % the new car is now on road
            nextb(nc) = b;                              % Next block
            tenter(nc) = t;                             % Time entered
            benter(nc) = b;                             % Block entered
            penter(nc) = p(nc);                         % Position entered
        end
    end
end
        