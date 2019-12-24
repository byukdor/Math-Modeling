
%%%%%%%%%%This code is to compare data for removing blocks%%%%%%%%%%

N = 5;                                  % Specify the size of the map
situation = 1:(2*N^2+2*N);              % Variable to test Braess's Paradox(the number of blocks to remove)
time_consumed = zeros(20,(2*N^2-2*N));  % Variable to store time period taken for each situation

for iteration = 1:(2*N^2-2*N)
    progress = (iteration-1);
    for counting = 1:10
        switch_ = 1;                    % Switch_ == 1 indicates normal steering algorithm
        binlet = [1,7,13,19,25,31,32,33,34,35];         % Manually code the binlet and boutlet to avoid
        boutlet = [6,12,18,24,30,56,57,58,59,60];       % choosing them as a block to remove

        wow = union(binlet,boutlet);
        blocks_to_remove = setdiff(situation,wow);      % Blocks that are not inlets or outlets
        remover = blocks_to_remove(iteration);
        
        Traffic_fordata;
        time_consumed(counting,iteration) = clock;
        disp(round(((progress*20)+counting)/(length(situation)*2),4))
    end
end


%%%%%%%%%%This Code is to compare data for different path algorithm %%%%%%%%%%

%comparing = 5;  %how many situations are we comparing
%for iteration = 2:2
%    progress = ((iteration-1)*50);
%    if iteration == 1
%        for counting = 1:100               %normal situation
%            switch_ = 1;
%            Traffic_fordata;
%            time_consumed(counting,iteration) = clock;
%            disp(round((progress+counting)/(comparing),2))
%        end
%    elseif iteration == 2                   %new algorithm
%        for counting = 1:50
%            switch_ = 2;
%            decide = 1;
%            Traffic_fordata;
%            time_consumed(counting,iteration) = clock;
%            disp(round((progress+counting)/(comparing),2))
%        end
%    elseif iteration == 3
%        switch_ = 2;
%        decide = 2;
%        for counting = 1:50
%            Traffic_fordata;
%            time_consumed(counting,iteration) = clock;
%            disp(round((progress+counting)/(comparing),2))
%        end
%    elseif iteration == 4
%        switch_ = 2;
%        decide = 3;
%        for counting = 1:50
%            Traffic_fordata;
%            time_consumed(counting,iteration) = clock;
%            disp(round((progress+counting)/(comparing),2))
%        end
%    elseif iteration == 5
%        switch_ = 2;
%        decide = 4;
%        for counting = 6:50
%            Traffic_fordata;
%            time_consumed(counting,iteration) = clock;
%           disp(round((progress+counting)/(comparing*100),2))
%        end
%    end
%end