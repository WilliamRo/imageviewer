function view(this)
%VIEW ...
%   ...

%% Set parameters
% set default parameters
pct = [0.4, 0.8];

%% Open a new customised figure
% get screen size
screenSize = get(0, 'ScreenSize');
[screenWidth, screenHeight] = deal(screenSize(3), screenSize(4));
% get image size
imgSize = size(this.Data);
[imgHeight, imgWidth] = deal(imgSize(1), imgSize(2));
% open a new figure
f = figure('Name', this.FigureName, 'NumberTitle', 'off', ...
    'ToolBar', 'none', 'MenuBar', 'none', 'Units', 'pixels');
% adjust figure position and size
ratio = max([imgWidth / screenWidth, imgHeight / screenHeight]);
scale = 1;
if ratio < pct(1), scale = pct(1) / ratio; end
if ratio > pct(2), scale = pct(2) / ratio; end
f.Position = [...
    screenWidth / 2 - imgWidth * scale / 2, ...
    screenHeight / 2 - imgHeight * scale / 2, ...
    imgWidth * scale, imgHeight * scale];
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
            fprintf('>> Figure closed.\n')
        otherwise
            fprintf('>> Unknown key pressed: [%s]\n', ...
                callbackdata.Key)
    end
end