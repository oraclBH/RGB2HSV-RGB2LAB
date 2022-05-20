function outIM = RGB2LAB(inIM)

inIM = double(inIM);
[m, n, ~] = size(inIM);

L = zeros(m,n);
A = zeros(m,n);
B = zeros(m,n);

r = inIM(:,:,1) / 255;   
g = inIM(:,:,2) / 255;
b = inIM(:,:,3) / 255;

Xn = 0.950456;
Yn = 1.0;
Zn = 1.088754;

%% RGB  ===> XYZ

% 
% rgb2xyzMatrix = [ 0.4124,  0.3576,  0.1805;
%                            0.2126,  0.7152,  0.0722;
%                             0.0193, 0.1192,  0.9505];
                        
%  rgb2xyzMatrix  = [0.4124564,  0.3575761,  0.1804375;  
%                              0.2126729,  0.7151522,  0.0721750;  
%                              0.0193339,  0.1191920,  0.9503041]; 
 
 rgb2xyzMatrix =  [0.412453,    0.357580,    0.180423;
                            0.212671,     0.715160,    0.072169;   
                            0.019334,     0.119193,    0.950227] ;
                        
  %% According to the coefficient and normalization, the transformation matrix is processed to obtain the matrix  
%  rgb2xyzMatrix = [0.433953,   0.376219,   0.189828; 
%                             0.212671,    0.715160,    0.072169;   
%                             0.017758,    0.109477,    0.872765];             
                         
for i = 1:m
    for j = 1:n
        r(i,j) = gamma(r(i,j));
        g(i,j) = gamma(g(i,j));
        b(i,j) = gamma(b(i,j));
    end
end

x  =  rgb2xyzMatrix(1,1) * r +  rgb2xyzMatrix(1,2) * g + rgb2xyzMatrix(1, 3) * b  ;  
y  =  rgb2xyzMatrix(2,1) * r +  rgb2xyzMatrix(2,2) * g + rgb2xyzMatrix(2, 3) * b  ;  
z  =  rgb2xyzMatrix(3,1) * r +  rgb2xyzMatrix(3,2) * g + rgb2xyzMatrix(3, 3) * b  ;   


%%  XYZ ==> LAB

for i = 1:m
    for j = 1:n
        [L(i,j), A(i,j), B(i,j)] = xyz2lab(x(i,j), y(i,j), z(i,j), Xn, Yn, Zn);
    end
end

outIM = cat(3, L, A, B);

end


function  value = gamma(x)

if x>0.04045
    value = ((x + 0.055)/1.055) ^ 2.4;
else
    value = x/12.92;
end

end


function  [l, a, b] = xyz2lab(x, y, z, xn, yn, zn)

x = x/xn;
y = y/yn;
z = z/zn;

fx = judge(x);
fy = judge(y);
fz = judge(z);

% l = 116 * fy - 16;
if y > 0.008856
    l = 116* y^(1/3) - 16;
else
    l = 903.3*y;
end


a = 500 * (fx - fy);
b = 200 * (fy - fz);

end


function  value = judge(x)

if x>0.008856
    value = x^(1/3);
else
    value = 7.787  * x + 4/29; 
end

end













