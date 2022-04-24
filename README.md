# linuxsetup
winget install --id Git.Git -e --source winget;
New-Item C:\Users\CKIRUser\.bashrc -Value "git clone https://github.com/chaeripicker/linuxsetup.git";
New-Item C:\Users\CKIRUser\.bash_profile -Value "test -f ~/.profile && . ~/.profile
test -f ~/.bashrc && . ~/.bashrc";
start "C:\Program Files\Git\bin\bash.exe" -WorkingDirectory 'C:\Users\CKIRUser\Desktop';
Start-Process 'C:\Program Files\Git\git-bash.exe' C:\Users\CKIRUser\Desktop\linuxsetup\ssb3.sh
