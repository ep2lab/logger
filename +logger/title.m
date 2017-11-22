%{
Log a title message to screen and to a log file. Can manage several
debug levels. Wraps text if too long. Wraps text to desired linelength.

INPUT:
* message: string with the message to be written 
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
function title(message,priority,logoptions) 

%% Message size
l = max(70,logoptions.linelength)-20; % number of characteres before wrapping text 
n = ceil(length(message)/l); % number of lines to use to write message

%% Print to file
if priority >= logoptions.filedebuglevel
    fid = fopen(logoptions.logfile,'a');
    fprintf(fid,'\n');
    for i = 1:max(70,logoptions.linelength); fprintf(fid,'-'); end;
    fprintf(fid,'\n');
    for i = 1:n
        fprintf(fid,'          %s\n',message(l*(i-1)+1:min(l*i,length(message))));
    end
    for i = 1:max(70,logoptions.linelength); fprintf(fid,'-'); end;
    fprintf(fid,'\n');
    fclose(fid);
end

%% Print to screen
if priority >= logoptions.screendebuglevel    
    fprintf(1,'\n');
    for i = 1:max(70,logoptions.linelength); fprintf(1,'-'); end;
    fprintf(1,'\n');
    for i = 1:n
        fprintf(1,'          %s\n',message(l*(i-1)+1:min(l*i,length(message))));
    end
    for i = 1:max(70,logoptions.linelength); fprintf(1,'-'); end;
    fprintf(1,'\n');
end
