function outIM = LAB2RGB(inIM)

L = inIM(:, :, 1);
A = inIM(:, :, 2);
B = inIM(:, :, 3);

Xn = 0.950456;
Yn = 1.0 ;
Zn = 1.088754;

inIM = double(inIM);
[m, n, ~] = size(inIM);

x= zeros(m,n);
y = zeros(m,n);
z= zeros(m,n);

r = zeros(m,n);
g = zeros(m,n);
b = zeros(m,n);

 for i = 1:m
     for j = 1:n
          [x(i,j), y(i,j), z(i,j)] = lab2xyz(L(i,j), A(i,j), B(i,j), Xn, Yn, Zn);
     end
 end


%% XYZ ===> RGB

% xyz2rgbMatrix = [3.2410, -1.5374,  -0.4986;
%                           -0.9692, 1.8760,    0.0416;
%                             0.0556, -0.2040,  1.0570];


%  xyz2rgbMatrix  =  [3.2404542,  - 1.5371385,   - 0.4985314;  
%                               -0.9692660,   1.8760108,   0.0415560;  
%                                0.0556434,   - 0.2040259,   1.0572252];

 xyz2rgbMatrix  =  [3.240479,   -1.537150,   -0.498535; 
                              -0.969256,    1.875992,    0.041556;   
                               0.055648,   -0.204043,    1.057311] ;   
                           
%  xyz2rgbMatrix  =  [3.0799327,   -1.537150,   -0.542782; 
%                                -0.921235,   1.875992,    0.0452442;  
%                                 0.0528909,  -0.204043,  1.1511515] ;                       
                           
r  =  xyz2rgbMatrix(1,1) * x +  xyz2rgbMatrix(1,2) * y + xyz2rgbMatrix(1, 3) * z ;  
g  =  xyz2rgbMatrix(2,1) * x +  xyz2rgbMatrix(2,2) * y + xyz2rgbMatrix(2, 3) * z ;    
b  =  xyz2rgbMatrix(3,1) * x +  xyz2rgbMatrix(3,2) * y + xyz2rgbMatrix(3, 3) * z ;     

 for i = 1:m
     for j = 1:n
          r(i,j) = gamma_xyz2rgb(r(i,j))*255;
          g(i,j) = gamma_xyz2rgb(g(i,j))*255;
          b(i,j) = gamma_xyz2rgb(b(i,j))*255;
     end
 end

 r(r>255) = 255;
 r(r<0) = 0;
 g(g>255) = 255;
 g(g<0) = 0;
 b(b>255) = 255;
 b(b<0) = 0;

% r = 255*(r -min(r(:))) ./(max(r(:)) - min(r(:)));
% g = 255*(g -min(g(:))) ./(max(g(:)) - min(g(:)));
% b = 255*(b -min(b(:))) ./(max(b(:)) - min(b(:)));

outIM = cat(3, r, g, b);

end


function value = gamma_xyz2rgb(x)

if x>0.0031308
    value = 1.055*(x^(1/2.4)) - 0.055;
else
    value = x * 12.92;
end

end

function [x, y, z] = lab2xyz(l, a, b, xn, yn, zn)

fy = (l + 16) /116;
fx = a / 500 + fy;
fz = fy - b/200;

x = inv_judge(fx) * xn;
y = inv_judge(fy) * yn;
z = inv_judge(fz) * zn;

end

function value = inv_judge(x)

if x > 6/29
    value =  x^3;
else
    value = (x - 4/29) / 7.787;
end

end








