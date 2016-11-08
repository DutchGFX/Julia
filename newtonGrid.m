function [rootMap, iterMap] = newtonGrid(powerN, c, iters, z, a, tol)
% newtonGrid.m
% parameters: powerN - degree of polynomial
%             c - constant term in polynomial
%             iters - # of iterations for Newton's method
%             z - grid in complex plane to iterate on
%             a - scaling constant for relaxed Newton's method
%             tol - tolerance to consider a point converged
% returns: rootMap - maps each point in z to the root to which it converges
%          iterMap - maps eaceh point in z to the # of iterations for
%          convergence

rootMap = zeros(size(z)); % initialize kGrid

func = @(v) (v .^ powerN) + c;
dfunc = @(v) powerN * v.^(powerN-1);

poly = zeros(1,powerN+1);
poly(1) = 1; poly(end) = c;
rts = roots(poly);
tempz = z;

% possible implementation for general polynomials 
%func = @(v) polyval(poly,v);
%dfunc = @(v) polyval(polyder(poly),v);

%% rootMapping

for iter = 1:iters % perform Newton's method
    z = z - a * (func(z)./dfunc(z));
end

for j = 1:powerN  % find which roots each point converges to
    root = rts(j); %.*exp(j*2*pi*1i / powerN);
    where = j*(abs(z-root)<=tol);
    rootMap = rootMap + where;
    
end

%% iterMapping

z = tempz;
iterMap = zeros(size(z)); % # iterations for convergence
figure;
hold on;
colors = colorcube.^3;

for iter = 1:iters
    prev = z;
    z = z - a * (func(z)./dfunc(z));
    converged = abs(z-prev) <= tol;
    z(converged) = NaN;
    iterMap(converged) = iter;
    converged = converged .* 0;
    
    % real time plotting
%     imagesc([-4 4],[-4 4], iterMap);
%     colormap(colors);
%     axis equal;
%     axis off;
%     colorbar;
%     drawnow;
end

end

% TODO - real time plotting

% figure;
% hold on;
% colors = jet.^1;
% 
% for iter = 1:iters
%     prev = z;
%     z = z - a * (func(z)./dfunc(z));
%     converged = abs(z-prev) <= tol;
%     z(converged) = NaN;
%     iterMap(converged) = iter;
%     converged = converged .* 0;
%     imagesc([-4 4],[-4 4], iterMap);
% colormap(colors);
% axis equal;
% axis off;
% drawnow;
% end
% 
% disp(iter);
