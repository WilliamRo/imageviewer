function cursorChanged(this, ~, ~)
%CURSORCHANGED ...
%   ...

%% Check cursor bounds
if this.Cursor == 0, this.Cursor = length(this.Images);
elseif this.Cursor > length(this.Images)
    this.Cursor = 1;
end

%% Show image
imshow(this.Images{this.Cursor}, this.Maps{this.Cursor}); 
f = gcf;
fname = this.Labels{this.Cursor};
% change title
if ~isempty(fname), fname = [' ', fname]; end
f.Name = sprintf('[%d/%d]%s - %s', ...
        this.Cursor, length(this.Images), ...
        fname, this.FigureName);

end

