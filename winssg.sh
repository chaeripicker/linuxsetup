#!/bin/bash
/c/'Program Files'/Google/Chrome/Application/chrome.exe "https://code.visualstudio.com/sha/download?build=stable&os=win32-x64-archive"
/c/'Program Files'/Google/Chrome/Application/chrome.exe "https://github.com/tonsky/FiraCode/releases/download/6.2/Fira_Code_v6.2.zip"
curl -O https://download.visualstudio.microsoft.com/download/pr/e4f4bbac-5660-45a9-8316-0ffc10765179/8ade57de09ce7f12d6411ed664f74eca/dotnet-sdk-6.0.202-win-x64.exe
./dotnet-sdk-6.0.202-win-x64.exe
curl -O https://github.com/tonsky/FiraCode/releases/download/6.2/Fira_Code_v6.2.zip
git clone https://github.com/chaeripicker/TheDarkDungeons.git
mv ~/Downloads/VSCode-win32-x64-1.66.2.zip ~/Desktop/VSCode-win32-x64-1.66.2.zip
mv ~/Downloads/Fira_Code_v6.2.zip ~/Desktop/Fira_Code_v6.2.zip
unzip VSCode-win32-x64-1.66.2.zip -d code
unzip Fira_Code_v6.2.zip -d fira
mv fira/ttf/FiraCode-Regular.ttf FiraCode-Regular.ttf
code/Code.exe
echo done.
read