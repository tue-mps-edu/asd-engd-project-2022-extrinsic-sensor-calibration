# asd-engd-project-2022-extrinsic-sensor-calibration

This repository shares the software tool and documentation for the extrinsic calibration of an Imaging RADAR and mono camera.         (TUE LOGO RIGHT CORNER)

Intro IMAGE

## Overview

## Info

The extrinsic calibration tool is capable of calculating the extrinsic parameters of a 3+1D RADAR and camera by processing the point cloud and image datasets of a calibration target.

Photo of PCD and camera data

# Sensors and data

## Sensors

- a MMWCAS-RF-EVM + MMWCAS-DSP-EVM 3+1D RADAR (Add links)
- a Basler dart daA1600-60uc camera (1600 x 1200)

## Data

- Radar data was captured using the mmWavestudio package from TI, processed using the provided MATLAB scripts and saved as FIG files.
- Camera data was captured using the Pylon package from Basler and stored as JPG files.

For details on setup and data capture, please refer to the Wiki(link)

# Getting started

- Capture datasets with both sensors placing the calibration target ideally in 6 different positions
- Store RADAR and camera data in individual folders on the host PC
- Install MATLAB (r2015b or later)
- Download the matlab scripts provided
- Open and run ext_cal_v2.m in MATLAB
- Select the respective data folders when prompted
- Output including the calibrated data and extrinsic parameters will be provided

## Example data

Please refer to folders Image Raw Data and Radar PCD containing exaample datasets for calibration.

# Important Information

- Calibration software is in the Alpha stage where the performance is inconsistent
- Image detection of calibration target is not robust, possibly due to exposure and resolution 
- The RADAR used was a evaluation prototype board leading to inaccuratre and inconsistent data capture






