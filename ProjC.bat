echo off

set projName=%1
set e1=%2
set e2=%3
SET mypath=%~dp0
shift
shift
mkdir %projName%
cd %projName%
mkdir Core
cd Core
if "%e1%"=="p" @type %mypath%Instrumentor.h > Instrumentor.h
if "%e2%"=="p" @type %mypath%Instrumentor.h > Instrumentor.h
cd ..
mkdir App
cd App
@type %mypath%base.cpp > %projName%.cpp
@type %mypath%pch.cpp > pch.cpp
@type %mypath%pch.h > pch.h
cd ..
mkdir ThirdParty
mkdir Dependencies
cd Dependencies
mkdir Include
mkdir Libraries
cd ..
mkdir Assets
@type %mypath%CMakeLists.txt > CMakeLists.txt
mkdir .vscode
cd .vscode
@type %mypath%c_cpp_properties.json > c_cpp_properties.json
cd ..
@type nul > .clang-format
if "%e1%"=="g" (@type nul > README.md)
if "%e1%"=="g" (@type %mypath%.gitignore > .gitignore)
if "%e1%"=="g" (@type %mypath%.gitmodules > .gitmodules)
if "%e1%"=="g" (@type nul > LICENSE)
if "%e2%"=="g" (@type nul > README.md)
if "%e2%"=="g" (@type %mypath%.gitignore > .gitignore)
if "%e2%"=="g" (@type %mypath%.gitmodules > .gitmodules)
if "%e2%"=="g" (@type nul > LICENSE)
cd ..
code %projName%