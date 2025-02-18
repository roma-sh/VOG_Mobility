function prev_flag = sendMotorControlSignal(flag, prev_flag, check_left, check_right, check_straight_right, check_straight_left, check_left_right, check_right_left)
	if prev_flag == 0 && flag == 1
		disp('motor moved straight');
		check_straight_right = 1;
		check_left_right = 1;
		fprintf('Sending data for motor moving straight to the right\n');
	elseif prev_flag == 1 && flag == 0
		disp('motor moved straight');
		check_straight_left = 1;
		check_right_left = 1;
		fprintf('Sending data for motor moving straight to the left\n');
	elseif prev_flag == 0 && flag == 2
		if check_right || check_straight_right || check_right_left
			disp('motor stays');
			check_right = 0;
			check_straight_right = 0;
			check_right_left = 0;
		else
			disp('motor moved left');
			check_left = 1;
			fprintf('Sending data for motor moving left\n');
		end
	elseif prev_flag == 1 && flag == 2
		if check_left || check_straight_left || check_left_right
			disp('motor stays');
			check_left = 0;
			check_straight_left = 0;
			check_left_right = 0;
		else
			disp('motor moved right');
			check_right = 1;
			fprintf('Sending data for motor moving right\n');
		end
	else
		disp('motor stays');
		fprintf('Sending data for motor staying\n');
	end

	prev_flag = flag;
end
