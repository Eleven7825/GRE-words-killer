load Diaries
description = input("how did you feel today?",'s');
Diaries(end+1) = Diary(description);
save('Diaries.mat','Diaries','-append');