

%% Saccade detector and alignment (Tried on the new Data from Pedro - last attempt)
% This just plots the eye-signals for all the trials inside a folder



directory = dir('\\BACKUP6\Konstantinos\brainstorm_db\Remapping_Attention_Probe\data\Brazilian\Brazilian_saccades_20180917_03');



data = zeros(198,3361);
ii = 0;
for ifile = 1:length(directory)
    if strfind(directory(ifile).name,'data_saccade_offset2')
        load([directory(ifile).folder '/' directory(ifile).name])
        include = true;

        for ievent = 1:length(Events)
            if strcmp(Events(ievent).label,'BAD')
                include = false;
            end
        end
        if include
            ii = ii + 1;
            data(ii,:) = F(304,:);
        end
          
    end
end
        
        
        

figure;plot(Time,data')

% for i = 1:70
%     figure(1)
%     plot(data(i,:))
%     
%     title(num2str(i))
%     drawnow
%     KbWait
%     pause(.15)
% end





