
if(nc > 0 && sum(onroad)>0)
    %plot(G,'XData',xi,'YData',yi)
    %hold on
    scatter(x(find(onroad)),y(find(onroad)),'red','filled');
    xlim([0 N+3]);
    ylim([0 N+3]);
    %frame = getframe(gcf); % 'gcf' can handle if you zoom in to take a movie.
    %writeVideo(writerObj, frame);
    grid on
    drawnow;
    hold off
    %set(hcars,'XData',x(find(onroad)),...
    %    'YData',y(find(onroad)));
end
