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

- Install MATLAB (r2015b or later)
- Download the matlab scripts provided
- Store RADAR and camera data in indiviual folders
- Open and run ext_cal_v2.m in MATLAB
- Select the respective data folders when prompted
- Output including the calibrated data and extrinsic parameters will be provided



asd-engd-project-2022-extrinsic-sensor-calibration created by GitHub Classroom
