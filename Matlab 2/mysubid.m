function [At, Bt, Ct, Dt, x0t, S] = mysubid(y, u, s, n)













[Bt,Dt,x0t] = subidhelp(y,u,At,Ct);
end