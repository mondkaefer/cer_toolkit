REM Build the Windows installer using the wixtoolset.
REM Prerequisites:
REM  * Wixtoolset 3.8 must be installed and its executables must be in the search path
REM  * The rjm repository must be located next to the cer_toolkit repository
REM    Adjust the variable RJM_DIR if set up differently
REM 
REM This script must be run in the directory where it is located.

set RJM_DIR=..\..\..\..\rjm

del *.wixobj *.wixpdb *.msi /q

candle.exe CeRToolkit.wxs CeRToolkit_InstallDirDlg.wxs CeRToolkit_WixUI_InstallDir.wxs

light.exe -ext WixUIExtension^
          -b bin_path=.\bin^
          -b rjm_exe_path=%RJM_DIR%\client\bin\dist^
          -b rjm_doc_path=%RJM_DIR%\doc^
          -b rjm_deps_path=%RJM_DIR%\client\deps^
          -dWixUIBannerBmp=bitmaps\banner.bmp^
          -dWixUIDialogBmp=bitmaps\dialog.bmp^
          -o CeR-Toolkit.msi^
          CeRToolkit_InstallDirDlg.wixobj CeRToolkit_WixUI_InstallDir.wixobj CeRToolkit.wixobj
