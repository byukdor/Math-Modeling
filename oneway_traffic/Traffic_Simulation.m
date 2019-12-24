%%Initialize%%

switch_ = 1; % 1 means regular algorithm, 2 means optimized algorithm

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
[xi,yi,ux,uy,L] = Traffic_coordinate(ni,N,i1,i2);
onroad = ones(1,nc);
tb = zeros(1,nb);
G = digraph(i1,i2,L);
allpaths = getpaths(G);

%writerObj = VideoWriter('out_3_1.avi');    % Video generating code
%writerObj.FrameRate = 100;                 % How many frames per second.
%open(writerObj);


for clock = 1:Time
    t = clock * dt;
    Traffic_light
    Traffic_car
    Traffic_move
    Traffic_plot
end

%close(writerObj);                          % Close the video after the
%loop