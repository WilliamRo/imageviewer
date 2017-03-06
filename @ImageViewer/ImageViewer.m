classdef ImageViewer < handle
    %IMAGEVIEWER ...
    %   ...
    %% Constants
    properties (Access = private, Constant)
        FigureName = 'Date Viewer';
    end
    %% Private Properties
    properties (Access = private, SetObservable) 
        Data
        Labels = []
        Interpreter = []
        Cursor
    end
    %% Public Methods
    methods (Access = public)
        % Constructor
        function this = ImageViewer(data, labels, interpreter)
            % check input
            narginchk(1, 3)
            assert(~isempty(data), '!! Input data is illegal.')
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
        view(this)
    end
    %% Private Methods
    methods (Access = private)
        cursorChanged(this, ~, ~)
    end
    %% Public Static Methods
    methods (Access = public, Static)
        viewImage(varargin)
    end
    
end

