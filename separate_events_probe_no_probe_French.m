





directory = dir('C:\Users\McGill\Desktop\French events');



% 1,  2: Probe P2 appears (1),  probe doesn’t appear  (2) (ratio 9/1), while fixating on target 1
% 11,12: Probe P2 appears (11), probe doesn’t appear (12) (ratio 9/1), while fixating on target 2


ii = 0;
for ifile = 1:length(directory)
    if strfind(directory(ifile).name,'events')
        
        % Load each events file and the needed events
        load([directory(ifile).folder '\' directory(ifile).name])
        
        correct_Button1 = []; iCorrect_Button1 = [];
        false_Button1   = []; iFalse_Button1   = [];
        correct_Button2 = []; iCorrect_Button2 = [];
        false_Button2   = []; iFalse_Button2   = [];
        
        for iEvent = 1:length(events)
            
            if strcmp(events(iEvent).label,'NoProbe_1')
                eventNoProbe1 = events(iEvent).times;
            end
            if strcmp(events(iEvent).label,'saccade_offset1')
                event_offset1 = events(iEvent).times;
                ievent_offset1 = iEvent;
            end
            if strcmp(events(iEvent).label,'NoProbe_2')
                eventNoProbe2 = events(iEvent).times;
            end
            if strcmp(events(iEvent).label,'saccade_offset2')
                event_offset2 = events(iEvent).times;
                ievent_offset2 = iEvent;
            end
            
            if strcmp(events(iEvent).label,'Corr_101') || strcmp(events(iEvent).label,'Corr_111')
                correct_Button1  = [correct_Button1 events(iEvent).times];
                iCorrect_Button1 = [iCorrect_Button1 iEvent];
            end
            if strcmp(events(iEvent).label,'False_201') || strcmp(events(iEvent).label,'False_211')
                false_Button1  = [false_Button1 events(iEvent).times];
                iFalse_Button1 = [iFalse_Button1 iEvent];
            end
            
            if strcmp(events(iEvent).label,'Corr_102') || strcmp(events(iEvent).label,'Corr_112')
                correct_Button2  = [correct_Button2 events(iEvent).times];
                iCorrect_Button2 = [iCorrect_Button2 iEvent];
            end
            if strcmp(events(iEvent).label,'False_202') || strcmp(events(iEvent).label,'False_212')
                false_Button2  = [false_Button2 events(iEvent).times];
                iFalse_Button2 = [iFalse_Button2 iEvent];
            end
        end
        
        
        
     
        
        %% Separate Probe / No probe
        indices_to_remove_event_offset1 = [];
        indices_to_remove_event_offset2 = [];

        for iCorrectSaccade1 = 1:length(eventNoProbe1)
            for iEvent_offset1 = 1:length(event_offset1)
                if event_offset1(iEvent_offset1) - eventNoProbe1(iCorrectSaccade1) <0.200 && event_offset1(iEvent_offset1) - eventNoProbe1(iCorrectSaccade1) >0.00
                    indices_to_remove_event_offset1 = [indices_to_remove_event_offset1 iEvent_offset1];
                    disp(['Index: ' num2str(iEvent_offset1) '      Time:' num2str(event_offset1(iEvent_offset1)) ' ms'])                    
                end
            end
        end

        for iEventNoProbe2 = 1:length(eventNoProbe2)
            for iEvent_offset2 = 1:length(event_offset2)
                if event_offset2(iEvent_offset2) - eventNoProbe2(iEventNoProbe2) <0.200 && event_offset2(iEvent_offset2) - eventNoProbe2(iEventNoProbe2) >0.00
                    indices_to_remove_event_offset2 = [indices_to_remove_event_offset2 iEvent_offset2];
                    disp(['Index: ' num2str(iEvent_offset2) '      Time:' num2str(event_offset2(iEvent_offset2)) ' ms'])
                end
            end
        end
        
        
        indices_to_remove_event_offset1_logical = false(1,length(event_offset1));
        indices_to_remove_event_offset2_logical = false(1,length(event_offset2));
        
        indices_to_remove_event_offset1_logical(indices_to_remove_event_offset1) = true;
        indices_to_remove_event_offset2_logical(indices_to_remove_event_offset2) = true;
        
        
        
        %% Separate Correct Incorrect - This will create overlapping saccade offset events
        
        succesfulSaccades1 = [];
        succesfulSaccades2 = [];
        falseSaccades1     = [];
        falseSaccades2     = [];
        
        
        for iCorrSucc1 = 1:length(correct_Button1)
            for iEvent_offset1 = 1:length(event_offset1)
                if correct_Button1(iCorrSucc1) - event_offset1(iEvent_offset1) <0.800 && correct_Button1(iCorrSucc1) - event_offset1(iEvent_offset1)>0.00
                    succesfulSaccades1 = [succesfulSaccades1 iEvent_offset1];
                    disp(['Index: ' num2str(iEvent_offset1) '      Time:' num2str(event_offset1(iEvent_offset1)) ' ms'])                    
                end
            end
        end

        for iCorrSucc2 = 1:length(correct_Button2)
            for iEvent_offset2 = 1:length(event_offset2)
                if  correct_Button2(iCorrSucc2) - event_offset2(iEvent_offset2) <0.800 && correct_Button2(iCorrSucc2) - event_offset2(iEvent_offset2) >0.00
                    succesfulSaccades2 = [succesfulSaccades2 iEvent_offset2];
                    disp(['Index: ' num2str(iEvent_offset2) '      Time:' num2str(event_offset2(iEvent_offset2)) ' ms'])
                end
            end
        end
        
        for iFalseButton1 = 1:length(false_Button1)
            for iEvent_offset1 = 1:length(event_offset1)
                if false_Button1(iFalseButton1) - event_offset1(iEvent_offset1) <0.800 && false_Button1(iFalseButton1) - event_offset1(iEvent_offset1) >0.00
                    falseSaccades1 = [falseSaccades1 iEvent_offset1];
                    disp(['Index: ' num2str(iEvent_offset1) '      Time:' num2str(event_offset1(iEvent_offset1)) ' ms'])                    
                end
            end
        end

        for iFalseButton2 = 1:length(false_Button2)
            for iEvent_offset2 = 1:length(event_offset2)
                if  false_Button2(iFalseButton2) - event_offset2(iEvent_offset2) <0.800 && false_Button2(iFalseButton2) - event_offset2(iEvent_offset2) >0.00
                    falseSaccades2 = [falseSaccades2 iEvent_offset2];
                    disp(['Index: ' num2str(iEvent_offset2) '      Time:' num2str(event_offset2(iEvent_offset2)) ' ms'])
                end
            end
        end
        
        
        %% Transfer the events that showed no probe, to a new events category
        
        endEventsIndex = length(events);
        endEventsIndex = endEventsIndex+1;
        
        events(endEventsIndex).label      = 'saccade_offset1';
        events(endEventsIndex).color      = [1,0,0];
        events(endEventsIndex).epochs     = events(ievent_offset1).epochs (~indices_to_remove_event_offset1_logical);
        events(endEventsIndex).times      = events(ievent_offset1).times  (~indices_to_remove_event_offset1_logical);
        events(endEventsIndex).reactTimes = [];
        events(endEventsIndex).select     = 1;

        endEventsIndex = endEventsIndex+1;        
        events(endEventsIndex).label      = 'saccade_offset2';
        events(endEventsIndex).color      = [1,0,0];
        events(endEventsIndex).epochs     = events(ievent_offset2).epochs (~indices_to_remove_event_offset2_logical);
        events(endEventsIndex).times      = events(ievent_offset2).times  (~indices_to_remove_event_offset2_logical);
        events(endEventsIndex).reactTimes = [];
        events(endEventsIndex).select     = 1;
        
        endEventsIndex = endEventsIndex+1;        
        events(endEventsIndex).label      = 'no_probe_saccade_offset1';
        events(endEventsIndex).color      = [1,0,0];
        events(endEventsIndex).epochs     = events(ievent_offset1).epochs (indices_to_remove_event_offset1_logical);
        events(endEventsIndex).times      = events(ievent_offset1).times  (indices_to_remove_event_offset1_logical);
        events(endEventsIndex).reactTimes = [];
        events(endEventsIndex).select     = 1;

        endEventsIndex = endEventsIndex+1;        
        events(endEventsIndex).label      = 'no_probe_saccade_offset2';
        events(endEventsIndex).color      = [1,0,0];
        events(endEventsIndex).epochs     = events(ievent_offset2).epochs (indices_to_remove_event_offset2_logical);
        events(endEventsIndex).times      = events(ievent_offset2).times  (indices_to_remove_event_offset2_logical);
        events(endEventsIndex).reactTimes = [];
        events(endEventsIndex).select     = 1;
        
        endEventsIndex = endEventsIndex+1;        
        events(endEventsIndex).label      = 'succ_saccade_offset1';
        events(endEventsIndex).color      = [1,0,0];
        events(endEventsIndex).epochs     = events(ievent_offset1).epochs (succesfulSaccades1);
        events(endEventsIndex).times      = events(ievent_offset1).times  (succesfulSaccades1);
        events(endEventsIndex).reactTimes = [];
        events(endEventsIndex).select     = 1;

        endEventsIndex = endEventsIndex+1;        
        events(endEventsIndex).label      = 'succ_saccade_offset2';
        events(endEventsIndex).color      = [1,0,0];
        events(endEventsIndex).epochs     = events(ievent_offset2).epochs (succesfulSaccades2);
        events(endEventsIndex).times      = events(ievent_offset2).times  (succesfulSaccades2);
        events(endEventsIndex).reactTimes = [];
        events(endEventsIndex).select     = 1;
        
        endEventsIndex = endEventsIndex+1;        
        events(endEventsIndex).label      = 'false_saccade_offset1';
        events(endEventsIndex).color      = [1,0,0];
        events(endEventsIndex).epochs     = events(ievent_offset1).epochs (falseSaccades1);
        events(endEventsIndex).times      = events(ievent_offset1).times  (falseSaccades1);
        events(endEventsIndex).reactTimes = [];
        events(endEventsIndex).select     = 1;

        endEventsIndex = endEventsIndex+1;        
        events(endEventsIndex).label      = 'false_saccade_offset2';
        events(endEventsIndex).color      = [1,0,0];
        events(endEventsIndex).epochs     = events(ievent_offset2).epochs (falseSaccades2);
        events(endEventsIndex).times      = events(ievent_offset2).times  (falseSaccades2);
        events(endEventsIndex).reactTimes = [];
        events(endEventsIndex).select     = 1;        
        
        events_to_keep = true(1,length(events));
        events_to_keep([ievent_offset1, ievent_offset2]) = false;
        
        events = events(events_to_keep);
        
        
        %% Save corrected events
        save([directory(ifile).folder '\corrected_' directory(ifile).name ])
        
    end
end
        