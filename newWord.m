clear

load voc.mat

ip = 10;

fprintf("Three star word:   %d",sum(v.Mas==3))
disp(sum(v.Mas==3)/height(v))
fprintf("Two star word number:")
disp(sum(v.Mas==2))
fprintf("One star word number:")
disp(sum(v.Mas==1))

occur = input("choose the occurace of the voc:");
fami = input("choose the familarity of the voc:");


while true
    if isempty(occur)
        indx = find(v.Mas==fami);
    else
        indx = find(v.Occ==occur&v.Mas==fami);
    end
    i = indx(randi(length(indx)));
    
    if isempty(indx)
        disp("No words in this catagoty!")
        break
    end
    
    if v{i,5}==3
        continue
    end
    
    switch v{i,4}
        case 1
            word = strcat("*   ",v{i,1});
        case 2
            word = strcat("**  ",v{i,1});
        case 3
            word = strcat("*** ",v{i,1});
    end
    disp(word)
    % tts(char(word))
    disp(v{i,2});disp(" ");
    
   % tts(char(erase(v{i,2},["n.","adj.","v.","vt.","adv.","vi."])))
    ip = input("");
    
 
    
    if isempty(ip)
        ip = 10;
        v{i,5}=1;
        continue
    end
    
    switch ip
        case 0
            break
            
        case 1
            v{i,5}=1;
            
        case 2
            v{i,5}=2;
            
        case 3
            v{i,5}=3;
            
    end
end


save("voc.mat","v",'-append')
