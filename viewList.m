% view list
load voc

occur = input("choose the occurace of the voc:");
fami = input("choose the familarity of the voc:");

if isempty(occur)
    indx = find(v.Mas==fami);
else
    indx = find(v.Occ==occur&v.Mas==fami);
end

vv = v(indx,:);
for i = 1:height(vv)
    switch vv{i,4}
        case 1
            word = strcat("*   ",vv{i,1});
        case 2
            word = strcat("**  ",vv{i,1});
        case 3
            word = strcat("*** ",vv{i,1});
    end
    disp(word)
    disp(v{i,6})
    disp(vv{i,2});disp(" ")
    
end