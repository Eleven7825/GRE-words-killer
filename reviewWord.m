clear
load voc.mat
load index.mat

ip = 10;
fprintf("Three star word:   %d",sum(v.Mas==3))
disp(sum(v.Mas==3)/height(v))
fprintf("Two star word number:")
disp(sum(v.Mas==2))
fprintf("One star word number:")
disp(sum(v.Mas==1))

occur = input("choose the occurace of the voc:");
fami = input("choose the familarity of the voc:");

if isempty(occur)
    indx = find(v.Mas==fami);
else
    indx = find(v.Occ==occur&v.Mas==fami);
end

if isempty(indx)
    disp("No words in this catagoty!")
end

loci =locindx(fami,occur+1);
if loci > length(indx)
    loci = 1;
end

while true
%     i = indx(randi(length(indx)));

    loci = loci + 1;
    if loci > length(indx)
        loci = 1;
    end
    i = indx(loci);
    switch v{i,4}
        case 1
            word = strcat("*   ",v{i,1});
        case 2
            word = strcat("**  ",v{i,1});
        case 3
            word = strcat("*** ",v{i,1});
    end
    fprintf(word)
%    tts(char(word))
    if v{i,6}~=""
        fprintf("\nAppears in %s\n",v{i,6})
    end
    ip = input(" ",'s');
    
    if isempty(ip)
        ip = 10;
        
        v{i,5}=fami;
        disp(v{i,2});
        while true
            if isempty(input(""))
                savev(loci,fami,occur,locindx)
                break
            end
        end
        continue
    end
    
    switch ip
        case '0'
            savev(loci,fami,occur,locindx)
            break
        case {'1','b'}
            v{i,5}=1;
        case {'2','n'}
            v{i,5}=2;
        case {'3','m'}
            v{i,5}=3;
    end
    disp(v{i,2});
    while true
        if isempty(input(""))
            savev(loci,fami,occur,locindx)
            break
        end
    end
    
end


save("voc.mat","v",'-append')

function savev(loci,fami,occur,locindx)
locindx(fami,occur+1) = loci;
save('index.mat','locindx')
end
