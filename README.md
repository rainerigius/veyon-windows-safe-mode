# Veyon in Windows Safe Mode

## Two ways to solve the same problem
Reading the following file description you may ask yourself "Why should I block the safe mode if I want to run Veyon in it?"
Well, trying personally to run Veyon in the safe mode I came to an easier solution, blocking directly users from accessing the safe mode.
Sure, this is not what I  needed so I made sure that Veyon could run in safe mode.
But if Veyon is made to monitor and control computers why I should allow people to try entering safe mode?
What is my final idea? I opted for both.
First I make Veyon run in safe mode, and then block it. In this way, I have theoretically a double layer of security.
First, the final user can't enter the safe mode, but even if he can Veyon is still running and monitoring it.

## Installation and usage

To use the files

First download the files
```bash
  git clone https://github.com/rainerigius/veyon-windows-safe-mode.git
```

Then based on what actions you need to perform you can run the right file.

### `./VeyonSafeMode/1-VeyonService.reg` 
A registry script that adds VeyonService and required services to Safe Mode with Networking, ensuring they run in that mode. It also sets Veyon to start automatically on boot and configures its service startup type to Automatic.

### `./VeyonSafeMode/2-CheckVeyonService.bat`
This script verifies the Veyon configuration for Safe Mode with Networking by checking necessary registry keys and services. It reports any missing or incorrect entries and summarizes the total keys checked and issues found.

### `./VeyonSafeMode/3-BlockSafeMode.bat`
This script modifies BCD settings to disable the boot menu, advanced options, and Windows recovery, and sets the boot policy to ignore all failures. It updates the system configuration and suggests restarting the computer to apply the changes.

### `./VeyonSafeMode/4-EnableSafeMode.bat`
This script restores default BCD settings by re-enabling the boot menu, advanced options, boot status policy, and Windows recovery. It resets the system configuration and notifies the user that the settings have been restored.

## Author
[@rainerigius](https://www.github.com/rainerigius)
