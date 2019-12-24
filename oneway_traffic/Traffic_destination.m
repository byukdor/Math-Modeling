

x_lists = boutlet(find(xi(i2(boutlet)) >= x_inter));
y_lists = boutlet(find(yi(i2(boutlet)) <= y_inter));
target = intersect(x_lists,y_lists);

bd(nc) = target(1+floor(rand*length(target)));
pd(nc) = rand*max(L);
xd(nc) = xi(i1(bd(nc))) + pd(nc) * ux(bd(nc));
yd(nc) = yi(i1(bd(nc))) + pd(nc) * uy(bd(nc));

while (pd(nc) >= L(bd(nc)))
    bd(nc) = target(1 + floor(rand*length(target)));
    pd(nc) = rand*max(L);
    xd(nc) = xi(i1(bd(nc))) + pd(nc) * ux(bd(nc));
    yd(nc) = yi(i1(bd(nc))) + pd(nc) * uy(bd(nc));
end

