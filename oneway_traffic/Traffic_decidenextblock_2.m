if nextb(c) == b
    store_list = cell(1,length(allpaths));
    
    for i = 1:nb
        tb(i) = car_count(i,i1,i2,xi,yi,x,y,onroad);
    end
    for i = 1:nc
        if nextb(i) ~= 0
            tb(nextb(i)) = tb(nextb(i)) + 1;
        end
    end
   
    i = i2(b);
    
    keep = false(size(allpaths));
    
    for pidx = 1:numel(allpaths)
        [found, where] = ismember([i, i2(bd(c))], allpaths{pidx});
        if all(found)
            keep(pidx) = true;
            store_list{pidx} = allpaths{pidx}(min(where):max(where)); %only keep part of the path between the two node        
        end
    end
    
    paths = store_list(keep);
   
    hey = cell2mat(paths);
    hey = reshape(hey,length(hey)/length(paths),length(paths)).';
    mat = arrayfun(@(x) tb(x) ,hey);
    [row,column] = size(mat);
    if decide < 4
        if column > decide
            [min_value,min_ind] = min(sum(mat(:,1:(decide+1)),2));
        else
            [min_value,min_ind] = min(sum(mat,2));
        end
    elseif decide == 4
        [min_value,min_ind] = min(sum(mat,2));    
    end
    nextb(c) = intersect(find(i2 == (paths{min_ind}(2))),find(i1 == i));
end
