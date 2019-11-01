tt = 1;                    %number of total periods
time = 1;
ii = 30;                    %Processes
jj = 3;                     %goods

B = rand(ii,jj);          %Uniform distribution for Output
A = rand(ii,jj);          %Uniform distribution for Input
R = sym(zeros(ii,tt));     %Constant intensity for each time period
P = sym('P', [jj,tt]);     %Price of the goods
Q = P.^2;                %Price for later calculation
Ex = sym(zeros(jj,tt));    % Excess Demand if a consumption(A) is more than a production(B) at time t
Price = zeros(jj,tt);
gradient = sym(zeros(jj,tt));

epsilon = 7*10^(-6);
tau = .001;
size_sample = 20
N = size_sample^2;
value = zeros(3,N);
[x,y,z] = sphere(size_sample-1);
value(1,:) = x(:);
value(2,:) = y(:);
value(3,:) = z(:);

R(:,1) = 1;     %Intensity for t=1(initial time period) is 1
disp("R Done")
Ex(:,1) = ex_update(A,B,Q,R,Ex,time); %Excess demand from previous period
gradient(:,1) = min_derivative(A,B,Q,R,P,time);

trace = zeros(3,5000);
phi_trace = zeros(1,5000);

for matrix = 1:1
        previous = 1;
        count = 0;
        new = 0;
        new_gradient = matlabFunction(gradient,'Vars', {P(:,time)});
        for i = 1:5000
            if count == 0
                value_for = value(:,130);                                    %random points on a unit sphere
                value_for = value_for/sqrt(sum(value_for.^2));                  %Normalize
                %new = subs(gradient(:,time),P(:,time),value_for);
                new = new_gradient(value_for);               %initial value assign
                count = count + 1;
            end
            if count > 0 
                previous = new;
                part = new_gradient(previous);
               %part = subs(gradient(:,time),P(:,time),previous);
                new = (previous - tau*part)/norm(previous - tau*part);
                trace(:,i) = new;
                %phi_trace(1,i) = phi(A,B,Q,P,R,new,time);
                count = count + 1;
                if rem(count,30) == 0
                    disp(count)
                    %sprintf("%dth loop with %f difference time spent %d", count, norm(previous - new))
                end
            end
        end
        price(:,matrix) = new;
        %sprintf('%d%% done for calculating price equilibrium for period %d',(round((matrix/N)*100)),time)
    end

colormap(parula(5))
price_uniq = unique(round(price,4).','rows').';
price_uniq = price_uniq(:,all(~isnan(price_uniq)));
length_uniq = size(price_uniq,2);

surf(x,y,z)
hold on
for i = 1:length_uniq
    eval(join(["scatter3(price_uniq(1,",i,"),price_uniq(2,",i,"),price_uniq(3,",i,"),'r','filled');"]));
end
plot3(trace(1,:),trace(2,:),trace(3,:),'r')
hold off

%plot(1:N,phi_trace(1:N))
