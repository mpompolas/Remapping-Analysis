






%% Create the histograms for the latencies

all_experiments = {'BrazilianActualExperiment'  'BrazilianNoAtttention' 'BrazilianFarProbe' 'IranianActualExperiment' 'IranianNoAtttention' 'IranianFarProbe'};


%% Select events files for each experiment

latencies = [];
for iExperiment = 1:6
    
    experiment = all_experiments{iExperiment};
    
    switch experiment
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%       BRAZILIAN       %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        case 'BrazilianActualExperiment'    
            events1 = load('Z:\MEG RAW DATA\Remapping\Attention Probes\20180917 - Brazilian\Brazilian_saccades_20180917_03.ds\events_Brazilian_saccades_20180917_03.mat');
            events2 = load('Z:\MEG RAW DATA\Remapping\Attention Probes\20180917 - Brazilian\Brazilian_saccades_20180917_04.ds\events_Brazilian_saccades_20180917_04.mat');
            events3 = load('Z:\MEG RAW DATA\Remapping\Attention Probes\20180917 - Brazilian\Brazilian_saccades_20180917_05.ds\events_Brazilian_saccades_20180917_05.mat');
            events4 = load('Z:\MEG RAW DATA\Remapping\Attention Probes\20180917 - Brazilian\Brazilian_saccades_20180917_06.ds\events_Brazilian_saccades_20180917_06.mat');
            events5 = load('Z:\MEG RAW DATA\Remapping\Attention Probes\20180917 - Brazilian\Brazilian_saccades_20180917_07.ds\events_Brazilian_saccades_20180917_07.mat');
            events6 = load('Z:\MEG RAW DATA\Remapping\Attention Probes\20180917 - Brazilian\Brazilian_saccades_20180917_08.ds\events_Brazilian_saccades_20180917_08.mat');

        case 'BrazilianNoAtttention'    
            events1 = load('Z:\MEG RAW DATA\Remapping\Attention Probes\No Attention - Control\20181004 - Brazilian\meg\sub-Brazilian_ses-20181004_task-saccades_run-01_meg.ds\events_sub-Brazilian_ses-20181004_task-saccades_run-01_meg.mat');
            events2 = load('Z:\MEG RAW DATA\Remapping\Attention Probes\No Attention - Control\20181004 - Brazilian\meg\sub-Brazilian_ses-20181004_task-saccades_run-02_meg.ds\events_sub-Brazilian_ses-20181004_task-saccades_run-02_meg.mat');
            events3 = load('Z:\MEG RAW DATA\Remapping\Attention Probes\No Attention - Control\20181004 - Brazilian\meg\sub-Brazilian_ses-20181004_task-saccades_run-03_meg.ds\events_sub-Brazilian_ses-20181004_task-saccades_run-03_meg.mat');
            events4 = load('Z:\MEG RAW DATA\Remapping\Attention Probes\No Attention - Control\20181004 - Brazilian\meg\sub-Brazilian_ses-20181004_task-saccades_run-04_meg.ds\events_sub-Brazilian_ses-20181004_task-saccades_run-04_meg.mat');
            events5 = load('Z:\MEG RAW DATA\Remapping\Attention Probes\No Attention - Control\20181004 - Brazilian\meg\sub-Brazilian_ses-20181004_task-saccades_run-05_meg.ds\events_sub-Brazilian_ses-20181004_task-saccades_run-05_meg.mat');
            events6 = load('Z:\MEG RAW DATA\Remapping\Attention Probes\No Attention - Control\20181004 - Brazilian\meg\sub-Brazilian_ses-20181004_task-saccades_run-06_meg.ds\events_sub-Brazilian_ses-20181004_task-saccades_run-06_meg.mat');

        case 'BrazilianFarProbe'    
            events1 = load('Z:\MEG RAW DATA\Remapping\Attention Probes\Far Probe - Control\20181005 - Brazilian\meg\sub-Brazilian_ses-20181005_task-saccades_run-01_meg.ds\events_sub-Brazilian_ses-20181005_task-saccades_run-01_meg.mat');
            events2 = load('Z:\MEG RAW DATA\Remapping\Attention Probes\Far Probe - Control\20181005 - Brazilian\meg\sub-Brazilian_ses-20181005_task-saccades_run-02_meg.ds\events_sub-Brazilian_ses-20181005_task-saccades_run-02_meg.mat');
            events3 = load('Z:\MEG RAW DATA\Remapping\Attention Probes\Far Probe - Control\20181005 - Brazilian\meg\sub-Brazilian_ses-20181005_task-saccades_run-03_meg.ds\events_sub-Brazilian_ses-20181005_task-saccades_run-03_meg.mat');
            events4 = load('Z:\MEG RAW DATA\Remapping\Attention Probes\Far Probe - Control\20181005 - Brazilian\meg\sub-Brazilian_ses-20181005_task-saccades_run-04_meg.ds\events_sub-Brazilian_ses-20181005_task-saccades_run-04_meg.mat');
            events5 = load('Z:\MEG RAW DATA\Remapping\Attention Probes\Far Probe - Control\20181005 - Brazilian\meg\sub-Brazilian_ses-20181005_task-saccades_run-05_meg.ds\events_sub-Brazilian_ses-20181005_task-saccades_run-05_meg.mat');
            events6 = load('Z:\MEG RAW DATA\Remapping\Attention Probes\Far Probe - Control\20181005 - Brazilian\meg\sub-Brazilian_ses-20181005_task-saccades_run-06_meg.ds\events_sub-Brazilian_ses-20181005_task-saccades_run-06_meg.mat');


        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%      IRANIAN      %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        case 'IranianActualExperiment'    
            events1 = load('Z:\MEG RAW DATA\Remapping\Attention Probes\Actual Experiment\20181004 - Iranian\meg\sub-Iranian_ses-20181004_task-saccades_run-01_meg.ds\events_sub-Iranian_ses-20181004_task-saccades_run-01_meg.mat');
            events2 = load('Z:\MEG RAW DATA\Remapping\Attention Probes\Actual Experiment\20181004 - Iranian\meg\sub-Iranian_ses-20181004_task-saccades_run-02_meg.ds\events_sub-Iranian_ses-20181004_task-saccades_run-02_meg.mat');
            events3 = load('Z:\MEG RAW DATA\Remapping\Attention Probes\Actual Experiment\20181004 - Iranian\meg\sub-Iranian_ses-20181004_task-saccades_run-03_meg.ds\events_sub-Iranian_ses-20181004_task-saccades_run-03_meg.mat');
            events4 = load('Z:\MEG RAW DATA\Remapping\Attention Probes\Actual Experiment\20181004 - Iranian\meg\sub-Iranian_ses-20181004_task-saccades_run-04_meg.ds\events_sub-Iranian_ses-20181004_task-saccades_run-04_meg.mat');
            events5 = load('Z:\MEG RAW DATA\Remapping\Attention Probes\Actual Experiment\20181004 - Iranian\meg\sub-Iranian_ses-20181004_task-saccades_run-05_meg.ds\events_sub-Iranian_ses-20181004_task-saccades_run-05_meg.mat');
            events6 = load('Z:\MEG RAW DATA\Remapping\Attention Probes\Actual Experiment\20181004 - Iranian\meg\sub-Iranian_ses-20181004_task-saccades_run-06_meg.ds\events_sub-Iranian_ses-20181004_task-saccades_run-06_meg.mat');

         case 'IranianNoAtttention'      
            events1 = load('Z:\MEG RAW DATA\Remapping\Attention Probes\No Attention - Control\20181003 - Iranian\sub-Iranian_ses-20181003_task-saccades_run-03_meg.ds\events_sub-Iranian_ses-20181003_task-saccades_run-03_meg.mat');
            events2 = load('Z:\MEG RAW DATA\Remapping\Attention Probes\No Attention - Control\20181003 - Iranian\sub-Iranian_ses-20181003_task-saccades_run-04_meg.ds\events_sub-Iranian_ses-20181003_task-saccades_run-04_meg.mat');
            events3 = load('Z:\MEG RAW DATA\Remapping\Attention Probes\No Attention - Control\20181003 - Iranian\sub-Iranian_ses-20181003_task-saccades_run-05_meg.ds\events_sub-Iranian_ses-20181003_task-saccades_run-05_meg.mat');
            events4 = load('Z:\MEG RAW DATA\Remapping\Attention Probes\No Attention - Control\20181003 - Iranian\sub-Iranian_ses-20181003_task-saccades_run-06_meg.ds\events_sub-Iranian_ses-20181003_task-saccades_run-06_meg.mat');
            events5 = load('Z:\MEG RAW DATA\Remapping\Attention Probes\No Attention - Control\20181003 - Iranian\sub-Iranian_ses-20181003_task-saccades_run-07_meg.ds\events_sub-Iranian_ses-20181003_task-saccades_run-07_meg.mat');
            events6 = load('Z:\MEG RAW DATA\Remapping\Attention Probes\No Attention - Control\20181003 - Iranian\sub-Iranian_ses-20181003_task-saccades_run-08_meg.ds\events_sub-Iranian_ses-20181003_task-saccades_run-08_meg.mat');

        case 'IranianFarProbe'   
            events1 = load('Z:\MEG RAW DATA\Remapping\Attention Probes\Far Probe - Control\20181009 - Iranian\meg\sub-Iranian_ses-20181009_task-saccades_run-01_meg.ds\events_sub-Iranian_ses-20181009_task-saccades_run-01_meg.mat');
            events2 = load('Z:\MEG RAW DATA\Remapping\Attention Probes\Far Probe - Control\20181009 - Iranian\meg\sub-Iranian_ses-20181009_task-saccades_run-02_meg.ds\events_sub-Iranian_ses-20181009_task-saccades_run-02_meg.mat');
            events3 = load('Z:\MEG RAW DATA\Remapping\Attention Probes\Far Probe - Control\20181009 - Iranian\meg\sub-Iranian_ses-20181009_task-saccades_run-03_meg.ds\events_sub-Iranian_ses-20181009_task-saccades_run-03_meg.mat');
            events4 = load('Z:\MEG RAW DATA\Remapping\Attention Probes\Far Probe - Control\20181009 - Iranian\meg\sub-Iranian_ses-20181009_task-saccades_run-04_meg.ds\events_sub-Iranian_ses-20181009_task-saccades_run-04_meg.mat');
            events5 = load('Z:\MEG RAW DATA\Remapping\Attention Probes\Far Probe - Control\20181009 - Iranian\meg\sub-Iranian_ses-20181009_task-saccades_run-05_meg.ds\events_sub-Iranian_ses-20181009_task-saccades_run-05_meg.mat');
            events6 = load('Z:\MEG RAW DATA\Remapping\Attention Probes\Far Probe - Control\20181009 - Iranian\meg\sub-Iranian_ses-20181009_task-saccades_run-06_meg.ds\events_sub-Iranian_ses-20181009_task-saccades_run-06_meg.mat');
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
        iProbeOffset   = find(strcmp({events{iRun}.label},'5'));

        if isempty(iProbeOffset)
            error('Probe offset is not defined')
        end

        iOnsetEvents = [iSaccadeOnset1 iSaccadeOnset2];

        for iCondition = 1:2 % saccadeonset1 / saccadeonset2

            for iEvent = 1:length(events{iRun}(iOnsetEvents(iCondition)).times)

                difference = events{iRun}(iOnsetEvents(iCondition)).times(iEvent) - events{iRun}(iProbeOffset).times;
                indices = find(difference > -0.050 & difference < 0.150);

                if ~isempty(indices)
                    latency = min(difference(indices));

                    latencies.(experiment).(conditionLabels{iCondition}) = [latencies.(experiment).(conditionLabels{iCondition}) latency];

                end


            end
        end
    end

            
    figure(1);
    nBins = 40;
    subplot(6,2,(iExperiment-1)*2+1); hist(latencies.(experiment).(conditionLabels{1}),nBins); title ({experiment ; 'SaccadeOnset1'}); axis([-0.05 0.2 0 60])
    subplot(6,2,(iExperiment-1)*2+2); hist(latencies.(experiment).(conditionLabels{2}),nBins); title ({experiment ; 'SaccadeOnset2'}); axis([-0.05 0.2 0 60])
            

