function output = validm()
    %This function will validate the input weight values that the user 
    %enters. They will be flagged if they are zero, negative, or
    %unrealistically high (over 2.72 meters). The user will also be flagged
    %if no inputs are entered.

    %Prompt the user to enter their height values in meters. 
    %Let them know that they can enter either a single value or a vector.
    fprintf('\n')
    fprintf('Please enter your height values in meters.\n')
    height = input(['You may enter a single value if working with a ' ...
        'single person or a vector of values if working with multiple ' ...
        'people: ']);
    %While loop with isempty function determines if user has entered any
    %values at all. The user will be repeatedly prompted to enter values if
    %no inputs are entered.
    while isempty(height) == 1
        fprintf('\n')
        height = input('Please enter at least one value: ');
    end
    %While loop with any function determines if user's height values are
    %zero, negative, or unrealistically high. The user will be repeatedly
    %prompted to enter values if they are unrealistic.
    while any(height <= 0) || any(height > 2.72)
        fprintf('\n')
        height = input(['Your height values must not be zero, ' ...
            'negative, or unrealistic: ']);
    end
    output = height;
end
