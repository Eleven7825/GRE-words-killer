classdef Diary
    properties
        Date datetime
        Description string
    end
    
    methods
        function dia = Diary(des)
            dia.Date = datetime('today');
            dia.Description = des;
        end
    end
end