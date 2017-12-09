%{
Compendium of all tests for the function/class in the name of this file.
You can run the tests by executing runtests. You must add the package to
your path first.  
%}
function tests = logger_test
    tests = functiontests(localfunctions);     
end

%----------------------------------------------------------------------
%----------------------------------------------------------------------
%----------------------------------------------------------------------
 
function setup(t) % this function is run before each test
    t.TestData.tempfile = [tempname,'.txt'];
end

function teardown(t) % this function is run after each test
    delete(t.TestData.tempfile);
end

function test_log(t)
    logoptions.logfile = t.TestData.tempfile;
    logoptions.screendebuglevel = 3;
    logoptions.filedebuglevel = 2;
    logoptions.linelength = 30;
    logger.blank(3,logoptions); 
    logger.log('this is a test','INF',3,logoptions);    
    logger.log('this is a much longer test that I want to wrap around to see what happens, blablah, whatever, this is a looong text','INF',5,logoptions);    
    logger.log('this is a much longer test that I want to wrap around to see what happens, blablah, whatever, this is a looong text','INF',5,logoptions);    
    logger.log('this is an error test','ERR',3,logoptions);    
end

function test_title(t)
    logoptions.logfile = t.TestData.tempfile;
    logoptions.screendebuglevel = 4;
    logoptions.filedebuglevel = 2;
    logoptions.linelength = 80;
    logger.title('this is a test',5,logoptions);    
    logger.title('this is a much longer test that I want to wrap around to see what happens, blablah, whatever, this is a looong text',5,logoptions);    
end

