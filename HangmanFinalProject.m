function Hangman()
clear all
close all
clc

fprintf("Welcome to hangman\n");
fprintf("\n");

DrawNoose();

Used_letters = [];
AmountWrong = 0; % Counts the amount of wrong guesses
GuessesLeft = 6; %Remaining guesses

generate_case = randi(5);

% chooses a word to play with

switch generate_case
    case 1
        word = 'matrices';
    case 2
        word = 'eigenvector';
    case 3
        word = 'identity';
    case 4
        word = 'transpose';
    case 5
        word = 'determinant';
end

TheWordToBeGuessed = lower(word); %Converts to lowercase
MainString = string(TheWordToBeGuessed); % Converts to string
Length = length(TheWordToBeGuessed); %Finds the length of the string

AmountOfLetters = isletter(TheWordToBeGuessed);

for i=1:Length
 String1= fprintf('_ ');
end





while 1
     
%Takes input from player    
if AmountWrong < 6
LetterInput = input('\nGuess a letter: ','s');
TheInputString = string(LetterInput);           %converts LetterInput to string form
LowercaseInput = lower(TheInputString);         %converts to lowercase
StringFindInput= strfind(MainString, LowercaseInput);        %Looks for guess within actual word
InputLengthCorrect = length(StringFindInput);

    if LowercaseInput == TheWordToBeGuessed
            fprintf('You Won!\n')
            break
        end
    if InputLengthCorrect >= 1
    clc
    fprintf('Correct letter guessed\n')
    fprintf('%d attempts remaining.\n', GuessesLeft)
    fprintf('"%s"\n',word)
    if LowercaseInput == TheWordToBeGuessed
        fprintf('You Won!\n')
        break
    end
    else
    clc
    fprintf('Wrong letter\n')
    GuessesLeft = GuessesLeft - 1;
    fprintf('%d attempts remaining.\n', GuessesLeft)
    fprintf('"%s"\n',word)
    AmountWrong = AmountWrong + 1;
    DrawHangingMan(AmountWrong)
    end
    
    else
        fprintf("You've lost\n");
        break
    end

    
end    
end


%_________________________________________________________________________________________________________________
function DrawNoose()

hold on 
rectangle('Position', [5 5 5 5],'linewidth',5,'edgecolor','k');

S1= line([9,9],[9,5]);
S1.Color = 'k'; 
S1.LineWidth = 4;

S2= line([7.5,9],[9,9]);
S2.Color = 'k'; 
S2.LineWidth = 4;

S2= line([7.5,7.5],[8,9]);
S2.Color = 'k'; 
S2.LineWidth = 4;

end


function DrawHangingMan(AmountWrong)

hold on

if (AmountWrong == 1)
hold on
%Draws head
x=7.5;
y=7.75;
r=0.25;
theta = 0:pi/100:2*pi;
a= r*cos(theta)+x;
b=r*sin(theta)+y;
Head = plot(a,b);
Head.LineWidth = 4;
Head.Color = 'b';
end

if (AmountWrong == 2)

%Draws Body
hold on
Body= line([7.5,7.5],[7.5,6]);
Body.Color = 'b'; 
Body.LineWidth = 4;
end

if (AmountWrong == 3)
%Draws Left Leg
hold on
LeftLeg = line([7.5,7],[6,5.5]);
LeftLeg.Color = 'b'; 
LeftLeg.LineWidth = 4;
end

if (AmountWrong == 4)
%Draws Right Leg
hold on
LeftLeg = line([7.5,8],[6,5.5]);
LeftLeg.Color = 'b'; 
LeftLeg.LineWidth = 4;
end

if (AmountWrong == 5)
%Draws Right Arm
hold on
RightArm = line([7.5,7],[7,7.5]);
RightArm.Color = 'b'; 
RightArm.LineWidth = 4;
end

if (AmountWrong == 6)
%Draws Left Arm
hold on
LeftArm = line([7.5,8],[7,7.5]);
LeftArm.Color = 'b'; 
LeftArm.LineWidth = 4;

end

end
