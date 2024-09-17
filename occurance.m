% calculate appearing time for each word
load list
[~,ia] = unique(YM.Word);
YM = YM(ia,:);
[~,ia] = unique(FJ.Word);
FJ = FJ(ia,:);
[~,ia] = unique(JJ.Word);
JJ = JJ(ia,:);

v = [YM;FJ;JJ];
[~,~, ic] = unique(v.Word);
occ = zeros(height(v),1);

for i = 1:height(v)
    occ(i) = sum(ic==ic(i));
end

% create the table containing the names and the occurance
T = table(v.Word,occ);
T.Properties.VariableNames = {'Word','Occ'};
[~,ia] = unique(T.Word);
T = T(ia,:);

v = join(v,T);
[~,ia] = unique(v.Word);
v = v(ia,:);

% create a table of mastery and join with v
T2 = table(v.Word,zeros(height(v),1));
T2.Properties.VariableNames = {'Word','Mas'};
v = join(v,T2);