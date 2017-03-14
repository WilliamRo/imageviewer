function addImage(this, image, label, map)
%IMAGEVIEWER::ADDIMAGE ...
%   ...

%% Check this and inputs
narginchk(2, 4)
if nargin < 4, map = []; end
if nargin < 3, label = []; end

%% Add image
index = length(this.Images) + 1;
this.Images{index} = image;
this.Labels{index} = label;
this.Maps{index} = map;

end

