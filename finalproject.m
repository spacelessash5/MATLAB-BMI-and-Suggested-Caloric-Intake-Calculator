%Santony Duan
%ID Number: 0600369
%Date: 05-02-26
%ENGI-111, Section 3
%Final Project - MATLAB Application
%Program Creation Date: 05-02-26

clc
clear variables
format bank

%This program will calculate the BMI and caloric need values of all
%individuals whose weight, height, age, gender, and activity levels are
%input into the program.

%Inform the user of the purpose of the program.
%Call the user-defined function validnames to prompt the user to enter a
%cell array of names for their subjects. The function will then validate
%the user's inputs.
fprintf(['This program will calculate the Body Mass Index (BMI) ' ...
    'and suggested daily caloric intake of a person based on ' ...
    'various user input data.\n'])
fprintf('The program may work with one person or multiple people.\n')
fprintf(['Please keep in mind that all information provided are ' ...
    'suggestions.\n'])
fprintf(['More research should be thoroughly conducted before ' ...
    'determining your lifestyle choices.\n'])
fprintf('\n')
names = validnames();

%Use a while loop as a way to validate user inputs. If inputs do not match
%what the program will accept, the program will keep looping and prompting
%user for an input. 
%Initialize weightunit, the variable for the user's choice of units for 
%weight, to 0, so that the loop may run.
weightunit = 0;
while weightunit == 0
    %Prompt user for their choice of weight units, either kilograms or
    %pounds.
    fprintf('\n')
    weightunit = input(['Please enter your choice of units for ' ...
        'weight. You may enter 1 for kilograms and 2 for pounds: ']);
    %While loop to check if the user only entered a single value or not. 
    while length(weightunit) ~= 1  
        fprintf('\n')
        weightunit = input('You must enter a single value: ');
    end
    %While loop to determine if the user entered anything at all.
    while isempty(weightunit) == 1
        fprintf('\n')
        weightunit = input('You must enter at least one value: ');
    end
    %While loop to validate inputs for weight units. 
    while any(weightunit <= 0) || any(weightunit > 2)
        fprintf('\n')
        weightunit = input(['Your input is invalid. Please try ' ...
                'again: ']);
    end
    %If-else statement to validate inputs in kilograms or pounds.
    if weightunit == 1
        %User-defined function validkg checks if weights in kilograms are 
        %nonzero, positive, and realistic, as well as checking if the user 
        %entered anything at all. 
        %Use a while loop to check if the length of the weights vector 
        %matches the length of the name vector. Let the user enter new 
        %values if the lengths do not match.
        weights = validkg();
        while length(weights) ~= length(names)
            fprintf('\n')
            fprintf(['You must enter the same number of weight values ' ...
                'as previous inputs.'])
            weights = validkg();
        end
    else
        %User-defined function validkg checks if weights in pounds are
        %nonzero, positive, and realistic, as well as checking if the user 
        %entered any values at all. All weight values are then converted to
        %kilograms.
        weights = validlb(); 
        while length(weights) ~= length(names)
            fprintf('\n')
            fprintf(['You must enter the same number of weight values ' ...
                'as previous inputs.'])
            weights = validlb();
        end
    end
end

