 function [ex_updates] = ex_update(A,B,Q,R,Ex,tt)
%   UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
[ii,jj] = size(A);
ex_updates = sym(zeros(jj,1));

for items = 1:jj                 %for each good
    for producer = 1:ii          %for all process
        sum_A = sum(A(producer,:).*transpose(Q(:,tt)));
        sum_B = sum(B(producer,:).*transpose(Q(:,tt)));
        ex_updates(items,1) = vpa(ex_updates(items,1) + R(producer,tt)*(sum_B/sum_A*A(producer,items)-B(producer,items)));
    end
end
    disp("Ex Done")
end