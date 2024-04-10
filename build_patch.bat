@echo off
if exist lang.txt (
    set /p lang=<lang.txt
) else (
    set /p lang="Enter Language you are translating to: "
)
bin\cpkmakec.exe bin\pack_031_message.csv pack_031_message_%lang%.cpk -align=64 -code=UTF-8 -mode=FILENAMEGROUP -nodatetime -nogroupsort
if exist "pack_031_message_%lang%.cpk" (
    bin\xdelta3.exe -e -f -s "bin\pack_031_message.cpk" "pack_031_message_%lang%.cpk" "patch_031_message_%lang%.xdelta"
    echo patch created successfully
    pause
) else (
    echo something went wrong. "pack_031_message_%lang%.cpk" wasn't built.
pause
)