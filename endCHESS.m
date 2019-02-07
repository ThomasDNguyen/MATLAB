function[] = endCHESS()
%This is the function to run when the game ends
reply=input('What do you want to do now? ','s');
if reply == "play again" || move == "restart" || move == "rematch"
    CHESS();
elseif reply == "stop" || move == "end" || move == " "
    return
else 
    msgBOX("Invalid input !!");
    invalCHESS();
    return
end
end%endCHESS()

