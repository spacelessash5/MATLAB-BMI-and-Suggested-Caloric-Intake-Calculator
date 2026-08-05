function output = validgenders()
    %This function prompts the user to enter values for gender for the
    %people they are working with. They may enter 1 for male, or 2 for
    %female. The function will validate if their values are within the
    %accepted range, or if anything was entered at all.

    %Prompt the user for the gender values of their subject(s).
    %Let them know what their options are.
    fprintf('\n')
    fprintf(['Enter a single value or vector for the genders of your ' ...
        'subject(s).\n'])
    gender = input('You may enter 1 for male and 2 for female: ');
    %Determine if any values were entered for gender at all. Keep prompting
    %the user until something is entered.
    while isempty(gender) == 1
        fprintf('\n')
        gender = input('You must enter at least one value: ');
    end
    %Determine if values within accepted range. Keep prompting the user
    %until values fall within this range.
    while any(gender <= 0) || any(gender > 2)
        fprintf('\n')
        gender = input(['At least one of your values are invalid. ' ...
            'Please try again: ']);
    end
    output = gender;
end