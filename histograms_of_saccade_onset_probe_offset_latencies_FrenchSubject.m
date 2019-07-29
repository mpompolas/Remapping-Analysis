






%% Create the histograms for the latencies

all_experiments = {'FrenchActualExperiment'};


%% Select events files for each experiment

latencies = [];
for iExperiment = 1:1
    
    experiment = all_experiments{iExperiment};
    
    switch experiment
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%       French       %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        case 'FrenchActualExperiment'    
            events1 = load('C:\Users\McGill\Desktop\French events\corrected_events_sub-FrenchSubject_ses-20190606_task-Visual_run-03_meg.mat');
            events2 = load('C:\Users\McGill\Desktop\French events\corrected_events_sub-FrenchSubject_ses-20190606_task-Visual_run-04_meg.mat');
            events3 = load('C:\Users\McGill\Desktop\French events\corrected_events_sub-FrenchSubject_ses-20190606_task-Visual_run-05_meg.mat');
            events4 = load('C:\Users\McGill\Desktop\French events\corrected_events_sub-FrenchSubject_ses-20190606_task-Visual_run-06_meg.mat');
            events5 = load('C:\Users\McGill\Desktop\French events\corrected_events_sub-FrenchSubject_ses-20190606_task-Visual_run-07_meg.mat');
            events6 = load('C:\Users\McGill\Desktop\French events\corrected_events_sub-FrenchSubject_ses-20190606_task-Visual_run-08_meg.mat');
    end

    
    events1 = events1.events;
    events2 = events2.events;
    events3 = events3.events;
    events4 = events4.events;
    events5 = events5.events;
    events6 = events6.events;

    events = {events1 events2 events3 events4 events5 events6};
    clear events1 events2 events3 events4 events5 events6
    %% Create the vectors with the latencies

    conditionLabels = {'saccade_onset1' 'saccade_onset2'};

    %% Initiate struct

    for iCondition = 1:2
        try 
            latencies.(experiment).(conditionLabels{iCondition});
        catch
            latencies.(experiment).(conditionLabels{iCondition}) = [];
        end
    end




    %% Gather all the latencies from the probe offset to the saccade onset
    for iRun = 1:6

        % Get the indices for the saccade onsets and the probe offset (labeled as "5")
        iSaccadeOnset1 = find(strcmp({events{iRun}.label},'saccade_onset1'));
        iSaccadeOnset2 = find(strcmp({events{iRun}.label},'saccade_onset2'));
        iProbeOffset   = find(strcmp({events{iRun}.label},'probe_offset'));

        if isempty(iProbeOffset)
            error('Probe offset is not defined')
        end

        iOnsetEvents = [iSaccadeOnset1 iSaccadeOnset2];

        for iCondition = 1:2 % saccadeonset1 / saccadeonset2

            for iEvent = 1:length(events{iRun}(iOnsetEvents(iCondition)).times)

                difference = events{iRun}(iOnsetEvents(iCondition)).times(iEvent) - events{iRun}(iProbeOffset).times;
                indices = find(difference > -0.1 & difference < 0.25);

                if ~isempty(indices)
                    latency = min(difference(indices));

                    latencies.(experiment).(conditionLabels{iCondition}) = [latencies.(experiment).(conditionLabels{iCondition}) latency];

                end


            end
        end
    end

    maxY = 40; % Maximum of the YAxis
            
    figure(1);
    nBins = 100;
    subplot(1,2,(iExperiment-1)*2+1); histfit(latencies.(experiment).(conditionLabels{1}),nBins,'kernel'); title ({experiment ; 'Time relative to SaccadeOnset1'}); axis([-0.1 0.25 0 maxY])
    hold on; grid on
    line([0, 0], [0 maxY], 'LineWidth', 2, 'Color', 'g'); hold off; xlabel ('Time (ms)');
    
    subplot(1,2,(iExperiment-1)*2+2); histfit(latencies.(experiment).(conditionLabels{2}),nBins,'kernel'); title ({experiment ; 'Time relative to SaccadeOnset2'}); axis([-0.1 0.25 0 maxY]); 
    hold on; grid on
    line([0, 0], [0 maxY], 'LineWidth', 2, 'Color', 'g'); hold off; xlabel ('Time (ms)');
    

end
    




