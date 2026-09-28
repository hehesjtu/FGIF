# FGIF: Fractal-Guided Image Filtering with Adaptive Tuning for Single Image Detail Enhancement

This repository provides the MATLAB implementation of **FGIF** (Fractal-Guided Image Filtering with Adaptive Tuning) for single image detail enhancement.

## Introduction

FGIF is a fractal-guided filtering method for single image detail enhancement. In the supplied demo, `FGIF` returns a filtered image `q` and a weight map `beta` for each color channel. The enhanced image is reconstructed by adding a weighted detail residual to the filtered image:

```matlab
I_enhanced = (I - q) .* beta + q;
```

The core functions are distributed as MATLAB P-code (`.p` files); the repository provides the readable demo script but not the internal function source.

## Features

* Fractal-Guided Processing: Uses fractal analysis to guide image filtering and adaptive tuning.
* Adaptive Detail Enhancement: Weights the difference between the input and filtered images with the output `beta`.
* Color Image Support: The demo processes the three color channels independently.
* Ready-to-Run Demo: Includes sample images in `data/` and displays the input and enhanced images side by side.

## System Requirements

The code is intended for the following environment:

[![MATLAB](https://img.shields.io/badge/MATLAB-R2018a%2B-blue.svg)](https://www.mathworks.com/products/matlab.html)

* Image Processing Toolbox is required.
* Signal Processing Toolbox is optional, according to `requirements.txt`.
* No third-party libraries or external datasets are required.

## Usage

### 1. Setup

Clone the repository, then set MATLAB's **Current Folder** to the cloned `FGIF` directory so the demo can access `data/` and the FGIF functions.

```bash
git clone https://github.com/hehesjtu/FGIF.git
```

### 2. Running the Demo

In MATLAB, run:

```matlab
demoforfgif
```

The supplied script reads `data/35010.png`, displays the input and enhanced images, and uses the following settings. To try another image, change the `imread` path in `demoforfgif.m`. The `result/` folder contains pre-generated results for reference; the demo does not save its output there.

```matlab
% Equivalent example using the settings in demoforfgif.m
I = im2double(imread('data/35010.png'));
p = I;
r = 32;
eps = 0.01;

q = zeros(size(I));
beta = zeros(size(I));
for c = 1:size(I, 3)
    [q(:, :, c), beta(:, :, c)] = FGIF(I(:, :, c), p(:, :, c), r, eps);
end

I_enhanced = (I - q) .* beta + q;
figure;
subplot(1, 2, 1); imshow(I); title('input');
subplot(1, 2, 2); imshow(I_enhanced); title('enhanced');
```

## Contact

For questions about this implementation, please open an issue in the [FGIF repository](https://github.com/hehesjtu/FGIF/issues).
