# Automation-macOS-JXA

This repo contains a collection of my scripts that I use for automation on masOS with JXA.


## Send Message
Automatically send an iMessage or SMS from your iPhone to whomeveer you like when something happens, like: 
- You arrive at a certain location.
- Your smart alarm system turns on.
- Well pretty much any event you can catch on IFTTT, Zapier or the likes there of.

[Setup Instructions](./Script Libraries/@Script/send-message.md)


## Repo Structure
This repository is structured after where the files will go on your Mac. 

### Automator Folder Actions
Some times Automator Folder Actions are used to trigger the JXA scripts. 

All Automator folder actions are located in `./Folder Actions/`

If you want to remove an Automator Folder Action, have a look at the scripts provided by Apple here: 
`/Library/Scripts/Folder Actions/`


### Libraries
Code sharred between several scripts are stored in libraries.

All libraries are located in `./Script Libraries/`


### Scripts
Controversially my scripts are stored in a subfolder of the libraries folder.  
I do this to allow myself easy access to execute the scripts from Automator.  

All scripts are located in `./Script Libraries/@Script/`


### Where everything goes on the Mac

Files in the `./Script Libraries/` go in the folowing folder on your Mac:  
`~/Library/Script Libraries/`

Files in the `./Folder Actions/` go in the folowing folder on your Mac:  
`~/Library/Workflows/Applications/Folder Actions`
