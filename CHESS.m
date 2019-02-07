%-------------------------------------------------------------------------%
%------------------------------Notations----------------------------------%
%-------------------------------------------------------------------------%
%
%This is a function to play the game Chess.
%Fuctions' jobs:
%   1. CHESS() is the main function to run the game
%   2. boardSetup() is the function to set up the board
%   to the original placement. Used when "play" or "restart"
%   is called.
%   3. checkMove() is the function to check if a move is valid.
%   4. moveOrTake() is the function to either move the assigned piece to 
%   an empty space ("e") or take an opposing piece.
%   5. checkPoints() is the function to check th current points (Positive
%   means White has the advantage, Negative means Black has the advantage).
%   6. checkTurn() is the function to check which player's turn it is.    
%   7. invalCHESS() is the function to handle invalid inputs.
%   8. endCHESS() is the function that handles what happens after the game
%   has ended (either by one player winning or the other forfeiting).
%Usage: 
%

%-------------------------------------------------------------------------%
%--------------------------------CHESS------------------------------------%
%-------------------------------------------------------------------------%
%
function[board] = CHESS()
%This is where the main funtion is

checkPoints();
[turn,winner] = checkTurn();
disp(turn,' to move.');
prompt=('Next move: '); %msg before taking the input
move=input(prompt,'s'); %input from keyboard
if move(ceil(length(move)/2)) == 'x'
    r=['a' 'b' 'c' 'd' 'e' 'f' 'g' 'h'];
    fromLet = move(start);
    toLet = move(end-1);
    
    fromNumRow = find(r==fromLet);
    fromNumCol = str2double(move(start+1));
    toNumRow = find(r==toLet);
    toNumCol = str2double(move(end));
    
    output = checkMove(fromNumRow,fromNumCol,toNumRow,toNumCol);
    if output == 1
        moveOrTake()
    else
        %sth here
    end
   
end
end%CHESS()

%-------------------------------------------------------------------------%
%----------------------------Local Functions------------------------------%
%-------------------------------------------------------------------------%
%
function[board] = boardSetup()
%Function to set up the board

board = ["wR"  "wP" "e" "e" "e" "e" "bP" "bR" 
         "wKg" "wP" "e" "e" "e" "e" "bP" "bKg"
         "wB"  "wP" "e" "e" "e" "e" "bP" "bB" 
         "wQ"  "wP" "e" "e" "e" "e" "bP" "bQ" 
         "wK"  "wP" "e" "e" "e" "e" "bP" "bK" 
         "wB"  "wP" "e" "e" "e" "e" "bP" "bB" 
         "wKg" "wP" "e" "e" "e" "e" "bP" "bKg"
         "wR"  "wP" "e" "e" "e" "e" "bP" "bR" ];
end%boardSetup()

function[output] = checkMove(fromNumRow,fromNumCol,toNumRow,toNumCol)
%Function to check move 

slope=abs((toNumRow-fromNumRow)/(toNumCol-fromNumCol)); %abs(rise/run)

if isnan(slop)==1 %if the piece move to it's own current spot
    output=0;
    return;
end    

%Indicating Piece Id
if strlength(board(fromNumRow,fromNumCol))==3
    piece={"Knight", 3};
elseif strlength(board(fromNumRow,fromNumCol))==2
    if board(fromNumRow,fromNumCol)=="wR" || board(fromNumRow,fromNumCol)=="bR"
        piece={"Rook", 5};
    elseif board(fromNumRow,fromNumCol)=="wB" || board(fromNumRow,fromNumCol)=="bB"
        piece={"Bishop", 3};
    elseif board(fromNumRow,fromNumCol)=="wQ" || board(fromNumRow,fromNumCol)=="bQ"
        piece={"Queen", 9};
    elseif board(fromNumRow,fromNumCol)=="wK" || board(fromNumRow,fromNumCol)=="bK"
        piece={"King", 100};
    elseif board(fromNumRow,fromNumCol)=="wP"
        piece={"WhitePawn", 1};
    elseif board(fromNumRow,fromNumCol)=="bP"
        piece={"BlackPawn", 1};
    end 
elseif strlength(board(fromNumRow,fromNumCol))==1
    piece={"empty", 0};
end

