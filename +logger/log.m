%{
Log a message to screen and to a log file. Prepends tag, date, and time.
Can manage several debug levels. Wraps text to desired linelength.

INPUT:
* message: string with the message to be written
* tag: 3-letter string to label the message header (e.g. INF, ERR,
  WRN, ...)
* priority: the priority of current message. It will be printed to 
  screen and/or file if priority >= screendebuglevel, filedebuglevel
* logoptions: structure with the following fields:
  - logfile: file to write the message to
  - screendebuglevel: necessary level of priority to screen
  - filedebuglevel: necessary level of priority to file
  - linelength: integer, how many characters to write per line (min 70)

%----------------------------------------------------------------------
Author: Mario Merino
Date: 20171122
%----------------------------------------------------------------------
%}
function log(message,tag,priority,logoptions)

%% Message size
l = max(70,logoptions.linelength)-28; % number of characteres before wrapping text
n = ceil(length(message)/l); % number of lines to use to write message

%% Get date and time
t = datestr(datetime('now'),'yyyy-mm-dd HH:MM:SS');  

%% Print to file
if priority >= logoptions.filedebuglevel
    fid = fopen(logoptions.logfile,'a');
    fprintf(fid,'[%s] [%s] %s\n',t,tag(1:3),message(1:min(l,length(message))));
    for i = 2:n
        fprintf(fid,'                            %s\n',message(l*(i-1)+1:min(l*i,length(message))));
    end
    fclose(fid);
end

%% Print to screen
if priority >= logoptions.screendebuglevel    
    fprintf(1,'[%s] [%s] %s\n',t,tag(1:3),message(1:min(l,length(message))));
    for i = 2:n
        fprintf(1,'                            %s\n',message(l*(i-1)+1:min(l*i,length(message))));
    end 
end












