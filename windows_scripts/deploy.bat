
:: Deploys the application

pushd "%~dp0.."
pushd build

"C:\Qt\6.12.0\mingw_64\bin\windeployqt.exe" BetterNotepad.exe

popd
popd
