function output = validlb()
    %This function serves to validate the input weight values that the user
    %enters in pounds. Weight values will be flagged if they are zero,
    %negative, or unrealistically high (over 1400 pounds). The user will
    %also be flagged if no values are entered for weights.

    %Prompt the user for weights in pounds.
    %Let them know that they may enter a single value for a single person
    %or a vector for multiple people. 
    fprintf('\n')
    fprintf('Please enter your weight values in pounds.\n')
    weight = input(['You may enter a single value if working with a ' ...
        'single person or a vector of values if working with multiple ' ...
        'people: ']);
    %While loop with isempty function to determine if any weight values 
    %were entered. The function will keep prompting the user to enter 
    %values if no weight values were entered.
    while isempty(weight) == 1
        fprintf('\n')
        weight = input('Please enter at least one value: ');
    end
    %While loop with any function to determine if any weight values are
    %zero, negative, or unrealistically high. The function will keep
    %prompting the user to enter realistic values if the values remain
    %unrealistic.
    while any(weight <= 0) || any(weight > 1400)
        fprintf('\n')
        weight = input(['Your weight values must not be zero, ' ...
            'negative, or unrealistic: ']);
    end
    %Convert weights from pounds to kilograms. 
    weight = weight.*0.453592;
    output = weight;
end