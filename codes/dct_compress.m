% Reading the image
originalImage = imread('IMG_3.jpeg');

% Converting the image to double precision image
originalImage = im2double(originalImage);

% Spliting the image into RGB channels
redChannel = originalImage(:, :, 1);
greenChannel = originalImage(:, :, 2);
blueChannel = originalImage(:, :, 3);

% Performing DCT on each color channel separately
dctRedChannel = dct2(redChannel);
dctGreenChannel = dct2(greenChannel);
dctBlueChannel = dct2(blueChannel);

% Setting a threshold to remove high-frequency coefficients
% Higher the threshold lower the image size with lower quality
% Threshold coefficient values: 0.01, 0.0005, 0.000001 
t_coeff1 = 0.001;
t_coeff2 = 0.0005;
t_coeff3 = 0.000001;
threshold = t_coeff3 * max([abs(dctRedChannel(:)); abs(dctGreenChannel(:)); abs(dctBlueChannel(:))]);

% Appling compression by zeroing out coefficients below the threshold
dctRedChannel(abs(dctRedChannel) < threshold) = 0;
dctGreenChannel(abs(dctGreenChannel) < threshold) = 0;
dctBlueChannel(abs(dctBlueChannel) < threshold) = 0;

% Performing inverse DCT to retrieve the compressed image
compressedRedChannel = idct2(dctRedChannel);
compressedGreenChannel = idct2(dctGreenChannel);
compressedBlueChannel = idct2(dctBlueChannel);

% Combining the color channels into the compressed image
compressedImage = cat(3, compressedRedChannel, compressedGreenChannel, compressedBlueChannel);

% Save the compressed image
imwrite(compressedImage, 'IMG_3_dct_compressed_coeff3.jpg');


