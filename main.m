clc;
clear;
delete(instrfind);

% Load configuration
config = loadConfig();

% Initialize state variables
state = initializeState();

% Setup video input
vid = setupVideoCapture(config.videoFile);

% Main processing loop
while hasFrame(vid)
	frame = captureAndPreprocessImage(vid, config);
	[left_eye, right_eye, left_flag, right_flag] = detectEyes(frame, config);

	if left_flag || right_flag
		[flag, state] = processEyeMovement(left_eye, right_eye, left_flag, right_flag, state, config);
		state.prev_flag = sendMotorControlSignal(flag, state);
	end
end

% Cleanup
cleanup();
