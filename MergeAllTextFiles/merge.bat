@echo off
setlocal enabledelayedexpansion

rem Define the output file
set output_file=output.txt

rem Clear the output file if it already exists
if exist "%output_file%" del "%output_file%"

rem Loop through all files in the current directory
for %%f in (*) do (
    rem Skip the output file itself
    if "%%f" neq "%output_file%" (
        echo Processing %%f...
        
        rem Read each file and append its content to the output file
        for /f "usebackq delims=" %%l in ("%%f") do (
            echo %%l >> "%output_file%"
        )
        
        rem Add a blank line between files for clarity
        echo. >> "%output_file%"
    )
)

echo Done! All files have been combined into %output_file%.
pause
