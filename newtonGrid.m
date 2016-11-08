function [rootMap, iterMap] = newtonGrid(powerN, c, iters, z, a, tol)
% newtonGrid.m
% parameters: powerN - degree of polynomial
%             c - constant term in polynomial
%             iters - # of iterations for Newton's method
%             z - grid in complex plane to iterate on
%             a - scaling constant for relaxed Newton's method
%             tol - tolerance to consider a point converged
% returns: kGrid - maps each point in z to the root to which it converges 

rootMap = zeros(size(z)); % initialize kGrid

func = @(v) (v .^ powerN) + c;
dfunc = @(v) powerN * v.^(powerN-1);

poly = zeros(1,powerN+1);
poly(1) = 1; poly(end) = c;
rts = roots(poly);


for iter = 1:iters % perform Newton's method
    z = z - a * (func(z)./dfunc(z));
end

for j = 1:powerN  % find which roots each point converges to
    root = rts(j)*exp(j*2*pi*1i / powerN);
    dif = j*(abs(z-root)<=tol);
    rootMap = rootMap + dif;
end

iterMap = zeros(size(z)); % # iterations for convergence
colors = jet.^1;
figure;
hold on;

for iter = 1:iters
    prev = z;
    z = z - a * (func(z)./dfunc(z));
    converged = abs(z-prev) <= tol;
    z(converged) = NaN;
    iterMap(converged) = iter;
    converged = converged .* 0;
    
end

end


% TODO - real time plotting 

% imagesc([-4 4],[-4 4], iterMap);
% colormap(colors);
% axis equal;
% axis off;
% drawnow;
% disp(iter);
