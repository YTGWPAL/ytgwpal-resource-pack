@echo off
setlocal
pushd "%~dp0" || exit /b 1
if not exist "output\" mkdir "output"
if not exist "output\" goto fail
"%SystemRoot%\System32\tar.exe" -a -cf "output\YTGWPAL.Resource.Pack.zip" "1-20-title-overlay" "assets" "pack.mcmeta" "pack.png"
if errorlevel 1 goto fail
"%SystemRoot%\System32\tar.exe" -a -cf "output\YTGWPAL.Resource.Pack.DLC.zip" "assets-dlc" "pack-dlc.mcmeta" "pack-dlc.png"
if errorlevel 1 goto fail
7z rn "output\YTGWPAL.Resource.Pack.DLC.zip" "assets-dlc" "assets" "pack-dlc.mcmeta" "pack.mcmeta" "pack-dlc.png" "pack.png"
if errorlevel 1 goto fail
popd
exit /b 0

:fail
popd
exit /b 1
