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
interv = input("Input the interval time for two words: ");
Chinese = input("Include chinese?");
soundtrack = [];

for i = 1:height(v)
    if v{i,5} == fami && v{i,4} == occur
        w = tts(char(v{i,1}),[],0,44100);
        switch Chinese
            case 0
                
                soundtrack = [soundtrack,w',zeros(1,44100)];
            case 1
                w2 = tts(char(erase(v{i,2},["n.","v.","vt.","adj.","adv."])),[],0,44100);
                soundtrack = [soundtrack,w',zeros(floor(0.5*interv),44100),w2',zeros(interv,44100)];
        end
    end
end

audiowrite('track.wav', soundtrack, 44100)
