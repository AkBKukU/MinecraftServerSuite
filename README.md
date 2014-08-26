MinecraftServerSuite
====================

This is a set of server tools to make the Minecraft server run like a daemon/service on Ubuntu Linux and to be easier to maintain. This is meant to be an all in one solution for managing the files of a Minecraft server. It will install Minecraft and configure it to run as a service. 


##Features##

There are many features that will make your job as an admin easier.

 - Automatic Backups
	 - Just put `mcmanager autoBackupMinecraft` into roots [cron][cronGuide] and forget about it!
 - Automatic Backup Management:
	 - Keeps a specified number of backups and deletes the oldest ones.
 - Easy MOTD Configuration:
	 - Setup a fun and fancy motd for your server using much easier format codes like [Dark Blue].
 - Automatic Updates:
	 - With `mcmanager autoUpdate` in roots [cron][cronGuide] it will check for new versions of the server and automatically update to them! Works with Vanilla, Craftbukkit Dev, Craftbukkit Beta, and Craftbukkit Recomended versions so you can use whatever you like!
 - Full Service Integration:
	 - Control your Minecraft server just like any other linux [service][serviceGuide]

##Setup##
This requires that you have `screen`. If you do not, install it with `sudo apt-get install screen`.

 - You can download the files using the command `git clone https://github.com/AkBKukU/MinecraftServerSuite.git`. 
 - It will create a new directory. Use `cd MinecraftServerSuite` to enter it.
 - Make configurations in the top of mcmanger.
 - Run `sudo mcmanager installMinecraft` to start setup
 - The Minecraft server will be set to start automatically on boot but to run it immediately you will need to run `sudo service minecraftd start`.

 (Note: The tab completion of mcmanager arguments will not work until you log back in.)

That's all there is to the basic setup. 

##Commands##
The [service][serviceGuide] will accept the following commands: start, stop, status, restart, console. Run them like this `sudo service minecraftd start`

 - start:
	 - Runs the server if it's not running.
 - stop:
	 - Stops the server if it's running.
 - status:
	 - Tells you if the server is running.
 - restart:
	 - Stops the server if it's running, then starts it.
 - console:
	 - Brings you to the server console using screen. Exit the console by pressing `ctrl+a+d` (Note: There is an issue where you may not be able to access the console if the service was automatically started on boot. You can fix this by restarting the minecraftd service)


The mcmanger has many useful commands. Most of them are self explanatory but here are descriptions of the ones you will be most likely to use:`

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
 - setOPS:
 	 - Brings up the list of opped players to edit
 - setMOTD: 
 	 - An editor for the motd property in server.properties. It allows you to use human readable names for the format codes (eg, [Dark Blue])
 - status:
 	 - Tells you the current version of the server, the newest available version.

[cronGuide]: http://www.adminschoice.com/crontab-quick-reference/ "What is Cron/Crontab?"
[serviceGuide]: http://linux.about.com/od/lts_guide/a/gdelts36.htm "What is a service?"