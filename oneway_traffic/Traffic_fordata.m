%%Initialize%%

switch_ = 1; % 1 means regular algorithm, 2 means optimized path algorithm
%decide = 2; % for how many blocks, 1 means consdiering the traffic of just one block ahead

%Time = 2500;
dt = .1;                        % Time step parameter
R = .5;                         % Rate parameter that determines the rate of car generation

nc = 0;                         % Variable to store the number of cars
N = 5;                          % creates a grid of NxN map
ni = N^2+4*N;                   % number of intersections
nb = 2*N^2+2*N;                 % number of blocks for symmetric roadmap

i1 = zeros(1,nb);               % indices of intersections connected by block b
i2 = zeros(1,nb);               % ordered by the direction of traffic flow

inlet= zeros(1,2*N);            % returns a list of indices for starting point
outlet = zeros(1,2*N);          % returns a list of indices for destination
binlet= zeros(1,2*N);           % returns a list of indices for starting point
boutlet = zeros(1,2*N);         % returns a list of indices for destination

bin = zeros(1,N);               % Indices for blocks entering intersection i
nbin = zeros(1,ni);             % number of blocks exiting intersection i
bout = zeros(1,N);              % Indices for blocks entering intersection i
nbout = zeros(1,ni);            % number of blocks exiting intersection i
xi = zeros(1,ni);               % x coordinate of intersections
yi = zeros(1,ni);               % i coordinate of intersections
L = zeros(1,nb);                % length of block b
ux = zeros(1,nb);               % unit vector along block b
uy = zeros(1,nb);               % in direction of traffic flow

tlcstep = .1;                   % time step for traffic light change
tlc = tlcstep;                  % initial tlc
jgreen = ones(1,ni);

firstcar = zeros(1,nb);         % Storing an index of the first car of the block
nextcar = zeros(1,1);
lastcar = zeros(1,nb);
vel = zeros(1,2);

%%%% Regulatory Rule %%%%

global dmax dmin vmax;
dmax = 1;                       % Maximum Distance between cars(for velocity)
dmin = .2;                      % Minimum Distance between cars
vmax = .2;                      % Maximum Velocity


%%%%% Mapping the traffic %%%%% 

[i1,i2,binlet,boutlet,inlet,outlet,bin,bout,nbin,nbout] = Traffic_map(N);
remover = 0;                    %remover indicates the index of block to remove, 0 to turn off!!


%[i1,i2,binlet,boutlet,inlet,outlet,bin,bout,nbin,nbout] = Traffic_map(N,remover);
[xi,yi,ux,uy,L] = Traffic_coordinate(ni,N,i1,i2);
onroad = ones(1,nc);            % Variable that stores whether a car is on road or not
tb = zeros(1,nb);               %
G = digraph(i1,i2,L);           % Digraph connects the nodes
allpaths = getpaths(G);         % Returns all the possible paths between two nodes
routes = distances(G);          % Distances function to choose the possible destination


trigger = 0;                    % Variable to control the while loop below
clock = 1;                      % Variable to keep track of the time period

while trigger == 0
%for clock = 1:Time
    %t = clock * dt;             % incre
    Traffic_light               % Matlab file for traffic light
    if nc < 500
        Traffic_car             % Generates car if the number of cars is below 500
    end
    Traffic_move                % Move the car
    %scatter(xi,yi,'blue');     % plots the intersection
    %hold on                    % Connects plot
    %Traffic_plot
    clock = clock + 1;
    if (sum(onroad) == 0) && (nc > 0)
        trigger = 1;            % If nc reaches 500 and there is no cars on the map, stops the while loop
    end
end