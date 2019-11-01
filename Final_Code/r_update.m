function r_updates = r_update(A,B,Q,r,tt)
%   r_update Summary of this function goes here
%   Detailed explanation goes here
[ii,jj] = size(A);
r_updates = sym(zeros(ii,1));

for producer = 1:ii
    sum_A = sum(A(producer,:).*transpose(Q(:,tt)));
    sum_B = sum(B(producer,:).*transpose(Q(:,tt)));
    r_updates(producer,1) = vpa(r(producer,tt-1) *(sum_B/sum_A));
end
disp("R Done")
end
