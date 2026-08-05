function output = validnames()
    %This function will prompt the user for a cell array of subjects'
    %names. It will then validate that users have entered at least one
    %input, before passing the values on to the program.

    %Prompt the user for the cell array of names.
    name = input(['Please enter a cell array for the ' ...
        'names of your subjects (Use curly braces): ']);

    %Use a while loop to validate that the name vector is not empty.
    %Repeatedly prompt the user to enter at least one name if the vector
    %remains empty.
    while isempty(name) == 1
        fprintf('\n')
        name = input('Please enter at least one name: ');
    end
    
    %Use the iscell function and a while loop to check if the input is a
    %cell array of. The user will be repeatedly prompted for new inputs if
    %their inputs continue to not match what is accepted by the program.
    while iscell(name) == 0
        fprintf('\n')
        name = input('Please enter your names in a cell array format: ');
    end

    output = name;
end