%Defining Piece movement
if piece{1} == "Knight"
    if (slope==2 || slope==0.5) && abs(toNumRow-fromNumRow)<3 && abs(toNumCol-fromNumCol)<3
        output=1;
    else 
        output=0;
    end

elseif piece{1} == "Rook"
    if slope==0 %toNumRow=fromNumRow
        min2max(fromNumCol,toNumCol);
        if (toNumCol-fromNumCol)>1
            for j=(fromNumCol+1):(toNumCol-1)
                if (board(fromNumRow,j)=="e")
                    output=1;
                else
                    output=0;
                    break;
                end
            end
        elseif (toNumCol-fromNumCol)==1
            output=1;
        end
    elseif isinf(slope)==1 %toNumCol=fromNumCol
        min2max(fromNumRow,toNumRow);
        if (toNumRow-fromNumRow)>1
            for i=(fromNumRow+1):(toNumRow-1)
                if (board(i,fromNumCol)=="e")
                    output=1;
                else
                    output=0;
                    break;
                end
            end
        elseif (toNumRow-fromNumRow)==1
            output=1;
        end
    else
        output=0;
    end
    
elseif piece{1} == "Bishop"
    if slope==1 %abs(toNumRow-fromNumRow)=abs(toNumCol-fromNumCol)
        originFromNumRow=fromNumRow;
        originFromNumCol=fromNumCol;
        min2max(fromNumRow,toNumRow);
        min2max(fromNumCol,toNumCol);
        for i=(fromNumRow+1):(toNumRow-1)
            for j=(fromNumCol+1):(toNumCol-1)
                if abs((i-originFromNumRow)/(j-originFromNumCol))==1 && (board(i,j)=="e")
                    output=1;
                else
                    output=0;
                    break;
                end
            end
        end
    else
        output=0;
    end
    
elseif piece{1} == "Queen"
    %Similar to Rook's movement
    if slope==0 %toNumRow=fromNumRow
        min2max(fromNumCol,toNumCol);
        if (toNumCol-fromNumCol)>1
            for j=(fromNumCol+1):(toNumCol-1)
                if (board(fromNumRow,j)=="e")
                    output=1;
                else
                    output=0;
                    break;
                end
            end
        elseif (toNumCol-fromNumCol)==1
            output=1;
        end
    elseif isinf(slope)==1 %toNumCol=fromNumCol
        min2max(fromNumRow,toNumRow);
        if (toNumRow-fromNumRow)>1
            for i=(fromNumRow+1):(toNumRow-1)
                if (board(i,fromNumCol)=="e")
                    output=1;
                else
                    output=0;
                    break;
                end
            end
        elseif (toNumRow-fromNumRow)==1
            output=1;
        end
    else
        output=0;
    end
    %Similar to Bishop's movement
    if slope==1 %abs(toNumRow-fromNumRow)=abs(toNumCol-fromNumCol)
        originFromNumRow=fromNumRow;
        originFromNumCol=fromNumCol;
        min2max(fromNumRow,toNumRow);
        min2max(fromNumCol,toNumCol);
        for i=(fromNumRow+1):(toNumRow-1)
            for j=(fromNumCol+1):(toNumCol-1)
                if abs((i-originFromNumRow)/(j-originFromNumCol))==1 && (board(i,j)=="e")
                    output=1;
                else
                    output=0;
                    break;
                end
            end
        end
    else
        output=0;
    end
    
elseif piece{1} == "King"    
    if slope==0 && abs(toNumRow-fromNumRow)<2 && abs(toNumCol-fromNumCol)<2 %toNumRow=fromNumRow
        output=1;
    else 
        output=0;
    end
    
end%Defining Piece movement
end%checkMove()

function[board] = moveOrTake()
%Function to move the assinged piece    
    
end%moveOrTake()

function[] = checkPoints()
%Function to check points 

%Piece Value
wP=1;
bP=1;
wKg=3;
bKg=3;
wB=3;
bB=3;
wR=5;
bR=5;
wQ=9;
bQ=9;
e=0;
wK=100;
bK=100;
end%checkPoints

function[turn,winner] = checkTurn()
%Function to check player's turn

if mod(count/2) ~= 0
    turn = "White";
else
    turn = "Black";
end
end%checkTurn()