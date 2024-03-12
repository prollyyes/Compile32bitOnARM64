# Compile32bitOnARM64
## Cross compile 32 bit ASM on ARM64 using Docker

After a bit of thought I was able to find this workaround to cross compile 32 bit ASM files on an ARM64 CPU architecture machine (in my case, a MBP M2 Pro), avoiding slow, bulky and unresponsive emulated VMs.

## GUIDE
### Disclaimer: this guide uses Docker Desktop for ease of use.

First, make sure to install the Docker CLI plugin Buildx (e.g. using _Homebrew_).

Then, open Docker Desktop -> Settings -> Docker Engine, and set the `` "experimental" `` flag to true. It should look something like this:



<img width="1363" alt="image" src="https://github.com/prollyyes/Compile32bitOnARM64/assets/127027878/fa9337ae-3ad9-42ae-9cfd-72b271d2948b">




Now, open a Terminal window and navigate to the directory where you downloaded the Dockerfile, and paste this: `docker buildx build --platform linux/386 --load -t ia32-assembly . `.

After that, run the container: `docker run -d -it --name ia32onARM -v ~/Path/to/directory/:/workspace ia32-assembly `, and enter the correct path to the directory in which you want to save your files. They will be accessible inside the container, allowing you to easily edit and compile files without using VSC, which doesn't support i686.

Lastly, interact with the container via the terminal through: `docker exec -it ia32onARM bash `.
