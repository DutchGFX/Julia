function [kGrid] = newtonGrid(powerN, c, iters, z, a, tol)
%
% references: http://atmos.eas.cornell.edu/~mek236/fractal/

kGrid = zeros(size(z)); % will store k values: dark not diverging

func = @(v) (v .^ powerN) + c;
dfunc = @(v) powerN * v.^(powerN-1);

poly = zeros(1,powerN+1);
poly(1) = 1; poly(end) = c;
rts = roots(poly);

for iter = 1:iters
    z = z - a * (func(z)./dfunc(z));
end

for j = 1:powerN 
    root = rts(j)*exp(j*2*pi*1i / powerN);
    dif = j*(abs(z-root)<=tol);
    kGrid = kGrid + dif;
end

end
