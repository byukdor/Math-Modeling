if nextb(c) == b
    i = i2(b);
    xdvec = xd(c) - xi(i);
    ydvec = yd(c) - yi(i);
    dp = ux(bout(i,1:nbout(i)))*xdvec + uy(bout(i,1:nbout(i)))*ydvec;
    [dpmax,jnext] = max(dp);
    nextb(c) = bout(i,jnext);
    if isinf(routes(i2(nextb(c)),i2(bd(c))))
        nextb(c) = setdiff(bout(i,:),nextb(c));
    end
end
