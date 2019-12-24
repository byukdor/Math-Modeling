coord = readmatrix("intersection_var.csv");

xi = zeros(1,ni);
yi = zeros(1,ni);

% Find the X,Y coordinate using VLOOKUP Like method in Matlab %

for i = 1:ni
    [tf,RowWithElem] = ismember(i,coord(:,1));
    xi(i) = coord(RowWithElem,2);
    yi(i) = coord(RowWithElem,3);
end

ux = xi(i2) - xi(i1);
uy = yi(i2) - yi(i1);

L = sqrt(ux.^2+uy.^2);

ux = ux./L;
uy = uy./L;

G = digraph(i1,i2,L);
hehe = distances(G);
TF = isinf(hehe);
out=sum(TF,2);
result = find(out < 3000);
possibleb = find(ismember(i2,result));
