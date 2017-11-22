%{
Prints a blank line to screen and to a log file. Can manage several debug
levels. Wraps text to desired linelength. 

INPUT:
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
function blank(priority,logoptions)

%% Print to file
if priority >= logoptions.filedebuglevel
    fid = fopen(logoptions.logfile,'a');
    fprintf(fid,'\n'); 
    fclose(fid);
end

%% Print to screen
if priority >= logoptions.screendebuglevel    
    fprintf(1,'\n');
end












