function[] = invalCHESS()
%
%
%
reply=input('Do you want to resume? [y/n] ','s'); %Ask if you want to resume to the CHESS.m function
    if reply == 'y' %Yes
        return; %return to CHESS.m
    elseif reply == 'n' %No
        shtdwn=input('Do you want to quit? [Y/n] ','s'); %Ask if you want to quit (completely)
        if shtdwn == 'Y' %Yes
            %sth here
        elseif shtdwn == 'n' %No
            invalCHESS(); %return to the top to run again as a loop
        else
            disp('Please enter "Y" or "n" '); %message when you enter invalid value
            invalCHESS() %return to the top to run again as a loop
        end
    else 
        msgBOX("Please enter 'y' or 'n'") %message box when you enter invalid value
        invalCHESS() %return to the top to run again as a loop
    end
end%invalCHESS()