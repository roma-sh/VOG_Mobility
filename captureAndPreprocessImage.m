function I = captureAndPreprocessImage(vid)
	% Read the current frame
	frame = readFrame(vid);

	% Preprocess the frame
	I = rgb2gray(frame);
	I = imadjust(I);
	I = adapthisteq(I);
	I = imrotate(I, 180);
end
