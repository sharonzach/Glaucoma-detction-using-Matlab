function simpleGUI()
    % Create a figure for the GUI
    fig = figure('Position', [100, 100, 600, 400], 'MenuBar', 'none', 'Name', 'Image Processing Steps', 'Resize', 'off');

    % Create text area to display status messages
    statusText = uicontrol('Style', 'text', 'Position', [20, 330, 560, 40], ...
                           'String', 'Welcome to the Image Processing GUI', ...
                           'HorizontalAlignment', 'center', ...
                           'FontSize', 12);

    % Create buttons for each step
    uicontrol('Style', 'pushbutton', 'String', 'Load Image', 'Position', [20, 290, 100, 30], ...
              'Callback', @(src, event) loadImage(statusText));
    uicontrol('Style', 'pushbutton', 'String', 'Preprocess', 'Position', [130, 290, 100, 30], ...
              'Callback', @(src, event) preprocess(statusText));
    uicontrol('Style', 'pushbutton', 'String', 'Convert to Gray', 'Position', [240, 290, 100, 30], ...
              'Callback', @(src, event) convertToGray(statusText));
    uicontrol('Style', 'pushbutton', 'String', 'Extract Texture Features', 'Position', [350, 290, 140, 30], ...
              'Callback', @(src, event) extractFeatures(statusText));
    uicontrol('Style', 'pushbutton', 'String', 'Show Final Result', 'Position', [500, 290, 100, 30], ...
              'Callback', @(src, event) showResult(statusText));

    % Create axes for displaying images
    imgAxes = axes('Position', [0.1, 0.1, 0.8, 0.6]);

    % Variables to hold images
    img = []; % Original image
    preprocessedImg = []; % Preprocessed image
    grayImg = []; % Grayscale image
    highlightedImg = []; % Image with simulated results

    % Callback functions
    function loadImage(statusText)
        [file, path] = uigetfile({'*.jpg;*.jpeg;*.png', 'Image Files (*.jpg, *.jpeg, *.png)'});
        if isequal(file, 0)
            statusText.String = 'Image loading canceled.';
        else
            img = imread(fullfile(path, file));
            imshow(img, 'Parent', imgAxes); % Display the loaded image
            statusText.String = 'Image Loaded.';
        end
    end

    function preprocess(statusText)
        if isempty(img)
            statusText.String = 'Please load an image first.';
            return;
        end
        % Example preprocessing: resizing
        preprocessedImg = imresize(img, 0.5); % Resize for demonstration
        imshow(preprocessedImg, 'Parent', imgAxes); % Display the preprocessed image
        statusText.String = 'Image Preprocessed.';
    end

    function convertToGray(statusText)
        if isempty(preprocessedImg)
            statusText.String = 'Please preprocess the image first.';
            return;
        end
        % Convert to grayscale
        grayImg = rgb2gray(preprocessedImg);
        imshow(grayImg, 'Parent', imgAxes); % Display the grayscale image
        statusText.String = 'Image Converted to Gray.';
    end

    function extractFeatures(statusText)
        if isempty(grayImg)
            statusText.String = 'Please convert the image to gray first.';
            return;
        end
        % Extract texture features
        featureVector = extractTextureFeatures(grayImg);
        % Simulate glaucoma detection
        highlightedImg = simulateDetection(grayImg, featureVector);
        statusText.String = 'Texture Features Extracted and Simulated Detection Done.';
    end

    function showResult(statusText)
        if isempty(highlightedImg)
            statusText.String = 'Please extract features first.';
            return;
        end
        imshow(highlightedImg, 'Parent', imgAxes); % Show the highlighted image
        title(imgAxes, 'Final Result with Highlighted Regions');
        statusText.String = 'Final Result Displayed.';
    end
end

% Function to extract texture features
function featureVector = extractTextureFeatures(img)
    % Convert image to grayscale if it's not already
    if size(img, 3) == 3 % Check if the image has 3 color channels (RGB)
        img = rgb2gray(img); % Convert RGB to grayscale
    end
    % Extract Local Binary Pattern features
    featureVector = extractLBPFeatures(img); % Requires Image Processing Toolbox
end

% Function to simulate glaucoma detection
function highlightedImg = simulateDetection(img, featureVector)
    % Create a dummy result by highlighting random regions
    highlightedImg = img;
    % Simulate highlighting a region (for example, adding a red rectangle)
    highlightedImg = insertShape(highlightedImg, 'Rectangle', [30, 30, 50, 50], 'Color', 'red', 'LineWidth', 3);
end
