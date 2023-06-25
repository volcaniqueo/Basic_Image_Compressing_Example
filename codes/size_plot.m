% DCT sizes
%array1 = [1023858, 1727738, 2993447,5595383]
%array2 = [1056043, 1539278, 2184647, 4266336]
%array3 = [639057, 907829, 1477543, 2925269]

% DWT sizes
array1 = [2733704, 3062194, 3024516, 5595383]
array2 = [1936289, 2161521, 2237864, 4266336]
array3 = [1444412, 1794981, 1533373, 2925269]

x = [1,2,3,4];
figure;

hold on; 
plot(x, array1, 'b-s', 'LineWidth', 2, 'MarkerSize', 8); % Line color: blue
plot(x, array2, 'r-s', 'LineWidth', 2, 'MarkerSize', 8); % Line color: red
plot(x, array3, 'm-s', 'LineWidth', 2, 'MarkerSize', 8); % Line color: yellow

xlabel('Compressed Image with Compression Ratio (0.1, 0.5, 0.9, original)');
ylabel('Size of image (bytes)');
title('Size of Images Compressed with Different Compression Ratios');

legend('Image 1', 'Image 2', 'Image 3');

grid on;  
box on;   

