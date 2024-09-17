% summary
load voc.mat

ip = 10;
fprintf("Three star word:   %d",sum(v.Mas==3))
disp(sum(v.Mas==3)/height(v))
fprintf("Two star word number:")
disp(sum(v.Mas==2))
fprintf("One star word number:")
disp(sum(v.Mas==1))