%Use a while loop to validate height units. The program will repeatedly
%prompt the user for height values if they do not match what the program
%will accept.
%Initialize heightunit, the variable for units of height, to zero, so that
%the loop may run. 
heightunit = 0;
while heightunit == 0
    %Prompt the user for their choice of height units, either meters or
    %feet.
    fprintf('\n')
    heightunit = input(['Please enter your choice of units for height.' ...
        ' You may enter 1 for meters and 2 for inches: ']);
    %Check if the user entered only a single value or not. 
    while length(heightunit) ~= 1 
        fprintf('\n')
        heightunit = input('You must enter a single value: ');
    end
    %While loop to determine if a user entered anything at all.
    while isempty(heightunit) == 1
        fprintf('\n')
        heightunit = input('You must enter at least one value: ');
    end
    %While loop to validate user's answer for choice of height units. 
    while any(heightunit <= 0) || any(heightunit > 2)
        fprintf('\n')
        heightunit = input('Your input is invalid. Please try again: ');
    end
    %If-else statement to validate inputs in meters or feet.
    if heightunit == 1 
        %User-defined function validm checks if values for height in meters 
        %are nonzero, positive, and realistic, and if any values were 
        %entered at all.
        heights = validm();
        while length(heights) ~= length(weights)
            fprintf('\n')
            fprintf(['You must enter the same number of values as' ...
                ' previous inputs.\n'])
            heights = validm();
        end
    else
        %User-defined function validft checks if values for height in feet
        %are nonzero, positive, and realistic, and if any values were
        %entered at all.
        heights = validin();
        while length(heights) ~= length(weights)
            fprintf('\n')
            fprintf(['You must enter the same number of values as ' ...
                'previous inputs.\n'])
            heights = validin();
        end
    end
end

%Preallocate vector for individuals' BMI values.
bmis = zeros(1,length(weights));
%For loop so that the BMI value of each individual whose data was entered
%into the program can be calculated.
for i = 1:length(weights)
    bmis(i) = weights(i)./((heights(i)).^2);
end
%Calculate the average, minimum, and maximum BMI values for the subject
%pool.
meanbmi = mean(bmis);
minbmi = min(bmis);
maxbmi = max(bmis);

%Count the number of users who fall under each BMI category using the
%user-defined function countbmi, so that they may be displayed to the users
%later.
[numund, numhealth, numover, numobe] = countbmi(bmis);

%Call the user-defined function validages to prompt the user for the ages
%of the subject(s) in the program. The function will then validate the
%values that the user enters. 
ages = validages();
%While loop to check if the number of values entered for ages matches that
%of previous input functions. The user will be repeatedly prompted until
%the lengths of all input vectors match. 
while length(ages) ~= length(weights)
    fprintf('\n')
    fprintf(['You must enter the same number of values for ages as ' ...
        'previous inputs.\n'])
    ages = validages();
end

%Call the user-defined function validgenders to prompt the user for values
%to represent the genders of the subject(s) in the program. The function
%will validate the values that the user enters. 
genders = validgenders();
%While loop to determine if the number of values entered for gender matches
%that of previous input functions. The user will be repeatedly prompted
%until the lengths of all input vectors match. 
while length(genders) ~= length(weights)
    fprintf('\n')
    fprintf(['You must enter the same number of values for genders as' ...
        ' previous inputs.\n'])
    genders = validgenders();
end

%Preallocate the vector for Basal (Resting) Metabolic Rate values.
bmrs = zeros(1, length(weights));
%Call upon the user-defined function getbmr to calculate BMR values for all 
%individuals.
for i = 1:length(bmrs)
    bmrs(i) = getbmr(weights(i), heights(i), ages(i), genders(i));
end

%Call the user-defined function validactivity to prompt the user for values 
%to represent the activity levels of the subject(s) in the program. The 
%function will validate the values that the user enters. 
activity = validactivity();
%While loop is used to determine if length of activity vector matches that
%of previous inputs. The user will be repeatedly prompted until the lengths
%of all input vectors match. 
while length(activity) ~= length(weights)
    fprintf('\n')
    fprintf(['You must enter the same number of values for activty ' ...
        'levels as weights and heights.\n'])
    activity = validactivity();
end

%Call the user-defined function validweightgoal to prompt the user for
%values representing the weight-related goals for the subject(s) of the
%program. The function will validate the values that the user inputs.
weightgoal = validweightgoal();
%While loop to determine if length of weightgoal vector matches that of
%previous inputs. The user will be repeatedly prompted until the lengths of
%all input vectors match.
while length(weightgoal) ~= length(weights)
    fprintf('\n')
    fprintf(['You must enter the same number of values for weight ' ...
        'goals as previous inputs.\n'])
    weightgoal = validweightgoal();
end

