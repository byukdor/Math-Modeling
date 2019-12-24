%%%Light%%%
if t > tlc
    for i= 1:ni
        jgreen(i) = jgreen(i)+1;
        if jgreen(i) > nbin(i)
            jgreen(i) = 1;
        end
    end
    tlc = tlc + tlcstep;
end

S = ones(1,nb);
%for i = 1:ni
%    b = bin(i,jgreen(i));
%    if b == 0
%    else
%        S(b) = 1;
%    end
%end
