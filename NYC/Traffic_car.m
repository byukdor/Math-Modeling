for cb = 1:length(possibleb)
    b = possibleb(cb);
    if(rand < dt*R*L(b))
        nc = nc+1;
        p(nc) = rand*L(b);
        x(nc) = xi(i1(b)) +p(nc) * ux(b);
        y(nc) = yi(i1(b)) +p(nc) * ux(b);
        onroad(nc) = 1;
        Traffic_newcar
        Traffic_destination
        nextb(nc) = b;
        tenter(nc) = t;
        benter(nc) = b;
        penter(nc) = p(nc);
        Path{nc,1} = shortestpath(G,i2(benter(nc)),i1(bd(nc)));  %Path Saved
        Path{nc,2} = 1;                 %We are on the first section of path
    end
end