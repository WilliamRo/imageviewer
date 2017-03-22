function quickView(varargin)
%IMAGEVIEW::QUICKVIEW ...
%   ...

vr = imv.ImageViewer;
for cel = varargin
    val = cel{1};
    if ischar(val), vr.addLabel(val);
    else vr.addImage(val); end
end
vr.view

end

