@echo off
setlocal enabledelayedexpansion

:: Define sentences
set sentences[0]=Life is what happens when you’re busy making other plans.
set sentences[1]=It always seems impossible until it’s done.
set sentences[2]=Believe you can and you’re halfway there.
set sentences[3]=Don’t watch the clock; do what it does. Keep going.
set sentences[4]=You are never too old to set another goal or to dream a new dream.

:: Select a random sentence
set /a rand=%random% %% 5
for /f "tokens=2 delims==" %%A in ('set sentences[%rand%]') do set "sentence=%%A"

:: Display sentence
echo.
echo Type the following sentence:
echo.
echo %sentence%
echo.

:: Start timer
for /f "tokens=2 delims==" %%T in ('wmic os get localdatetime /value ^| find "="') do set starttime=%%T

:: Get user input
set /p userinput=Your Input: 

:: End timer
for /f "tokens=2 delims==" %%T in ('wmic os get localdatetime /value ^| find "="') do set endtime=%%T

:: Calculate elapsed time
set /a startSeconds=%starttime:~8,2%*3600 + %starttime:~10,2%*60 + %starttime:~12,2%
set /a endSeconds=%endtime:~8,2%*3600 + %endtime:~10,2%*60 + %endtime:~12,2%
set /a timeTaken=%endSeconds% - %startSeconds%

:: Count mistakes
set /a mistakes=0
for /l %%i in (0,1,100) do (
    set char1=!sentence:~%%i,1!
    set char2=!userinput:~%%i,1!
    if not "!char1!"=="!char2!" set /a mistakes+=1
)

:: Calculate WPM (approximate)
set /a wpm=(%userinput:~0,-1% / 5) * 60 / %timeTaken%

:: Display results
echo.
echo ------------- Results -------------
echo Time Taken: %timeTaken% seconds
echo Mistyped Characters: %mistakes%
echo Typing Speed: %wpm% WPM
echo -----------------------------------
echo.
pause
