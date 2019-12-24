destination_option = find(TF(i2(b),:) == 0);
bd(nc) = destination_option(1+floor(rand*length(destination_option)));
pd(nc) = rand*max(L);
while (pd(nc) >= L(bd(nc)))
    bd(nc) = destination_option(1+floor(rand*length(destination_option)));
    pd(nc) = rand*max(L);
end
xd(nc) = xi(i1(bd(nc)))+ pd(nc) * ux(bd(nc));
yd(nc) = yi(i1(bd(nc)))+ pd(nc) * uy(bd(nc));


