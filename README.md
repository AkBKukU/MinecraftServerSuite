MinecraftServerSuite
====================

Set suite of server tools to make the Minecraft server run like a daemon/service on Ubuntu Linux. This is meant to be an all in one solution for managing the files of a Minecraft server. It will install Minecraft and configure it to run as a service. 

this requires that you have `screen`. If you do not install it with `sudo apt-get install screen`.

##Setup##

 - You can download the files using the command `git clone https://github.com/AkBKukU/MinecraftServerSuite.git`. 
 - It will create a new directory. Use `cd MinecraftServerSuite` to enter it.
 - Run `sudo mcManager installMinecraft` to start a barebones setup
 - The Minecraft server will start automatically on boot but to run it immediately you will need to run `sudo service minecraft start`. 

That's all there is to the basic setup. 

##Commands##
The service will accept the following commands: start, stop, status, restart, console. Run them like this `sudo service minecraft start`

 - start:
	 - Runs the server if it's not running.
 - stop:
	 - Stops the server if it's running.
 - status:
	 - Tells you if the server is running.
 - restart:
	 - Stops the server if it's running, then starts it.
 - console:
	 - Brings you to the server console using screen. Exit the console by pressing `ctrl+a+d`


The mcManger has several useful commands including: installMinecraft, checkForUpdate, autoUpdate, updateMinecraft, backupMinecraft, autoBackupMinecraft. Run them like this `sudo mcManager checkForUpdate`

 - installMinecraft:
	 - Installs the Minecraft server like described in install instructions.
 - checkForUpdate:
	 - Checks if there is an update available for the server.
 - autoUpdate:
	 - Runs checkForUpdate and if there is an update it installs it.
 - updateMinecraft:
	 - Installs the newest version of the Minecraft server. Does not delete the worlds.
 - backupMinecraft:
	 - Backs up the whole Minecraft server to the backup directory.
 - autoBackupMinecraft:
	 - Runs backupMinecraft and checks if there are more backups than allowed and cleans up old one if there is.