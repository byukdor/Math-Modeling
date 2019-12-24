for b = 1:nb
    c = firstcar(b);
    while(c > 0)
        if(c==firstcar(b))
            if(bd(c) == b) && (pd(c) > p(c))
                d = dmax;                       %Distance
            elseif(S(b) == 0)
                d = L(b)-p(c);                  %Distance
            else
                if switch_ == 1
                    Traffic_decidenextblock
                elseif switch_ == 2
                    Traffic_decidenextblock_2
                end
                if(lastcar(nextb(c)) > 0)
                    d = (L(b)-p(c))+p(lastcar(nextb(c)));   %Distance
                else
                    d = dmax;                               %Drive max?
                end
            end
        else
            d = min(p(find(nextcar == c)) - p(c));        %Distance between the previous and me
        end
        pz = p(c);
        nextc = nextcar(c);
 %      vel(c) = Traffic_vlag(d,Traffic_vel(d));
        p(c) = p(c) + dt * Traffic_vel(d);
        
        if(b == bd(c))&&(pz<pd(c))&&(pd(c)<=p(c))
            Traffic_remove
        elseif (L(b) <= p(c))
            p(c) = p(c) - L(b);
            if(nextb(c) == bd(c)) && (pd(c)<=p(c))
                Traffic_remove
            else
                Traffic_nextblock
            end
        else
            x(c) = xi(i1(b)) + p(c) * ux(b);
            y(c) = yi(i1(b)) + p(c) * uy(b);
            ca = c;
        end
        c = nextc;
    end
end   
                    
                
    