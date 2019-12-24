function vv = Traffic_vel(d)
global dmax dmin vmax;
if (d < dmin)
  vv=0;
elseif (d < dmax)
  vv=vmax*log(d/dmin)/log(dmax/dmin);
else
  vv=vmax;
end

