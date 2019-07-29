

% Pooya - Control Experiment - No Attention (Doesn't differentiate between correct and incorrect button presses)



directory = dir('C:\Users\McGill\Desktop\New folder');

% 1,  2: Probe P2 appears (1,2) while targets 1,2 have already appeared
% 91,92: No probe appears (ratio 1/9), while targets 1,2 have already appeared




ii = 0;
for ifile = 1:length(directory)
        
    if strfind(directory(ifile).name,'events')
        
        % Load each events file and the needed events
        load([directory(ifile).folder '\' directory(ifile).name])
        for iEvent = 1:length(events)
            
            if strcmp(events(iEvent).label,'91')
                event91 = events(iEvent).times;
                ievent91 = iEvent;
            end
            if strcmp(events(iEvent).label,'saccade_offset1')
                event_offset1 = events(iEvent).times;
                ievent_offset1 = iEvent;
            end
            if strcmp(events(iEvent).label,'92')
                event92 = events(iEvent).times;
                ievent92 = iEvent;
            end
            if strcmp(events(iEvent).label,'saccade_offset2')
                event_offset2 = events(iEvent).times;
                ievent_offset2 = iEvent;
            end
            if strcmp(events(iEvent).label,'5') % 5 refers to all the probe offsets (not coded. This is from the photodiode)
                event5 = events(iEvent).times;
            end
            if strcmp(events(iEvent).label,'saccade_onset1')
                event_onset1 = events(iEvent).times;
            end
            if strcmp(events(iEvent).label,'saccade_onset2')
                event_onset2 = events(iEvent).times;
            end
            
        end
        
        
        
        

        indices_to_remove_event_offset1 = [];
        indices_to_remove_event_offset2 = [];
        %% Get the appropriate 
        for iEvent91 = 1:length(event91)

            for iEvent_offset1 = 1:length(event_offset1)
                if event_offset1(iEvent_offset1) - event91(iEvent91) <0.800 && event_offset1(iEvent_offset1) - event91(iEvent91) >0.00
                    indices_to_remove_event_offset1 = [indices_to_remove_event_offset1 iEvent_offset1];
                    disp(['Index: ' num2str(iEvent_offset1) '      Time:' num2str(event_offset1(iEvent_offset1)) ' ms'])                    
                end
            end
        end

        for iEvent92 = 1:length(event92)

            for iEvent_offset2 = 1:length(event_offset2)
                if event_offset2(iEvent_offset2) - event92(iEvent92) <0.800 && event_offset2(iEvent_offset2) - event92(iEvent92) >0.00
                    indices_to_remove_event_offset2 = [indices_to_remove_event_offset2 iEvent_offset2];
                    disp(['Index: ' num2str(iEvent_offset2) '      Time:' num2str(event_offset2(iEvent_offset2)) ' ms'])
                end
            end
        end
        
        
        indices_to_remove_event_offset1_logical = false(1,length(event_offset1));
        indices_to_remove_event_offset2_logical = false(1,length(event_offset2));
        
        indices_to_remove_event_offset1_logical(indices_to_remove_event_offset1) = true;
        indices_to_remove_event_offset2_logical(indices_to_remove_event_offset2) = true;
        
        %% Transfer the events that showed no probe, to a new events category
        
        endEventsIndex = length(events);
        endEventsIndex = endEventsIndex+1;
        
        events(endEventsIndex).label      = 'saccade_offset1';
        events(endEventsIndex).color      = [1,0,0];
        events(endEventsIndex).samples    = events(ievent_offset1).samples(~indices_to_remove_event_offset1_logical);
        events(endEventsIndex).epochs     = events(ievent_offset1).epochs (~indices_to_remove_event_offset1_logical);
        events(endEventsIndex).times      = events(ievent_offset1).times  (~indices_to_remove_event_offset1_logical);
        events(endEventsIndex).reactTimes = [];
        events(endEventsIndex).select     = 1;

        endEventsIndex = endEventsIndex+1;        
        events(endEventsIndex).label      = 'saccade_offset2';
        events(endEventsIndex).color      = [1,0,0];
        events(endEventsIndex).samples    = events(ievent_offset2).samples(~indices_to_remove_event_offset2_logical);
        events(endEventsIndex).epochs     = events(ievent_offset2).epochs (~indices_to_remove_event_offset2_logical);
        events(endEventsIndex).times      = events(ievent_offset2).times  (~indices_to_remove_event_offset2_logical);
        events(endEventsIndex).reactTimes = [];
        events(endEventsIndex).select     = 1;
        
        endEventsIndex = endEventsIndex+1;        
        events(endEventsIndex).label      = 'no_probe_saccade_offset1';
        events(endEventsIndex).color      = [1,0,0];
        events(endEventsIndex).samples    = events(ievent_offset1).samples(indices_to_remove_event_offset1_logical);
        events(endEventsIndex).epochs     = events(ievent_offset1).epochs (indices_to_remove_event_offset1_logical);
        events(endEventsIndex).times      = events(ievent_offset1).times  (indices_to_remove_event_offset1_logical);
        events(endEventsIndex).reactTimes = [];
        events(endEventsIndex).select     = 1;

        endEventsIndex = endEventsIndex+1;        
        events(endEventsIndex).label      = 'no_probe_saccade_offset2';
        events(endEventsIndex).color      = [1,0,0];
        events(endEventsIndex).samples    = events(ievent_offset2).samples(indices_to_remove_event_offset2_logical);
        events(endEventsIndex).epochs     = events(ievent_offset2).epochs (indices_to_remove_event_offset2_logical);
        events(endEventsIndex).times      = events(ievent_offset2).times  (indices_to_remove_event_offset2_logical);
        events(endEventsIndex).reactTimes = [];
        events(endEventsIndex).select     = 1;
        
        
        
        events_to_keep = true(1,length(events));
        events_to_keep([ievent_offset1, ievent_offset2]) = false;
        
        events = events(events_to_keep);
        
        
        
        %% Save corrected events
        save([directory(ifile).folder '\corrected_' directory(ifile).name ])
        
    end
end
        





    
    






























