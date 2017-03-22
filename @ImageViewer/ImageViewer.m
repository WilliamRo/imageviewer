classdef ImageViewer < handle
    %IMAGEVIEWER ...
    %   ...
    %% Constants
    properties (Access = private, Constant)
        FigureName = 'Image Viewer';
    end % constants
    %% Private Properties
    properties (Access = private, SetObservable) 
        Images = []     % image cells
        Maps = []       % color maps
        Labels = []     % string cells
        Cursor
    end % private properties
    %% Public Methods
    methods (Access = public)
        % Constructor
        function this = ImageViewer()
            this.Cursor = 1;
            addlistener(this, 'Cursor', 'PostSet', ...
                @this.cursorChanged);
        end % constructor
        %
        addImage(this, image, label, map)
        addLabel(this, label)
        view(this)
    end % public methods
    %% Static Methods
    methods (Static, Access = public)
        quickView(varargin)
    end
    %% Private Methods
    methods (Access = private)
        cursorChanged(this, ~, ~)
    end % private methods
    
end

