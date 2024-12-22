# Glaucoma-detction-using-Matlab
This project provides a Graphical User Interface (GUI) for performing basic image preprocessing and simulating glaucoma detection using MATLAB. It enables users to:

Load images.
Preprocess images (resize, enhance, etc.).
Extract texture features.
Simulate glaucoma detection.
Visualize results.
The application can be extended with a pre-trained model for actual glaucoma detection.

Features
1. Load Images: Upload images from your local system.
2. Preprocess Images: Perform basic preprocessing steps like resizing.
3. Convert to Grayscale: Transform loaded or preprocessed images to grayscale.
4. Extract Texture Features: Utilize Local Binary Patterns (LBP) for feature extraction.
5. Simulate Glaucoma Detection: Highlight potential regions (currently simulated with dummy results).
6. Display Final Results: Visualize the processed image with simulated detection results.
Dataset
You can use a dataset of retinal fundus images to train a glaucoma detection model. For this demo:

Place your dataset images in the folder: dataset/images/.
Ensure the dataset includes properly labeled glaucoma and non-glaucoma images for training a future model.

Prerequisites
MATLAB: R2021a or newer is recommended.

Toolboxes:
Image Processing Toolbox (required for extractLBPFeatures function).
Dataset: A collection of retinal fundus images (optional for training/testing).

How to Run
Clone this repository:
git clone https://github.com/your-username/glaucoma-detection-gui.git
cd glaucoma-detection-gui
Open MATLAB and navigate to the project directory.

Run the GUI

1. Load Image: Select and load an image from your local system.
2. Preprocess: Resize the image for further processing.
3. Convert to Gray: Transform the image to grayscale.
4. Extract Texture Features: Extract features using Local Binary Patterns (LBP).
5. Show Final Result: Display the final result with highlighted regions.

Future Work
Integrate a pre-trained model for actual glaucoma detection.
Add advanced feature extraction techniques (e.g., GLCM, wavelets).
Save processed images with detected regions.
Extend the GUI for batch processing of images.
