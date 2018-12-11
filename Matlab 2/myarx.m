function [aest, best] = myarx(y, u, n)
d = 0;
for i = 1:length(y)
    d = d + y(i);
end
C = zeros(1, 2 * n);
for j = 1:length(y)
    for i = 1:n
        if j > i
            C(i) = C(i) + u(j-i);
            C(i+n) = C(i+n) +u(j-i);
        end
    end
end
estimator = lsqlin(C,d);
aest = estimator(n+1:2*n);
best = estimator(1:n);
end    