%Preallocate the cell array for values for subjects' daily caloric needs.
calories = zeros(1,length(weights));
%Call the user-defined function getcalorie to calculate the Total Daily
%Energy Expenditure (TDEE) values for all subjects using their BMR values
%and their activity level values. Caloric need values will then be
%calculated based on values for whether the user wishes to gain weight,
%lose weight, or maintain weight.
for i = 1:length(calories)
    calories(i) = getcalorie(bmrs(i), activity(i), weightgoal(i));
end

%Store all information to the the structure variable bmiandcalories.
for i = length(weights):-1:1
    bmiandcalories(i) = struct('Name', names{i}, 'Age', ages(i), ...
        'GenderValue',genders(i),'Weight', weights(i), 'Height', ...
        heights(i),'BMI', bmis(i), 'ActivityValue', activity(i), ...
        'GoalValue', weightgoal(i), 'CaloricNeed', calories(i));
end

%Display information about each subject to the user, including name, age,
%gender, weight in kilograms, height in meters, BMI, activity level, 
%weight goals and daily caloric needs. 
%Use a for loop to accomplish this.
for i = 1:length(weights)
    fprintf('\n')
    fprintf('Subject name: %s\n',bmiandcalories(i).Name)
    switch genders(i)
        case 1 
            fprintf('Gender: Male\n')
        otherwise
            fprintf('Gender: Female\n')
    end
    fprintf('Age: %d\n', bmiandcalories(i).Age)
    fprintf('Weight(kg): %.2f\n',bmiandcalories(i).Weight)
    fprintf('Height(m): %.2f\n',bmiandcalories(i).Height)
    fprintf('BMI: %.2f\n',bmiandcalories(i).BMI)
    if bmis(i) < 18.5
        fprintf('BMI Category: Underweight\n')
    elseif bmis(i) >= 18.5 && bmis(i) < 25
        fprintf('BMI Category: Healthy\n')
    elseif bmis(i) >= 25 && bmis(i) < 30
        fprintf('BMI Category: Overweight\n')
    else 
        fprintf('BMI Category: Obese\n')
    end
    switch activity(i)
        case 1
            fprintf('Activity level: Sedentary\n')
        case 2
            fprintf('Activity level: Lightly active\n')
        case 3
            fprintf('Activity level: Moderately active\n')
        case 4
            fprintf('Activity level: Active\n')
        otherwise
            fprintf('Activity level: Highly active\n')
    end
    switch weightgoal(i) 
        case 1
            fprintf('Goal: Gain weight\n')
        case 2
            fprintf('Goal: Lose weight\n')
        otherwise 
            fprintf('Goal: Maintain weight\n')
    end
    fprintf('Suggested daily caloric intake: %.2f\n', ...
        bmiandcalories(i).CaloricNeed)
end

%Display mean, minimum, and maximum BMI values to the user.
fprintf('\n')
fprintf('Average BMI: %.2f\n', meanbmi)
fprintf('Minimum BMI: %.2f\n', minbmi)
fprintf('Maximum BMI: %.2f\n', maxbmi)

%Display total subjects and subjects in each BMI category.
fprintf('\n')
fprintf('Of the %d subjects entered:\n',length(weights))
fprintf('    Underweight: %d\n',numund)
fprintf('    Healthy: %d\n',numhealth)
fprintf('    Overweight: %d\n',numover)
fprintf('    Obese: %d\n',numobe)

%Allow for comparison scenarios where users may see their caloric needs at
%different activity levels.
%Prompt the user for subjects who wish to see their caloric needs at
%different activity levels.
fprintf('\n')
fprintf(['Do any subjects wish to see their caloric needs at ' ...
    'different activity levels?\n'])
diffact = input('You may enter 1 for yes and 0 for no: ');
%Validate that only one input was entered.
%Validate that a single input was entered.
while isempty(diffact) == 1 || length(diffact) > 1
    diffact = input('Please enter a single value: ');
end
%Validate that inputs are within acceptable scope. 
while any(diffact < 0) || any(diffact > 1)
    diffact = input('Your input is invalid. Please try again: ');
