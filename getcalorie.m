function output = getcalorie(inputbmr, inputact, inputgoal)
    %This function will calculate the daily caloric need of a subject in
    %the program, based on values for Basal Metabolic Rate, activity level,
    %and desire to gain, lose, or maintain weight. 

    %Calculating Total Daily Energy Expenditure (TDEE) values for the
    %subject, depending on BMR value and activity level value. This
    %represents the amount of calories needed to maintain weight for an
    %individual.
    %A switch statement will be used to determine what activity level
    %factor to multiply the BMR value by.
    switch inputact
        case 1
            tdee = inputbmr.*1.2;
        case 2
            tdee = inputbmr.*1.375;
        case 3
            tdee = inputbmr.*1.55;
        case 4
            tdee = inputbmr.*1.725;
        otherwise 
            tdee = inputbmr.*1.9;
    end

    %Use an if-else statement to determine how many calories the subject
    %should eat, based on their desires to gain weight, lose weight, or
    %maintain weight. Add or subtract 750 calories from the TDEE value if
    %the subject wishes to gain or lose weight, respectively. 
    if inputgoal == 1
        calories = tdee + 750;
        output = calories;
    elseif inputgoal == 2 
        calories = tdee - 750;
        output = calories;
    else
        output = tdee;
    end
end



