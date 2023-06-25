originalImage_1 = imread('IMG_1.jpeg');
originalImage_2 = imread('IMG_2.jpeg');
originalImage_3 = imread('IMG_3.jpeg');
comp1_coeff1 = imread('IMG_1_dwt_compressed_ratio1.jpg');
comp1_coeff2 = imread('IMG_1_dwt_compressed_ratio2.jpg');
comp1_coeff3 = imread('IMG_1_dwt_compressed_ratio3.jpg');

comp2_coeff1 = imread('IMG_2_dwt_compressed_ratio1.jpg');
comp2_coeff2 = imread('IMG_2_dwt_compressed_ratio2.jpg');
comp2_coeff3 = imread('IMG_2_dwt_compressed_ratio3.jpg');

comp3_coeff1 = imread('IMG_3_dwt_compressed_ratio1.jpg');
comp3_coeff2 = imread('IMG_3_dwt_compressed_ratio2.jpg');
comp3_coeff3 = imread('IMG_3_dwt_compressed_ratio3.jpg');

%IMG_1
difference1_1 = double(originalImage_1) - double(comp1_coeff1); 
rmse1_coeff1 = sqrt(mean(difference1_1(:).^2));

difference1_2 = double(originalImage_1) - double(comp1_coeff2); 
rmse1_coeff2 = sqrt(mean(difference1_2(:).^2));

difference1_3 = double(originalImage_1) - double(comp1_coeff3); 
rmse1_coeff3 = sqrt(mean(difference1_3(:).^2));

%IMG_2
difference2_1 = double(originalImage_2) - double(comp2_coeff1); 
rmse2_coeff1 = sqrt(mean(difference2_1(:).^2));

difference2_2 = double(originalImage_2) - double(comp2_coeff2); 
rmse2_coeff2 = sqrt(mean(difference2_2(:).^2));

difference2_3 = double(originalImage_2) - double(comp2_coeff3); 
rmse2_coeff3 = sqrt(mean(difference2_3(:).^2));

%IMG_3
difference3_1 = double(originalImage_3) - double(comp3_coeff1); 
rmse3_coeff1 = sqrt(mean(difference3_1(:).^2));

difference3_2 = double(originalImage_3) - double(comp3_coeff2); 
rmse3_coeff2 = sqrt(mean(difference3_2(:).^2));

difference3_3 = double(originalImage_3) - double(comp3_coeff3); 
rmse3_coeff3 = sqrt(mean(difference3_3(:).^2));

array1 = [rmse1_coeff1, rmse1_coeff2, rmse1_coeff3];
array2 = [rmse2_coeff1, rmse2_coeff2, rmse2_coeff3];
array3 = [rmse3_coeff1, rmse3_coeff2, rmse3_coeff3];

x = [0.1,0.5,0.9];

figure;

hold on; 
plot(x, array1, 'b-s', 'LineWidth', 2, 'MarkerSize', 8); % Line color: blue
plot(x, array2, 'r-s', 'LineWidth', 2, 'MarkerSize', 8); % Line color: red
plot(x, array3, 'm-s', 'LineWidth', 2, 'MarkerSize', 8); % Line color: yellow

xlabel('Compression Ratio');
ylabel('RMSE Values');
title('RMSE values of differences between compressed and original images');

legend('Image 1', 'Image 2', 'Image 3');

grid on;  
box on;   


