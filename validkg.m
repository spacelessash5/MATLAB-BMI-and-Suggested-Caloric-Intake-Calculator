function output = validkg()
    %This function serves to validate the input weight values that the user
    %enters in kilograms. Weight values will be flagged if they are zero,
    %negative, or unrealistic (over 635 kilograms). The user will also be
    %flagged if no values are entered for weights.

    %Prompt the user to enter weights in kilograms.
    %Let them know that they may enter weights for a single person and for
    %multiple people.
    fprintf('\n')
    fprintf('Please enter your weight values in kilograms.\n')
    weight = input(['You may enter a single value if working with ' ...
        'one person or a vector of values if working with multiple ' ...
        'people: ']);
    %While loop with isempty function determines if weight value vector is
    %empty, and keeps prompting user to enter weight values if vector
    %remains empty. 
    while isempty(weight) == 1
        fprintf('\n')
        weight = input('Please enter at least one value: ');
    end
    %While loop with any function determines if any weight values are zero,
    %negative, or unrealistically high, and keeps prompting user to enter
    %realistic weight values if they remain unrealistic.
    while any(weight <= 0) || any(weight > 635)
        fprintf('\n')
        weight = input(['Your weight values must not be zero, ' ...
            'negative, or unrealistic: ']);
    end
    output = weight;
end