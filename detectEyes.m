function [left_eye, right_eye, left_flag, right_flag] = detectEyes(I)
	faceDetector = vision.CascadeObjectDetector('LeftEyeCART');
	bboxes = step(faceDetector, I);

	left_eye = [];
	right_eye = [];
	left_flag = 0;
	right_flag = 0;

	% Filter bounding boxes for valid eye sizes
	eye = [];
	j = 0;
	[m, ~] = size(bboxes);
	for i = 1:m
		if bboxes(i, 3) >= 150 && bboxes(i, 3) <= 300
			j = j + 1;
			eye(j, :) = bboxes(i, :);
		end
	end

	% Detect left and right eyes
	for i = 1:j
		if eye(i, 1) > 200 && eye(i, 1) < 400
			left_eye = eye(i, :);
			disp('Left:');
			disp(left_eye);
			left_flag = 1;
		elseif eye(i, 1) > 400 && eye(i, 1) < 600
			right_eye = eye(i, :);
			disp('Right:');
			disp(right_eye);
			right_flag = 1;
		end
	end
end
