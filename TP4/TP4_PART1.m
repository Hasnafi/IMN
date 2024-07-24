% Étape 1 : Lire les images
lena = imread('lena.jpg');
noisy = imread('noisy.jpg');
test_blur = imread('test_blur.jpg');

figure;
imshow(lena)

% Étape 2 : Convolution de Léna avec un filtre PB de taille 5x5
h = fspecial('average', [5 5]);
lena_blurred = imfilter(lena, h, 'conv', 'circular');
figure;
imshow(lena_blurred)

% Restauration de Léna en utilisant deconvwnr
estimated_nsr = 0.001; % estimation du rapport signal sur bruit
lena_restored = deconvwnr(lena_blurred, h, estimated_nsr);
figure;
imshow(lena_restored)

% Étape 3 : Ajouter un flou et un déplacement à l'image Léna
h = fspecial('motion', 21, 11); % flou de mouvement
lena_blurred_moved = imfilter(lena, h, 'conv', 'circular');
figure;
imshow(lena_blurred_moved)

% Restauration de l'image initiale
estimated_nsr = 0.001; % estimation du rapport signal sur bruit
lena_restored_moved = deconvwnr(lena_blurred_moved, h, estimated_nsr);
figure;
imshow(lena_restored_moved)