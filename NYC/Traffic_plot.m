
if(nc > 0 && sum(onroad)>0)
    scatter(x(find(onroad)),y(find(onroad)),'blue','filled');
    %scatter(xd(find(onroad)),yd(find(onroad)),'green','filled');
    %xlim([min(xi),(min(xi)+max(xi))/2])
    %ylim([min(yi),(min(yi)+max(yi))/2])
    drawnow;
    hold off
    %When we look at Google Maps they show us the status of each traffic
    %with Green, Orange, Red, Dark Red
    %Implement an algorithm for traffic flow and color code the traffic
    %situation for each bar
end
