function [r, g, b] = fast_hsv2rgb(h, s, v)

%%Normalized gray value

[m, n] = size(h);
r = zeros(m,n);
g = zeros(m,n);
b = zeros(m,n);

hfloor = floor(h/60);
hf = h/60 - hfloor;

p = v .* (1 - s);
q = v.* (1 - hf .* s);
t = v.*(1 - (1-hf).*s);

r(hfloor==0) = v(hfloor==0);
g(hfloor==0) = t(hfloor==0);
b(hfloor==0) = p(hfloor==0);

r(hfloor==1) = q(hfloor==1);
g(hfloor==1) = v(hfloor==1);
b(hfloor==1) = p(hfloor==1);

r(hfloor==2) = p(hfloor==2);
g(hfloor==2) = v(hfloor==2);
b(hfloor==2) = t(hfloor==2);

r(hfloor==3) = p(hfloor==3);
g(hfloor==3) = q(hfloor==3);
b(hfloor==3) = v(hfloor==3);

r(hfloor==4) = t(hfloor==4);
g(hfloor==4) = p(hfloor==4);
b(hfloor==4) = v(hfloor==4);

r(hfloor==5) = v(hfloor==5);
g(hfloor==5) = p(hfloor==5);
b(hfloor==5) = q(hfloor==5);

r(r>1) = 1;
r(r<0) = 0;

g(g>1) = 1;
g(g<0) = 0;

b(b>1) = 1;
b(b<0) = 0;


end
