






directory = dir('C:\Users\McGill\Desktop\Pedro Events');



% 1,  2: Probe P2 appears (1),  probe doesn’t appear  (2) (ratio 9/1), while fixating on target 1
% 11,12: Probe P2 appears (11), probe doesn’t appear (12) (ratio 9/1), while fixating on target 2


ii = 0;
for ifile = 1:length(directory)
    if strfind(directory(ifile).name,'events')
        
        % Load each events file and the needed events
        load([directory(ifile).folder '\' directory(ifile).name])
        for iEvent = 1:length(events)
            
            if strcmp(events(iEvent).label,'2')
                event2 = events(iEvent).times;
                ievent2 = iEvent;
            end
            if strcmp(events(iEvent).label,'saccade_offset1')
                event_offset1 = events(iEvent).times;
                ievent_offset1 = iEvent;
            end
            if strcmp(events(iEvent).label,'12')
                event12 = events(iEvent).times;
                ievent12 = iEvent;
            end
            if strcmp(events(iEvent).label,'saccade_offset2')
                event_offset2 = events(iEvent).times;
                ievent_offset2 = iEvent;
            end
        end
        
        
        
        indices_to_remove_event_offset1 = [];
        indices_to_remove_event_offset2 = [];

        
        %% Get the appropriate 
        for iEvent2 = 1:length(event2)

            for iEvent_offset1 = 1:length(event_offset1)
                if event_offset1(iEvent_offset1) - event2(iEvent2) <0.200 && event_offset1(iEvent_offset1) - event2(iEvent2) >0.00
                    indices_to_remove_event_offset1 = [indices_to_remove_event_offset1 iEvent_offset1];
                    disp(['Index: ' num2str(iEvent_offset1) '      Time:' num2str(event_offset1(iEvent_offset1)) ' ms'])                    
                end
            end
        end

        for iEvent12 = 1:length(event12)

            for iEvent_offset2 = 1:length(event_offset2)
                if event_offset2(iEvent_offset2) - event12(iEvent12) <0.200 && event_offset2(iEvent_offset2) - event12(iEvent12) >0.00
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
        





    
    






























