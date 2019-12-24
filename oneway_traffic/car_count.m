function counter = car_count(i,i1,i2,xi,yi,x,y,onroad)
x_pool = x(find(onroad));
y_pool = y(find(onroad));
if xi(i1(i)) == xi(i2(i))
    counter = length(intersect(intersect(find(yi(i1(i)) > y_pool), find(yi(i2(i)) < y_pool)),find(xi(i2(i)) == x_pool)));
elseif yi(i1(i)) == yi(i2(i))          
    counter = length(intersect(intersect(find(xi(i1(i)) < x_pool), find(xi(i2(i))>x_pool)),find(yi(i2(i)) == y_pool)));
end
end