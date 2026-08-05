function output = validweightgoal()
    %This function will prompt the user to enter values based on their
    %subjects' weight-related goals. They may enter 1 for intention to gain
    %weight, 2 for intention to lose weight, or 3 for intention to maintain
    %weight. The function will then validate the user's inputs by checking
    %if they are within the acceptable scope of the function, or if
    %anything was entered at all.

    %Prompt the user for weight goal values. 
    %Let them know what their options are.
    fprintf('\n')
    fprintf(['Please enter a value for the weight-related goals on ' ...
        'each of your subjects. Refer to the key below.\n'])
    fprintf('\n')
    fprintf('1 - Gain weight\n')
    fprintf('2 - Lose weight\n')
    fprintf('3 - Maintain weight\n')
    fprintf('\n')
    weightgoals = input('Enter your values here: ');

    %Check if the user entered anything at all.
    %Use a while loop to keep prompting user if no values continue to be
    %entered.
    while isempty(weightgoals) == 1
        fprintf('\n')
        weightgoals = input('Please enter at least one value: ');
    end

    %Check if the values are within the accepted range for this function.
    while any(weightgoals <= 0) || any(weightgoals > 3)
        fprintf('\n')
        weightgoals = input(['At least one of your values is invalid. ' ...
            'Please try again: ']);
    end
    output = weightgoals;
end