% finding the reading answers
clear
load answer

p = input("which passage?");
for i = 2:5
    if isempty(answ{p,i})
        break
    end
    disp(answ{p,i})
end