set RJM_DIR=..\..\..\..\..\rjm

del *.wixobj
del *.wixpdb
del *.msi

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
