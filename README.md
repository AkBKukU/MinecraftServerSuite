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
The service will accept the following commands: start, stop, status, restart, console. Run the like this `sudo service minecraft start`

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