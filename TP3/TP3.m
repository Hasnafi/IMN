% Charger l'image
A = imread("cameraman.jpg")
imshow(A)


% Appliquer l'érosion avec SE 3x3 fenêtre
figure;
SE_3x3 = strel('square', 3);
erosion_3x3 = imerode(A, SE_3x3);
imshow(erosion_3x3)

% Appliquer l'érosion avec un disque comme SE
figure;
SE_disque = strel('disk', 3);
erosion_disque = imerode(A, SE_disque);
imshow(erosion_disque)

%Dilatation se 3x3 fenetre
figure;
dilate_square = imdilate(A,SE_3x3)
imshow(dilate_square)

%Dilatation se disque
figure;
dilate_disque = imdilate(A,SE_disque)
imshow(dilate_disque)

% Trouver l'image contour morphologique
figure;
contour = A - erosion_3x3;
imshow(contour)