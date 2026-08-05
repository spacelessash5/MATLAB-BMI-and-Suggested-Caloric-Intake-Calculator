function [countund, counthealth, countover, countobe] = countbmi(input)
    %This function will receive a vector of BMI values and count the number
    %of individuals who fall under each of four categories: underweight,
    %healthy, overweight, and obese. This function utilizes varargin in
    %order to receive a variable number of inputs, and will return count
    %values of all BMI categories to the user. 

    %Initialize all count values for all BMI categories to 0.
    countund = 0;
    counthealth = 0;
    countover = 0;
    countobe = 0;
    
    %For loop with nested switch statement to go through each element and 
    %determine which BMI category it falls under. Count variables for 
    %respective BMI categories increase by an increment of 1 for each 
    %person who is determined to fall into that category. 
    for i = 1:length(input)
        if input(i) < 18.5
            countund = countund + 1;
        elseif input(i) >= 18.5 && input(i) < 25
            counthealth = counthealth + 1;
        elseif input(i) >= 25 && input(i) < 30
            countover = countover + 1;
        else 
            countobe = countobe + 1;
        end
    end
end