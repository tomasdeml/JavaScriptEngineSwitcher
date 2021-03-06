set project_name=JavaScriptEngineSwitcher.Extensions.MsDependencyInjection
set dotnet_project_source_dir=..\..\src\%project_name%
set dotnet_project_bin_dir=%dotnet_project_source_dir%\bin\Release
set nuget_package_manager=..\..\.nuget\nuget.exe

call "..\setup.cmd"

rmdir lib /Q/S

%dotnet_cli% build "%dotnet_project_source_dir%" --framework net45 --configuration Release --no-dependencies --no-incremental
xcopy "%dotnet_project_bin_dir%\net45\%project_name%.dll" lib\net45\
xcopy "%dotnet_project_bin_dir%\net45\%project_name%.xml" lib\net45\
xcopy "%dotnet_project_bin_dir%\net45\ru-ru\%project_name%.resources.dll" lib\net45\ru-ru\

%dotnet_cli% build "%dotnet_project_source_dir%" --framework netstandard1.3 --configuration Release --no-dependencies --no-incremental
xcopy "%dotnet_project_bin_dir%\netstandard1.3\%project_name%.dll" lib\netstandard1.3\
xcopy "%dotnet_project_bin_dir%\netstandard1.3\%project_name%.xml" lib\netstandard1.3\
xcopy "%dotnet_project_bin_dir%\netstandard1.3\ru-ru\%project_name%.resources.dll" lib\netstandard1.3\ru-ru\

%nuget_package_manager% pack "..\%project_name%\%project_name%.nuspec"