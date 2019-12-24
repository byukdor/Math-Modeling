%%%Traffic%%%
function[i1,i2,binlet,boutlet,inlet,outlet,bin,bout,nbin,nbout] = Traffic_map(N)%,remover)
            % First, create a simple symmetric road with a grid setting %
ni = N^2+4*N;                   % number of itersections
i = linspace(1,ni,ni);          % intersection index
nb = 2*N^2+2*N;                 % number of blocks for symmetric roadmap
b = linspace(1,nb,nb);          % block index

i1 = zeros(1,nb);               % indices of intersections connected by block b
i2 = zeros(1,nb);               % ordered by the direction of traffic flow

inlet = zeros(1,2*N);           %
outlet = zeros(1,2*N);          % indices of outlet(destination) intersection
binlet = zeros(1,2*N);          %
boutlet = zeros(1,2*N);         % indices of outlet(destination) intersection

nbin = zeros(1,ni);             % number of blocks entering intersection i                                
nbout = zeros(1,ni);            % number of blocks leaving intersection i

for i = 1:nb
    if i <= N*(N+1)
        i1(i) = i+floor((i-1)/(N+1));
        i2(i) = i+1+floor((i-1)/(N+1));
    elseif  N*(N+1) < i & i <= N*(N+2)
        i1(i) = i+N;
        i2(i) = i+1-N*(N+1);
    elseif N*(N+2) < i & i <= N*(2*N+1)
        i1(i) = i2(i-N);     % or j + 1 + floor((i-1-N*(N+2))/N);
        i2(i) = i1(i)+N+2;
    elseif N*(2*N+1) < i & i <= nb
        i1(i) = i2(i-N);
        i2(i) = i1(i)+(2*N+1);
    end
end

%i1 = i1(setdiff(1:nb,remover));
%i2 = i2(setdiff(1:nb,remover));
%nb = nb - length(remover);


for i = 1:ni
    nbin(i) = sum(i2 == i);
    nbout(i) = sum(i1 == i);
end

nbinbmax = max(nbin);
nboutmax = max(nbout);
bin = zeros(ni,nbinbmax);
bout = zeros(ni,nboutmax);

for i = 1:ni
    bin(i,1:nbin(i)) = find(i2 == i);
    bout(i,1:nbout(i)) = find(i1 == i);
end

count = 1;

for i = 1:ni
    if nbin(i) == 1 & nbout(i) == 0
        outlet(count) = i;
        count = count+1;
    end
end

count = 1;

for i = 1:ni
    if nbin(i) == 0 & nbout(i) == 1
        inlet(count) = i;
        count = count+1;
    end
end

icount = 1;
ocount = 1;
for i = 1:nb
    if ismember(i1(i),inlet)
        binlet(icount) = i;
        icount = icount + 1;
    elseif ismember(i2(i),outlet)
        boutlet(ocount) = i;
        ocount = ocount + 1;
    end
end

end
    