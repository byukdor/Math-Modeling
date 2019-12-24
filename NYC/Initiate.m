
inter = readmatrix("Manhattan_assign.csv");
inter(1,:) = [];
inter = unique(inter,'rows');
%inter = readmatrix("assign.csv");
dict = readmatrix("dict.csv");

inter(isnan(inter))=0;

[row,col] = size(inter);

i1=zeros(1,1);
i2=zeros(1,1);
count = 1;

for i = 1:row
    for j = 1:col
        if inter(i,j) ~= 0 && j+1 <= col && inter(i,j+1) ~= 0
            i1(1,count) = inter(i,j);
            i2(1,count) = inter(i,j+1); 
            count = count + 1;
        end
    end
end

ni = max(i1);

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

nb = sum(nbin);
Path = {nb,2};

%%% Traffic Light matter for outlets and inlets %%%