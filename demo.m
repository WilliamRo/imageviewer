function demo
%DEMO ...
%

% read sample image from disk
img = imread('sample.tif');

% initilize image stack
stack = repmat(zeros(size(img)), 1, 1, 3);

% process image
stack(:, :, 1) = medfilt2(img, [3, 3]);
stack(:, :, 2) = medfilt2(img, [4, 4]);
stack(:, :, 3) = medfilt2(img, [5, 5]);

% show image
viewer = ImageViewer(stack);
viewer.view

end