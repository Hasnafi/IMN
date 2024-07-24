A = imread('cameraman.jpg');

% Tracer son histogramme
figure;
subplot(2,3,1);
imshow(A);
title('Image originale');
subplot(2,3,4);
imhist(A);
title('Histogramme');

% Translater l'histogramme à droite et à gauche
image_r =  A + 50;
subplot(2,3,2);
imshow(image_r);
title('Image translatée à droite');


image_l = A - 50;
subplot(2,3,3);
imshow(image_l);
title('Image translatée à gauche');

% Charger l'image 'cameraman'
cameraman = imread('cameraman.jpg');

% Calculer l'histogramme de l'image
[counts, ~] = imhist(cameraman);

% Calculer l'histogramme cumulé
cumulative_histogram = cumsum(counts);

% Afficher l'histogramme cumulé
figure;
plot(cumulative_histogram);
title('Histogramme Cumulé de l''Image');
xlabel('Niveaux de gris');
ylabel('Nombre de pixels cumulés');


% Elagation de l'histogramme sur l'image thumb_pout 
image2 = imread('thumb_pout.png');

equalized_img = histeq(image2);
figure;
subplot(1,2,1);
imshow(image2);
title('Image originale');
subplot(1,2,2);
imshow(equalized_img);
title('Image égalisée');


% Chargement de l'image trui
trui_img = imread('trui.png');


% le masque Wx de Sobel sur l'image
Wx_sobel = [-1 0 1; -2 0 2; -1 0 1];
sobel_x_result = imfilter(double(trui_img), Wx_sobel);
figure;
subplot(1,2,1);
imshow(trui_img);
title('Image originale');
subplot(1,2,2);
imshow(sobel_x_result, []);
title('Résultat du filtre Sobel Wx');

% le masque Wy de Sobel sur l'image
trui_img = imread('trui.png');
Wy_sobel = [-1 -2 -1 ; 0 0 0; 1 2 1];
sobel_y_result = imfilter(double(trui_img), Wy_sobel);
figure;
subplot(1,2,1);
imshow(trui_img);
title('Image originale');
subplot(1,2,2);
imshow(sobel_y_result, []);
title('Résultat du filtre Sobel Wy');

%%
figure;
% 9. Trouver l’image qui donne le module du gradient
gradient_magnitude = sqrt(sobel_x_result.^2 + sobel_y_result.^2);
% Afficher le résultat
subplot(1, 1, 1);
imshow(gradient_magnitude, []);
title('Module du Gradient (Sobel)');

% 11. Générer la TF d'un filtre passe-bas
[M, N] = size(A);
U0 = 30; 
V0 = 30; 
[x, y] = meshgrid(1:N, 1:M);
D = sqrt((x - N/2).^2 + (y - M/2).^2);
H = double(D <= sqrt(U0^2 + V0^2));
img_filtre = ifft2(fft2(A) .* fftshift(H));
figure;
subplot(1,2,1);
imshow(A);
title('Image originale');
subplot(1,2,2);
imshow(img_filtre, []);
title('Image filtrée');


% 12. filtre passe-haut 

img_filtr = ifft2(fft2(A) .* fftshift(1 - H));
figure;
subplot(1,2,1);
imshow(A);
title('Image originale');
subplot(1,2,2);
imshow(img_filtr, []);
title('Image filtrée');