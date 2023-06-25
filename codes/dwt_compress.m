% Reading the image
originalImage = imread('IMG_3.jpeg');

% Converting image to double precision 
originalImage = im2double(originalImage);

% Defining the wavelet and level of decomposition
wavelet = 'sym8'; 
level = 3; % Number of decomposition levels

% Performing DWT on each color channel
compressedImage = zeros(size(originalImage));
for i = 1:3
    channel = originalImage(:,:,i);
    [cA, cH, cV, cD] = dwt2(channel, wavelet);
    
    % Defining the compression ratio 
    compressionRatio1 = 0.1;
    compressionRatio2 = 0.5;
    compressionRatio3 = 0.9;
    
    % Determining the number of coefficients to keep
    coefficientsToKeep = round(compressionRatio3 * numel(cA));
    
    % Converting the wavelet coefficients matrices to vectors
    cA_vector = cA(:);
    cH_vector = cH(:);
    cV_vector = cV(:);
    cD_vector = cD(:);
    
    % Sorting the coefficients in descending order of magnitude
    [~, indices] = sort(abs(cA_vector), 'descend');
    
    % Setting the least significant coefficients to zero
    cA_vector(indices(coefficientsToKeep+1:end)) = 0;
    
    % Reshaping the vector to the original wavelet coefficients matrices
    compressed_cA = reshape(cA_vector, size(cA));
    compressed_cH = reshape(cH_vector, size(cH));
    compressed_cV = reshape(cV_vector, size(cV));
    compressed_cD = reshape(cD_vector, size(cD));
    
    % Reconstructing the compressed channel using inverse DWT
    compressedChannel = idwt2(compressed_cA, compressed_cH, compressed_cV, compressed_cD, wavelet);
    
    % Updating the compressed image with the compressed channel
    compressedImage(:,:,i) = compressedChannel;
end

imwrite(compressedImage, "IMG_3_dwt_compressed_ratio3.jpg")

