
heyyy = 1:(2*N);
result = isinf(routes(i1(b),outlet));
target_1 = boutlet(heyyy(~result));
x_lists = boutlet(find(xi(i2(boutlet)) >= x_inter));
y_lists = boutlet(find(yi(i2(boutlet)) <= y_inter));
target_2 = intersect(x_lists,y_lists);
target = intersect(target_1,target_2);


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