end
    





%% Same thing for saccde offset as 0 and TARGET onset (BEFORE)





latencies2 = [];




%% Select events files for each experiment
for iExperiment = 1:6
    
    experiment = all_experiments{iExperiment};
    
    switch experiment
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%       BRAZILIAN       %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        case 'BrazilianActualExperiment'    
            events1 = load('Z:\MEG RAW DATA\Remapping\Attention Probes\20180917 - Brazilian\Brazilian_saccades_20180917_03.ds\events_Brazilian_saccades_20180917_03.mat');
            events2 = load('Z:\MEG RAW DATA\Remapping\Attention Probes\20180917 - Brazilian\Brazilian_saccades_20180917_04.ds\events_Brazilian_saccades_20180917_04.mat');
            events3 = load('Z:\MEG RAW DATA\Remapping\Attention Probes\20180917 - Brazilian\Brazilian_saccades_20180917_05.ds\events_Brazilian_saccades_20180917_05.mat');
            events4 = load('Z:\MEG RAW DATA\Remapping\Attention Probes\20180917 - Brazilian\Brazilian_saccades_20180917_06.ds\events_Brazilian_saccades_20180917_06.mat');
            events5 = load('Z:\MEG RAW DATA\Remapping\Attention Probes\20180917 - Brazilian\Brazilian_saccades_20180917_07.ds\events_Brazilian_saccades_20180917_07.mat');
            events6 = load('Z:\MEG RAW DATA\Remapping\Attention Probes\20180917 - Brazilian\Brazilian_saccades_20180917_08.ds\events_Brazilian_saccades_20180917_08.mat');

        case 'BrazilianNoAtttention'    
            events1 = load('Z:\MEG RAW DATA\Remapping\Attention Probes\No Attention - Control\20181004 - Brazilian\meg\sub-Brazilian_ses-20181004_task-saccades_run-01_meg.ds\events_sub-Brazilian_ses-20181004_task-saccades_run-01_meg.mat');
            events2 = load('Z:\MEG RAW DATA\Remapping\Attention Probes\No Attention - Control\20181004 - Brazilian\meg\sub-Brazilian_ses-20181004_task-saccades_run-02_meg.ds\events_sub-Brazilian_ses-20181004_task-saccades_run-02_meg.mat');
            events3 = load('Z:\MEG RAW DATA\Remapping\Attention Probes\No Attention - Control\20181004 - Brazilian\meg\sub-Brazilian_ses-20181004_task-saccades_run-03_meg.ds\events_sub-Brazilian_ses-20181004_task-saccades_run-03_meg.mat');
            events4 = load('Z:\MEG RAW DATA\Remapping\Attention Probes\No Attention - Control\20181004 - Brazilian\meg\sub-Brazilian_ses-20181004_task-saccades_run-04_meg.ds\events_sub-Brazilian_ses-20181004_task-saccades_run-04_meg.mat');
            events5 = load('Z:\MEG RAW DATA\Remapping\Attention Probes\No Attention - Control\20181004 - Brazilian\meg\sub-Brazilian_ses-20181004_task-saccades_run-05_meg.ds\events_sub-Brazilian_ses-20181004_task-saccades_run-05_meg.mat');
            events6 = load('Z:\MEG RAW DATA\Remapping\Attention Probes\No Attention - Control\20181004 - Brazilian\meg\sub-Brazilian_ses-20181004_task-saccades_run-06_meg.ds\events_sub-Brazilian_ses-20181004_task-saccades_run-06_meg.mat');

        case 'BrazilianFarProbe'    
            events1 = load('Z:\MEG RAW DATA\Remapping\Attention Probes\Far Probe - Control\20181005 - Brazilian\meg\sub-Brazilian_ses-20181005_task-saccades_run-01_meg.ds\events_sub-Brazilian_ses-20181005_task-saccades_run-01_meg.mat');
            events2 = load('Z:\MEG RAW DATA\Remapping\Attention Probes\Far Probe - Control\20181005 - Brazilian\meg\sub-Brazilian_ses-20181005_task-saccades_run-02_meg.ds\events_sub-Brazilian_ses-20181005_task-saccades_run-02_meg.mat');
            events3 = load('Z:\MEG RAW DATA\Remapping\Attention Probes\Far Probe - Control\20181005 - Brazilian\meg\sub-Brazilian_ses-20181005_task-saccades_run-03_meg.ds\events_sub-Brazilian_ses-20181005_task-saccades_run-03_meg.mat');
            events4 = load('Z:\MEG RAW DATA\Remapping\Attention Probes\Far Probe - Control\20181005 - Brazilian\meg\sub-Brazilian_ses-20181005_task-saccades_run-04_meg.ds\events_sub-Brazilian_ses-20181005_task-saccades_run-04_meg.mat');
            events5 = load('Z:\MEG RAW DATA\Remapping\Attention Probes\Far Probe - Control\20181005 - Brazilian\meg\sub-Brazilian_ses-20181005_task-saccades_run-05_meg.ds\events_sub-Brazilian_ses-20181005_task-saccades_run-05_meg.mat');
            events6 = load('Z:\MEG RAW DATA\Remapping\Attention Probes\Far Probe - Control\20181005 - Brazilian\meg\sub-Brazilian_ses-20181005_task-saccades_run-06_meg.ds\events_sub-Brazilian_ses-20181005_task-saccades_run-06_meg.mat');


        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%      IRANIAN      %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        case 'IranianActualExperiment'    
            events1 = load('Z:\MEG RAW DATA\Remapping\Attention Probes\Actual Experiment\20181004 - Iranian\meg\sub-Iranian_ses-20181004_task-saccades_run-01_meg.ds\events_sub-Iranian_ses-20181004_task-saccades_run-01_meg.mat');
            events2 = load('Z:\MEG RAW DATA\Remapping\Attention Probes\Actual Experiment\20181004 - Iranian\meg\sub-Iranian_ses-20181004_task-saccades_run-02_meg.ds\events_sub-Iranian_ses-20181004_task-saccades_run-02_meg.mat');
            events3 = load('Z:\MEG RAW DATA\Remapping\Attention Probes\Actual Experiment\20181004 - Iranian\meg\sub-Iranian_ses-20181004_task-saccades_run-03_meg.ds\events_sub-Iranian_ses-20181004_task-saccades_run-03_meg.mat');
            events4 = load('Z:\MEG RAW DATA\Remapping\Attention Probes\Actual Experiment\20181004 - Iranian\meg\sub-Iranian_ses-20181004_task-saccades_run-04_meg.ds\events_sub-Iranian_ses-20181004_task-saccades_run-04_meg.mat');
            events5 = load('Z:\MEG RAW DATA\Remapping\Attention Probes\Actual Experiment\20181004 - Iranian\meg\sub-Iranian_ses-20181004_task-saccades_run-05_meg.ds\events_sub-Iranian_ses-20181004_task-saccades_run-05_meg.mat');
            events6 = load('Z:\MEG RAW DATA\Remapping\Attention Probes\Actual Experiment\20181004 - Iranian\meg\sub-Iranian_ses-20181004_task-saccades_run-06_meg.ds\events_sub-Iranian_ses-20181004_task-saccades_run-06_meg.mat');

         case 'IranianNoAtttention'      
            events1 = load('Z:\MEG RAW DATA\Remapping\Attention Probes\No Attention - Control\20181003 - Iranian\sub-Iranian_ses-20181003_task-saccades_run-03_meg.ds\events_sub-Iranian_ses-20181003_task-saccades_run-03_meg.mat');
            events2 = load('Z:\MEG RAW DATA\Remapping\Attention Probes\No Attention - Control\20181003 - Iranian\sub-Iranian_ses-20181003_task-saccades_run-04_meg.ds\events_sub-Iranian_ses-20181003_task-saccades_run-04_meg.mat');
            events3 = load('Z:\MEG RAW DATA\Remapping\Attention Probes\No Attention - Control\20181003 - Iranian\sub-Iranian_ses-20181003_task-saccades_run-05_meg.ds\events_sub-Iranian_ses-20181003_task-saccades_run-05_meg.mat');
            events4 = load('Z:\MEG RAW DATA\Remapping\Attention Probes\No Attention - Control\20181003 - Iranian\sub-Iranian_ses-20181003_task-saccades_run-06_meg.ds\events_sub-Iranian_ses-20181003_task-saccades_run-06_meg.mat');
            events5 = load('Z:\MEG RAW DATA\Remapping\Attention Probes\No Attention - Control\20181003 - Iranian\sub-Iranian_ses-20181003_task-saccades_run-07_meg.ds\events_sub-Iranian_ses-20181003_task-saccades_run-07_meg.mat');
            events6 = load('Z:\MEG RAW DATA\Remapping\Attention Probes\No Attention - Control\20181003 - Iranian\sub-Iranian_ses-20181003_task-saccades_run-08_meg.ds\events_sub-Iranian_ses-20181003_task-saccades_run-08_meg.mat');

        case 'IranianFarProbe'   
            events1 = load('Z:\MEG RAW DATA\Remapping\Attention Probes\Far Probe - Control\20181009 - Iranian\meg\sub-Iranian_ses-20181009_task-saccades_run-01_meg.ds\events_sub-Iranian_ses-20181009_task-saccades_run-01_meg.mat');
            events2 = load('Z:\MEG RAW DATA\Remapping\Attention Probes\Far Probe - Control\20181009 - Iranian\meg\sub-Iranian_ses-20181009_task-saccades_run-02_meg.ds\events_sub-Iranian_ses-20181009_task-saccades_run-02_meg.mat');
            events3 = load('Z:\MEG RAW DATA\Remapping\Attention Probes\Far Probe - Control\20181009 - Iranian\meg\sub-Iranian_ses-20181009_task-saccades_run-03_meg.ds\events_sub-Iranian_ses-20181009_task-saccades_run-03_meg.mat');
            events4 = load('Z:\MEG RAW DATA\Remapping\Attention Probes\Far Probe - Control\20181009 - Iranian\meg\sub-Iranian_ses-20181009_task-saccades_run-04_meg.ds\events_sub-Iranian_ses-20181009_task-saccades_run-04_meg.mat');
            events5 = load('Z:\MEG RAW DATA\Remapping\Attention Probes\Far Probe - Control\20181009 - Iranian\meg\sub-Iranian_ses-20181009_task-saccades_run-05_meg.ds\events_sub-Iranian_ses-20181009_task-saccades_run-05_meg.mat');
            events6 = load('Z:\MEG RAW DATA\Remapping\Attention Probes\Far Probe - Control\20181009 - Iranian\meg\sub-Iranian_ses-20181009_task-saccades_run-06_meg.ds\events_sub-Iranian_ses-20181009_task-saccades_run-06_meg.mat');
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

    conditionLabels = {'saccade_offset1' 'saccade_offset2'};

    %% Initiate struct

    for iCondition = 1:2
        try 
            latencies2.(experiment).(conditionLabels{iCondition});
        catch
            latencies2.(experiment).(conditionLabels{iCondition}) = [];
        end
    end




    %% Gather all the latencies from the probe offset to the saccade onset
    for iRun = 1:6

        % Get the indices for the saccade onsets and the probe offset (labeled as "5")
        iSaccadeOffset1 = find(strcmp({events{iRun}.label},'saccade_offset1'));
        iSaccadeOffset2 = find(strcmp({events{iRun}.label},'saccade_offset2'));
        iProbeOffset   = find(strcmp({events{iRun}.label},'5'));

        if isempty(iProbeOffset)
            error('Probe offset is not defined')
        end

        iOffsetEvents = [iSaccadeOffset1 iSaccadeOffset2];

        for iCondition = 1:2 % saccadeoffset1 / saccadeoffset2

            for iEvent = 1:length(events{iRun}(iOffsetEvents(iCondition)).times)

                difference =  - (events{iRun}(iOffsetEvents(iCondition)).times - (events{iRun}(iProbeOffset).times(iEvent) - 0.118)); % Around 118 ms from target onset to probe offset. I want saccade offset at 0, so i reverse the sign
                indices = find(difference < -0.1 & difference > -0.5);

                if ~isempty(indices)
                    latency = min(difference(indices));

                    latencies2.(experiment).(conditionLabels{iCondition}) = [latencies2.(experiment).(conditionLabels{iCondition}) latency];

                end


            end
        end
    end

            
    figure(2);
    nBins = 40;
    subplot(6,2,(iExperiment-1)*2+1); hist(latencies2.(experiment).(conditionLabels{1}),nBins); title ({experiment ; 'SaccadeOffset1'}); axis([-0.4 0.1 0 35])
    subplot(6,2,(iExperiment-1)*2+2); hist(latencies2.(experiment).(conditionLabels{2}),nBins); title ({experiment ; 'SaccadeOffset2'}); axis([-0.4 0.1 0 35])
            

end





figure(1);
set(gcf,'Name','Saccade onset relative to probe offset')


figure(2);
set(gcf,'Name','Saccade offset relative to TARGET ONSET')




















