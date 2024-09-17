% view the word
clear
load voc.mat

while true
    word = input("Enter the word: ",'s');
    if word == "0"
        break
    end
    
    if ismember(word,v.Word)
        [~,i] = ismember(word,v.Word);
        disp(v{i,2});
        switch v{i,4}
            case 1
                disp("Appear once")
            case 2
                disp("Appear twice")
            case 3
                disp("Appear three times")
        end
        disp('Mastery level:')
        disp(v{i,5})
        
        if v{i,6} == ""
            disp("No description here")
        else
            disp("description: ")
            fprintf(v{i,6})
            fprintf("\n")
        end
    else
        disp("word not in the list")
        continue
    end
    
    choice = input("\nChange one of properties, enter to continue\n1.description\n2.mastery\n3.Occurance");
    if isempty(choice)
        continue
    
    end
    switch choice
    case 0
        break
    case 1
        v{i,5} = max(1,v{i,5});
        des = string(input("Add description: ",'s'));
        
        if des == ""
            continue
        else
            if v{i,6}==""
                v{i,6} = des;
            else
                v{i,6} = strcat(v{i,6},", ",des);
            end
        end
        
        case 2
            mas = input("Change mastery: ");
            if isempty(mas); continue; 
            else
                v{i,5} = mas;
            end
        case 3
            occ = input("Change mastery: ");
            if isempty(occ); continue; 
            else
                v{i,4} = occ;
            end
            
    end
end

save("voc.mat","v",'-append')