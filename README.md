# Eye Movement-Controlled Wheelchair using VOG Technology

This project uses Video-oculography (VOG) technology to detect eye movements from a live video feed. The system processes the video to detect eye coordinates, compares them between frames, and determines the direction of eye movement. Based on the detected movement, a signal is sent to a microcontroller that controls an electric wheelchair. For example, if the user moves their eyes to the left, the wheelchair moves to the left, and so on.

## Table of Contents
- [Overview](#overview)
- [How It Works](#how-it-works)
- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)
- [Code Structure](#code-structure)
- [Contributing](#contributing)

## Overview
The project is designed to assist individuals with limited mobility by enabling them to control an electric wheelchair using eye movements. The system captures video frames, processes them to detect eye positions, and determines the direction of eye movement. Based on the detected movement, the system sends appropriate control signals to the wheelchair's microcontroller.

## How It Works
1. **Video Capture**: The system captures live video frames using a video file or camera feed.
2. **Eye Detection**: The system detects the user's eyes using a cascade object detector.
3. **Movement Tracking**: The system compares the eye positions between consecutive frames to determine the direction of movement (left, right, or no movement).
4. **Motor Control**: Based on the detected eye movement, the system sends control signals to the wheelchair's microcontroller to move the wheelchair in the corresponding direction.

## Requirements
- MATLAB (tested on R2021a or later)
- MATLAB Image Processing Toolbox
- MATLAB Computer Vision Toolbox
- A video file or live camera feed for testing
- Microcontroller (e.g., Arduino) for motor control (optional for simulation)

## Installation
1. Clone the repository to your local machine.
	```bash
		git clone https://github.com/roma-sh/VOG_Mobility
	```
2. Open MATLAB and navigate to the project directory.
3. Ensure all required MATLAB toolboxes are installed.

## Usage
1. Update the `config` file with the path to your video file or camera feed.
2. Run the main script `main.m` in MATLAB.
3. The system will process the video, detect eye movements, and simulate motor control signals.

## Code Structure
- `main.m`: The main script that initializes the system and runs the processing loop.
- `detectEyes.m`: Detects the user's eyes in a given frame.
- `captureAndPreprocessImage.m`: Captures and preprocesses video frames.
- `processEyeMovement.m`: Processes eye movement and determines the direction.
- `sendMotorControlSignal.m`: Simulates sending control signals to the microcontroller.
- `setupVideoCapture.m`: Initializes the video capture object.
- `cleanup.m`: Cleans up resources after processing.

## Contributing
Contributions are welcome! If you'd like to contribute, please follow these steps:
1. Fork the repository.
2. Create a new branch for your feature or bug fix.
3. Commit your changes.
4. Submit a pull request.


---

**Note**: This project is a simulation and may require additional hardware integration for real-world applications. Ensure proper safety measures are taken when testing with actual wheelchairs.