end
%While loop to keep prompting the user for subjects who wish to see their
%caloric needs at different activity levels.
while diffact == 1
    if diffact == 1 
        %Ask the user for which subject it is. If number of subjects used
        %in program was only 1, automatically move on to next step. 
        if length(weights) > 1
            fprintf('\n')
            whichuser = input(['Which subject is it? Enter their ' ...
                'index in all previous input vectors: ']);
            %Check if anything was entered, and keep prompting user if the
            %inputs remain empty. Validate that only one input was entered.
            while isempty(whichuser) == 1 || length(whichuser) > 1
                whichuser = input('Please enter a single value: ');
            end
            %Check if inputs are within valid range, and keep prompting
            %user if they remain invalid.
            while whichuser <= 0 || whichuser > length(weights)
                whichuser = input(['Your input is invalid, please try ' ...
                    'again: ']);
            end
        else
            whichuser = 1;
        end
        %Prompt the user for what weight-related goal the subject wishes to
        %see their new caloric intakes at.
        fprintf('\n')
        fprintf('What weight-related goal do they wish to use?\n')
        diffgoal = input(['You may enter 1 for gain weight, 2 ' ...
            'for lose weight, and 3 for maintain weight: ']);
        %Validate that user entered correct number of values.
        while isempty(diffgoal) == 1 || length(diffgoal) > 1
            diffgoal = input('Please enter a single value: ');
        end
        %Validate that inputs are within acceptable scope.
        while diffgoal <= 0 || diffgoal > 3
            diffgoal = input('Your input is invalid. Please try again: ');
        end
        %If-else statement to compute caloric intakes at different goals.
        %If weight goal is to gain weight.
        if diffgoal == 1
            %Calculate caloric needs at all activity levels and when weight
            %goal is to gain weight. 
            calseden = getcalorie(bmrs(whichuser),1,1);
            callight = getcalorie(bmrs(whichuser),2,1);
            calmod = getcalorie(bmrs(whichuser),3,1);
            calact = getcalorie(bmrs(whichuser),4,1);
            calveryact = getcalorie(bmrs(whichuser),5,1);
            %Display these values to the user. 
            fprintf('\n')
            fprintf(['Suggested caloric intake for subject ' ...
                'at different activity levels while trying to gain ' ...
                'weight:\n'])
            fprintf('    Sedentary: %.2f\n', calseden)
            fprintf('    Lightly active: %.2f\n', callight)
            fprintf('    Moderately active: %.2f\n', calmod)
            fprintf('    Active: %.2f\n', calact)
            fprintf('    Very active: %.2f\n', calveryact)
        %If weight goal is to lose weight.
        elseif diffgoal == 2
            %Compute caloric needs at all activity levels and if user
            %wishes to lose weight.
            calseden = getcalorie(bmrs(whichuser),1,2);
            callight = getcalorie(bmrs(whichuser),2,2);
            calmod = getcalorie(bmrs(whichuser),3,2);
            calact = getcalorie(bmrs(whichuser),4,2);
            calveryact = getcalorie(bmrs(whichuser),5,2);
            %Display values to the user.
            fprintf('\n')
            fprintf(['Suggested caloric intake for subject ' ...
                'at different activity levels while trying to lose ' ...
                'weight:\n'])
            fprintf('    Sedentary: %.2f\n', calseden)
            fprintf('    Lightly active: %.2f\n', callight)
            fprintf('    Moderately active: %.2f\n', calmod)
            fprintf('    Active: %.2f\n', calact)
            fprintf('    Very active: %.2f\n', calveryact)
        %If user wishes to maintain weight. 
        else
            %Compute caloric needs at all activity levels and if user
            %wishes to maintain weight. 
            calseden = getcalorie(bmrs(whichuser),1,3);
            callight = getcalorie(bmrs(whichuser),2,3);
            calmod = getcalorie(bmrs(whichuser),3,3);
            calact = getcalorie(bmrs(whichuser),4,3);
            calveryact = getcalorie(bmrs(whichuser),5,3);
            %Display these values to the user.
            fprintf('\n')
            fprintf(['Suggested caloric intake for subject at ' ...
                'different activity levels while trying to maintain ' ...
                'weight:\n'])
            fprintf('    Sedentary: %.2f\n', calseden)
            fprintf('    Lightly active: %.2f\n', callight)
            fprintf('    Moderately active: %.2f\n', calmod)
            fprintf('    Active: %.2f\n', calact)
            fprintf('    Very active: %.2f\n', calveryact)
        end
    end
    %Ask the user if any other subjects wish to see their weights at
    %different activity levels. The loop will keep running as long as the
    %user says yes.
    fprintf('\n')
    diffact = input(['Do any other subjects wish to see their ' ...
        'caloric needs at different activity levels?: ']);
    %Validate that a single value was entered.
    while length(diffact) > 1 || isempty(diffact) == 1
        diffact = input('Please enter only one value');
    end
    %Validate that inputs are within acceptable scope. 
    while any(diffact < 0) || any(diffact > 1)
        diffact = input('Your input is invalid. Please try again: ');
    end
