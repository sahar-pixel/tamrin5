clc; clear; close all;
pic = imread("photo.jpg");
pic = rgb2gray(pic);
[x,y] = size(pic);
newX = 512;
newY = 512;
pic2 = zeros(newX , newY);

ratioX = newX / x;
ratioY = newY / y;
for i = 1 : newX
    for j = 1 : newY
        pic2(i,j) = pic(ceil(i/ratioX),ceil(j / ratioY));
    end
end
figure;
imshow(pic2)

center = [256 ,256];
pic2(center(1),center(2)) = 255;
r = 256;
for i= center(1) - r : center(1) + r
    for j = center(2) - r : center(2) + r
        sum = (center(1) - i) * (center(1) - i) + (center(2) - j)* (center(2)-j);
        distance = round(sqrt(sum));
        pic2(j,i) = 255;
        if (distance >= r)
            pic(j,i,1) = 255;
        end
    end
end

imshow(pic);