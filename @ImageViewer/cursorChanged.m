function cursorChanged(this, ~, ~)
%CURSORCHANGED ...
%   ...

%% Check cursor bounds
if this.Cursor == 0, this.Cursor = size(this.Data, 3);
elseif this.Cursor > size(this.Data, 3)
    this.Cursor = 1;
end

%% Show image
imshow(this.Data(:, :, this.Cursor), []); 
f = gcf;
fname = [];
if ~isempty(this.Interpreter) && ~isempty(this.Labels)
    fname = this.Interpreter(this.Labels(this.Cursor));
elseif iscell(this.Labels)
    fname = this.Labels{this.Cursor};
end
% change title
if ~isempty(fname), fname = [' ', fname]; end
f.Name = sprintf('[%d/%d]%s - %s', ...
        this.Cursor, size(this.Data, 3), ...
        fname, this.FigureName);

end

