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
if ~isempty(this.Interpreter) && ~isempty(this.Labels)
    f.Name = sprintf('[%d/%d] %s - %s', ...
        this.Cursor, size(this.Data, 3), ...
        this.Interpreter(this.Labels(this.Cursor)), ...
        this.FigureName);
else
    f.Name = sprintf('[%d/%d] - %s', ...
        this.Cursor, size(this.Data, 3), ...
        this.FigureName);
end

end

