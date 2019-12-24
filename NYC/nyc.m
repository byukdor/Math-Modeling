
%First Initialize by calling data%

Initiate

% Call coordinates for each intersection

Coordinate


%%%%
Time = 5000;
dt = .1;
R = .3;

nc = 0;
tlcstep = .1;
tlc = tlcstep;
jgreen = ones(1,ni);

firstcar = zeros(1,nb);
nextcar = zeros(1,nb);
lastcar = zeros(1,nb);
vel = zeros(1,2);

%%%% Regulatory Rule %%%%
global dmax dmin vmax;
dmax = max(L);
dmin = 0;
vmax = .0001;

%%% Draw the background for NYC %%%
%m = reshape([xi(i1),yi(i1),xi(i2),yi(i2)],length(i1),4);
%x__=[m(:,1) m(:,3)];
%y__=[m(:,2) m(:,4)];
%plot(x__',y__','black');

%xlim([min(xi),max(xi)]);
%ylim([min(yi),max(yi)]);   
%hold on
%%%%

for clock = 1:Time
    t = clock * dt;
    Traffic_light
    Traffic_car
    Traffic_move
    %plot(G,'XData',xi,'YData',yi);
    scatter(xi,yi,3,'red');
    hold on
    Traffic_plot
end
