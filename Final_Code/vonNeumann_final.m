
tt = 50;                    %number of total periods
ii = 10;                    %Processes
jj = 5;                     %goods

%B = rand(ii,jj);          %Uniform distribution for Output
%A = rand(ii,jj);          %Uniform distribution for Input
R = sym(zeros(ii,tt));     %Constant intensity for each time period
P = sym('P', [jj,tt]);     %Price of the goods
Q = P.^2;                %Price for later calculation
Ex = sym(zeros(jj,tt));    % Excess Demand if a consumption(A) is more than a production(B) at time t
Price = zeros(jj,tt);
gradient = sym(zeros(jj,tt));

for time = 1:tt             %For each time period
    tic
    if time == 1
        R(:,time) = 1;     %Intensity for t=1(initial time period) is 1
        disp("R Done")
        Ex(:,time) = ex_update(A,B,Q,R,Ex,time); %Excess demand from previous period
        gradient(:,time) = min_derivative(A,B,Q,R,P,time);
        Price(:,time) = price_update(gradient(:,time),P,Ex,time,A,B,Q,R);
    else
        R(:,time) = r_update(A,B,Q,R,time);
        R = subs(R,P(:,time-1),Price(:,time-1));
        Ex(:,time) = ex_update(A,B,Q,R,Ex,time); %Excess demand from previous period
        gradient(:,time) = min_derivative(A,B,Q,R,P,time);
        Price(:,time) = price_update(gradient(:,time),P,Ex,time,A,B,Q,R); %Equilibrium prices for current period
    end        
    toc
end
