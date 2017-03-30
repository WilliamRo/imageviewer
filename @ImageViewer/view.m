function view(this)
%VIEW ...
%   ...

%% Check this
if isempty(this.Images)
    fprintf('>> Nothing to be viewed.\n')
    return
end

%% Set parameters
% set default parameters
pct = [0.4, 0.8];

%% Open a new customised figure
% get screen size
screenSize = get(0, 'ScreenSize');
screenSize = screenSize(3:4);
% get image size
imgSize = size(this.Images{1});
imgSize = imgSize(2:-1:1);
% open a new figure
f = figure('Name', this.FigureName, 'NumberTitle', 'off', ...
    'ToolBar', 'none', 'MenuBar', 'none', 'Units', 'pixels');
% adjust figure position and size
ratio = max(imgSize ./ screenSize);
scale = 1;
if ratio < pct(1), scale = pct(1) / ratio; end
if ratio > pct(2), scale = pct(2) / ratio; end
f.Position = [(screenSize - imgSize * scale) / 2, imgSize * scale];
f.KeyPressFcn = @btnPressed;
f.UserData = this;
% set new axes
ax = axes('Units', 'normalized', 'Position', [0 0 1 1], ...
    'NextPlot', 'replace');

%% Show data
this.Cursor = 1;

end

%% Callback functions
function btnPressed(f, callbackdata)
    % set parameters
    sizeStep = 20;  % pixels
    delta = [-sizeStep/2, -sizeStep/2, sizeStep, sizeStep];
    % ...
    switch lower(callbackdata.Key)
        case {'leftarrow', 'h'}
            f.UserData.Cursor = f.UserData.Cursor - 1;
        case {'rightarrow', 'l'}
            f.UserData.Cursor = f.UserData.Cursor + 1;
        case {'uparrow', 'k', 'add'}
            f.Position = f.Position + delta;
        case {'downarrow', 'j', 'subtract'}
            f.Position = f.Position - delta;
        case {'escape', 'return'}
            close(f)
            fprintf('!> Figure closed.\n')
        otherwise
            fprintf('?> Unknown key pressed: [%s]\n', ...
                callbackdata.Key)
    end
end