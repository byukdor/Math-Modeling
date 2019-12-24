%%% coordinate Assign %%%
function[xi,yi,ux,uy,L] = Traffic_coordinate(ni,N,i1,i2)

for i = 1:ni
    if i <= N*(N+2)
        xi(i) = 2+floor((i-1)/(N+2));     %Since x coordinate of 1 is starting points
        yi(i) = N+2-mod(i-1,N+2);                   %Since y coordinate of 1 is starting points
    elseif (N*(N+2)) < i & i <= (N*(N+2)+N)
        xi(i) = 1;
        yi(i) = N+2-mod(i,N+2);
    else
        xi(i) = N+2;
        yi(i) = yi(i-N);
    end
end

ux = xi(i2) - xi(i1);
uy = yi(i2) - yi(i1);

L = sqrt(ux.^2+uy.^2);

ux = ux./L;
uy = uy./L;

end