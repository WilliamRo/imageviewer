function addLabel(this, label)
%IMAGEVIEWER::ADDLABEL ...
%   ...

index = length(this.Labels);
if index > 0, this.Labels{index} = label; end

end

