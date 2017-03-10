function addImage(this, image, label)
%IMAGEVIEWER::ADDIMAGE ...
%   ...

%% Check this and inputs
narginchk(2, 3)
if nargin < 3, label = []; end
if ~isempty(this.Interpreter)
    error('!! This instance of Image Viewer is read only')
end

%% Add image
if isempty(this.Data), 
    this.Data = image;
    this.Labels = {label};
else
    % check input shape
    if ~all(size(image) == size(this.Data(:, :, 1)))
        error('!! The shape of input image is illegal')
    end
    % add image to data
    index = size(this.Data, 3) + 1;
    this.Data(:, :, index) = image;
    this.Labels{index} = label;
end

end

