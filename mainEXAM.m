function[] = mainEXAM()
% Function to run 'exam_2018.m'. 
% Usage: follow the instructions 
%in the Command Window.
%----#sort_of_reuseable_code----%

    %Enter the task you want to run in 'exam_2018.m'
    prompt='Enter which task you would like to check (1-10): '; %msg before taking the input 
    inp=input(prompt,'s'); %input from keyboard
    x=str2double(inp); %converting the str to double.
    if (x>=1)&&(x<=10) %condition (exam_2018.m has only 10 tasks)
        exam_2018(x) %run exam_2018.m with the entered task
        mainEXAM() %return to the top to run again like a loop
    else
        disp('You entered an invalid value!! ');
        invalEXAM() %a function for when an invalid input is entered
        return 
    end
end%mainEXAM()
