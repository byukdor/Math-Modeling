


if t > tlc
    for i= 1:ni
        jgreen(i) = jgreen(i)+1;
        if jgreen(i) > nbin(i)
            jgreen(i) = 1;
        end
    end
    tlc = tlc + tlcstep;
end

S = zeros(1,nb);
for i = 1:ni
    if ismember(i,outlet)
        jgreen(i) = 1;
    elseif ~ismember(i,inlet)
        b = bin(i,jgreen(i));
        if b == 0
        else
            S(b) = 1;
        end
    end
end
