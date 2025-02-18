function [flag, prev_left, prev_right] = processEyeMovement(left_eye, right_eye, left_flag, right_flag, prev_left, prev_right)
	if left_flag
		if ~isempty(prev_left)
			if (left_eye(1, 1) - prev_left(1, 1)) > 14
				flag = 0;
				disp('moved left');
			elseif (left_eye(1, 1) - prev_left(1, 1)) < -14
				flag = 1;
				disp('moved right');
			else
				flag = 2;
				disp('stayed');
			end
		end
		prev_left = left_eye;
	elseif right_flag
		if ~isempty(prev_right)
			if (right_eye(1, 1) - prev_right(1, 1)) > 14
				flag = 0;
				disp('moved left');
			elseif (right_eye(1, 1) - prev_right(1, 1)) < -14
				flag = 1;
				disp('moved right');
			else
				flag = 2;
				disp('stayed');
			end
		end
		prev_right = right_eye;
	else
		flag = 2; % No movement detected
	end
end
