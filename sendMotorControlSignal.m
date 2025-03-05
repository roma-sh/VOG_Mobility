function prev_flag = sendMotorControlSignal(flag, prev_flag, check_left, check_right, check_straight_right, check_straight_left, check_left_right, check_right_left)
    if prev_flag == 0 && flag == 1
        disp('moved straight');
        check_straight_right = 1;
        check_left_right = 1;
        % Send command for motor to move straight to the right
        fprintf(serialObj, 'right');
    elseif prev_flag == 1 && flag == 0
        disp('moved straight');
        check_straight_left = 1;
        check_right_left = 1;
        % Send command for motor to move straight to the left
        fprintf(serialObj, 'left');
    elseif prev_flag == 0 && flag == 2
        if check_right || check_straight_right || check_right_left
            disp('stay center');
            check_right = 0;
            check_straight_right = 0;
            check_right_left = 0;
        else
            disp('moved left');
            check_left = 1;
            % Send command for motor to move left
            fprintf(serialObj, 'left');
        end
    elseif prev_flag == 1 && flag == 2
        if check_left || check_straight_left || check_left_right
            disp('stay center');
            check_left = 0;
            check_straight_left = 0;
            check_left_right = 0;
        else
            disp('moved right');
            check_right = 1;
            % Send command for motor to move right
            fprintf(serialObj, 'right');
        end
    else
        disp('stay center');
        % Send command for motor to stay
        fprintf(serialObj, 'stay');
    end

    prev_flag = flag;
end
