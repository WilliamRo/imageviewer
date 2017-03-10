classdef ImageViewer < handle
    %IMAGEVIEWER ...
    %   ...
    %% Constants
    properties (Access = private, Constant)
        FigureName = 'Date Viewer';
    end % constants
    %% Private Properties
    properties (Access = private, SetObservable) 
        Data
        Labels = []
        Interpreter = []
        Cursor
    end % private properties
    %% Public Methods
    methods (Access = public)
        % Constructor
        function this = ImageViewer(data, labels, interpreter)
            % check input
            if nargin < 1, data = []; end
            % set parameters
            this.Cursor = 1;
            this.Data = data;
            if nargin > 2, 
                assert(length(labels) == size(data, 3), ...
                    '!! Input data and labels are not matched.')
                this.Labels = labels; 
                this.Interpreter = interpreter; 
            end % if 
            addlistener(this, 'Cursor', 'PostSet', ...
                @this.cursorChanged);
        end % constructor
        %
        addImage(this, image, label)
        view(this)
    end % public methods
    %% Private Methods
    methods (Access = private)
        cursorChanged(this, ~, ~)
    end % private methods
    %% Public Static Methods
    methods (Access = public, Static)
        viewImage(varargin)
    end % public static methods
    
end

