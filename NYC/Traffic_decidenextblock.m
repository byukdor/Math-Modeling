if nextb(c) == b
    i = i2(b);
    road = Path{c,1};
    count = Path{c,2};
    if length(road) > count
        if count == 1
            next_intersection = road(count+1);
            nextb(c) = intersect(find(i == i1),find(next_intersection == i2));
            Path{c,2} = Path{c,2} + 1;
        elseif i1(b) == road(count)
            next_intersection = road(count+1);
            nextb(c) = intersect(find(i == i1),find(next_intersection == i2));
            Path{c,2} = Path{c,2} + 1;
        elseif i1(b) ~=road(count)
            Path{c,2} = find(i2(b) == road);
            next_intersection = road(Path{c,2}+1);
            nextb(c) = intersect(find(i == i1),find(next_intersection == i2));
            Path{c,2} = Path{c,2} + 1;
        end
    elseif length(road) == count
        nextb(c) = bd(c);
    end
end
