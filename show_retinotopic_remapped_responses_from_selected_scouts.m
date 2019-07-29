











head_41_zscore_low_16 = load('Z:\brainstorm_db\Remapping_Attention_Probe\data\Brazilian\@intra\results_average_190315_1741_zscore_low.mat');
head_42_zscore_low_16 = load('Z:\brainstorm_db\Remapping_Attention_Probe\data\Brazilian\@intra\results_average_190315_1757_zscore_low.mat');





time_selection = 331:421;




%% Retinotopic - 41 - 42


% Plot the average responses from head41

left41  = mean(mean(abs(head_41_zscore_low_16.ImageGridAmp(scouts_41_42(1).Vertices,time_selection))));
right41 = mean(mean(abs(head_41_zscore_low_16.ImageGridAmp(scouts_41_42(2).Vertices,time_selection))));

left41_std  = mean(std(abs(head_41_zscore_low_16.ImageGridAmp(scouts_41_42(1).Vertices,time_selection))));
right41_std = mean(std(abs(head_41_zscore_low_16.ImageGridAmp(scouts_41_42(2).Vertices,time_selection))));



% Plot the average responses from head42

left42  = mean(mean(abs(head_42_zscore_low_16.ImageGridAmp(scouts_41_42(1).Vertices,time_selection))));
right42 = mean(mean(abs(head_42_zscore_low_16.ImageGridAmp(scouts_41_42(2).Vertices,time_selection))));

left42_std  = mean(std(abs(head_42_zscore_low_16.ImageGridAmp(scouts_41_42(1).Vertices,time_selection))));
right42_std = mean(std(abs(head_42_zscore_low_16.ImageGridAmp(scouts_41_42(2).Vertices,time_selection))));




% 
figure(1);bar([left41 right41 left42 right42])
%you can change the x labels with anything you want.
set(gca,'FontName','Arial','FontSize',8)

hold on
errorbar([left41 right41 left42 right42],[left41_std right41_std left42_std right42_std],'r.','LineWidth',2)
hold off

labels = {'Event41-Scout:Left41 Contralateral','Event41-Scout:Right42 Ipsilateral','Event42-Scout:Left41 Ipsilateral', 'Event42-Scout:Right42 Contralateral'};
labels = cellfun(@(x) strrep(x,' ','\newline'), labels,'UniformOutput',false);
a = gca;
a.XTickLabel = labels;

title 'Fixation - V3A Fixation Responses [50-200] ms - zscores'
grid on


maxmaxmax = max([left41 + left41_std, right41 + right41_std, left42 + left42_std, right42+ right42_std]);


%% Retinotopic - LIP


% Plot the average responses from head41

right41  = mean(mean(abs(head_41_zscore_low_16.ImageGridAmp(LIP_scouts(1).Vertices,time_selection))));
left41 = mean(mean(abs(head_41_zscore_low_16.ImageGridAmp(LIP_scouts(2).Vertices,time_selection))));

right41_std  = mean(std(abs(head_41_zscore_low_16.ImageGridAmp(LIP_scouts(1).Vertices,time_selection))));
left41_std = mean(std(abs(head_41_zscore_low_16.ImageGridAmp(LIP_scouts(2).Vertices,time_selection))));



% Plot the average responses from head42

right42 = mean(mean(abs(head_42_zscore_low_16.ImageGridAmp(LIP_scouts(1).Vertices,time_selection))));
left42 = mean(mean(abs(head_42_zscore_low_16.ImageGridAmp(LIP_scouts(2).Vertices,time_selection))));

right42_std = mean(std(abs(head_42_zscore_low_16.ImageGridAmp(LIP_scouts(1).Vertices,time_selection))));
left42_std = mean(std(abs(head_42_zscore_low_16.ImageGridAmp(LIP_scouts(2).Vertices,time_selection))));




% 
figure(2);bar([left41 right41 left42 right42])
%you can change the x labels with anything you want.
set(gca,'FontName','Arial','FontSize',8)

hold on
errorbar([left41 right41 left42 right42 ],[left41_std right41_std left42_std right42_std ],'r.','LineWidth',2)
hold off

labels = {'Event41-Scout:LeftLIP Contralateral', 'Event41-Scout:RightLIP Ipsilateral', 'Event42-Scout:LeftLIP Ipsilateral', 'Event42-Scout:RightLIP Contralateral'};
labels = cellfun(@(x) strrep(x,' ','\newline'), labels,'UniformOutput',false);
a = gca;
a.XTickLabel = labels;
axis([0.5 4.5, 0 maxmaxmax])
title 'Fixation - LIP Fixation Responses[50-200] ms - zscores'

grid on











%% Check the remapped responses - STATISTICS


head_offset1_regular = load('Z:\brainstorm_db\Remapping_Attention_Probe\data\Brazilian\@intra\presults_no_190329_1631.mat');
head_offset2_regular = load('Z:\brainstorm_db\Remapping_Attention_Probe\data\Brazilian\@intra\presults_no_190329_1714.mat');





time_selection = 331:421;


