end

%Plot the heights, weights, BMI values, and caloric needs of all subjects
%into line graphs.
%Create the reference line for the first graph. The first one will have
%various heights in meters. The second will have approximately healthy
%weights in kilograms for respective heights.
heighthealth = [0 0.5 1 1.5 2 2.5];
weighthealth = [0 10 20 50 80 130];
%The first figure will be a graph comparing height and weight values of
%subjects. Points will be plotted based on each subject's weight and height
%values. A reference line, plotted using the previous two vectors, can be
%used to compare a subject's weight to a healthy weight for their height. 
figure(1)
plot(heights, weights, 'co')
hold on
plot(heighthealth, weighthealth, 'red')
hold off
ylabel('Weights of Subjects (kg)')
ylim([0,500])
xlabel('Heights of Subjects (m)')
xlim([0,2.5])
title('Weights vs Heights of Subjects')

%Make a legend so users may be able to determine what the line represents.
legend('Subjects','Approximately Healthy Weight by Height')

%A second figure, a bar chart, will compare BMI values of the subjects. 
%Bars will be created based on subjects' BMIs. Three reference lines will 
%also be plotted. The first, a green line, will show healthy BMI values 
%above it. The second, a cyan line, will show overweight BMI values above 
%it. The last, a blue line, will show obese BMI values above it. Subjects 
%may compare their BMIs to these reference lines to understand how close 
%they are to each BMI category.
figure(2)
bar(names, bmis, 'blue')
hold on 
yline(18.5,'green')
yline(25,'cyan')
yline(30, 'red')
hold off
ylabel('BMI Values of Subjects')
ylim([0,80])
xlabel('Names of Subjects')
title('BMI Values of Subjects')

%A legend to allow users to understand what the lines represent. 
legend('Subjects', 'Above this: Healthy','Above this: Overweight', ...
    'Above this: Obese')

%A third figure will a bar chart of subjects' caloric need values on the 
%y-axis and subject names on the x-axis. Bars will be plotted based on 
%users' caloric need values. Four reference lines will be made, each 
%representing either the minimum or maximum recommended daily maintenance 
%calories for either men or women. Subjects may compare their recommended
%caloric intake to the recommended maintenance calories for their 
%respective genders. 
figure(3)
bar(names, calories, 'blue')
hold on 
yline(1600, 'green')
yline(2200, 'yellow')
yline(2400, 'red')
yline(3000, 'magenta')
hold off
ylabel('Caloric Needs of Subjects')
ylim([0,6000])
xlabel('Names of Subjects')
title('Caloric Need of Subjects')

%A legend so that users may understand what the lines represent. 
legend('Subjects', ['Minimum Recommended Maintenance Calories for ' ...
    'Women'],'Minimum Recommended Maintenance Calories for Men', ...
    'Maximum Recommended Maintenance Calories for Women', ['Maximum ' ...
    'Recommended Maintenance Calories for Men'])