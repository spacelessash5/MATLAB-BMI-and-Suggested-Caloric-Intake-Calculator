function output = getbmr(inputweight, inputheight, inputage, inputgender)
    %This function will calculate the Basal Metabolic Rate values for all
    %individuals whose data was entered into the program. The BMR values
    %will be calculated with the Mifflin-St. Jeor equation, a widely used
    %equation to calculate BMR. Height values will be converted from meters
    %to centimeters.

    %Convert height values from meters to centimeters.
    heightcm = inputheight.*100;

    %Calculate the BMR value for each person.
    %If-else statement is used to calculate the BMR for different genders. 
    if inputgender == 1
        output = (10.*inputweight)+(6.25.*heightcm)-(5.*inputage)+5;
    else
        output = (10.*inputweight)+(6.25.*heightcm)-(5.*inputage)-161;
    end
end
