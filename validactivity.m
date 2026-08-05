function output = validactivity()
    %This function will prompt the user for values that represent the
    %activity levels of all subjects whose data was entered into the
    %program. They may enter any values from 1 to 5, with 1 representing
    %sedentary while 5 represents very hard physical exertion. 

    %Prompt the user for the activity levels of the subjects. 
    %Let them know what values they are allowed to input.
    fprintf('\n')
    fprintf(['While referring to the key below, enter values for ' ...
        'the activity levels of your subject(s).\n'])
    fprintf('\n')
    fprintf('1 - Sedentary\n')
    fprintf('2 - Lightly active (Light exercise 1-3 times a week)\n')
    fprintf('3 - Moderately active (Moderate exercise 3-5 times a week)\n')
    fprintf('4 - Active (Heavy exercise 6-7 times a week)\n')
    fprintf(['5 - Highly active (Very heavy daily exercise, ' ...
        'physically demanding job)\n'])
    fprintf('\n')
    activity = input('Enter your values here: ');
    
    %Use isempty function to determine if anything was entered at all.
    %While loop to repeatedly prompt user if nothing continues to be
    %entered.
    while isempty(activity) == 1
        fprintf('\n')
        activity = input('Please enter at least one value: ');
    end

    %While loop to determine if user inputs are valid. Repeatedly prompt
    %the user for new values if they continue to be invalid.
    while any(activity <= 0) || any(activity > 5)
        fprintf('\n')
        activity = input(['At least one of your values is invalid. ' ...
            'Please try again: ']);
    end
    output = activity;
end

