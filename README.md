<img src="https://user-images.githubusercontent.com/120169307/227249076-fa0c9a73-4318-47cb-8e02-878f06ff1f65.png" align="right" width="35%" height="35%">

# Extrinsic Sensor Calibration <br> ASD EngD 2022

<p align="justify">

This repository contains the software tool and documentation for the extrinsic calibration of a TI Imaging RADAR and mono camera.

## Overview
- [Info](#info)
- [Sensors and data](#sensors-and-data)
- [User instructions](#user-instructions)
- [Example data](#example-data)
- [Important information](#important-information)

## Info

The extrinsic calibration tool is capable of calculating the extrinsic parameters of a 3+1D RADAR and camera by processing the point cloud and image datasets of a calibration target.

| PCD | Overlay |
| :---: | :---: |
| <img src="https://user-images.githubusercontent.com/120169307/227243078-74372771-6868-48c0-9461-ff7d4e260391.png" width="95%" height="95%"> | <img src="https://user-images.githubusercontent.com/120169307/227238761-bfcce5bd-f5f0-4d92-973a-65dea2c17033.png" width="70%" height="70%"> |

## Sensors and data

### Sensors

- a [MMWCAS-RF-EVM](https://www.ti.com/tool/MMWCAS-RF-EVM) + [MMWCAS-DSP-EVM](https://www.ti.com/tool/MMWCAS-DSP-EVM) 3+1D RADAR
- a [Basler dart daA1600-60uc](https://www.baslerweb.com/en/products/cameras/area-scan-cameras/dart/daa1600-60uc-s-mount/) camera (1600 x 1200)

### Data

- Radar data was captured using the mmWavestudio package from TI, processed using the provided MATLAB scripts and saved as _.fig_ files.
- Camera data was captured using the Pylon package from Basler and stored as _.jpg_ files.

For details on setup and data capture, please refer to the [Wiki](https://github.com/tue-mps-edu/asd-engd-project-2022-extrinsic-sensor-calibration/wiki/2.-Sensor-setup-and-data-capture)

## User instructions

- Capture datasets with both sensors placing the calibration target ideally in 6 different positions
- Store RADAR and camera data in individual folders on the host PC
- Install MATLAB (r2015b or later)
- Download the matlab scripts provided
- Open and run [ext_cal_v2.m](https://github.com/tue-mps-edu/asd-engd-project-2022-extrinsic-sensor-calibration/blob/main/Extrinsic_Calibration_Tool_MATLAB/ext_cal_v2.m) in MATLAB
- Select the respective data folders when prompted
- Calibration tool outputs the calibrated data and saves extrinsic parameters in the code directory.

## Example data

Please refer to folders [Image_Example_Data](https://github.com/tue-mps-edu/asd-engd-project-2022-extrinsic-sensor-calibration/tree/main/Image_Example_Data) and [Radar_PCD_Example_Data](https://github.com/tue-mps-edu/asd-engd-project-2022-extrinsic-sensor-calibration/tree/main/Radar_PCD_example_data) containing example datasets for calibration.

## Important Information

- The tool was developed and tested on Windows 10, compatibility with other OS's has not been explored
- Calibration software is in the Alpha stage where the performance is inconsistent. It is recommended to run the tool a few times until a good mapping between radar and image data is obtained.
- Image detection of calibration target is not robust, possibly due to exposure and resolution 
- The RADAR used was a evaluation prototype board leading to inaccuratre and inconsistent data capture

</p>
