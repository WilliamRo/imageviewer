function demo
%DEMO ...
%

% read sample image from disk
img = imread('+imv/sample.tif');

% initialize an instance for ImageViewer
viewer = imv.ImageViewer();

% process image and add results to viewer
viewer.addImage(medfilt2(img, [3, 3]), 'medfilt[3, 3]')
viewer.addImage(medfilt2(img, [4, 4]), 'medfilt[4, 4]')
viewer.addImage(medfilt2(img, [5, 5]), 'medfilt[5, 5]')

% show images
viewer.view

end