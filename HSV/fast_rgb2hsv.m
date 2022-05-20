function [h, s, v] = fast_rgb2hsv(rgb)

%% rgb is normalized gray value, the max value is 1, and  min value is 0.

img = double(rgb);
[m n , ~]=size(img);

r=img(:,:,1);
g=img(:,:,2);
b=img(:,:,3);

h=zeros(m,n);   %色相角
s=zeros(m,n);   %饱和度
v=zeros(m,n);   %明度


maxrgb = max(img, [], 3);
minrgb = min(img, [], 3);
tmp = maxrgb - minrgb;

v = maxrgb;
s(maxrgb ~=0)  = 1 - minrgb(maxrgb ~=0) ./maxrgb(maxrgb ~=0);

for i = 1:m
    for j =1:n
        if (maxrgb(i,j)==r(i,j) && (g(i,j) >= b(i,j)))
            h(i,j) = 60 * (g(i,j) - b(i,j) ) / tmp(i,j);
        else if (maxrgb(i,j)==r(i,j) && (g(i,j) < b(i,j)))
                h(i,j) = 60 * (g(i,j) - b(i,j) ) / tmp(i,j) + 360;
              end
        end
    end
end
        
h(maxrgb==g) = 60*(b(maxrgb==g)-r(maxrgb==g)) ./ (maxrgb(maxrgb==g)-minrgb(maxrgb==g))+120;
h(maxrgb==b) = 60*(r(maxrgb==b)-g(maxrgb==b)) ./ (maxrgb(maxrgb==b)-minrgb(maxrgb==b))+240;
h(maxrgb==minrgb)  = 0;


end


