function output = validages()
    %This function will prompt the user for the ages of the subjects they
    %are working with, while also checking if the values they entered are
    %valid or if they entered anything at all. Values will be flagged if
    %they are zero, negative, or unrealistically high (over 122 years).

    %Prompt the user for the age values of their subject(s).
    fprintf('\n')
    age = input(['Enter a single value or vector for the ages of your' ...
        ' subject(s): ']);
    %Check if the user entered anything at all. Keep prompting them for a
    %input until something is entered.
    while isempty(age) == 1
        fprintf('\n')
        age = input('You must enter at least one value: ');
    end
    %Check if any values are zero, negative, or unrealistically high. Keep
    %prompting them if inputs remain outside of the accepted value.
    while any(age <= 0) || any(age > 122)
        fprintf('\n')
        age = input(['Your age values must not be zero, negative, or ' ...
            'unrealistic: ']);
    end
    output = age;
end
